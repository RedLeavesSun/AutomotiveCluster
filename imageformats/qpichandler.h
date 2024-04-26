#ifndef QPIC_IO_HANDLER_H
#define QPIC_IO_HANDLER_H

#include <QImageIOHandler>
#include <QVariant>

class QPicHandler : public QImageIOHandler
{
public:
    QPicHandler();
    
    virtual bool canRead() const override;
    virtual bool read(QImage *image) override;
};

#endif // QPIC_IO_HANDLER_H
