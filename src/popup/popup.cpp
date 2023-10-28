#include "popup.h"

#include <QSGFlatColorMaterial>
#include <QSGSimpleRectNode>

namespace popup {

Popup::Popup() {
  setFlag(ItemHasContents, true);
  timer.setInterval(5000);
  timer.setSingleShot(true);
  connect(&timer, &QTimer::timeout, this,
          [this]() { emit timeToSayGoodbye(); });
  timer.start();
}

QSGNode *Popup::updatePaintNode(QSGNode *oldNode,
                                UpdatePaintNodeData *updatePaintNodeData) {
  qDebug() << "0";
  QSGSimpleRectNode *mainRect = static_cast<QSGSimpleRectNode *>(oldNode);
  QSGGeometryNode *borderNode;
  QSGGeometry *border;
  qDebug() << "1";
  if (!mainRect) {
    qDebug() << "2a";
    mainRect = new QSGSimpleRectNode(boundingRect(), m_baseColor);
    borderNode = new QSGGeometryNode;
    border = new QSGGeometry(QSGGeometry::defaultAttributes_Point2D(), 5);
    mainRect->appendChildNode(borderNode);
    mainRect->setFlag(QSGNode::OwnsMaterial, true);
    mainRect->setFlag(QSGNode::OwnsGeometry, true);
  } else {
    qDebug() << "2b";
    borderNode = static_cast<QSGGeometryNode *>(mainRect->childAtIndex(0));
    border = borderNode->geometry();
  }

  qDebug() << "3";
  border->setLineWidth(2);
  border->setDrawingMode(QSGGeometry::DrawLineStrip);
  borderNode->setGeometry(border);

  qDebug() << "4";
  auto *material = new QSGFlatColorMaterial;
  material->setColor(m_borderColor);
  borderNode->setMaterial(material);

  qDebug() << "5";
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

}  // namespace popup
