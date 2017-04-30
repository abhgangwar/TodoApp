import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Todo App")
    color: "#191919"

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
        taskViewWidth: mainWindow.width
        taskViewHeight: 6*mainWindow.height/7
        anchors.top: parent.top
        anchors.topMargin: 10
        spacing: 5
        anchors.leftMargin: 50
        
        model: taskModel
    }

//    Text {
//        id: testT
//        text: "Yo bro, what's up ?"
//        anchors.top: tasks.bottom
//        anchors.topMargin: 20
//        anchors.horizontalCenter: parent.horizontalCenter
//        color: "yellow"
//    }

    AddItem {
        id: addItem
        anchors.top: tasks.bottom
        anchors.topMargin: 20
//        addItemWidth: mainWindow.width
        anchors.horizontalCenter: parent.horizontalCenter
//        addItemHeight: mainWindow.height/7
    }
    
    Component.onCompleted: {
        console.log("Component done");
        for(var i=0; i<3; ++i) {
            taskModel.append({details: "Sample Task " + (i+1).toString()});
        }
    }
}
