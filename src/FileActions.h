//
// This file is part of the ToDo app.
//
// This program is free software licensed under the GNU LGPL. You can
// find a copy of this license in LICENSE.txt in the top directory of
// the source code.
//
// Copyright 2017 Abhinav Gangwar <abhgang@gmail.com>
//

#ifndef FILEACTIONS_H
#define FILEACTIONS_H

#include <QObject>

class QString;

class FileActions : public QObject
{

    Q_OBJECT
    Q_PROPERTY( QString contents READ contents WRITE setContents NOTIFY contentsChanged )
    Q_PROPERTY( QString source READ source WRITE setSource NOTIFY sourceChanged )

public:
    explicit FileActions( QObject *parent = 0 );

    Q_INVOKABLE void saveContents();
    QString contents() const;
    void setContents( QString &contents );
    QString source() const;
    void setSource( QString &source );

Q_SIGNALS:
    void contentsChanged( QString &contents );
    void sourceChanged( QString &source );

private Q_SLOTS:
    void readContents();

private:
    QString m_fileContents;
    QString m_source;
};

#endif
