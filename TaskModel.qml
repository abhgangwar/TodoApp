import QtQuick 2.7

ListModel {
    property alias taskModel: taskModel
    id: taskModel
    
    ListElement {
        details: "A sample task details"
    }
}