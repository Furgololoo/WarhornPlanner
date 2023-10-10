#pragma once

#include <QJsonArray>
#include <QJsonDocument>
#include <QObject>

class BoardManager : public QObject {
  Q_OBJECT
public:
  explicit BoardManager();

public slots:
  QStringList getTicketColList() const;
  int getTicketColListSize() const;

  void showTickets();

  void setup();
  QJsonArray getTickets(const quint8 columnIndex);

signals:
  void updateBoard();

  void createTicket(const QJsonObject &data);

private:
  void groupTickets();
  QVector<QJsonArray> groupedTickets;
  QJsonDocument doc;
};
