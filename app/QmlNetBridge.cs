using Qml.Net;
using System;
using System.Collections.Generic;
using System.Text;

class QmlNetBridge
{
    private List<TodoItemViewModel> _todoItems = 
        new List<TodoItemViewModel>();

    private int _count = 0;

    public QmlNetBridge()
    {

    }

    public void AddTodo(string text)
    {
        _todoItems.Add(new TodoItemViewModel(text, _count % 2 == 0 ));
        count = _todoItems.Count;
        
        this.ActivateSignal(nameof(todoItems) + "prop");
    }
    
    [NotifySignal(nameof(todoItems) + "prop")]
    public List<TodoItemViewModel> todoItems
    {
        get
        {
            return _todoItems;
        }

        private set
        {
            this.ActivateSignal(nameof(todoItems) + "prop");
        }
    }

    [NotifySignal(nameof(count) + "prop")]
    public int count
    {
        get
        {
            return _count;
        }
        set
        {
            _count = value;
            this.ActivateSignal(nameof(count) + "prop");
        }
    }
}

public class TodoItemViewModel
{
    private string _name;
    private bool _done;

    [NotifySignal(nameof(name) + "prop")]
    public string name
    {
        get
        {
            return _name;
        }
        set
        {
            _name = value;
            this.ActivateSignal(nameof(name) + "prop");
        }
    }

    [NotifySignal(nameof(isDone) + "prop")]
    public bool isDone
    {
        get
        {
            return _done;
        }
        set
        {
            _done = value;
            this.ActivateSignal(nameof(isDone) + "prop");
        }
    }

    public TodoItemViewModel(string name, bool isDone)
    {
        this.name = name;
        this.isDone = isDone;
    }
}

