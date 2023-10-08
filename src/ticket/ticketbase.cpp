#include "ticketbase.h"

#include <QJsonObject>

namespace ticket {
TicketBase::TicketBase() {}

void TicketBase::setData(const QJsonObject &data) {
  ticketInfo = std::make_unique<TicketInfo>(data);
  emit ticketReadyToDisplay();
}

TicketPriority TicketBase::getPriority() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->ticketPriority;
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

TicketComponents TicketBase::getComponent() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->component;
}

QString TicketBase::getCreateDate() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->createDate;
}

QString TicketBase::getUpdateDate() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->updateDate;
}

TicketStatus TicketBase::getTicketStatus() const {
  Q_ASSERT(ticketInfo);
  return ticketInfo->status;
}

}  // namespace ticket
