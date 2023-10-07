#include "coffey.h"

#include <QDate>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QTime>

#include "ticket/ticketinfo.h"

Coffey::Coffey(QObject *parent) : QObject{parent} {}

void Coffey::test() {
  //  QJsonArray array;
  //  {
  //    QJsonObject ticket1;
  //    QJsonObject body;
  //    QJsonObject usersInfo;
  //    usersInfo["assignee_id"] = "3";
  //    usersInfo["reporter_id"] = "2";
  //    usersInfo["implementer_id"] = "1";
  //    body["users_info"] = usersInfo;

  //    QJsonObject ticketData;
  //    ticketData["title"] = "Fix AI";
  //    ticketData["description"] = "Create new AI";
  //    QDate createDate(2023, 10, 5);
  //    QTime createTime(12, 47, 25);
  //    QDate updateDate(2023, 10, 6);
  //    QTime updateTime(15, 11, 7);
  //    ticketData["create_date"] = createDate.toString();
  //    ticketData["create_hour"] = createTime.toString();
  //    ticketData["update_date"] = updateDate.toString();
  //    ticketData["update_hour"] = updateTime.toString();
  //    ticketData["component"] =
  //        ticket::ticketComponentsToString(ticket::TicketComponents::Code);
  //    ticketData["priority"] =
  //        ticket::ticketPriorityToString(ticket::TicketPriority::P3);
  //    ticketData["status"] =
  //        ticket::ticketStatusToString(ticket::TicketStatus::InProgress);
  //    body["ticket_data"] = ticketData;

  //    ticket1["ticket"] = body;
  //    array.append(ticket1);
  //  }

  //  {
  //    QJsonObject ticket2;
  //    QJsonObject body;
  //    QJsonObject usersInfo;
  //    usersInfo["assignee_id"] = "1";
  //    usersInfo["reporter_id"] = "1";
  //    usersInfo["implementer_id"] = "3";
  //    body["users_info"] = usersInfo;

  //    QJsonObject ticketData;
  //    ticketData["title"] = "Add build mechanic";
  //    ticketData["description"] = "Add mechanics bal bla bla";
  //    QDate createDate(2023, 10, 4);
  //    QTime createTime(12, 44, 21);
  //    QDate updateDate(2023, 10, 7);
  //    QTime updateTime(16, 27, 37);
  //    ticketData["create_date"] = createDate.toString();
  //    ticketData["create_hour"] = createTime.toString();
  //    ticketData["update_date"] = updateDate.toString();
  //    ticketData["update_hour"] = updateTime.toString();
  //    ticketData["component"] =
  //        ticket::ticketComponentsToString(ticket::TicketComponents::Code);
  //    ticketData["priority"] =
  //        ticket::ticketPriorityToString(ticket::TicketPriority::P2);
  //    ticketData["status"] =
  //        ticket::ticketStatusToString(ticket::TicketStatus::Blocked);
  //    body["ticket_data"] = ticketData;

  //    ticket2["ticket"] = body;
  //    array.append(ticket2);
  //  }

  //  {
  //    QJsonObject ticket3;
  //    QJsonObject body;
  //    QJsonObject usersInfo;
  //    usersInfo["assignee_id"] = "2";
  //    usersInfo["reporter_id"] = "1";
  //    usersInfo["implementer_id"] = "1";
  //    body["users_info"] = usersInfo;

  //    QJsonObject ticketData;
  //    ticketData["title"] = "Create DEVLOG #1";
  //    ticketData["description"] = "Add here new AI and new building mechanic";
  //    QDate createDate(2023, 10, 7);
  //    QTime createTime(17, 23, 01);
  //    QDate updateDate(2023, 10, 7);
  //    QTime updateTime(17, 37, 59);
  //    ticketData["create_date"] = createDate.toString();
  //    ticketData["create_hour"] = createTime.toString();
  //    ticketData["update_date"] = updateDate.toString();
  //    ticketData["update_hour"] = updateTime.toString();
  //    ticketData["component"] =
  //        ticket::ticketComponentsToString(ticket::TicketComponents::DevLog);
  //    ticketData["priority"] =
  //        ticket::ticketPriorityToString(ticket::TicketPriority::P4);
  //    ticketData["status"] =
  //        ticket::ticketStatusToString(ticket::TicketStatus::Open);
  //    body["ticket_data"] = ticketData;

  //    ticket3["ticket"] = body;
  //    array.append(ticket3);
  //  }

  //  QJsonDocument ticket_doc(array);
  //  QFile file("/home/furgololoo/Documents/CoffeyTestJson.json");
  //  file.open(QFile::WriteOnly);
  //  file.write(ticket_doc.toJson());
}
