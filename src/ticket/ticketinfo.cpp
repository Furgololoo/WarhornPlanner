#include "ticketinfo.h"

#include <QDebug>

namespace ticket {
TicketInfo::TicketInfo() {}

TicketPriority TicketInfo::getPriority() const { return ticketPriority; }

QString TicketInfo::getTitle() const { return title; }

QString TicketInfo::getDescription() const { return description; }

QString TicketInfo::getAssigneeUser() const { return assigneeUser.getName(); }

QImage TicketInfo::getAssigneeUserImage() const {
  return assigneeUser.getImage();
}

TicketComponents TicketInfo::getComponent() const { return component; }

QDate TicketInfo::getCreateDate() const { return createDate; }

QDate TicketInfo::getUpdateDate() const { return updateDate; }

TicketStatus TicketInfo::getTicketStatus() const { return status; }
}  // namespace ticket
