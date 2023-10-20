#include "networkmanager.h"

#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QtGlobal>

namespace network {

NetworkManager::NetworkManager(const QUrl &url, QObject *parent) {
  startSession(url);
}

NetworkManager::~NetworkManager() { closeSession(); }

void NetworkManager::startSession(const QUrl &url) {
  if (webSocket.state() != QAbstractSocket::ConnectedState &&
      webSocket.state() != QAbstractSocket::ConnectingState) {
    connect(&webSocket, &QWebSocket::connected, this,
            &NetworkManager::onConnected);
    connect(&webSocket, &QWebSocket::disconnected, this,
            &NetworkManager::onDisconnected);
    connect(&webSocket, &QWebSocket::errorOccurred, this,
            &NetworkManager::errorOccured);
    connect(&webSocket,
            QOverload<const QList<QSslError> &>::of(&QWebSocket::sslErrors),
            this, &NetworkManager::onSslErrors);
    webSocket.open(url);
  }
}

void NetworkManager::closeSession() {
  //  QJsonObject closeRequest;
  //  closeRequest["action"] = 16;
  //  QJsonDocument document(closeRequest);

  //  webSocket.sendTextMessage();
  //  if (webSocket.state() == QAbstractSocket::ConnectedState)
  //    webSocket.close();
}

void NetworkManager::onConnected() {
  qDebug() << "WebSocket connected";
  connect(&webSocket, &QWebSocket::textMessageReceived, this,
          &NetworkManager::onRead);
  webSocket.sendTextMessage(QStringLiteral("Hello, world!"));
}

void NetworkManager::onDisconnected() { qDebug() << "WebSocket disconnected"; }

void NetworkManager::errorOccured(QAbstractSocket::SocketError error) {
  qDebug() << "Error Occured, what: " << error;
}

void NetworkManager::onRead(QString mess) {
  static int counter = 0;
  qDebug() << "Message received: " << mess;
  counter++;
  if (counter <= 2)
    //    closeSession();
    //  else {
    //    qDebug() << "Sending message: ";
    webSocket.sendTextMessage(QStringLiteral("Hello, world!"));
  //  }
}

void NetworkManager::onSslErrors(const QList<QSslError> &errors) {
  qWarning() << "SSL errors:" << errors;
}

} // namespace network
