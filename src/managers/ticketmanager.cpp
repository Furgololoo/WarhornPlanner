#include "ticketmanager.h"

#include <ranges>
#include <vector>

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

bool TicketManager::createTicket() {
  if (!ticket) {
    ticket = std::make_unique<Ticket>();
    qDebug() << "Created ticket";
    return true;
  }
  return false;
}

void TicketManager::setTitle(const QString &title) {
  if (ticket)
    ticket->title = title;
  qDebug() << __FUNCTION__ << " " << title;
}

void TicketManager::setType(const quint8 &type_int) {
  if (ticket)
    ticket->ticketType = static_cast<TicketType>(type_int);
  qDebug() << __FUNCTION__ << " " << ticketTypeToString(ticket->ticketType);
}

void TicketManager::setAcceptanceCriteria(const QString &text) {
  if (ticket)
    ticket->acceptanceCriteria = text;
  qDebug() << __FUNCTION__ << " " << text;
}

void TicketManager::setDescription(const QString &text) {
  if (ticket)
    ticket->description = text;
  qDebug() << __FUNCTION__ << " " << text;
}

void TicketManager::setComponent(const quint8 &type_int) {
  if (ticket)
    ticket->ticketComponent = static_cast<TicketComponents>(type_int);
  qDebug() << __FUNCTION__ << " "
           << ticketComponentsToString(ticket->ticketComponent);
}

void TicketManager::setPriority(const quint8 &type_int) {
  if (ticket)
    ticket->ticketPriority = static_cast<TicketPriority>(type_int);
  qDebug() << __FUNCTION__ << " "
           << ticketPriorityToString(ticket->ticketPriority);
}

void TicketManager::setStatus(const quint8 &type_int) {
  if (ticket)
    ticket->ticketStatus = static_cast<TicketStatus>(type_int);
  qDebug() << __FUNCTION__ << " " << ticketStatusToString(ticket->ticketStatus);
}

QString TicketManager::addAttachment(const QUrl &url,
                                     const quint8 &attachment_id) {
  if (ticket) {
    ticket->attachments.push_back(Attachment{url, attachment_id});

    for (const auto &i : ticket->attachments)
      qDebug() << "added attachment" << i.id << " " << i.url;

    return url.fileName();
  }
  return "Problem my friend";
}

void TicketManager::removeAttachment(const int &attachment_id) {
  if (ticket) {
    ticket->attachments.erase(ticket->attachments.begin() + attachment_id);
    qDebug() << "removed attachment " << attachment_id;
  }
}

void TicketManager::addLink(const QString &linkType, const QString &ticket_id,
                            const quint8 &link_id) {
  if (ticket)
    ticket->links.push_back(TicketLink{linkType, ticket_id, link_id});
  qDebug() << "added link " << link_id << " " << linkType << " " << ticket_id;
}

void TicketManager::updateLink(const QString &linkType,
                               const QString &ticket_id,
                               const quint8 &link_id) {
  if (ticket) {
    auto &link = ticket->links[link_id];

    if (linkType != nullptr)
      link.linkType = linkType;
    if (ticket_id != nullptr)
      link.ticketID = ticket_id;

    qDebug() << "updated link to: " << link.id << " " << link.linkType << " "
             << link.ticketID;
  }
}

void TicketManager::removeLink(const quint8 &link_id) {
  if (ticket) {
    ticket->links.erase(ticket->links.begin() + link_id);
    qDebug() << "removed link " << link_id;
  }
}

void TicketManager::saveTicket() {}

} // namespace ticket
