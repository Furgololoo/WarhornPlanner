#pragma once

#include <QObject>
#include <memory>

#include "management/coffeyuser.h"

class Coffey : public CoffeyUser {

public:
  explicit Coffey(QObject *parent = nullptr);

  BoardManager *getBoardManager() { return &board; }
  ticket::TicketManager *getTicketManager() { return &ticketManager; }
};
