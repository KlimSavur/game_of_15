import QtQuick 2.12
import QtQuick.Controls 2.12

Popup {
    id: root
    signal pressed()
    closePolicy: Popup.CloseOnEscape
    opacity: 0.88

    contentItem:
        Rectangle{
            anchors.fill: parent
            color: "lightblue"
            Text{
                anchors.centerIn: parent
                font.bold: true
                text: qsTr("You won!")
            }

            Button{
                width: root.width
                height: root.height/4
                anchors.bottom: parent.bottom
                text: qsTr("Close and Restart")

                background: Rectangle{
                    anchors.fill: parent
                    color: "red"
                }

                onClicked: {
                    root.close()
                    root.pressed()
                }
            }
        }
}
