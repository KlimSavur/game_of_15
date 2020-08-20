import QtQuick 2.0

GridView{
    id: root
    property alias popupWidth: _popup.width
    property alias popupHeight: _popup.height
    interactive: false
    focus: true

    model: NodeModel {
        id: _model;
    }
    delegate: Node{
        width: root.cellWidth
        height: root.cellHeight
        onPressed:{
            move(index)
        }
    }

    move: Transition {
        NumberAnimation { properties: "x,y"; duration: 350; }
    }

    WinPopup{
        id: _popup
        anchors.centerIn: root
        onPressed: shuffle()
    }

    Keys.onSpacePressed: shuffle()

    Component.onCompleted: shuffle()

    function isWin(){
       var i = 0
        while ((i+1) === _model.get(i++).number){
            if (i === 15){
                _popup.open()
                return
            }
        }
    }

    function shuffle(){
        var randomSample = function(arr){ return arr.map(a => [a,Math.random()]).sort((a,b) => {return a[1] < b[1] ? -1 : 1;}).map(a => a[0]); }
        var arr = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        arr = randomSample(arr)
        while(!checkBoard(arr)){
           arr = randomSample(arr)
        }
        for (var i = 0; i <= 15; ++i){
            _model.setProperty(i, qsTr("number"), arr[i]+1)
        }
    }

    function checkBoard(arr){
        var sum
        for (var i = 0; i <= 15; i++){
            if (arr[i] === 16){
                sum = sum + Math.floor(i/4) + 1
                continue
            }
            for (var j =i+1; j <= 15; j++)
                if (arr[i] > arr[j]){
                    sum++
                }
        }
        return !(sum%2)
    }
    function move(pos){
        console.log(pos)
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
}

