import QtQuick
import QtQuick.Window
import QtQuick.Controls

Item {
    width: rootBg.width
    height: rootBg.height


    Loader {
        id: welcomeLoader
    }


    Image {
        id: rootBg
        width: rootScreen.width
        height: rootScreen.height
        source: "qrc:/images/car_bg"
        opacity: 0.1
        z: -1
    }


    Timer {
            id: timer
        }


    function delay(delayTime, cb) {
            timer.interval = delayTime;
            timer.repeat = false;
            timer.triggered.connect(cb);
            timer.start();
        }

    OpacityAnimator {
            target: rootBg;
            from: rootBg.opacity
            to: 1;
            duration: 2000

            running: true
            onStopped: {

                delay(2000, function() {
                welcomeLoader.setSource("ScreenSport.qml")
                rootBg.visible = false;
                welcomeText.visible = false;
                    footerId.visible = false;


                    })
            }
        }


    Text {
        id: welcomeText
        x: (parent.width - welcomeText.width) / 2
        y: (parent.height - welcomeText.height) / 2
        text: qsTr("Welcome..")
        font.pixelSize: 72
        color: "white"
    }

  

    OpacityAnimator {
        target: footerId
        from: 0.1
        to: 1
        duration: 1000
        running: true
    }





}
