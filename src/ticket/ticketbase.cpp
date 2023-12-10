#include "ticketbase.h"

#include <QJsonObject>

namespace ticket {
TicketBase::TicketBase() {}

QString TicketBase::getAssigneeName() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->assigneeName;
}

void TicketBase::setData(const QJsonObject &data) {
  ticketInfo = std::make_unique<TicketInfo>(data);
  emit ticketReadyToDisplay();
}

QString TicketBase::getPriority() const {
  Q_ASSERT(ticketInfo);
  return ticketPriorityToString(ticketInfo->ticketPriority);
}

quint8 TicketBase::getPriorityInt() const {
  Q_ASSERT(ticketInfo);
  return static_cast<quint8>(ticketInfo->ticketPriority);
}

QString TicketBase::getTitle() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->title;
}

// QString TicketInfo::getAssigneeUser() const { return assigneeUser.getName();
// }

// QImage TicketInfo::getAssigneeUserImage() const {
//   return assigneeUser.getImage();
// }

QString TicketBase::getComponent() const {
  Q_ASSERT(ticketInfo);
  return ticketComponentsToString(ticketInfo->component);
}

QString TicketBase::getUpdateDate() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->updateDate;
}

QString TicketBase::getTicketStatus() const {
  Q_ASSERT(ticketInfo);
  return ticketStatusToString(ticketInfo->status);
}

} // namespace ticket
