#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "coffey.h"
#include "managers/popupmanager.h"
#include "popup/error.h"
#include "ticket/ticketbase.h"

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  Coffey coffey;
  //  coffey.test();
  QQmlApplicationEngine engine;
  engine.rootContext()->setContextProperty("BoardManager",
                                           coffey.getBoardManager());
  engine.rootContext()->setContextProperty("TicketManager",
                                           coffey.getTicketManager());
  engine.rootContext()->setContextProperty("PopupManager",
                                           &popup::PopupManager::getInstance());

  qmlRegisterType<ticket::TicketBase>("CustomElements", 1, 0, "TicketBase");
  qmlRegisterType<popup::Error>("CustomElements", 1, 0, "Error");

  const QUrl url("qrc:/main.qml");
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
