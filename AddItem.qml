import QtQuick 2.7
import QtQuick.Controls 2.0
import QtLocation 5.8
import FSBasics 1.0

Rectangle {
    property alias addItemWidth: addItem.width
    property alias addItemHeight: addItem.height

    property bool textBoxVisible: false
    property bool mouseAreaEnabled: true

    signal taskAdded(string taskDetails)

    id: addItem
    width: 480
    height: 640
    color: "#191919"
    Image {
        id: addItemIcon
        anchors.left: parent.left
        anchors.leftMargin: 10
        source: "./resources/ic_add_white_48px.svg"
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: addItemText
        anchors.left: addItemIcon.right
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        color: "#ffffff"
        text: qsTr("Add list item")
    }

    Rectangle {
        visible: textBoxVisible
        anchors.left: parent.left
        width: 7*parent.width/8
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: parent.color
        TextField {
            id: textField
            placeholderText: qsTr("Enter task description")
            anchors.left: parent.left
            width: 7*parent.width/8
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
        }

        Image {
            id: doneIcon
            anchors.left: textField.right
            anchors.leftMargin: 10
            source: "./resources/ic_done_white_48px.svg"
            anchors.verticalCenter: parent.verticalCenter

            MouseArea {
                id: doneArea
                anchors.fill: parent
                onClicked: {
                    console.log("Done clicked");
                    createTask(textField.text);
                    textField.clear();
                }
            }
        }

        Image {
            id: cancelIcon
            source: "./resources/ic_close_white_48px.svg"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: doneIcon.right
            anchors.leftMargin: 10

            MouseArea {
                id: cancelArea
                anchors.fill: parent
                onClicked: {
                    console.log("Cancel clicked");
                    textField.clear();
                    textBoxVisible = false;
                    mouseAreaEnabled = true;
                }
            }
        }
    }

    FileActions {
        id: fsBasics
        source: "someTextFile.txt"
    }

    MouseArea {
        id: addItemArea
        anchors.fill: parent
        onClicked: {
            textBoxVisible = true;
            mouseAreaEnabled = false;
            console.log("Add item clicked");
            console.log("w", addItem.width);
            console.log("h", addItem.height);
        }
        enabled: mouseAreaEnabled
    }

    Component.onCompleted: {
        console.log("AddItem done");
        fsBasics.contents = "SomeContents";
        fsBasics.saveContents();
    }

    function createTask(taskDetails) {
        mouseAreaEnabled = true;
        textBoxVisible = false;
        taskAdded(taskDetails);
    }

}
