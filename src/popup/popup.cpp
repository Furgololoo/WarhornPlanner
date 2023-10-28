#include "popup.h"
#include <QSGFlatColorMaterial>

namespace popup {

Popup::Popup() {
  setFlag(ItemHasContents, true);
  timer.setInterval(5000);
  timer.setSingleShot(true);
  connect(&timer, &QTimer::timeout, this, &Popup::close);
  timer.start();
}

QSGNode *Popup::updatePaintNode(QSGNode *oldNode,
                                UpdatePaintNodeData *updatePaintNodeData) {

  QSGGeometryNode *mainRect = static_cast<QSGGeometryNode *>(oldNode);

  if (!mainRect) {
    mainRect = new QSGGeometryNode;
    mainRect->setFlag(QSGNode::OwnsMaterial, true);
    mainRect->setFlag(QSGNode::OwnsGeometry, true);
  }

  const QRectF rect = boundingRect();
  QSGGeometry *geometry =
      new QSGGeometry(QSGGeometry::defaultAttributes_Point2D(), 4);

  QSGGeometry::Point2D *points = geometry->vertexDataAsPoint2D();
  points[0].x = rect.left();
  points[0].y = rect.top();
  points[1].x = rect.left();
  points[1].y = rect.bottom();
  points[2].x = rect.right();
  points[2].y = rect.top();
  points[3].x = rect.right();
  points[3].y = rect.bottom();

  mainRect->setGeometry(geometry);

  QSGFlatColorMaterial *material = new QSGFlatColorMaterial;
  material->setColor(m_baseColor);
  mainRect->setMaterial(material);

  return mainRect;
}

void Popup::close() {
  timer.stop();
  disconnect(&timer, &QTimer::timeout, this, &Popup::close);
  emit timeToSayGoodbye();
}

} // namespace popup
