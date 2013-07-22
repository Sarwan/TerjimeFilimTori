using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_ManageMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (Request.Url.AbsolutePath.ToLower().Contains("mlogin"))
            {
                mnuMain.Visible = false;
            }
            else
            {
                mnuMain.Visible = true;
            }
        }
    }
}
