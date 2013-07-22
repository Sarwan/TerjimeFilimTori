using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["id"] != null)
        //{
        //    (dvOrder.Rows[2].Cells[1].Controls[0] as TextBox).Text = "ۋەتەنپەرۋەر";
        //}

    }
   
    protected void dvOrder_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["Date"] = DateTime.Now;
        e.Values["UserID"] = 0;//tempurary
        e.Values["MovieID"] = Request.QueryString["id"].Trim();//movieID
       
    }
    protected void dvOrder_DataBinding(object sender, EventArgs e)
    {
        
    }
    protected void dvOrder_DataBound(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            //(dvOrder.Rows[1].Cells[1].Controls[0] as TextBox).Text = "1";// Session["userID"].ToString();//UserID
            dcUTWDataContext dc = new dcUTWDataContext();
            string MovieName= dc.Movies.Where(m => m.ID == Convert.ToInt32(Request.QueryString["id"].Trim())).Single().Name;
            (dvOrder.Rows[2].Cells[1].Controls[0] as TextBox).Text = MovieName;//MovieTitle
            //(dvOrder.Rows[3].Cells[1].Controls[0] as TextBox).Text = Request.QueryString["id"].Trim();//movieID
        }
    }
    protected void dvOrder_Load(object sender, EventArgs e)
    {
        
    }
    protected void dvOrder_ItemCreated(object sender, EventArgs e)
    {
        
    }
    protected void dvOrder_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        Response.Redirect(string.Format("Movie.aspx?id={0}",Request.QueryString["id"]));
    }
}
