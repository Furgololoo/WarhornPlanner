#pragma once

#include "../ticket/ticketbase.h"
#include <QObject>

namespace ticket {
class TicketManager : public QObject {
  Q_OBJECT
public:
  TicketManager();

public slots:
  QVector<QString> getEnumList(const int &enumID);

signals:
};
} // namespace ticket
