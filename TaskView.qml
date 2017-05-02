import QtQuick 2.7

ListView {
    property alias taskView: taskView
    property alias taskViewWidth: taskView.width
    property alias taskViewHeight: taskView.height
    property alias model: taskView.model

    id: taskView
    width: 200
    height: 500
    highlightFollowsCurrentItem: true
//    highlight: Rectangle {
//        id: highlightStyle
//        color: "yellow"
//        anchors.fill: taskView
//    }

    delegate: TaskLayout {
        taskWidth: taskViewWidth
        taskHeight: taskViewHeight/7
        taskDetails: details
        color: "#191919"
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.right: parent.right
//        anchors.rightMargin: 10
    }
}
