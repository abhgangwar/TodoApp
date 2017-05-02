import QtQuick 2.7
import QtLocation 5.8

Item {
    property alias addItemWidth: addItem.width
    property alias addItemHeight: addItem.height

    id: addItem
    width: 1500
    height: 30
    anchors.horizontalCenter: parent.horizontalCenter
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

    MouseArea {
        id: addItemArea
        anchors.fill: parent
        onClicked: {
            console.log("Add item clicked");
            console.log("w", addItem.width);
            console.log("h", addItem.height);
        }
    }

}
