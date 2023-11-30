#pragma once

#include <QImage>
#include <QJsonObject>

namespace user {
enum class ERole : quint16 {
  Programmer = 1 << 0,
  ConceptArtist = 1 << 1,
  Artist3D = 1 << 2,
  Animator = 1 << 3,
  GameDesigner = 1 << 4,
  NarrativeDesigner = 1 << 5,
  QA = 1 << 6,
  Maintainer = 1 << 7,
  Tester = 1 << 8,
  ProductOwner = 1 << 9,
  Administrator = 1 << 10
};
constexpr int kRolesCount = 11;

QString roleToString(const ERole role);

class User {
public:
  explicit User(const QJsonObject &user_data);
  explicit User();

  QString getName() const;
  QString getLogin() const;
  QString getImagePath() const;
  QImage getImage() const;
  QString getToken() const;
  int getUserRole() const;
  QStringList getUserRoles() const;
  int getUserId() const;

  void setUserName(const QString &user_name_);
  void setLogin(const QString &login_);
  void setToken(const QString &token_);
  void setUserRole(const int role);

private:
  int user_id;
  int user_role;
  QString user_name;
  QString login;
  QString image_path;
  QImage user_image;
  QString token;
};
} // namespace user
