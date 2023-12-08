#pragma once

#include "coffeybase.h"
#include <QObject>

class CoffeyUser : public CoffeyBase {
  Q_OBJECT
public:
  explicit CoffeyUser(QObject *parent = nullptr);

public slots:
  void login(const QString &login, const QString &password);
  void onLogged(const QJsonObject &user_data);

  QJsonObject getUserInfo() const;

  void changeUserName(const QString user_name);
  void changeLogin(const QString login);
  void changePassword(const QString login, const QString old_password,
                      const QString new_password);

signals:
  void logged();
  void userLogged(QString userName);
  void failedLogin(const QString &message);
};
