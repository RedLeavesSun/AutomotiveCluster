import QtQuick
import QtLocation
import QtPositioning

Rectangle {

    width: 360 / 1280 * rootScreen.width
    height: 260 / 480 * rootScreen.height
    border.color: "transparent"
    border.width: 5
    radius: 10



    Plugin {
        id: mapPlugin
        name: "mapboxgl" // "osm", "esri", ...
        // specify plugin parameters if necessary
        // PluginParameter {
        //     name:
        //     value:
        // }
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(35.22, 33.32)
        zoomLevel: 12
    }

}
