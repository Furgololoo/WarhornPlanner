#include "error.h"

#include <QSGFlatColorMaterial>

namespace popup {

Error::Error() {
  setBaseColor("#F40038");
  setBorderColor(getBaseColor());
}

}  // namespace popup
