#include "boardmanager.h"

#include <QDate>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QTime>

#include "../config/config.h"
#include "../ticket/ticketinfo.h"

BoardManager::BoardManager() { groupedTickets.resize(7); }

void BoardManager::setup() {
  QJsonArray array;
  {
    QJsonObject ticket1;
    QJsonObject body;
    QJsonObject usersInfo;
    usersInfo["assignee_name"] = "Szkuti";
    usersInfo["assignee_id"] = "3";
    usersInfo["reporter_id"] = "2";
    usersInfo["implementer_id"] = "1";
    body["users_info"] = usersInfo;

    QJsonObject ticketData;
    ticketData["title"] = "Fix AI";
    ticketData["description"] = "Create new AI";
    QDate createDate(2023, 10, 5);
    QTime createTime(12, 47, 25);
    QDate updateDate(2023, 10, 6);
    QTime updateTime(15, 11, 7);
    ticketData["create_date"] = createDate.toString();
    ticketData["create_time"] = createTime.toString();
    ticketData["update_date"] = updateDate.toString();
    ticketData["update_time"] = updateTime.toString();
    ticketData["component"] =
        ticket::ticketComponentsToString(ticket::TicketComponents::Code);
    ticketData["priority"] =
        ticket::ticketPriorityToString(ticket::TicketPriority::P3);
    ticketData["status"] =
        ticket::ticketStatusToString(ticket::TicketStatus::InProgress);
    body["ticket_data"] = ticketData;

    ticket1["ticket"] = body;
    array.append(ticket1);
  }

  {
    QJsonObject ticket2;
    QJsonObject body;
    QJsonObject usersInfo;
    usersInfo["assignee_name"] = "Bartek";
    usersInfo["assignee_id"] = "1";
    usersInfo["reporter_id"] = "1";
    usersInfo["implementer_id"] = "3";
    body["users_info"] = usersInfo;

    QJsonObject ticketData;
    ticketData["title"] = "Add build mechanic";
    ticketData["description"] = "Add mechanics bal bla bla";
    QDate createDate(2023, 10, 4);
    QTime createTime(12, 44, 21);
    QDate updateDate(2023, 10, 7);
    QTime updateTime(16, 27, 37);
    ticketData["create_date"] = createDate.toString();
    ticketData["create_time"] = createTime.toString();
    ticketData["update_date"] = updateDate.toString();
    ticketData["update_time"] = updateTime.toString();
    ticketData["component"] =
        ticket::ticketComponentsToString(ticket::TicketComponents::Code);
    ticketData["priority"] =
        ticket::ticketPriorityToString(ticket::TicketPriority::P2);
    ticketData["status"] =
        ticket::ticketStatusToString(ticket::TicketStatus::Blocked);
    body["ticket_data"] = ticketData;

    ticket2["ticket"] = body;
    array.append(ticket2);
  }

  {
    QJsonObject ticket3;
    QJsonObject body;
    QJsonObject usersInfo;
    usersInfo["assignee_name"] = "Krawiec";
    usersInfo["assignee_id"] = "2";
    usersInfo["reporter_id"] = "1";
    usersInfo["implementer_id"] = "1";
    body["users_info"] = usersInfo;

    QJsonObject ticketData;
    ticketData["title"] = "Create DEVLOG #1";
    ticketData["description"] = "Add here new AI and new building mechanic";
    QDate createDate(2023, 10, 7);
    QTime createTime(17, 23, 01);
    QDate updateDate(2023, 10, 7);
    QTime updateTime(17, 37, 59);
    ticketData["create_date"] = createDate.toString();
    ticketData["create_time"] = createTime.toString();
    ticketData["update_date"] = updateDate.toString();
    ticketData["update_time"] = updateTime.toString();
    ticketData["component"] =
        ticket::ticketComponentsToString(ticket::TicketComponents::DevLog);
    ticketData["priority"] =
        ticket::ticketPriorityToString(ticket::TicketPriority::P4);
    ticketData["status"] =
        ticket::ticketStatusToString(ticket::TicketStatus::Open);
    body["ticket_data"] = ticketData;

    ticket3["ticket"] = body;
    array.append(ticket3);
  }

  {
    QJsonObject ticket3;
    QJsonObject body;
    QJsonObject usersInfo;
    usersInfo["assignee_name"] = "Krzysiek";
    usersInfo["assignee_id"] = "3";
    usersInfo["reporter_id"] = "3";
    usersInfo["implementer_id"] = "2";
    body["users_info"] = usersInfo;

    QJsonObject ticketData;
    ticketData["title"] = "Create Wolf 3D model";
    ticketData["description"] =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "
        "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim "
        "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
        "aliquip ex ea commodo consequat. Duis aute irure dolor in "
        "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
        "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
        "culpa qui officia deserunt mollit anim id est laborum.";
    QDate createDate(2023, 9, 28);
    QTime createTime(21, 01, 29);
    QDate updateDate(2023, 9, 30);
    QTime updateTime(9, 14, 53);
    ticketData["create_date"] = createDate.toString();
    ticketData["create_time"] = createTime.toString();
    ticketData["update_date"] = updateDate.toString();
    ticketData["update_time"] = updateTime.toString();
    ticketData["component"] =
        ticket::ticketComponentsToString(ticket::TicketComponents::Model3D);
    ticketData["priority"] =
        ticket::ticketPriorityToString(ticket::TicketPriority::P1);
    ticketData["status"] =
        ticket::ticketStatusToString(ticket::TicketStatus::InTest);
    body["ticket_data"] = ticketData;

    ticket3["ticket"] = body;
    array.append(ticket3);
  }

  {
    QJsonObject ticket3;
    QJsonObject body;
    QJsonObject usersInfo;
    usersInfo["assignee_name"] = "Animator";
    usersInfo["assignee_id"] = "1";
    usersInfo["reporter_id"] = "3";
    usersInfo["implementer_id"] = "2";
    body["users_info"] = usersInfo;

    QJsonObject ticketData;
    ticketData["title"] = "Create animations for Pig";
    ticketData["description"] =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "
        "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim "
        "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
        "aliquip ex ea commodo consequat. Duis aute irure dolor in "
        "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
        "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
        "culpa qui officia deserunt mollit anim id est laborum.";
    QDate createDate(2023, 10, 1);
    QTime createTime(23, 12, 23);
    QDate updateDate(2023, 10, 2);
    QTime updateTime(13, 15, 2);
    ticketData["create_date"] = createDate.toString();
    ticketData["create_time"] = createTime.toString();
    ticketData["update_date"] = updateDate.toString();
    ticketData["update_time"] = updateTime.toString();
    ticketData["component"] =
        ticket::ticketComponentsToString(ticket::TicketComponents::Animations);
    ticketData["priority"] =
        ticket::ticketPriorityToString(ticket::TicketPriority::P5);
    ticketData["status"] =
        ticket::ticketStatusToString(ticket::TicketStatus::InTest);
    body["ticket_data"] = ticketData;

    ticket3["ticket"] = body;
    array.append(ticket3);
  }

  doc.setArray(array);
  groupTickets();
}

QJsonArray BoardManager::getTickets(const quint8 columnIndex) {
  Q_ASSERT(columnIndex >= 0 && columnIndex < 7);
  return groupedTickets[columnIndex];
}

void BoardManager::groupTickets() {
  auto array = doc.array();
  for (const auto &i : doc.array()) {
    auto status_str = i.toObject()["ticket"]
                          .toObject()["ticket_data"]
                          .toObject()["status"]
                          .toString();
    ticket::TicketStatus status = ticket::ticketStatusToEnum(status_str);
    groupedTickets[static_cast<quint8>(status)].append(i.toObject());
  }
  emit updateBoard();
}

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

void BoardManager::showTickets() { setup(); }
