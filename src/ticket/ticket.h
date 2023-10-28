#pragma once

#include <QUrl>

#include "ticketinfo.h"

namespace ticket {

struct Attachment {
  QUrl url;
  quint8 id;
};

struct TicketLink {
  QString linkType;
  QString ticketID;
  quint8 id;
};

class Ticket {
  friend class TicketManager;

public:
  explicit Ticket();

private:
  QString title;
  ticket::TicketType ticketType;
  QString acceptanceCriteria;
  QString description;
  ticket::TicketComponents ticketComponent;
  ticket::TicketPriority ticketPriority;
  ticket::TicketStatus ticketStatus;

  std::vector<Attachment> attachments;
  std::vector<TicketLink> links;
};

} // namespace ticket
