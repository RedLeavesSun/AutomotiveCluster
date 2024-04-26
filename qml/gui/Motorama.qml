import QtQuick
import QtMultimedia
import QtQuick.Controls

Item {

    id: motoramaRoot
    property string currentScreen: ""
    property bool isHangOnState: false
    property bool isPowerOff: false
    property bool driveEnabled: false
    property bool chargeEnabled: false




    focus: true
    Keys.onPressed: {
        if (event.key === Qt.Key_Space){
            motoramaRoot.driveEnabled = true;

        }
        
        if (event.key === Qt.Key_C){
            motoramaRoot.chargeEnabled = true;
        }

        if (event.key === Qt.Key_B){
            motoramaRoot.chargeEnabled = false;

        }
        
    }

    Component.onCompleted: {

        changeCurrentScreen('ScreenWelcome.qml');
        motoramaRoot.forceActiveFocus();
    }

    Connections {
        target: motoramaRoot
        function onIsPowerOffChanged() {
            if(isPowerOff) powerOff();

        }
        function onDriveEnabledChanged() {
            checkAndUpdateScreen();
        }
        function onChargeEnabledChanged() {
            checkAndUpdateScreen();
        }
    }

    function checkAndUpdateScreen(){
        if (chargeEnabled){
            isHangOnState = false;
            changeCurrentScreen('ScreenCharge.qml');
        } else if (driveEnabled){
            isHangOnState = false;
            changeCurrentScreen('ScreenSport.qml');
        } else {
            isHangOnState = true;
            if (currentScreen != 'ScreenWelcome.qml'){
                goScreenInactiveAnim.running = true;
            }
        }
    }

    function changeCurrentScreen(qmlSource){
        if (screenTransitionAnim.running || screenOpenAnimation.running) return;
        if (currentScreen === qmlSource) {
            goScreenActiveAnim.running = true;
            return;
        }

        currentScreen = qmlSource;
        screenTransitionAnim.running = true;
        //screenLoader.setSource('ScreenSport.qml')
    }

    function powerOff(){
        Qt.callLater(Qt.quit);
    }


    OpacityAnimator {
        id: goScreenInactiveAnim
        target: screenLoader
        from: screenLoader.opacity
        to: 0.4
        duration: 250
    }


    OpacityAnimator{
        id: goScreenActiveAnim
        target: screenLoader
        from: screenLoader.opacity
        to: 1.0
        duration: 250
    }

    OpacityAnimator{
        id: screenTransitionAnim
        target: screenLoader
        from: screenLoader.opacity
        to: 0.0
        duration: 500
        onStopped: {
            screenLoader.setSource(currentScreen, {"globalFooter":footerId});
            screenOpenAnimation.running = true;
        }
    }

    OpacityAnimator {
        id: screenOpenAnimation
        target: screenLoader
        from: screenLoader.opacity
        to: 1.0
        duration: 400
        onStopped: {
            checkAndUpdateScreen();
        }

    }

    Loader {
        id:screenLoader
    }
    
    Footer {
        id: footerId
        x: 372 / 1280 * rootScreen.width
        y: 390 / 480 * rootScreen.width
        color: "transparent"

    }

    GlobalDatas{
        id: globalData
    }







}
