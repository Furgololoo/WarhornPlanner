#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "coffey.h"
#include "ticket/ticketbase.h"

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  Coffey coffey;
  //  coffey.test();
  QQmlApplicationEngine engine;
  engine.rootContext()->setContextProperty("BoardManager",
                                           coffey.getBoardManager());

  qmlRegisterType<ticket::TicketBase>("CustomElements", 1, 0, "TicketBase");

  //  const QUrl url("qrc:/main.qml");
  //  QObject::connect(
  //      &engine, &QQmlApplicationEngine::objectCreated, &app,
  //      [url](QObject *obj, const QUrl &objUrl) {
  //        if (!obj && url == objUrl)
  //          QCoreApplication::exit(-1);
  //      },
  //      Qt::QueuedConnection);
  //  engine.load(url);

  return app.exec();
}
