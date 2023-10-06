#ifndef TICKETINFO_H
#define TICKETINFO_H

#include <QObject>

class TicketInfo : public QObject
{
    Q_OBJECT
public:
    explicit TicketInfo(QObject *parent = nullptr);

signals:

};

#endif // TICKETINFO_H
