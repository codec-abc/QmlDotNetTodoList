using System;
using System.Collections.Generic;
using System.Text;

class QmlNetBridge
{
    public QmlNetBridge()
    {
        Console.WriteLine("constructor");
    }

    public void addTodo(string text)
    {
        Console.WriteLine(text);
    }
}

