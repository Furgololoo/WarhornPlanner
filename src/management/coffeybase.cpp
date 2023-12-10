#include "coffeybase.h"

CoffeyBase::CoffeyBase(QObject *parent)
    : QObject{parent}, conf(app_config::ConfigManager::instance()) {
  QUrl url;
  url.setHost("127.0.0.1");
  url.setPort(9999);
  networkManager = std::make_shared<network::NetworkManager>(
      QStringLiteral("ws://127.0.0.1:9999"));
  ticketManager.setNetworkManager(networkManager);

  currentLoggedUser = std::make_shared<user::User>();
}

QString CoffeyBase::getProjectName(const int id) { return "testProjectName"; }
