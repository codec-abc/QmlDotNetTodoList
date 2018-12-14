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
					var rowCount = listView.model.rowCount();
					qmlBridge.addTodo(textField.text);
					listView.model.rowsInserted(null, rowCount, rowCount);
					var index = listView.model.index(0, 0);
				}
            }
        }

        Row {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 0
            Text {
                text: qsTr("Current of number of todo items: ")
            }
            Text {
                text: qmlBridge.count
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
            model: Net.toListModel(qmlBridge.todoItems)
            delegate: Row {
                id: row
                spacing: 5
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                    Button {
                        width: 40
                        height: 40
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
                        color: if (modelData.isDone) {
                                   return "#666666";
                               } else {
                                   return "#000000";
                               }
                        text: modelData.name
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: !modelData.isDone
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
