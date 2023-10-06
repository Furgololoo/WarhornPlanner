#pragma once

#include <QObject>

class BoardManager : public QObject {
  Q_OBJECT
public:
  explicit BoardManager();

public slots:
  QStringList getTicketColList() const;
  int getTicketColListSize() const;

signals:
};
