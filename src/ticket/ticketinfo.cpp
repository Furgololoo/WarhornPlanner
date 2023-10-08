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

QString ticketPriorityToString(const TicketPriority &state) {
  QString text{"default"};
  switch (state) {
  case TicketPriority::Undefined:
    text = "Undefined";
    break;
  case TicketPriority::P1:
    text = "P1";
    break;
  case TicketPriority::P2:
    text = "P2";
    break;
  case TicketPriority::P3:
    text = "P3";
    break;
  case TicketPriority::P4:
    text = "P4";
    break;
  case TicketPriority::P5:
    text = "P5";
    break;
  }
  return text;
}

TicketPriority ticketPriorityToEnum(const QString &state) {
  if (state == "P1")
    return TicketPriority::P1;
  else if (state == "P2")
    return TicketPriority::P2;
  else if (state == "P3")
    return TicketPriority::P3;
  else if (state == "P4")
    return TicketPriority::P4;
  else if (state == "P5")
    return TicketPriority::P5;

  return TicketPriority::Undefined;
}

QString ticketComponentsToString(const TicketComponents &state) {
  QString text{"default"};
  switch (state) {
  case TicketComponents::AI:
    text = "AI";
    break;
  case TicketComponents::LevelDesign:
    text = "LevelDesign";
    break;
  case TicketComponents::Model3D:
    text = "Model3D";
    break;
  case TicketComponents::Animations:
    text = "Animations";
    break;
  case TicketComponents::DevLog:
    text = "DevLog";
    break;
  case TicketComponents::Gameplay:
    text = "Gameplay";
    break;
  case TicketComponents::Engine:
    text = "Engine";
    break;
  case TicketComponents::Team:
    text = "Team";
    break;
  case TicketComponents::Code:
    text = "Code";
    break;
  case TicketComponents::Other:
    text = "Other";
    break;
  }
  return text;
}

TicketComponents ticketComponentsToEnum(const QString &state) {
  if (state == "AI")
    return TicketComponents::AI;
  else if (state == "LevelDesign")
    return TicketComponents::LevelDesign;
  else if (state == "Model3D")
    return TicketComponents::Model3D;
  else if (state == "Animations")
    return TicketComponents::Animations;
  else if (state == "DevLog")
    return TicketComponents::DevLog;
  else if (state == "Code")
    return TicketComponents::Code;
  else if (state == "Gameplay")
    return TicketComponents::Gameplay;
  else if (state == "Engine")
    return TicketComponents::Engine;
  else if (state == "Team")
    return TicketComponents::Team;

  return TicketComponents::Other;
}

QString ticketStatusToString(const TicketStatus &state) {
  QString text{"default"};
  switch (state) {
  case TicketStatus::Open:
    text = "Open";
    break;
  case TicketStatus::Closed:
    text = "Closed";
    break;
  case TicketStatus::Validated:
    text = "Validated";
    break;
  case TicketStatus::InTest:
    text = "InTest";
    break;
  case TicketStatus::InProgress:
    text = "InProgress";
    break;
  case TicketStatus::Done:
    text = "Done";
    break;
  case TicketStatus::Blocked:
    text = "Blocked";
    break;
  case TicketStatus::UnderTDD:
    text = "UnderTDD";
    break;
  }
  return text;
}

TicketStatus ticketStatusToEnum(const QString &state) {
  if (state == "Open")
    return TicketStatus::Open;
  else if (state == "Closed")
    return TicketStatus::Closed;
  else if (state == "InTest")
    return TicketStatus::InTest;
  else if (state == "Validated")
    return TicketStatus::Validated;
  else if (state == "InProgress")
    return TicketStatus::InProgress;
  else if (state == "Done")
    return TicketStatus::Done;
  else if (state == "Blocked")
    return TicketStatus::Blocked;
  else if (state == "UnderDevlog")
    return TicketStatus::UnderTDD;

  return TicketStatus::Closed;
}

} // namespace ticket
