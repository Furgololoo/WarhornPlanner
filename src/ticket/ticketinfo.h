#pragma once

#include <QDate>
#include <QImage>
#include <QObject>

#include "../user/user.h"

namespace ticket {

enum class TicketPriority : quint8 {
  Undefined = 0x0,
  P1 = 0x1,
  P2 = 0x2,
  P3 = 0x3,
  P4 = 0x4,
  P5 = 0x5
};
enum class TicketComponents : quint8 {
  AI = 0x0,
  LevelDesign = 0x1,
  Model3D = 0x2,
  Animations = 0x3,
  DevLog = 0x4,
  Gameplay = 0x5,
  Engine = 0x6,
  Team = 0x7,
  Code = 0x8,
  Other = 0x9
};

enum class TicketStatus : quint8 {
  Open = 0x0,
  InProgress = 0x1,
  Blocked = 0x2,
  InTest = 0x3,
  Validated = 0x4,
  UnderTDD = 0x5,
  Done = 0x6,
  Closed = 0x7
};

QString ticketPriorityToString(const TicketPriority &state);
TicketPriority ticketPriorityToEnum(const QString &state);
QString ticketComponentsToString(const TicketComponents &state);
TicketComponents ticketComponentsToEnum(const QString &state);
QString ticketStatusToString(const TicketStatus &state);
TicketStatus ticketStatusToEnum(const QString &state);

class TicketInfo : public QObject {
  Q_OBJECT
  friend class TicketBase;

public:
  explicit TicketInfo(const QJsonObject &data);

signals:
  void readAll();

private:
  QString assigneeName;
  TicketPriority ticketPriority;
  QString title;
  QString description;
  //  user::User assigneeUser;
  TicketComponents component;
  QString createDate;
  QString updateDate;
  TicketStatus status;
};

} // namespace ticket
