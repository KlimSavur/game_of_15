import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 480
    height: 480
    title: qsTr("Game of Fifteens")
    id: _window
    GridView{
        id: _gridView
        interactive: false
        anchors.fill: parent
        model: NodeModel {
            id: _model
        }
        delegate: NodeDelegate {}
        cellHeight: _window.height/4
        cellWidth:  _window.width/4
    }
}
