import QtQuick 2.12

Rectangle {
    id: root

    signal pressed()

    border.width: 5
    border.color: "lightGrey"
    color: "lightGreen"
    visible: !(number === 16)
    MouseArea{
        id: mouseArea
        anchors.fill: root
        onClicked: root.pressed()
    }
    Text {
        anchors.centerIn: root
        text: number
        font.pixelSize: (root.width >= 64 && root.height>=64)?28:12
        font.bold: true
    }
}
