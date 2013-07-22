using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Common_UserControls_ImageLinks : System.Web.UI.UserControl
{
    public int Count
    {
        get { return Convert.ToInt32(hfCount.Value); }
        set { hfCount.Value = value.ToString(); }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
