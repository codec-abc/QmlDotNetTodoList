import QtQuick 2.7
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import QtQuick.Dialogs.qml 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 642
    height: 480
    title: qsTr("Todo List")

    ListModel {
        id: fruitModel

        ListElement {
            name: "HI"
            cost: 2.45
        }
        ListElement {
            name: "there"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }

    }

    //<C#> QmlNetBridge {
    //<C#>    id : qmlBridge
    //<C#> }

    GridLayout
    {
        anchors.topMargin: 5
        anchors.fill: parent
        columns: 1

        GridLayout
        {
            rowSpacing: 5
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            rows: 1

            TextField {
                id: textField
                text: qsTr("")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                selectByMouse: true
            }

            Button {
                width: 60
                enabled: textField.text != ""
                text: qsTr("Add")
                Layout.fillWidth: false
                onClicked: qmlBridge.addTodo(textField.text)
            }
        }

        ListView {
            id: listView
            spacing: 6
            snapMode: ListView.SnapToItem
            boundsBehavior: Flickable.StopAtBounds
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            model:fruitModel

            delegate: Row {
                id: row
                spacing: 5
                //height: 100
                anchors.right: parent.right
                anchors.left: parent.left
//                Rectangle {
//                    color: "#e61515"
//                    anchors.fill: parent
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.verticalCenter: parent.verticalCenter
                    Button {
                        width: 40
                        height: 40
                        text: qsTr("Add")
                        id : buttonTodo
                    }
                    Text {
                        color: "#1486f9"
                        text: name
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true

                    }
                //}
            }
            ScrollBar.vertical: ScrollBar {
                id: bar
                //x :100 doesn't work
                active: true
                policy: "AsNeeded"
                interactive: true
              }
        }

    }

}
