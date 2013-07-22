using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Response.Redirect("~/Web/Home.aspx");
        }
      
        dcUTWDataContext dc = new dcUTWDataContext();
       
        var objUser = dc.Users.Where(u => u.Name == txtName.Text.Trim() && u.Password == UDev.net.Scurity.CreateHashText(txtPass.Text.Trim())).SingleOrDefault();
        if (objUser == null)
        {
            lblMSG.Text = "ئىسىم ياكى پارول خفتا!";
        }
        else
        {
            Session["User"] = objUser;
            Response.Redirect("~/Web/Home.aspx");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Web/Home.aspx");
    }
}
