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

ListModel {
    property alias taskModel: taskModel
    id: taskModel
    
    ListElement {
        details: "A sample task details"
    }
}
