import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4

CheckBox {
    property int taskWidth: 500
    property int taskHeight: 100
    id: checkBox
    width: taskWidth
    height: taskHeight
    text: "Sample Text"
    checked: false
    indicator: Rectangle {
            implicitWidth: 26
            implicitHeight: 26
            x: checkBox.leftPadding
            y: parent.height / 2 - height / 2
            radius: 13
            border.color: checkBox.down ? "#17a81a" : "#21be2b"

            Rectangle {
                width: 14
                height: 14
                x: 6
                y: 6
                radius: 7
                color: checkBox.down ? "#17a81a" : "#21be2b"
                visible: checkBox.checked
            }
        }

    background: Rectangle {
        id: checkBoxBackground
        anchors.fill: parent
        color: "#696969"
        radius: 3*parent.height/2
    }

    contentItem: Text {
            text: checkBox.text
            font: checkBox.font
            opacity: enabled ? 1.0 : 0.3
            color: "#000000" // checkBox.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            leftPadding: checkBox.indicator.width + checkBox.spacing
        }
}
