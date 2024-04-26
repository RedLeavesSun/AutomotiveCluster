import QtQuick
import QtQuick.Window
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import "functions.js" as Functions
import ClusterDemo

Window {
    id: rootScreen
    width: 1280
    height: 480
    title: qsTr("HMI Cluster")
    visible: true
    color: "#000000"

    Loader { id: rootLoader }

    Component.onCompleted: {  rootLoader.setSource("qrc:/gui/Motorama.qml") }

}
