using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Common_UserControls_TopWatch : System.Web.UI.UserControl
{
    public int Count
    {
        get { return Convert.ToInt32(hfCount.Value); }
        set { hfCount.Value = value.ToString(); }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            showTopWatch();
        }
    }
    private void showTopWatch()
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        var topNew = dc.Movies.Where(p => p.State == true).OrderBy(p => p.WatchCount).Take(Convert.ToInt32(hfCount.Value));
        dlTopWatch.DataSource = topNew;
        dlTopWatch.DataBind();
    }
}
