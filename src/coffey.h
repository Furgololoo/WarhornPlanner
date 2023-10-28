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

signals:

private:
  std::unique_ptr<network::NetworkManager> networkManager;
  std::unique_ptr<AccountManager> account;
  BoardManager board;
  ticket::TicketManager ticketManager;
};
