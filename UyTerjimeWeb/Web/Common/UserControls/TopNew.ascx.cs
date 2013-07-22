using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Common_UserControls_TopNew : System.Web.UI.UserControl
{
    public int Count
    {
        get { return Convert.ToInt32(hfCount.Value);}
        set { hfCount.Value = value.ToString(); }
    
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        showTopNew();

    }

    private void showTopNew()
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        var topNew = dc.Movies.Where(p => p.State == true).OrderBy(p => p.AddTime).OrderBy(p => p.ID).Take(Convert.ToInt32(hfCount.Value));
        dlTopNew.DataSource = topNew;
        dlTopNew.DataBind();
    }
}
