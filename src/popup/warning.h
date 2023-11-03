#pragma once

#include "popup.h"
#include <QObject>

namespace popup {
class Warning : public Popup {
  Q_OBJECT
public:
  Warning(const int interval);
};

} // namespace popup
