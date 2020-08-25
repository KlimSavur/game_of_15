import QtQuick 2.0
import Game 1.0

GridView {
    id: root
    property alias popupWidth: _popup.width
    property alias popupHeight: _popup.height
    interactive: false
    focus: true

    model: Game {
        id: _model;
        onOpenPopup: {
            _popup.open()
        }
    }
    delegate: Node {
        width: root.cellWidth
        height: root.cellHeight
        nodeText: display
        onPressed: {
            _model.move(index)
        }
    }


    move: Transition {
        NumberAnimation { properties: "x,y"; duration: 350; }
    }

    WinPopup {
        id: _popup
        anchors.centerIn: root
        onPressed: {
            _model.shuffle()
        }
    }


    Keys.onSpacePressed: _model.shuffle()
}

