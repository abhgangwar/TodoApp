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
    
    TaskView {
        id: tasks
        taskViewWidth: mainWindow.width
        taskViewHeight: mainWindow.height
        anchors.centerIn: parent
        spacing: 5
        anchors.leftMargin: 50
        
        model: taskModel
    }
    
    TaskModel {
        id: taskModel
    }
    
    Component.onCompleted: {
        console.log("Component done");
        for(var i=0; i<10; ++i) {
            taskModel.append({details: "Sample Task " + (i+1).toString()});
        }
    }
}
