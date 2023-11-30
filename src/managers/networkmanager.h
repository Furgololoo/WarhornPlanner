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
  GET = 1,
  CREATE = 2,
  UPDATE = 3,
  REMOVE = 4,
  CLOSE_SESSION = 5,
  LOGIN = 6,
  TEST = 7
};

enum class EContentID : quint8 {
  TICKET = 1,
  SPRINT = 2,
  USER = 3,
  TOKEN = 4,
  ATTACHMENT = 5
};

class NetworkManager : public QObject {
  Q_OBJECT
public:
  explicit NetworkManager(const QUrl &url, QObject *parent = nullptr);
  ~NetworkManager();
  void setUserPointer(std::shared_ptr<user::User> user);
  void startSession(const QUrl &url);
  void closeSession();

  // ################### Ticket ###################
  void addTicket(std::unique_ptr<ticket::Ticket> ticket);

  // ################### User ###################
  void login(const QString &login, const QString &password);

  void sendTestJson();

private slots:
  void onConnected();
  void onDisconnected();
  void errorOccured(QAbstractSocket::SocketError error);
  void onRead(QString mess);
  void onSslErrors(const QList<QSslError> &errors);

signals:
  void logged(const QJsonObject &user_data);
  void failedLogin(const QString &message);
  void salt(const QString &salt);

private:
  QWebSocket webSocket;
  std::shared_ptr<user::User> current_logged_user;

  std::function<void(const QJsonDocument &)> response;
};

} // namespace network
