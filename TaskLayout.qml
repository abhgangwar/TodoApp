import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    property alias taskWidth: taskLayout.width
    property alias taskHeight: taskLayout.height
    property alias taskDetails: taskDescription.text

    id: taskLayout
    width: 600
    height: 50

    color: "#191919"

    CheckBox {
        id: checkBox
        width: 50
        height: 50
        anchors.left: taskLayout.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        checked: false
        indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                anchors.centerIn: checkBox
                radius: 13
                border.color: checkBox.down ? "#17a81a" : "#21be2b"

                Rectangle {
                    width: 14
                    height: 14
                    anchors.centerIn: parent
                    radius: 7
                    color: checkBox.down ? "#17a81a" : "#21be2b"
                    visible: checkBox.checked
                }
            }
    }

    Text {
        id: taskDescription
        anchors.left: checkBox.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        color: "#ffffff"
        text: qsTr("Some sample task description")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        id: clickArea
        anchors.fill: parent
        onClicked: {
            checkBox.checked = ! checkBox.checked;
        }
    }
}
