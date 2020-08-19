import QtQuick 2.12

Rectangle {
    function move(){
        var pos = index
        if (_model.get(pos).number === 16){
            return
        }
        if (pos <= 11){
            if (_model.get(pos+4).number === 16){
                _model.move(pos, pos+4,1)
                _model.move(pos+3, pos,1)
                isWin()
                return
            }
        }
        if (pos >= 4){
            if (_model.get(pos-4).number === 16){
                _model.move(pos, pos-4, 1)
                _model.move(pos-3, pos, 1)
                isWin()
                return
            }
        }
        if (pos >= 1){
            if (_model.get(pos-1).number === 16){
                _model.move(pos, pos-1, 1)
                isWin()
                return
            }
        }
        if (pos <= 14){
            if (_model.get(pos+1).number === 16){
                _model.move(pos, pos+1, 1)
                isWin()
                return
            }
        }
    }
    id: _node
    width: _gridView.cellWidth
    height: _gridView.cellHeight
    border.width: 5
    border.color: "lightGrey"
    color: "lightGreen"
    visible: !(number === 16)
    MouseArea{
        anchors.fill: parent
        onClicked: {
            move();
        }
    }
    Text {
        anchors.centerIn: parent
        text: number
        font.pixelSize: (_window.width >=250 && _window.height>=250)?28:12
        font.bold: true
    }
}
