#pragma once

#include <QImage>

namespace user {
class User {
 public:
  explicit User();

  QString getName() const;
  QImage getImage() const;

 private:
  QString userName;
  QImage userImage;
};
}  // namespace user
