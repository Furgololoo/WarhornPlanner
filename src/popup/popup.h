#pragma once

#include <QQuickItem>
#include <QSGGeometryNode>
#include <QTimer>

namespace popup {
class Popup : public QQuickItem {
  Q_OBJECT
public:
  Popup(const int interval);
  void setMapID(const uint8_t id) { map_id = id; }
  uint8_t getMapID() const { return map_id; }

protected:
  Q_PROPERTY(QString baseText MEMBER m_baseText READ getBaseText WRITE
                 setBaseText NOTIFY baseTextChanged)
  Q_PROPERTY(QColor baseColor MEMBER m_baseColor READ getBaseColor WRITE
                 setBaseColor NOTIFY baseColorChanged)
  Q_PROPERTY(QColor borderColor MEMBER m_borderColor READ getBorderColor WRITE
                 setBorderColor)
  Q_PROPERTY(
      int type MEMBER m_type READ getType WRITE setType NOTIFY typeChanged)

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
  void setBaseColor(const QColor &color) {
    m_baseColor = color;
    emit baseColorChanged(m_baseColor);
  }

  QColor getBorderColor() { return m_borderColor; }
  void setBorderColor(const QColor &color) { m_borderColor = color; }

  int getType() { return m_type; }
  void setType(const int &type) { m_type = type; }

signals:
  void baseTextChanged(const QString &text);
  void baseColorChanged(const QColor &color);
  void typeChanged(const int &type);

  void timeToSayGoodbye();

private:
  QString m_baseText;
  QColor m_baseColor;
  QColor m_borderColor;
  int m_type;

  QTimer timer;

  uint8_t map_id;

  QSGGeometryNode *m_borderActiveNode;
};

} // namespace popup
