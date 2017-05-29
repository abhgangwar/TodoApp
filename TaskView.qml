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
