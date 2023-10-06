#pragma once

#include "managers/accountmanager.h"
#include "managers/boardmanager.h"
#include "managers/networkmanager.h"

#include <QObject>

#include <memory>

class Coffey : public QObject {
  Q_OBJECT
public:
  explicit Coffey(QObject *parent = nullptr);

  BoardManager *getBoardManager() { return &board; };

signals:

private:
  std::unique_ptr<NetworkManager> network;
  std::unique_ptr<AccountManager> account;
  BoardManager board;
};
