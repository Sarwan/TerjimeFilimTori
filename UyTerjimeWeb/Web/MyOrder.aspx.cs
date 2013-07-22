using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_MyOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["UserID"] != null)
        {
            hfUserID.Value = Session["UserID"].ToString();
        }
    }
   
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //Trace.Write("Create Row", e.Row.Cells[3].Text);
    }
    protected void DropDownList1_DataBinding(object sender, EventArgs e)
    {
       // Trace.Write("DataBinding", e.ToString());
    }
}
