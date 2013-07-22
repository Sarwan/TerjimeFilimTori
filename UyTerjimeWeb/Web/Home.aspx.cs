using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Web_Home : System.Web.UI.Page
{
    protected void Page_Unload(object sender, EventArgs e)
    { 
   
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            showMovies();
        }
        
    }

    private void showMovies()
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        
        if (string.IsNullOrEmpty(hfCatgory.Value))
        {
           
          var  mv = dc.Movies.Where(p => p.State == true).OrderByDescending(p => p.AddTime).OrderByDescending(p=>p.ID).AsQueryable();
          gvMovies.DataSource = mv;
          gvMovies.DataBind();
        }
        else
        {
            if (Convert.ToInt32(hfCatgory.Value) > 0)
            {
                int nCatID = Convert.ToInt32(hfCatgory.Value);
                var mv = dc.Movies.Where(p => p.State == true && p.Type == nCatID).OrderByDescending(p => p.AddTime).AsQueryable();
                gvMovies.DataSource = mv;
                gvMovies.DataBind();
            }
            else
            {
                var mv = dc.Movies.Where(p => p.State == true).OrderByDescending(p => p.AddTime).OrderByDescending(p => p.ID).AsQueryable();
                gvMovies.DataSource = mv;
                gvMovies.DataBind();
            }
        
        }
    }

    public string Reduce(string strSource)
    {
        string Result=strSource;
      
        try
        {
            Result = Regex.Replace(Result, "<([A-Z]*)[^>]*>","");
        }
        catch (ArgumentException ex)
        {
            // Syntax error in the regular expression
        }
        if (Result.Length >= 300)
        {
            Result = Result.Substring(0, 300);
            Result = Result + "...";
        }
        return Result;
    }
    protected void gvMovies_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvMovies.PageIndex = e.NewPageIndex;
    }
    protected void lbtnAll_Click(object sender, EventArgs e)
    {
        hfCatgory.Value = "0";
        showMovies();
    }
    protected void lbtnCatgory_Click(object sender, EventArgs e)
    {
        hfCatgory.Value=(sender as LinkButton).CommandArgument;
        showMovies();
    }
}
