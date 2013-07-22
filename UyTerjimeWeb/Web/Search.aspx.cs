using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;

public partial class Web_Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillMovieType();
        Search();

    }

    private void fillMovieType()
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        var mc = from c in dc.MovieCatgories
                 where c.State == true
                 select new { c.ID, c.Name };
        ddlType.Items.Clear();
        ddlType.Items.Add(new ListItem("بارلىق", "0"));
        foreach (var t in mc)
        {
            ddlType.Items.Add(new ListItem(t.Name, t.ID.ToString()));
        }
       
    }

    private void Search()
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        string strKey = txtKeyWord.Text.Trim();
        IQueryable<Movie> iqMv = dc.Movies;
        iqMv = iqMv.Where(m=>m.Name==strKey || m.Name.Contains(strKey)|| m.Descraption.Contains(strKey)||m.OtherName.Contains(strKey));
        if (Convert.ToInt16(ddlType.SelectedValue) != 0)
        {
            iqMv=iqMv.Where(m=> m.Type==Convert.ToInt32(ddlType.SelectedValue));
        }
        //var sr=from m in dc.Movies
        //       where (m.Name == strKey || m.Name.Contains(strKey)  || m.Descraption.Contains(strKey) || m.OtherName.Contains(strKey))
                     
                       
        //               && m.Type==Convert.ToInt32(ddlType.SelectedValue)
                      
        //        select m;
        //StringBuilder sbQuery = new StringBuilder();
        //sbQuery.AppendLine("from m in dc.Movies");
        //sbQuery.AppendLine(" where (m.Name == \"" + strKey 
        //    + "\" || m.Name.Contains(\"" + strKey
        //    + "\") || m.Descraption.Contains(\"" + strKey 
        //    + "\") || m.OtherName.Contains(\"" + strKey + "\"))");
        //if (Convert.ToInt16(ddlType.SelectedValue) != 0)
        //{
        //    sbQuery.AppendLine("&& m.Type=="+ddlType.SelectedValue);
        //}
        //sbQuery.AppendLine(" select m;");
       
        //var SearchResult = dc.ExecuteQuery<Movie>(sbQuery.ToString());//dc.Movies.Where(p => p.Name.Contains("پالۋان") || p.Name == "يېشىل ئادەم" || p.Descraption.Contains("ئۇرۇش")).Take(10);
        //GridView1.DataSource = iqMv;//SearchResult;
        //GridView1.DataBind();

        gvMovies.DataSource = iqMv;
        gvMovies.DataBind();
       
    }

    public string Reduce(string strSource)
    {
        string Result = strSource;

        try
        {
            Result = Regex.Replace(Result, "<([A-Z]*)[^>]*>", "");
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
}
