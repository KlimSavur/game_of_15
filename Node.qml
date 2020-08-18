import QtQuick 2.0

Rectangle {
    id: _root
    function move(){
        var pos = index
        if (_model.get(pos).number === 16){
            return
        }
        if (pos <= 12){
            if (_model.get(pos+4).number === 16){
                console.log("get" + _model.get(pos+4).number + "\n")
                _model.move(pos, pos+4,1)
                _model.move(pos+3, pos,1)
                return
            }
        }
        if (pos>=4){
            if (_model.get(pos-4).number === 16){
                _model.move(pos, pos-4, 1)
                _model.move(pos-3, pos, 1)
                return
            }
        }
        if (pos>=1){
            if (_model.get(pos-1).number === 16){
                _model.move(pos-1, pos, 1)
                return
            }
        }
        if (pos <= 15){
            if (_model.get(pos+1).number === 16){
                _model.move(pos+1, pos, 1)
                return
            }
        }
    }

    function fontSize(){
        return 28;
    }
    property string value: ""

    width: _gridView.cellWidth
    height: _gridView.cellHeight
    Rectangle{
        anchors.fill: parent
        border.width: 5
        border.color: "lightGrey"
        color: "lightGreen"
        visible: (value === "16")?false:true
        MouseArea{
            anchors.fill: parent
            onClicked: {
                move();
            }

        }

        Text {
            id: _num
            anchors.centerIn: parent
            text: value
            font.pixelSize: fontSize()
            font.bold: true
        }
    }

}
