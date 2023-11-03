#include "popup.h"

#include <QSGFlatColorMaterial>
#include <QSGSimpleRectNode>

namespace popup {

Popup::Popup(const int interval) {

  setFlag(ItemHasContents, true);
  timer.setInterval(interval);
  timer.setSingleShot(true);
  connect(&timer, &QTimer::timeout, this,
          [this]() { emit timeToSayGoodbye(); });
  timer.start();
}

QSGNode *Popup::updatePaintNode(QSGNode *oldNode,
                                UpdatePaintNodeData *updatePaintNodeData) {
  QSGSimpleRectNode *mainRect = static_cast<QSGSimpleRectNode *>(oldNode);
  QSGGeometryNode *borderNode;
  QSGGeometry *border;

  if (!mainRect) {
    mainRect = new QSGSimpleRectNode(boundingRect(), m_baseColor);
    borderNode = new QSGGeometryNode;
    border = new QSGGeometry(QSGGeometry::defaultAttributes_Point2D(), 5);
    mainRect->appendChildNode(borderNode);
  } else {
    borderNode = static_cast<QSGGeometryNode *>(mainRect->childAtIndex(0));
    border = borderNode->geometry();
    borderNode->setFlag(QSGNode::OwnsMaterial, true);
    borderNode->setFlag(QSGNode::OwnsGeometry, true);
  }

  border->setLineWidth(1);
  border->setDrawingMode(QSGGeometry::DrawLineStrip);
  borderNode->setGeometry(border);

  auto *material = new QSGFlatColorMaterial;
  material->setColor(m_borderColor);
  borderNode->setMaterial(material);

  const QRectF rect = boundingRect();

  QSGGeometry::Point2D *vertices = border->vertexDataAsPoint2D();
  vertices[0].set(0, 0);
  vertices[1].set(rect.width(), 0);
  vertices[2].set(rect.width(), rect.height());
  vertices[3].set(0, rect.height());
  vertices[4].set(0, 0);
  borderNode->markDirty(QSGNode::DirtyGeometry);
  mainRect->markDirty(QSGNode::DirtyGeometry);

  return mainRect;
}

} // namespace popup
