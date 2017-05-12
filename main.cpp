#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "src/FileActions.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<FileActions>("FSBasics", 1, 0, "FileActions");
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
