using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Articles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["CatID"] != null)
        {

            try 
            {
                int nCatID=int.Parse(Request.QueryString["CatID"]);
                dcUTWDataContext dc = new dcUTWDataContext();
                var ArticleCat=dc.ArticleCatogries.Where(p => p.ID == nCatID).SingleOrDefault();
                lblTitle.Text = ArticleCat.Name;
            }
            catch { 
            
            
            }
        }
    }
}
