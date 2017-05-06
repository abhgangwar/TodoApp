import QtQuick 2.7

Rectangle {
    property alias taskViewWidth: taskView.width
    property alias taskViewHeight: taskView.height
    property alias model: listView.model
    id: taskView
    color: "#ffffff"
    ListView {
        id: listView
        width: parent.width
        height: parent.height
        spacing: 1
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
        }
    }
}
