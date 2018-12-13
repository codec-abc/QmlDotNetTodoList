using Qml.Net;
using System;

namespace app
{
    class Program
    {
        static int Main(string[] args)
        {
            using (var app = new QGuiApplication(args))
            {
                using (var engine = new QQmlApplicationEngine())
                {
                    Qml.Net.Qml.RegisterType<QmlNetBridge>(uri: "app");
                    var content = System.IO.File.ReadAllText(@"mainWindow.qml");
                    content = "import app 1.0\n" + content; 
                    content = content.Replace(@"//<C#>", @"");
                    //Console.WriteLine(content);
                    engine.LoadData(content);
                    return app.Exec();
                }
            }
        }
    }
}
