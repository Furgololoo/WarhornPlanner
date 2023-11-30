#pragma once

#include <QObject>
#include <memory>

#include "managers/accountmanager.h"
#include "managers/boardmanager.h"
#include "managers/networkmanager.h"
#include "managers/ticketmanager.h"

class Coffey : public QObject {
  Q_OBJECT
public:
  explicit Coffey(QObject *parent = nullptr);

  BoardManager *getBoardManager() { return &board; }
  ticket::TicketManager *getTicketManager() { return &ticketManager; }

public slots:
  void sendTestJson() { networkManager->sendTestJson(); };

  void login(const QString &login, const QString &password);
  void onLogged(const QJsonObject &user_data);

  QJsonObject getUserInfo() const;

signals:
  void logged();
  void userLogged(QString userName);
  void failedLogin(const QString &message);

private:
  std::shared_ptr<network::NetworkManager> networkManager;
  std::unique_ptr<AccountManager> account;
  BoardManager board;
  ticket::TicketManager ticketManager;
  std::shared_ptr<user::User> currentLoggedUser;
};
