using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MDownloads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkPermission(ManagerType.Manager);
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

    protected void gvDowns_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfDownID.Value = gvDowns.SelectedRow.Cells[0].Text;
        dvDown.DataBind();
        dvDown.Visible = true;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        dvDown.ChangeMode(DetailsViewMode.Insert);
        dvDown.Visible = true;
    }
    protected void dvDown_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        gvDowns.DataBind();
        dvDown.Visible = false;
    }
    protected void dvDown_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        gvDowns.DataBind();
        dvDown.Visible = false;
    }
    protected void dvDown_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["AddTime"] = DateTime.Now;
        e.Values["DownCount"] = 0;
    }
}
