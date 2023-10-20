#pragma once

#include <QImage>

namespace user {
enum class Role : quint8 {
  Undefined = 0x0,
  Programmer = 0x1,
  ConceptArtist = 0x2,
  Artist3D = 0x4,
  Animator = 0x8,
  GameDesigner = 0x10,
  NarrativeDesigner = 0x20

};

class User {
public:
  explicit User();

  QString getName() const;
  QImage getImage() const;

private:
  QString userName;
  QImage userImage;
};
} // namespace user
