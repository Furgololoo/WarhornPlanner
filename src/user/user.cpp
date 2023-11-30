#include "user.h"

namespace user {

User::User(const QJsonObject &user_data) {
  user_id = user_data["user_id"].toInt(-1);
  user_role = user_data["user_role"].toInt(-1);
  user_name = user_data["user_name"].toString();
  image_path = user_data["image_path"].toString();
  token = user_data["token"].toString();
}

User::User() {
  user_id = 1;
  user_role = 0b10010000001;
  user_name = "NotLogged";
  login = "not.logged";
}

QString User::getName() const { return user_name; }

QString User::getLogin() const { return login; }

QString User::getImagePath() const { return image_path; }

QImage User::getImage() const { return user_image; }

QString User::getToken() const { return token; }

int User::getUserRole() const { return user_role; }

QStringList User::getUserRoles() const {
  QStringList roles{};
  for (int i = 0; i < kRolesCount; i++) {
    if (user_role & (1 << i))
      roles.append(roleToString(static_cast<ERole>((1 << i))));
  }
  return roles;
}

int User::getUserId() const { return user_id; }

void User::setUserName(const QString &user_name_) { user_name = user_name_; }

void User::setLogin(const QString &login_) { login = login_; }

void User::setToken(const QString &token_) { token = token_; }

void User::setUserRole(const int role_) { user_role = role_; }

QString roleToString(const ERole role) {
  QString role_str{};

  switch (role) {
  case ERole::Programmer:
    role_str = "Programmer";
    break;
  case ERole::ConceptArtist:
    role_str = "ConceptArtist";
    break;
  case ERole::Artist3D:
    role_str = "Artist3D";
    break;
  case ERole::Animator:
    role_str = "Animator";
    break;
  case ERole::GameDesigner:
    role_str = "GameDesigner";
    break;
  case ERole::NarrativeDesigner:
    role_str = "NarrativeDesigner";
    break;
  case ERole::QA:
    role_str = "QA";
    break;
  case ERole::Maintainer:
    role_str = "Maintainer";
    break;
  case ERole::Tester:
    role_str = "Tester";
    break;
  case ERole::ProductOwner:
    role_str = "ProductOwner";
    break;
  case ERole::Administrator:
    role_str = "Administrator";
    break;
  default:
    role_str = "Undefined";
    break;
  }

  return role_str;
}

} // namespace user
