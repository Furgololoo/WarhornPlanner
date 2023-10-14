#ifndef OBJECTMANAGER_H
#define OBJECTMANAGER_H

#include <QObject>
#include <QSharedPointer>
#include <memory>

#include "accountmanager.h"
#include "boardmanager.h"
#include "networkmanager.h"

class QQmlApplicationEngine;

class ObjectManager : public QObject {
  Q_OBJECT
public:
  explicit ObjectManager(QObject *parent = nullptr);

  void setContextProperty(QQmlApplicationEngine &engine);
  void registerTypes();

signals:

private:
  std::shared_ptr<AccountManager> accountManager;
  std::shared_ptr<BoardManager> boardManager;
  std::shared_ptr<network::NetworkManager> networkManager;
};

#endif // OBJECTMANAGER_H
