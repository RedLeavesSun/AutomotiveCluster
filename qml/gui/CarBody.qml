import QtQuick
import QtQuick.Controls


Item {
    //id: carBody
    //visible: !playerView.musicEnabled
    Image {
        id: car
        x: 555 / 1280 * rootScreen.width
        y: 120 / 480 * rootScreen.height
        width: 140 / 1280 * rootScreen.width
        height: 211 / 480 * rootScreen.height
        source: "qrc:/images/car_body.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: tierLeftFront
        x: 547 / 1280 * rootScreen.width
        y: 154 / 480 * rootScreen.height
        width: 45 / 1280 * rootScreen.width
        height: 43 / 480 * rootScreen.height
        source: "qrc:/images/car_tier.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: tierLeftBack
        x: 547 / 1280 * rootScreen.width
        y: 283 / 480 * rootScreen.height
        width: 45 / 1280 * rootScreen.width
        height: 43 / 480 * rootScreen.height
        source: "qrc:/images/car_tier.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: tierRightBack
        x: 660 / 1280 * rootScreen.width
        y: 283 / 480 * rootScreen.height
        width: 45 / 1280 * rootScreen.width
        height: 43 / 480 * rootScreen.height
        source: "qrc:/images/car_tier.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: tierRightFront
        x: 660 / 1280 * rootScreen.width
        y: 154 / 480 * rootScreen.height
        width: 45 / 1280 * rootScreen.width
        height: 43 / 480 * rootScreen.height
        source: "qrc:/images/car_tier.png"
        fillMode: Image.PreserveAspectFit

    }

    OpacityAnimator {
            target: tierRightFront;
            from: 0.2;
            to: 1;
            duration: 2000
            loops: Animation.Infinite
            running: true
        }

    Text {
        id: text1
        x: 504 / 1280 * rootScreen.width
        y: 298 / 480 * rootScreen.height
        color: "white"
        width: 45 / 1280 * rootScreen.width
        height: 28 / 480 * rootScreen.height
        text: qsTr("30 psi")
        font.pixelSize: 12
    }

    Text {
        id: text2
        x: 504 / 1280 * rootScreen.width
        y: 163 / 480 * rootScreen.height
        color: "white"
        width: 45 / 1280 * rootScreen.width
        height: 28 / 480 * rootScreen.height
        text: qsTr("30 psi")
        font.pixelSize: 12
    }

    Text {
        id: tierRightBackText
        x: 715 / 1280 * rootScreen.width
        y: 298 / 480 * rootScreen.height
        color: "white"
        width: 45 / 1280 * rootScreen.width
        height: 28 / 480 * rootScreen.height
        text: qsTr("34 psi")
        font.pixelSize: 12
    }

    Text {
        id: tierRightFrontText
        x: 715 / 1280 * rootScreen.width
        y: 169 / 480 * rootScreen.height
        width: 45 / 1280 * rootScreen.width
        height: 28 / 480 * rootScreen.height
        text: "45 psi"
        font.pixelSize: 12
        color: {
            if (tierRightFrontText.text.split(" ")[0] === "45"){
                tierRightFrontText.opacity = 0.2
                return "red"
            } else {
                tierRightFrontText.opacity = 1.0
                return "white"
            }
        }

    }

    OpacityAnimator {
            target: tierRightFrontText
            from: tierRightFrontText.opacity
            to: 1.0
            duration: 2000
            loops: Animation.Infinite
            running: tierRightFrontText.opacity == 1.0 ? false : true
    }


}

