#include "coffeyuser.h"

CoffeyUser::CoffeyUser(QObject *parent) : CoffeyBase{parent} {
  connect(networkManager.get(), &network::NetworkManager::logged, this,
          &CoffeyUser::onLogged);
  connect(networkManager.get(), &network::NetworkManager::failedLogin, this,
          &CoffeyUser::failedLogin);
}

void CoffeyUser::login(const QString &login, const QString &password) {
  networkManager->login(login, password);
}

void CoffeyUser::onLogged(const QJsonObject &user_data) {
  currentLoggedUser = std::make_shared<user::User>(user_data);
  networkManager->setUserPointer(currentLoggedUser);
  emit logged();
  emit userLogged(currentLoggedUser->getName());
}

QJsonObject CoffeyUser::getUserInfo() const {
  QJsonObject user_info{};
  user_info["user_name"] = currentLoggedUser->getName();
  user_info["login"] = currentLoggedUser->getLogin();
  user_info["user_roles"] =
      QJsonArray::fromStringList(currentLoggedUser->getUserRoles());
  return user_info;
}

void CoffeyUser::changeUserName(const QString user_name)
{

}

void CoffeyUser::changeLogin(const QString login)
{

}

void CoffeyUser::changePassword(const QString login, const QString old_password, const QString new_password)
{

}
