import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Todo App")

    property int taskLayoutHeight: mainWindow.height/6
    property int taskLayoutWidth: mainWindow.width

    Flickable {
        id: flickable
        clip: true
        focus: true

        Keys.onUpPressed: scrollBar.decrease()
        Keys.onDownPressed: scrollBar.increase()
        ScrollBar.vertical: ScrollBar {
            id: scrollBar
            parent: flickable.parent
            anchors.top: flickable.top
            anchors.left: flickable.right
            anchors.bottom: flickable.bottom
        }
    }

    Column {
        id: taskContainer
        leftPadding: 10
        rightPadding: 10
        spacing: 5
        anchors.fill: parent

        TaskLayout {
            id: task1
            taskHeight: taskLayoutHeight
            taskWidth: taskLayoutWidth
        }

        TaskLayout {
            id: task2
            taskHeight: taskLayoutHeight
            taskWidth: taskLayoutWidth
        }

        TaskLayout {
            id: task3
            taskHeight: taskLayoutHeight
            taskWidth: taskLayoutWidth
        }

        TaskLayout {
            id: task4
            taskHeight: taskLayoutHeight
            taskWidth: taskLayoutWidth
        }

        TaskLayout {
            id: task5
            taskHeight: taskLayoutHeight
            taskWidth: taskLayoutWidth
        }

        TaskLayout {
            id: task6
            taskHeight: taskLayoutHeight
            taskWidth: taskLayoutWidth
        }
    }

//    SwipeView {
//        id: swipeView
//        anchors.fill: parent
//        currentIndex: tabBar.currentIndex

////        Page1 {

////        }

//        Page {
//            Label {
//                text: qsTr("Second page")
//                anchors.centerIn: parent
//            }
//        }
//    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: swipeView.currentIndex
//        TabButton {
//            text: qsTr("First")
//        }
//        TabButton {
//            text: qsTr("Second")
//        }
//    }
}
