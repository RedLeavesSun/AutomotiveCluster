#include "qpichandler.h"

#include <QPicture>
#include <QPixmap>
#include <QPainter>

QPicHandler::QPicHandler()
{

}

bool QPicHandler::canRead() const
{
    return true;
}

bool QPicHandler::read(QImage *image)
{
    QPicture picture;
    picture.load(device());

    QRect rect = picture.boundingRect();
    QPixmap pixmap(rect.width(), rect.height());
    pixmap.fill(QColor("transparent"));

    QPainter painter;
    painter.begin(&pixmap);
    painter.drawPicture(0, 0, picture);
    painter.end();

    *image = pixmap.toImage();

    return true;
}
