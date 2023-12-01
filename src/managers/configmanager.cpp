#include "configmanager.h"
#include "../config/config.h"
#include <QStandardPaths>

void app_config::ConfigManager::createCredConfig() {}

void app_config::ConfigManager::createAppConfig() {}

app_config::ConfigManager &app_config::ConfigManager::instance() {
  static ConfigManager instance;
  return instance;
}

app_config::ConfigManager::ConfigManager(QObject *parent) : QObject{parent} {
  m_app_dir_path =
      QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation);
  m_config_file = "config.json";

  setupAppDir();
  logAppPaths();
}

void app_config::ConfigManager::setupAppDir() const {
  try {
    for (const auto &i : kAppDirs) {
      if (m_app_dir_path.exists(QString::fromStdString(i))) {
        qInfo() << "exist " << QString::fromStdString(i);
      } else {
        qInfo() << "do not exist " << QString::fromStdString(i)
                << ". creating one";
        m_app_dir_path.mkdir(QString::fromStdString(i),
                             QFile::Permission::ReadOwner |
                                 QFile::Permission::WriteOwner);
      }
    }
  } catch (const std::exception &e) {
    qCritical() << "Catched error in " << __FUNCTION__
                << "\nwhat: " << e.what();
  }
}

void app_config::ConfigManager::logAppPaths() const {
  qInfo() << "====================================";
  qInfo() << "App Paths:";
  qInfo() << "Main dir: " << m_app_dir_path.absolutePath();
  logDirStructure(m_app_dir_path.filesystemAbsolutePath());
  qInfo() << "====================================";
}

void app_config::ConfigManager::logDirStructure(
    const fs::path &current_dir) const {

  for (const auto &entry :
       std::filesystem::recursive_directory_iterator(current_dir)) {
    if (entry.is_directory()) {
      qInfo() << QString::fromStdString(entry.path().string());
    }
  }
}
