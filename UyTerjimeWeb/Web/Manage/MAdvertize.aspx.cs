using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MAdvertize : System.Web.UI.Page
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

    protected void gvAdv_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfAdvID.Value = gvAdv.SelectedRow.Cells[0].Text;
        dvAdv.ChangeMode(DetailsViewMode.ReadOnly);
        dvAdv.DataBind();
        dvAdv.Visible = true;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        dvAdv.Visible = true;
        dvAdv.ChangeMode(DetailsViewMode.Insert);
    }
    protected void dvAdv_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["AddTime"] = DateTime.Now;
    }
    protected void dvAdv_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        dvAdv.Visible = false;
        gvAdv.DataBind();
    }
    protected void dvAdv_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        dvAdv.Visible = false;
        gvAdv.DataBind();
    }
}
