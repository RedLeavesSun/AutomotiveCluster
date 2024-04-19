import QtQuick 2.9

 Rectangle {
        id: rectangle
        x: 373 / 1280 * rootScreen.width
        y: 392 / 480 * rootScreen.height
        width: 536 / 1280 * rootScreen.width
        height: 36 / 480 * rootScreen.height
        color: "#000000"

        Text {
            id: clock
            x: 64 / 1280 * rootScreen.width
            y: 8 / 480 * rootScreen.height
            color: "white"
            text: "00:00"
            font.pixelSize: 14
        }

        Text {
            id: dateInfo
            x: 168 / 1280 * rootScreen.width
            y: 8 / 480 * rootScreen.height
            text: "00.00"
            color: "white"
            font.pixelSize: 14
        }

        Text {
            id: temp
            x: 377 / 1280 * rootScreen.width
            y: 8 / 480 * rootScreen.height
            text: "23°"
            color: "white"
            font.pixelSize: 14
        }

        Text {
            id: tempValue
            x: 415 / 1280 * rootScreen.width
            y: 8 / 480 * rootScreen.height
            width: 39 / 1280 * rootScreen.width
            height: 17 / 480 * rootScreen.height
            text: "Windy"
            color: "white"
            font.pixelSize: 14
        }

        Timer {
               interval: 500
               running: true
               repeat: true

               onTriggered: {
                   let date = new Date()
                   clock.text = date.toLocaleTimeString(Qt.locale("tr_TR"), "HH:mm:ss")
                   dateInfo.text = date.toLocaleDateString(Qt.locale("en_EN"))

               }
        }

    }




