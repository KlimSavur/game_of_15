import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: _window
    visible: true
    width: 480
    height: 480
    title: qsTr("Game of Fifteens")

    Board{
        id: _gridView
        anchors.fill: parent
    }

    WinPopup{
        id: _popup
        anchors.centerIn: parent
    }
}
