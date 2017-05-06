import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: test
    color: "yellow"
    width: 500
    height: 50
    TextField {
        placeholderText: qsTr("Enter name")
        anchors.fill: parent
        visible: textBoxVisible
    }
    
    MouseArea {
        id: addItemArea
        anchors.fill: parent
        onClicked: {
            addItemClicked();
            textBoxVisible = true;
            console.log("Add item clicked");
            console.log("w", addItem.width);
            console.log("h", addItem.height);
        }
    }
//     text: "Hi Bro! What\'s up ?"
}