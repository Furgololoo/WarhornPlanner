#include "popupmanager.h"
#include "../popup/error.h"
#include "../popup/notify.h"
#include "../popup/warning.h"

namespace popup {

PopupManager::PopupManager(QObject *parent) : QObject{parent} {}

void PopupManager::showError(const QString &message) {
  std::unique_ptr<Popup> error = std::make_unique<Error>();
  error->setBaseText(message);
  error->setMapID(errors.size());

  connect(error.get(), &Popup::timeToSayGoodbye, this,
          &PopupManager::deletePopup);
  emit raiseError(error.get());

  errors.insert({error->getMapID(), std::move(error)});
}

void PopupManager::showWarning(const QString &message) {
  std::unique_ptr<Popup> warning = std::make_unique<Warning>();
  warning->setBaseText(message);
  warning->setMapID(errors.size());

  connect(warning.get(), &Popup::timeToSayGoodbye, this,
          &PopupManager::deletePopup);
  emit raiseError(warning.get());

  errors.insert({warning->getMapID(), std::move(warning)});
}

void PopupManager::deletePopup() {
  Popup *popup = dynamic_cast<Popup *>(sender());
  for (auto it = errors.begin(); it != errors.end(); it++) {
    if (it->first == popup->getMapID()) {
      errors.erase(it);
    }
  }
}

} // namespace popup
