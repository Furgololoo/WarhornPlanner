#pragma once

#include <QQuickItem>

#include "ticketinfo.h"

namespace ticket {
class TicketBase : public QQuickItem {
  Q_OBJECT
 public:
  TicketBase();

 public slots:

 signals:

 private:
  TicketInfo ticketInfo;
};

}  // namespace ticket