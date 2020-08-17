import QtQuick 2.0

Rectangle {
    property string value: ""
    width: _window.width / 4
    height: _window.height / 4
    Rectangle{
        anchors.fill: parent
        border.width: 5
        border.color: "lightGrey"
        color: "lightGreen"
        Text {
            id: _num
            anchors.centerIn: parent
            text: parent.parent.value
            font.pixelSize: 28
            font.bold: true
        }
    }

}
