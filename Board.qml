import QtQuick 2.0

GridView{
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
        return !sum%2
    }

    interactive: false
    cellHeight: _window.height/4
    cellWidth:  _window.width/4
    model: NodeModel {
        id: _model;
    }
    delegate: Node{}
    Component.onCompleted: shuffle()
    move: Transition {
        NumberAnimation { properties: "x,y"; duration: 350; }
    }
    focus: true
    Keys.onSpacePressed: shuffle()
}
