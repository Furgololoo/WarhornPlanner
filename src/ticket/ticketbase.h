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
  QString getPriority() const;
  QString getTitle() const;
  QString getDescription() const;
  //  QString getAssigneeUser() const;
  //  QImage getAssigneeUserImage() const;
  QString getComponent() const;
  QString getCreateDate() const;
  QString getUpdateDate() const;
  QString getTicketStatus() const;

  void setData(const QJsonObject &data);

 signals:
  void ticketReadyToDisplay();

 private:
  std::unique_ptr<TicketInfo> ticketInfo;
};

}  // namespace ticket
