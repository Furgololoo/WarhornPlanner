#pragma once

#include <QJsonDocument>
#include <QObject>

class BoardManager : public QObject {
  Q_OBJECT
public:
  explicit BoardManager();

public slots:
  QStringList getTicketColList() const;
  int getTicketColListSize() const;

  void setup();

signals:
  void updateBoard();

  void createTicket(const QJsonObject &data);

private:
  QJsonDocument doc;
};
