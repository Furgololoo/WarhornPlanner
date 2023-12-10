#include "ticketmanager.h"
#include <QJsonArray>

#include <ranges>
#include <vector>

namespace ticket {
TicketManager::TicketManager() {}

void TicketManager::setNetworkManager(
    std::shared_ptr<network::NetworkManager> network_ptr) {
  network = network_ptr;
}

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
    ticket->ticketStatus = TicketStatus::Open;
    qDebug() << "Created ticket";
    return true;
  }
  return false;
}

QString TicketManager::getTicketName() const {
  if (current_managed_ticket)
    return current_managed_ticket->ticket_name;
  return "ticket name error";
}

QString TicketManager::getTitle() const {
  if (current_managed_ticket)
    return current_managed_ticket->title;
  return "ticket error";
}

int TicketManager::getProjectID() const {
  if (current_managed_ticket)
    return current_managed_ticket->project_id;
  return -1;
}

int TicketManager::getSprintID() const {
  if (current_managed_ticket)
    return current_managed_ticket->sprint_id;
  return -1;
}

quint8 TicketManager::getType() const {
  if (current_managed_ticket)
    return static_cast<quint8>(current_managed_ticket->ticketType);
  return 100;
}

QString TicketManager::getAcceptanceCriteria() const {
  if (current_managed_ticket)
    return current_managed_ticket->acceptanceCriteria;
  return "ticket error";
}

QString TicketManager::getDescription() const {
  if (current_managed_ticket)
    return current_managed_ticket->description;
  return "ticket error";
}

quint8 TicketManager::getComponent() const {
  if (current_managed_ticket)
    return static_cast<quint8>(current_managed_ticket->ticketComponent);
  return 100;
}

quint8 TicketManager::getPriority() const {
  if (current_managed_ticket)
    return static_cast<quint8>(current_managed_ticket->ticketPriority);
  return 100;
}

quint8 TicketManager::getStatus() const {
  if (current_managed_ticket)
    return static_cast<quint8>(current_managed_ticket->ticketStatus);
  return 100;
}

QJsonArray TicketManager::getLink() const {
  if (current_managed_ticket) {
    QJsonArray links;
    for (const auto &i : current_managed_ticket->links) {
      links.push_back(QJsonObject(
          {{"link_type", i.linkType}, {"link_ticket", i.ticketID}}));
    }
    return links;
  }
  return QJsonArray();
}

QJsonArray TicketManager::getAttachment() const {
  QJsonArray attachments;

  return attachments;
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

void TicketManager::saveTicket() {
  emit getData();
  Q_ASSERT(network);
  network->addTicket(std::move(ticket));
  ticket.reset();
  createTicket();

  emit resetTicketView();
}

void TicketManager::closeTicket() {}

void TicketManager::openTicket(const unsigned int ticket_id) {
  QJsonObject ticket1;
  QJsonObject body;
  QJsonObject usersInfo;
  usersInfo["assignee_id"] = "3";
  usersInfo["reporter_id"] = "2";
  usersInfo["implementer_id"] = "1";
  body["users_info"] = usersInfo;

  QJsonObject ticketData;
  ticketData["ticket_id"] = 1;
  ticketData["ticket_name"] = "TW-159";
  ticketData["title"] = "Fix AI";
  ticketData["description"] = "Create new AI";
  ticketData["acceptance_criteria"] = "AI should work and not crash";
  ticketData["attachments"] = QJsonArray();
  ticketData["links"] = QJsonArray();
  QDate createDate(2023, 10, 5);
  QTime createTime(12, 47, 25);
  QDate updateDate(2023, 10, 6);
  QTime updateTime(15, 11, 7);
  ticketData["create_date"] = createDate.toString();
  ticketData["create_time"] = createTime.toString();
  ticketData["update_date"] = updateDate.toString();
  ticketData["update_time"] = updateTime.toString();
  ticketData["ticket_type"] = 1;
  ticketData["component"] =
      ticket::ticketComponentsToString(ticket::TicketComponents::Code);
  ticketData["priority"] =
      ticket::ticketPriorityToString(ticket::TicketPriority::P3);
  ticketData["status"] =
      ticket::ticketStatusToString(ticket::TicketStatus::InProgress);
  body["ticket_data"] = ticketData;

  ticket1["ticket"] = body;

  current_managed_ticket = std::make_shared<Ticket>(ticket1);
  downloaded_tickets.push_back(current_managed_ticket);
  emit openTicketView();
}

} // namespace ticket
