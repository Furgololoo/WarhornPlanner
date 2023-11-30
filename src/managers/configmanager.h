#pragma once

#include <QJsonObject>
#include <QObject>

class ConfigManager : public QObject {
  Q_OBJECT
public:
  static void createConfigCred();
  static void createAppConfig();

signals:
private:
  explicit ConfigManager(QObject *parent = nullptr);
};
