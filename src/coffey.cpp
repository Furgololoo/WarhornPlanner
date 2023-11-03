#include "coffey.h"

#include <QDate>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QTime>

#include "ticket/ticketinfo.h"

Coffey::Coffey(QObject *parent) : QObject{parent} {
  QUrl url;
  url.setHost("127.0.0.1");
  url.setPort(9999);
  networkManager = std::make_shared<network::NetworkManager>(
      QStringLiteral("ws://127.0.0.1:9999"));
  ticketManager.setNetworkManager(networkManager);
}

void Coffey::login(const QString &username, const QString &password) {}
