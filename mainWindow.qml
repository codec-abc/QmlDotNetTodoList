import QtQuick 2.7
import QtQuick.Controls 2.0
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
                onClicked: qmlBridge.addTodo(textField.text)
            }
        }


        Rectangle {
            width: 1
            height: 1
            color: "#009621"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }




    }


}
