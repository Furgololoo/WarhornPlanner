#pragma once

#include <QObject>
#include <memory>

#include "../popup/popup.h"

namespace popup {
class PopupManager : public QObject {
  Q_OBJECT
  PopupManager(QObject *parent = nullptr);

 public:
  static PopupManager &getInstance() {
    static PopupManager instance;
    return instance;
  }

 public slots:
  void showError(const QString &message);
  void showWarning(const QString &message);
  void showNotify(const QString &message);

  void deletePopup();

 signals:
  void raiseError(Popup *error);
  void raiseNotify(Popup *error);

 private:
  std::map<uint8_t, std::unique_ptr<Popup>> popups;
};
}  // namespace popup
