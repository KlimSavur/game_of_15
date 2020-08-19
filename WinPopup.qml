import QtQuick 2.12
import QtQuick.Controls 2.12

Popup {
    width: _window.width/2
    height: _window.height/2
    Text{
        anchors.centerIn: parent
        font.bold: true
        text: qsTr("You win!")
    }

    Button{
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height/4
        text: qsTr("Close and Restart")
        onClicked: {
            _popup.close()
            _gridView.shuffle()
        }
    }

    closePolicy: "CloseOnEscape"
}
