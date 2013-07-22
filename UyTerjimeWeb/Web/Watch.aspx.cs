using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Watch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.QueryString["id"]))
        {
            dcUTWDataContext dc = new dcUTWDataContext();
            var oneMovie = dc.Movies.Where(p => p.ID == Convert.ToInt32(Request.QueryString["id"])).Single();
            mpWatch.MediaSource = oneMovie.WhatUrl.Trim();
            mpWatch.PlaceholderSource = oneMovie.Cover.Trim();
            oneMovie.WatchCount++;
            dc.SubmitChanges();
        }
    }
}
