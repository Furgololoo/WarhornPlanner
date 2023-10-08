#pragma once

#include <QQuickItem>
#include <memory>

#include "ticketinfo.h"

namespace ticket {
class TicketBase : public QQuickItem {
  Q_OBJECT
 public:
  TicketBase();

 public slots:
  TicketPriority getPriority() const;
  QString getTitle() const;
  QString getDescription() const;
  //  QString getAssigneeUser() const;
  //  QImage getAssigneeUserImage() const;
  TicketComponents getComponent() const;
  QString getCreateDate() const;
  QString getUpdateDate() const;
  TicketStatus getTicketStatus() const;

  void setData(const QJsonObject &data);

 signals:
  void ticketReadyToDisplay();

 private:
  std::unique_ptr<TicketInfo> ticketInfo;
};

}  // namespace ticket
