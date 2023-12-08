#pragma once

#include "../managers/accountmanager.h"
#include "../managers/boardmanager.h"
#include "../managers/configmanager.h"
#include "../managers/networkmanager.h"
#include "../managers/ticketmanager.h"

#include <QObject>
#include <memory>

class CoffeyBase : public QObject {
  Q_OBJECT
public:
  explicit CoffeyBase(QObject *parent = nullptr);

public slots:
  void sendTestJson() { networkManager->sendTestJson(); };

protected:
  std::shared_ptr<network::NetworkManager> networkManager;
  std::unique_ptr<AccountManager> account;
  BoardManager board;
  ticket::TicketManager ticketManager;
  std::shared_ptr<user::User> currentLoggedUser;
  app_config::ConfigManager &conf;
};
