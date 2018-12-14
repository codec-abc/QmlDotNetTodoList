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

    //<C#> QmlNetBridge {
    //<C#>    id : qmlBridge
    //<C#> }

    ListModel {
        id:fakeListModel
        ListElement {
            name: "Bill Smith"
            isDone: false
        }
        ListElement {
            name: "Bill Smith"
            isDone: false
        }
        ListElement {
            name: "Bill Smith"
            isDone: true
        }
        ListElement {
            name: "Bill Smith"
            isDone: false
        }
        ListElement {
            name: "Bill Smith"
            isDone: false
        }
        ListElement {
            name: "Bill Smith"
            isDone: true
        }
        ListElement {
            name: "Bill Smith"
            isDone: false
        }
        ListElement {
            name: "Bill Smith"
            isDone: false
        }
        ListElement {
            name: "Bill Smith"
            isDone: false
        }
    }

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
                onClicked: function() {
                    var rowCount = qmlBridge.todoCount();
                    qmlBridge.addTodo(textField.text);
                    listView.model.rowsInserted(null, rowCount, rowCount);
                    textField.text = "";
                }
            }
        }

        Row {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 0
            Text {
                text: qsTr("Current of number of todo items: ")
                style: Text.Normal
            }
            Text {
                text: qmlBridge.count
            }
        }

        ListView {
            id: listView
            spacing: 3
            snapMode: ListView.SnapToItem
            boundsBehavior: Flickable.StopAtBounds
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true

            model: Net.toListModel(qmlBridge.todoItems)
            delegate:
                Rectangle {
                id: rectangle
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                height: 45
                radius: 4
                border.width: 2
                Row {
                    id: row
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 5
                    Button {
                        width: 40
                        height: 40
                        anchors.verticalCenter: parent.verticalCenter
                        text: if (modelData.isDone) {
                                  return "✔";
                              } else {
                                  return "✘";
                              }
                        id : buttonTodo
                        onClicked: function() {
                            var rowIndex = qmlBridge.handleClick(modelData);
                            var index = listView.model.index(rowIndex, 0);
                            listView.model.dataChanged(index, index);
                        }
                    }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        color: if (modelData.isDone) {
                                   return "#666666";
                               } else {
                                   return "#000000";
                               }
                        text: modelData.name
                        font.bold: !modelData.isDone
                        font.strikeout: modelData.isDone
                    }
                }
            }
            ScrollBar.vertical: ScrollBar {
                id: bar
                active: true
                policy: "AsNeeded"
                interactive: true
            }
        }
    }
}
