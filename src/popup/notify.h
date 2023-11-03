#pragma once

#include "popup.h"
#include <QObject>

namespace popup {
class Notify : public Popup {
  Q_OBJECT
public:
  Notify(const int interval);
};

} // namespace popup
