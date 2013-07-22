using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MLogOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Manage"] != null)
        {
            Session["Manager"] = null;
           
        }
        Response.Redirect("~/Web/Manage/MLogin.aspx");
    }
}
