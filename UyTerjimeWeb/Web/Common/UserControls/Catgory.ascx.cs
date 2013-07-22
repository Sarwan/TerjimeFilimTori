using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Common_UserControls_Catgory : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbtnCatgory_Click(object sender, EventArgs e)
    {
        Session["CurrentCatgory"] = (sender as LinkButton).CommandArgument;
    }
    protected void lbtnAll_Click(object sender, EventArgs e)
    {
        Session["CurrentCatgory"] = 0;
    }
}
