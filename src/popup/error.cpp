#include "error.h"

#include <QSGFlatColorMaterial>

namespace popup {

Error::Error(const int interval) : Popup(interval) {
  setBaseColor("#F40038");
  setBorderColor(getBaseColor());
  setType(0); // top popup; error
}

} // namespace popup
