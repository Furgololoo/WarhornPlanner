#include "ticketbase.h"

#include <QJsonObject>

namespace ticket {
TicketBase::TicketBase() {}

void TicketBase::setData(const QJsonObject &data) { qDebug() << data; }

} // namespace ticket
