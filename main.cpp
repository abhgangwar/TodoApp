//
// This file is part of the ToDo app.
//
// This program is free software licensed under the GNU LGPL. You can
// find a copy of this license in LICENSE.txt in the top directory of
// the source code.
//
// Copyright 2017 Abhinav Gangwar <abhgang@gmail.com>
//

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
