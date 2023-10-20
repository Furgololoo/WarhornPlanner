#include "ticketmanager.h"

namespace ticket {
TicketManager::TicketManager() {}

QVector<QString> TicketManager::getEnumList(const int &enumID) {
  QVector<QString> enumList = {};
  int enumsCount = 0;
  switch (enumID) {
  case 0:
    enumsCount = 6;
    enumList.reserve(enumsCount);
    for (int i = 0; i < enumsCount; i++) {
      enumList.push_back(
          ticketPriorityToString(static_cast<TicketPriority>(i)));
    }
    break;
  case 1:
    enumsCount = 11;
    enumList.reserve(enumsCount);
    for (int i = 0; i < enumsCount; i++) {
      enumList.push_back(
          ticketComponentsToString(static_cast<TicketComponents>(i)));
    }
    break;
  case 2:
    enumsCount = 8;
    enumList.reserve(enumsCount);
    for (int i = 0; i < enumsCount; i++) {
      enumList.push_back(ticketStatusToString(static_cast<TicketStatus>(i)));
    }
    break;
  case 3:
    enumsCount = 3;
    enumList.reserve(enumsCount);
    for (int i = 0; i < enumsCount; i++) {
      enumList.push_back(ticketTypeToString(static_cast<TicketType>(i)));
    }
    break;
  }
  return enumList;
}

} // namespace ticket
