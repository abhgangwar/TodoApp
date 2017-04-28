import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: frame
//     clip: true
    width: 160
    height: 160
    color: "#696969"
//     border.color: "black"
//     anchors.centerIn: parent

    Text {
        id: content
        text: "ABC"
        font.pixelSize: 160
        x: -hbar.position * width
        y: -vbar.position * height
    }
    
    Keys.onUpPressed: {
      console.log("Up pressed");
      vbar.decrease();
    }
    Keys.onDownPressed: {
      console.log("Down pressed");
      vbar.increase()
    }

    Flickable {
        anchors.fill: parent

        contentWidth: parent.width * 2
        contentHeight: parent.height * 2

        ScrollBar.horizontal: ScrollBar { id: hbar; active: vbar.active }
        ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }
    }
}
