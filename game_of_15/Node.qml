import QtQuick 2.12

Rectangle {
    id: root

    property int nodeText: 0
    signal pressed()

    border.width: 5
    border.color: "lightGrey"
    color: "lightGreen"
    visible: !(nodeText === 16)
    MouseArea{
        id: mouseArea
        anchors.fill: root
        onClicked: root.pressed()
    }
    Text {
        anchors.centerIn: root
        text: root.nodeText
        font.pixelSize: (root.width >= 64 && root.height >= 64) ? 28 : 12
        font.bold: true
    }
}
