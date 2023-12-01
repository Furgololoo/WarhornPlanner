#include "coffey.h"

#include <QDate>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QTime>

#include "managers/configmanager.h"
#include "ticket/ticketinfo.h"

Coffey::Coffey(QObject *parent) : QObject{parent} {
  QUrl url;
  url.setHost("127.0.0.1");
  url.setPort(9999);
  networkManager = std::make_shared<network::NetworkManager>(
      QStringLiteral("ws://127.0.0.1:9999"));
  ticketManager.setNetworkManager(networkManager);

  connect(networkManager.get(), &network::NetworkManager::logged, this,
          &Coffey::onLogged);
  connect(networkManager.get(), &network::NetworkManager::failedLogin, this,
          &Coffey::failedLogin);
  currentLoggedUser = std::make_shared<user::User>();

  auto &conf = app_config::ConfigManager::instance();
}

void Coffey::login(const QString &login, const QString &password) {
  networkManager->login(login, password);
}

void Coffey::onLogged(const QJsonObject &user_data) {
  currentLoggedUser = std::make_shared<user::User>(user_data);
  networkManager->setUserPointer(currentLoggedUser);
  emit logged();
  emit userLogged(currentLoggedUser->getName());
}

QJsonObject Coffey::getUserInfo() const {
  QJsonObject user_info{};
  user_info["user_name"] = currentLoggedUser->getName();
  user_info["login"] = currentLoggedUser->getLogin();
  user_info["user_roles"] =
      QJsonArray::fromStringList(currentLoggedUser->getUserRoles());
  return user_info;
}
