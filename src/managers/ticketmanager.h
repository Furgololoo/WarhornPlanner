#pragma once

#include "../ticket/ticket.h"
#include <QObject>
#include <memory>

namespace ticket {
class TicketManager : public QObject {
  Q_OBJECT
public:
  TicketManager();

public slots:
  QVector<QString> getEnumList(const int &enumID);

  bool createTicket();

  void setTitle(const QString &title);
  void setType(const quint8 &type_int);
  void setAcceptanceCriteria(const QString &text);
  void setDescription(const QString &text);
  void setComponent(const quint8 &type_int);
  void setPriority(const quint8 &type_int);
  void setStatus(const quint8 &type_int);

  // clang-format off
  QString addAttachment(const QUrl &url, const quint8 &attachment_id);
  void removeAttachment(const int &attachment_id);
  void addLink(const QString &linkType, const QString &ticket_id, const quint8 &link_id);
  void updateLink(const QString &linkType, const QString &ticket_id, const quint8 &link_id);
  void removeLink(const quint8 &link_id);
  // clang-format on

  void saveTicket();

signals:
  void errorOccured(const QString &message);

private:
  std::unique_ptr<Ticket> ticket;
};
} // namespace ticket
