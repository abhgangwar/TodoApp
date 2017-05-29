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
import FSBasics 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Todo App - Manage your tasks better")
    color: "#ffffff"

    property int taskLayoutHeight: mainWindow.height/7
    property int taskLayoutWidth: mainWindow.width

    TaskModel {
        id: taskModel
    }

    FileActions {
        id: fsBasics
        source: "someTextFile.txt"
    }
    
    Rectangle {
        id: tasksContainer
        width: taskLayoutWidth
        anchors.top: parent.top
        anchors.topMargin: 1
        anchors.bottom: addItemF.top

        Flickable {
          anchors.fill: tasksContainer

          contentWidth: tasksContainer.width *2
          contentHeight: tasksContainer.height *2
          Keys.onUpPressed: vbar.decrease()
          Keys.onDownPressed: vbar.increase()

          ScrollBar.horizontal: ScrollBar { id: hbar; active: vbar.active }
          ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }
        }

        TaskView {
            id: tasks
            taskViewWidth: parent.width
            taskViewHeight: parent.height
            model: taskModel
        }
    }

    footer: AddItem {
        id: addItemF
        addItemWidth: taskLayoutWidth
        addItemHeight: taskLayoutHeight

        onTaskAdded: {
            taskModel.append({details: taskDetails});
            fsBasics.addContents(JSON.stringify({details: taskDetails}) + '\n');
        }
    }
    
    Component.onCompleted: {
        console.log("Component done");
        var data = fsBasics.contents;
        data = data.split('\n');
        data.map(function (item) {
            if(item) {
                var taskData;
                try {
                    taskData = JSON.parse(item);
                    taskModel.append(taskData);
                } catch (e) {
                    console.log("Error while parsing task data");
                }
            }
        });
    }
}
