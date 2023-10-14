#pragma once

#include <QList>
#include <QObject>
#include <QSslError>
#include <QString>
#include <QUrl>
#include <QWebSocket>

QT_FORWARD_DECLARE_CLASS(QWebSocket)  // same as class QWebSocket;

namespace network {

class NetworkManager : public QObject {
  Q_OBJECT
 public:
  explicit NetworkManager(const QUrl &url, QObject *parent = nullptr);
  ~NetworkManager();
  void startSession(const QUrl &url);
  void closeSession();

 private slots:
  void onConnected();
  void onDisconnected();
  void errorOccured(QAbstractSocket::SocketError error);
  void onRead(QString mess);
  void onSslErrors(const QList<QSslError> &errors);

 private:
  QWebSocket webSocket;
};

}  // namespace network
