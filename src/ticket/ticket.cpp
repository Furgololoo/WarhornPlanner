#include "ticket.h"

#include <QBuffer>
#include <QDate>
#include <QImage>
#include <QJsonArray>
#include <QPixmap>
#include <QTime>

namespace ticket {
Ticket::Ticket() {}

QJsonObject Ticket::toJson() const {
  QJsonObject ticket_data;

  ticket_data["title"] = title;
  ticket_data["ticket_type"] = static_cast<int>(ticketType);
  ticket_data["acceptance_criteria"] = acceptanceCriteria;
  ticket_data["description"] = description;
  ticket_data["component"] = static_cast<int>(ticketComponent);
  ticket_data["priority"] = static_cast<int>(ticketPriority);
  ticket_data["status"] = static_cast<int>(ticketStatus);

  QDate createDate = QDate::currentDate();
  QTime createTime = QTime::currentTime();

  ticket_data["create_date"] = createDate.toString("dd.MM.yyyy");
  ticket_data["create_time"] = createTime.toString("hh:mm:ss");

  ticket_data["update_date"] = ticket_data["create_date"].toString("undefined");
  ticket_data["update_time"] = ticket_data["create_time"].toString("undefined");

  QJsonArray links_arr{};
  QJsonObject link{{"link_type", ""}, {"link_ticket", ""}};

  for (const auto &i : links) {
    link.insert("link_type", QVariant(i.linkType).toJsonValue());
    link.insert("link_ticket", QVariant(i.ticketID).toJsonValue());
    links_arr.push_back(link);
  }

  QJsonArray attachments_arr{};
  QJsonObject attachment{{"url", ""}, {"format", ""}};

  for (const auto &i : attachments) {
    attachment.insert("format", 123);
    attachment.insert("file", QVariant(i.url.toLocalFile()).toJsonValue());
    attachments_arr.push_back(attachment);
  }

  ticket_data["links"] = links_arr;
  ticket_data["attachments"] = attachments_arr;

  return ticket_data;
}

QJsonValue Ticket::imageToJsonVal(const QImage &image) {
  auto pix = QPixmap::fromImage(image);
  QBuffer buffer;
  buffer.open(QIODevice::WriteOnly);
  pix.save(&buffer, "PNG");
  auto const encoded = buffer.data().toBase64();
  return {QLatin1String(encoded)};
}

QImage Ticket::jsonValToImage(const QJsonValue &json_val) {
  auto const encoded = json_val.toString().toLatin1();
  QPixmap pix;
  pix.loadFromData(QByteArray::fromBase64(encoded), "PNG");
  return pix.toImage();
}

} // namespace ticket
