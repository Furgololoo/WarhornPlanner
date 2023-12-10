#pragma once

#include "../ticket/ticket.h"
#include "networkmanager.h"
#include <QObject>
#include <memory>

namespace ticket {
class TicketManager : public QObject {
  Q_OBJECT
public:
  TicketManager();
  void setNetworkManager(std::shared_ptr<network::NetworkManager> network_ptr);

public slots:
  QVector<QString> getEnumList(const int &enumID);

  bool createTicket();

  QString getTicketName() const;
  QString getTitle() const;
  int getProjectID() const;
  int getSprintID() const;
  quint8 getType() const;
  QString getAcceptanceCriteria() const;
  QString getDescription() const;
  quint8 getComponent() const;
  quint8 getPriority() const;
  quint8 getStatus() const;
  QJsonArray getLink() const;
  QJsonArray getAttachment() const;

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
  void closeTicket();

  void openTicket(const unsigned int ticket_id);

signals:
  void errorOccured(const QString &message);
  void getData();

  void resetTicketView();

  void openTicketView();

private:
  std::unique_ptr<Ticket> ticket;
  std::shared_ptr<Ticket> current_managed_ticket;
  std::vector<std::shared_ptr<Ticket>> downloaded_tickets;

  std::shared_ptr<network::NetworkManager> network;
};
} // namespace ticket
