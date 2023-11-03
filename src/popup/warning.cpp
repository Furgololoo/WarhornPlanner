#include "warning.h"

namespace popup {
Warning::Warning(const int interval) : Popup(interval) {
  setBaseColor("#FFD000");
  setBorderColor(getBaseColor());
  setType(1); // top popup; warning
}
} // namespace popup
