#pragma once

#include <QQuickItem>
#include <QSGGeometryNode>
#include <QTimer>

namespace popup {
class Popup : public QQuickItem {
  Q_OBJECT
public:
  Popup();
  void setMapID(const uint8_t id) { map_id = id; }
  uint8_t getMapID() const { return map_id; }

protected:
  Q_PROPERTY(QString baseText MEMBER m_baseText READ getBaseText WRITE
                 setBaseText NOTIFY baseTextChanged)
  Q_PROPERTY(
      QColor baseColor MEMBER m_baseColor READ getBaseColor WRITE setBaseColor)

  virtual QSGNode *
  updatePaintNode(QSGNode *oldNode,
                  UpdatePaintNodeData *updatePaintNodeData) override final;

public slots:
  QString getBaseText() { return m_baseText; }
  void setBaseText(const QString &err_text) {
    m_baseText = err_text;
    emit baseTextChanged(m_baseText);
  }

  QColor getBaseColor() { return m_baseColor; }
  void setBaseColor(const QColor &color) { m_baseColor = color; }

  void close();

signals:
  void baseTextChanged(const QString &text);

  void timeToSayGoodbye();

private:
  QString m_baseText;
  QColor m_baseColor;

  QTimer timer;

  uint8_t map_id;

  QSGGeometryNode *m_borderActiveNode;
};

} // namespace popup
