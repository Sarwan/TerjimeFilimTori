using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Web_Movie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.QueryString["id"]))
        {
            dcUTWDataContext dc = new dcUTWDataContext();
            var oneMovie = dc.Movies.Where(p => p.ID == Convert.ToInt32(Request.QueryString["id"])).Single();
            ltrlDescraption.Text = oneMovie.Descraption;
            lblMovieTitle.Text = oneMovie.Name.Trim();
            imgCover.ImageUrl = oneMovie.Cover;
            hlWatch.NavigateUrl = "~/Web/Watch.aspx?id=" + oneMovie.ID;
            ltrlImages.Text = getImages(oneMovie.ID);

            ShowIMDBRating(oneMovie.IMDBID.Trim());
            
        }

    }

    
    protected void gvDownUrls_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower() == "down")
        {
            //this.Title=((GridView)e.CommandSource).Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            //this.Title=e.CommandSource.ToString()+"/"+e.CommandArgument.ToString();
        }
    }
    protected void lbDown_Click(object sender, EventArgs e)
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        var dwnUrl = dc.MovieAddrs.Where(p => p.ID == Convert.ToInt64((sender as LinkButton).CommandArgument.Trim())).Single();
        dwnUrl.DownCount++;
        dc.Movies.Where(p => p.ID == dwnUrl.MovieID).Single().DownCount++;
        dc.SubmitChanges();
        Response.Redirect(dwnUrl.Url.Trim());
    }

    /// <summary>
    /// get images for lightbox
    /// </summary>
    /// <param name="nMID"></param>
    /// <returns></returns>
    private string getImages(Int64 nMID)
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        var Images = dc.Pictures.Where(p => p.MovieID == nMID);
        StringBuilder sbImages = new StringBuilder();
        sbImages.Append("<ul>");
        foreach (var pic in Images)
        {
            sbImages.Append("<li>");
            sbImages.Append("<a href=\"" + pic.Url + "\" title=\"" + pic.Descraption + "\">");
            sbImages.Append("<img src=\"" + pic.Url + "\" width=\"72\" height=\"72\" alt=\"\" />");
            sbImages.Append("</a>");
            sbImages.Append("<li>");
            sbImages.Append("<li>");
        }
        sbImages.Append("</ul>");
        return sbImages.ToString();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="strIMDBID"></param>
    /// <returns></returns>
    public string Rating(string strIMDBID)
    {

        net.UyghurDev.Tools.IMDB imdb = new net.UyghurDev.Tools.IMDB();

        return imdb.getRating(strIMDBID.Trim());
    }
    /// <summary>
    /// Ajax Show Rating
    /// </summary>
    /// <param name="strIMdbID"></param>
    private void ShowIMDBRating(string strIMdbID)
    {
        //script
        string scriptKey = "key" + this.UniqueID;
        StringBuilder sbScript = new StringBuilder();
        sbScript.AppendLine("<script type=\"text/javascript\">");

        //sbScript.AppendLine("function ajaxFunction() {");
        sbScript.AppendLine("var xmlhttp;");
        sbScript.AppendLine("if (window.XMLHttpRequest) {");
        // code for IE7+, Firefox, Chrome, Opera, Safari
        sbScript.AppendLine(" xmlhttp = new XMLHttpRequest();");
        sbScript.AppendLine("}");
        sbScript.AppendLine("else if (window.ActiveXObject) {");
        // code for IE6, IE5
        sbScript.AppendLine(" xmlhttp = new ActiveXObject(\"Microsoft.XMLHTTP\");");
        sbScript.AppendLine("}");
        sbScript.AppendLine("else {");
        //sbScript.AppendLine(" alert(\"Your browser does not support XMLHTTP!\");");
        sbScript.AppendLine("}");
        sbScript.AppendLine("xmlhttp.onreadystatechange = function() {");
        sbScript.AppendLine(" if (xmlhttp.readyState == 4) {");
        //document.write(xmlhttp.responseText);
        sbScript.AppendLine("   document.getElementById(\"ctl00_ContentPlaceHolder1_DetailsView1_lblRating\").innerHTML = xmlhttp.responseText;");
        sbScript.AppendLine("}");
        sbScript.AppendLine("}");
        //sbScript.AppendLine("alert(\"Start\")");
        sbScript.AppendLine(" xmlhttp.open(\"GET\", \"IMDBRating.aspx?imdbid=" + strIMdbID + "\", true);");
        sbScript.AppendLine("xmlhttp.send(null);");
        //sbScript.AppendLine("alert(\"end\");");
        //sbScript.AppendLine("}");
        sbScript.AppendLine("</script>");
        this.Page.RegisterStartupScript(scriptKey, sbScript.ToString());
    }

}
