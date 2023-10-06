#include "boardmanager.h"
#include "../config/config.h"

BoardManager::BoardManager() {}

QStringList BoardManager::getTicketColList() const {
  QStringList ticketCols{};
  for (const auto &i : kTicketColNames) {
    ticketCols.push_back(QString::fromStdString(i));
  }
  return ticketCols;
}

int BoardManager::getTicketColListSize() const {
  return kTicketColNames.size();
}
