//
// This file is part of the ToDo app.
//
// This program is free software licensed under the GNU LGPL. You can
// find a copy of this license in LICENSE.txt in the top directory of
// the source code.
//
// Copyright 2017 Abhinav Gangwar <abhgang@gmail.com>
//

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

    header: Rectangle {
        id: appHeader
        width: taskLayoutWidth
        height: taskLayoutHeight/2
        color: "#191919"
        Text {
            text: "Todo - Get your tasks done"
            color: "#ffffff"
            anchors.centerIn: parent
        }
    }
    
    TaskView {
        id: tasks
        taskViewWidth: taskLayoutWidth
        taskViewHeight: 6*taskLayoutHeight
        anchors.top: parent.top
        model: taskModel
    }

    footer: AddItem {
        id: addItemF
        width: taskLayoutWidth
        height: taskLayoutHeight

        onTaskAdded: {
            console.log("Data", taskDetails);
            taskModel.append({details: taskDetails});
        }
    }
    
    Component.onCompleted: {
        console.log("Component done");
        var n = 5;
        for(var i=0; i<n; ++i) {
            taskModel.append({details: "Sample Task " + (i+1).toString()});
        }
    }
}
