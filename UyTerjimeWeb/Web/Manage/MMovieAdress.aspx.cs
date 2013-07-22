using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MMovieAdress : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkPermission(ManagerType.Editor);
    }

     /// <summary>
    /// سالاھىيەت تەكشۈرۈش
    /// </summary>
    /// <param name="mType"></param>
    private void checkPermission(ManagerType mType)
    {
        /*
            Administrator=1,
            Manager=2,
            Editor=3,
            User=4
         */
        if (Session["Manager"] != null)
        {
            Manager mngr = (Manager)Session["Manager"];
            if (mngr.Type > (int)mType && mngr.Type < 0)
            {
                Response.Redirect("~/Web/Manage/MMain.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Web/Manage/MLogin.aspx");
        }

    }

    protected void gvMovieAddress_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfMovieAddressID.Value = gvMovieAddress.SelectedRow.Cells[0].Text;
        dvMovieAddress.ChangeMode(DetailsViewMode.ReadOnly);
        dvMovieAddress.Visible = true;
    }
    protected void dvMovieAddress_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["AddTime"] = DateTime.Now;
        //e.Values["MovieTime"] = TimeSpan.FromMinutes(Convert.ToDouble(e.Values["MovieTime"]));
        e.Values["DownCount"] = 0;
        e.Values["WatchCount"] = 0;
    }
    protected void dvMovieAddress_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //e.NewValues["MovieTime"] = TimeSpan.FromMinutes(Convert.ToDouble(e.NewValues["MovieTime"]));

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        dvMovieAddress.ChangeMode(DetailsViewMode.Insert);
        dvMovieAddress.Visible = true;
    }
    protected void dvMovieAddress_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        gvMovieAddress.DataBind();
        dvMovieAddress.Visible = false;
    }
    protected void dvMovieAddress_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        gvMovieAddress.DataBind();
        dvMovieAddress.Visible = false;
    }

   
}
