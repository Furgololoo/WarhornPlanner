#pragma once

#include "popup.h"
#include <QSGGeometryNode>

namespace popup {
class Error : public Popup {
  Q_OBJECT
public:
  Error(const int interval);
};
} // namespace popup
