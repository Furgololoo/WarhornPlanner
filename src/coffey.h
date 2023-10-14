#pragma once

#include <QObject>
#include <memory>

#include "managers/accountmanager.h"
#include "managers/boardmanager.h"
#include "managers/networkmanager.h"

class Coffey : public QObject {
  Q_OBJECT
public:
  explicit Coffey(QObject *parent = nullptr);

  BoardManager *getBoardManager() { return &board; };

  void test();

signals:

private:
  std::unique_ptr<network::NetworkManager> networkManager;
  std::unique_ptr<AccountManager> account;
  BoardManager board;
};
