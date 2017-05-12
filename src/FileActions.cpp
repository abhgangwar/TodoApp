#include "FileActions.h"
#include <QString>
#include <QFile>
#include <QTextStream>
//#include <QDebug>

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
    emit sourceChanged( m_source );
}

#include "moc_FileActions.cpp"
