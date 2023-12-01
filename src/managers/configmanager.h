#pragma once

#include <QDir>
#include <QJsonObject>
#include <QObject>
#include <filesystem>

namespace app_config {
namespace fs = std::filesystem;

class ConfigManager : public QObject {
  Q_OBJECT
public:
  static void createCredConfig();
  static void createAppConfig();

  static ConfigManager &instance();

private:
  explicit ConfigManager(QObject *parent = nullptr);

  void setupAppDir() const;
  void logAppPaths() const;
  void logDirStructure(const fs::path &current_dir) const;

  QDir m_app_dir_path{};
  QString m_config_file{};
};
} // namespace app_config
