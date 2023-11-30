#include "networkmanager.h"

#include "../ticket/ticket.h"

#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QtGlobal>

namespace network {

NetworkManager::NetworkManager(const QUrl &url, QObject *parent) {
  startSession(url);
}

NetworkManager::~NetworkManager() { closeSession(); }

void NetworkManager::setUserPointer(std::shared_ptr<user::User> user) {
  current_logged_user = user;
}

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

void NetworkManager::addTicket(std::unique_ptr<ticket::Ticket> ticket) {
  qDebug() << __FUNCTION__;
  auto ticket_data = ticket->toJson();

  QJsonObject users_info{};
  users_info["assignee_id"] = 1;
  users_info["reporter_id"] = 0;
  users_info["implementer_id"] = 1;

  QJsonObject content{};
  content["users_info"] = users_info;
  content["ticket_data"] = ticket_data;

  QJsonObject request_data;
  request_data["user_id"] = 0;
  request_data["token"] = "token1234";
  request_data["action"] = static_cast<quint8>(ERequestActions::CREATE);
  request_data["content_id"] = static_cast<quint8>(EContentID::TICKET);

  QJsonObject body{};
  body["request_data"] = request_data;
  body["content"] = content;

  QJsonDocument doc(body);

  auto response_func = [&](const QJsonDocument &body) {
    qDebug() << "Response to " << __FUNCTION__ << " request.\nData: " << body;
  };
  response = response_func;

  if (webSocket.state() == QAbstractSocket::SocketState::ConnectedState) {
    webSocket.sendBinaryMessage(doc.toJson(QJsonDocument::JsonFormat::Compact));
  }
  qDebug() << doc;
}

void NetworkManager::login(const QString &login, const QString &password) {
  QJsonObject body{};
  QJsonObject request_data{};
  request_data["action"] = static_cast<quint8>(ERequestActions::LOGIN);
  request_data["content_id"] = static_cast<quint8>(EContentID::USER);
  body["request_data"] = request_data;

  QJsonObject content{};
  content["login"] = login;
  content["password"] = password;
  body["content"] = content;

  QJsonDocument doc(body);

  auto response_func = [&](const QJsonDocument &body) {
    auto content_data = body.object().take("content").toObject();
    if (content_data.contains("token"))
      emit logged(content_data);
    else
      emit failedLogin(content_data.take("error").toString());
    qDebug() << "Response to " << __FUNCTION__
             << " request.\nData: " << content_data;
  };
  response = response_func;

  if (webSocket.state() == QAbstractSocket::SocketState::ConnectedState) {
    webSocket.sendBinaryMessage(doc.toJson(QJsonDocument::JsonFormat::Compact));
  }
}

void NetworkManager::sendTestJson() {

  QJsonObject content{};
  QJsonObject usersInfo{};
  //  usersInfo["assignee_id"] = 1;
  //  usersInfo["reporter_id"] = 1;
  //  usersInfo["implementer_id"] = 1;
  //  content["users_info"] = usersInfo;

  QJsonObject ticketData{};
  //  ticketData["title"] = "Fix spawner bug";
  //  ticketData["ticket_type"] = 1;
  //  ticketData["attachments"] = QJsonArray{};
  //  ticketData["links"] = QJsonArray{};
  //  ticketData["ticket_type"] = 1;
  //  ticketData["description"] =
  //      "For some values in initial_ai_number and max_ai_number, after"
  //      " entering spawner game crash with error \"ERROR DIVIDE BY 0\"";
  //  ticketData["acceptance_criteria"] =
  //      "After entering spawner, game shouldn't crash";
  //  ticketData["create_date"] = "05.10.2023";
  //  ticketData["create_time"] = "12:47";
  //  ticketData["update_date"] = "06.10.2023";
  //  ticketData["update_time"] = "15:11";
  //  ticketData["component"] = 8;
  //  ticketData["priority"] = 3;
  //  ticketData["status"] = 6;
  //  content["ticket_data"] = ticketData;

  Q_ASSERT(current_logged_user);
  QJsonObject request_data;
  request_data["user_id"] = current_logged_user->getUserId();
  request_data["token"] = current_logged_user->getToken();
  request_data["action"] = static_cast<quint8>(ERequestActions::TEST);
  request_data["content_id"] = 1;

  QJsonObject body;
  body["content"] = content;
  body["request_data"] = request_data;
  QJsonDocument doc(body);

  auto response_func = [&](const QJsonDocument &body) {
    qDebug() << __FUNCTION__ << "   "
             << "response";
  };
  response = response_func;

  if (webSocket.state() == QAbstractSocket::ConnectedState)
    webSocket.sendBinaryMessage(doc.toJson(QJsonDocument::JsonFormat::Compact));
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
}

void NetworkManager::onDisconnected() { qDebug() << "WebSocket disconnected"; }

void NetworkManager::errorOccured(QAbstractSocket::SocketError error) {
  qDebug() << "Error Occured, what: " << error;
}

void NetworkManager::onRead(QString mess) {
  static int counter = 0;
  //  qDebug() << "Message received: " << mess;
  response(QJsonDocument::fromJson(mess.toUtf8()));
}

void NetworkManager::onSslErrors(const QList<QSslError> &errors) {
  qWarning() << "SSL errors:" << errors;
}

} // namespace network
