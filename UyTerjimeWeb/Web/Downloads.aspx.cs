using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Downloads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbDown_Click(object sender, EventArgs e)
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        var Downs = dc.Downloads.Where(p => p.ID == Convert.ToInt64((sender as LinkButton).CommandArgument.Trim())).Single();
        Downs.DownCount++;
       
        dc.SubmitChanges();
        Response.Redirect(Downs.Url.Trim()); 
    }
}
