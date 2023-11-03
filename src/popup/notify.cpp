#include "notify.h"

namespace popup {

Notify::Notify(const int interval) : Popup(interval) {
  setBaseColor("#131318");
  setBorderColor("#2E93FF");
  setType(2); // bottom popup
}

} // namespace popup
