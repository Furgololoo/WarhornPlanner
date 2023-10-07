#pragma once

#include <QDate>
#include <QImage>
#include <QObject>

#include "../user/user.h"

namespace ticket {

enum class TicketPriority { P1, P2, P3, P4, P5 };
enum class TicketComponents {
  AI,
  LevelDesign,
  Model,
  Animation,
  DevLog,
  Gameplay,
  Mechanics,
  Team,
  Code,
  Other
};

enum class TicketStatus { Open, Closed, InTest, InProgress, Done };

class TicketInfo : public QObject {
  Q_OBJECT
  friend class TicketBase;

 public:
  explicit TicketInfo();

  TicketPriority getPriority() const;
  QString getTitle() const;
  QString getDescription() const;
  QString getAssigneeUser() const;
  QImage getAssigneeUserImage() const;
  TicketComponents getComponent() const;
  QDate getCreateDate() const;
  QDate getUpdateDate() const;
  TicketStatus getTicketStatus() const;

 signals:
  void readAll();

 private:
  TicketPriority ticketPriority;
  QString title;
  QString description;
  user::User assigneeUser;
  TicketComponents component;
  QDate createDate;
  QDate updateDate;
  TicketStatus status;
};

}  // namespace ticket
