#include "networkmanager.h"
#include <QFile>

namespace network {

NetworkManager::NetworkManager(const QUrl &url, QObject *parent) {
  connect(&webSocket, &QWebSocket::connected, this,
          &NetworkManager::onConnected);
  connect(&webSocket, &QWebSocket::errorOccurred, this,
          &NetworkManager::errorOccured);
  connect(&webSocket,
          QOverload<const QList<QSslError> &>::of(&QWebSocket::sslErrors), this,
          &NetworkManager::onSslErrors);

  //  QSslConfiguration sslConfiguration;
  //  QFile certFile(QStringLiteral(":/localhost.cert"));
  //  certFile.open(QIODevice::ReadOnly);
  //  QSslCertificate certificate(&certFile, QSsl::Pem);
  //  certFile.close();
  //  sslConfiguration.addCaCertificate(certificate);
  //  webSocket.setSslConfiguration(sslConfiguration);
  qDebug() << __FUNCTION__;
  webSocket.open(QUrl(url));
}

void NetworkManager::onConnected() {
  qDebug() << "WebSocket connected";
  connect(&webSocket, &QWebSocket::textMessageReceived, this,
          &NetworkManager::onRead);
  webSocket.sendTextMessage(QStringLiteral("Hello, world!"));
}

void NetworkManager::errorOccured(QAbstractSocket::SocketError error) {
  qDebug() << "Error Occured, what: " << error;
}

void NetworkManager::onRead(QString mess) {
  qDebug() << "Message received:" << mess;
}

void NetworkManager::onSslErrors(const QList<QSslError> &errors) {
  qWarning() << "SSL errors:" << errors;
}

} // namespace network
