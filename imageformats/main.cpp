#include "qpichandler.h"

#include <QImageIOPlugin>

class QPicPlugin : public QImageIOPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QImageIOHandlerFactoryInterface" FILE "qpic.json")
public:
    Capabilities capabilities(QIODevice *device, const QByteArray &format) const override;
    QImageIOHandler *create(QIODevice *device, const QByteArray &format = QByteArray()) const override;
};

QImageIOPlugin::Capabilities QPicPlugin::capabilities(QIODevice *device, const QByteArray &format) const
{
    if (format == "pic" || format == "dat")
        return Capabilities(CanRead);
    return Capabilities();
}

QImageIOHandler *QPicPlugin::create(QIODevice *device, const QByteArray &format) const
{
    QImageIOHandler *handler = new QPicHandler;
    handler->setDevice(device);
    handler->setFormat(format);
    return handler;
}

#include "main.moc"
