#include "ticketbase.h"

#include <QJsonObject>

namespace ticket {
TicketBase::TicketBase() {}

void TicketBase::setData(const QJsonObject &data) {
  ticketInfo = std::make_unique<TicketInfo>(data);
  emit ticketReadyToDisplay();
}

QString TicketBase::getPriority() const {
  Q_ASSERT(ticketInfo);
  return ticketPriorityToString(ticketInfo->ticketPriority);
}

QString TicketBase::getTitle() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->title;
}

QString TicketBase::getDescription() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->description;
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

QString TicketBase::getCreateDate() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->createDate;
}

QString TicketBase::getUpdateDate() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->updateDate;
}

QString TicketBase::getTicketStatus() const {
  Q_ASSERT(ticketInfo);
  return ticketStatusToString(ticketInfo->status);
}

}  // namespace ticket
