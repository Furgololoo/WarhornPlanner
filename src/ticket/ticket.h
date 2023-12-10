#pragma once

#include <QJsonObject>
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
  explicit Ticket(const QJsonObject &data);
  QString getTitle() const { return title; };
  QJsonObject toJson() const;
  void fromJson(const QJsonObject &data);

private:
  QJsonValue imageToJsonVal(const QImage &image);
  QImage jsonValToImage(const QJsonValue &json_val);

  int ticket_id;
  int sprint_id;
  int project_id;
  QString ticket_name;
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
