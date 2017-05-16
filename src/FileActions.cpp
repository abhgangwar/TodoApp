//
// This file is part of the ToDo app.
//
// This program is free software licensed under the GNU LGPL. You can
// find a copy of this license in LICENSE.txt in the top directory of
// the source code.
//
// Copyright 2017 Abhinav Gangwar <abhgang@gmail.com>
//

#include "FileActions.h"
#include <QString>
#include <QFile>
#include <QTextStream>
#include <QDebug>

FileActions::FileActions(QObject *parent)
    : QObject( parent )
{
    // nothing to do
}

void FileActions::readContents()
{
    QFile fIn(m_source);
    if ( !fIn.open( QIODevice::ReadOnly ) ) {
        return;
    }

    QTextStream dataIn( &fIn );
    QString line;
    m_fileContents.clear();
    do {
        line = dataIn.read( 100 );
        m_fileContents.append( line );
    } while ( !line.isNull() );

    emit contentsChanged( m_fileContents );
    fIn.close();
}

void FileActions::saveContents()
{
    QFile fOut( m_source );
    if( !fOut.open( QIODevice::WriteOnly ) ) {
        return;
    }
    QTextStream dataOut( &fOut );
    dataOut << m_fileContents;
    fOut.close();
}

void FileActions::addContents( QString contents) {
    QFile fOut( m_source );
    if( !fOut.open( QIODevice::WriteOnly | QIODevice::Append ) ) {
        return;
    }
    QTextStream dataOut( &fOut );
    dataOut << contents;
    fOut.close();
}

QString FileActions::contents() const
{
    return m_fileContents;
}

void FileActions::setContents( QString &contents )
{
    m_fileContents = contents;
    emit contentsChanged( m_fileContents );
}

QString FileActions::source() const
{
    return m_source;
}

void FileActions::setSource( QString &source )
{
    m_source = source;
    readContents();
    emit sourceChanged( m_source );
}

// #include "moc_FileActions.cpp"
