#include "popupmanager.h"

#include "../popup/error.h"
#include "../popup/notify.h"
#include "../popup/warning.h"

namespace popup {

PopupManager::PopupManager(QObject *parent) : QObject{parent} {}

void PopupManager::showError(const QString &message) {
  std::unique_ptr<Popup> error = std::make_unique<Error>();
  error->setBaseText(message);
  error->setMapID(popups.size());

  connect(error.get(), &Popup::timeToSayGoodbye, this,
          &PopupManager::deletePopup);
  emit raiseError(error.get());

  popups.insert({error->getMapID(), std::move(error)});
}

void PopupManager::showWarning(const QString &message) {
  std::unique_ptr<Popup> warning = std::make_unique<Warning>();
  warning->setBaseText(message);
  warning->setMapID(popups.size());

  connect(warning.get(), &Popup::timeToSayGoodbye, this,
          &PopupManager::deletePopup);
  emit raiseError(warning.get());

  popups.insert({warning->getMapID(), std::move(warning)});
}

void PopupManager::showNotify(const QString &message) {
  std::unique_ptr<Popup> notify = std::make_unique<Notify>();
  notify->setBaseText(message);
  notify->setMapID(popups.size());

  connect(notify.get(), &Popup::timeToSayGoodbye, this,
          &PopupManager::deletePopup);
  emit raiseNotify(notify.get());

  popups.insert({notify->getMapID(), std::move(notify)});
}

void PopupManager::deletePopup() {
  Popup *popup = dynamic_cast<Popup *>(sender());
  if (popups.size() == 1) {
    auto it = popups.begin();
    popups.erase(it);
  } else {
    for (auto it = popups.begin(); it != popups.end(); it++) {
      if (it->first == popup->getMapID()) {
        popups.erase(it);
        //      it->second->deleteLater();
      }
    }
  }
}

}  // namespace popup
