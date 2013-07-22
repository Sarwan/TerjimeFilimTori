using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Web/Home.aspx");
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Session["Manager"] != null)
        {
            Response.Redirect("~/Web/Mange/MMain.aspx");
        }
        dcUTWDataContext dc = new dcUTWDataContext();
        var objManager = dc.Managers.Where(p => p.Name == txtName.Text.Trim() && p.Password == UDev.net.Scurity.CreateHashText(txtPass.Text.Trim())).SingleOrDefault();
        if (objManager == null)
        {
            lblMSG.Text = "ئىسىم ياكى پارول خفتا!";
        }
        else
        {
            Session["Manager"] = objManager;
            Response.Redirect("~/Web/Manage/MMain.aspx");
        }
    }
}
