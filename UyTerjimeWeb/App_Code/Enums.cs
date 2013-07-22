using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;

public enum WorkingState
{
    Palanning=1,
    Tranclating=2,
    Editing=3,
    Correctoring=4,
    Composing=5,
    Release=6
}

public enum ManagerType
{ 
    Administrator=1,
    Manager=2,
    Editor=3,
    User=4
}
