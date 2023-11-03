#pragma once

#include <QList>
#include <QObject>
#include <QSslError>
#include <QString>
#include <QUrl>
#include <QWebSocket>

#include "../ticket/ticket.h"

QT_FORWARD_DECLARE_CLASS(QWebSocket) // same as class QWebSocket;

namespace network {

enum class ERequestActions : quint8 {
  GET = 0x0,
  CREATE = 0x1,
  UPDATE = 0x2,
  REMOVE = 0x4,
  CLOSE_SESSION = 0x8
};

enum class EContentID : quint8 { TICKET = 0x0, SPRINT = 0x1, USER = 0x2 };

class NetworkManager : public QObject {
  Q_OBJECT
public:
  explicit NetworkManager(const QUrl &url, QObject *parent = nullptr);
  ~NetworkManager();
  void startSession(const QUrl &url);
  void closeSession();

  //################### Ticket ###################
  void addTicket(std::unique_ptr<ticket::Ticket> ticket);

  void sendTestJson();

private slots:
  void onConnected();
  void onDisconnected();
  void errorOccured(QAbstractSocket::SocketError error);
  void onRead(QString mess);
  void onSslErrors(const QList<QSslError> &errors);

private:
  QWebSocket webSocket;
};

} // namespace network
