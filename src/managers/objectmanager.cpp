#include "objectmanager.h"

#include <QQmlApplicationEngine>
#include <QQmlContext>

ObjectManager::ObjectManager(QObject *parent) : QObject{parent} {
  accountManager = std::make_shared<AccountManager>();
  boardManager = std::make_shared<BoardManager>();
  networkManager = std::make_shared<NetworkManager>();
}

void ObjectManager::setContextProperty(QQmlApplicationEngine &engine) {
  //  engine.rootContext()->setContextProperty("PdfManager", pdfManager.get());
  //  engine.rootContext()->setContextProperty("ImageManager",
  //  imageManager.get());
  //  engine.rootContext()->setContextProperty("ImageProvider",
  //                                           imageProvider.get());
  //  //  engine.rootContext()->setContextProperty("AlgorithmsManager",
  //  //                                           algorithmsManager.get());
  //  engine.addImageProvider("ImageProvider", imageProvider.get());
  //  //  engine.rootContext()->setContextProperty("AlgSettingsManager",
  //  //                                           algSettingsManager.get());
}

void ObjectManager::registerTypes() {
  //  qmlRegisterType<AlgSettingsManager>("settings", 1, 0,
  //  "AlgSettingsManager");
}
