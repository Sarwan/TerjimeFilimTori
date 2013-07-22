using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_IMDBRating : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["imdbid"].Trim()))
            {
                getRating();
            }
            else
            {
                Response.Write("--");
            }
        }
    }

    private void getRating()
    {
        net.UyghurDev.Tools.IMDB imdb = new net.UyghurDev.Tools.IMDB();

        Response.Write( imdb.getRating(Request.QueryString["imdbid"].Trim()));
    }
}
