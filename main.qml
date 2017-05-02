import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Todo App")
    color: "#b2b2b2"

    property int taskLayoutHeight: mainWindow.height/7
    property int taskLayoutWidth: mainWindow.width

    Flickable {
      anchors.fill: parent
      
      contentWidth: parent.width *2 
      contentHeight: parent.height *2
      Keys.onUpPressed: vbar.decrease()
      Keys.onDownPressed: vbar.increase()
      
      ScrollBar.horizontal: ScrollBar { id: hbar; active: vbar.active }
      ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }
    }

    TaskModel {
        id: taskModel
    }
    
    TaskView {
        id: tasks
        taskViewWidth: taskLayoutWidth
        taskViewHeight: 6*taskLayoutHeight
        anchors.top: parent.top
//        anchors.topMargin: 10
        spacing: 1
        anchors.leftMargin: 50
        
        model: taskModel
    }



    AddItem {
        id: addItem
        anchors.top: tasks.bottom
        anchors.topMargin: 20
        addItemWidth: mainWindow.width/3
    }
    
    Component.onCompleted: {
        console.log("Component done");
        var n = 10;
        for(var i=0; i<n; ++i) {
            taskModel.append({details: "Sample Task " + (i+1).toString()});
        }
        var originalHeight = taskLayoutHeight;
        var optimumHeight = mainWindow.height;
        if(n < 7) {
            optimumHeight = (n+1)*mainWindow.height/7;
        }
        console.log("New optimum height: ", height);
        mainWindow.height = optimumHeight;
        taskLayoutHeight = originalHeight;
    }
}
