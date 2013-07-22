using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MPictures : System.Web.UI.Page
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

    protected void gvPictures_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfPictureID.Value = gvPictures.SelectedRow.Cells[0].Text;
        dvPicture.ChangeMode(DetailsViewMode.ReadOnly);
        dvPicture.Visible = true;
    }
    protected void dvPicture_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["AddTime"] = DateTime.Now;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        dvPicture.ChangeMode(DetailsViewMode.Insert);
        dvPicture.Visible = true;
    }
    protected void dvPicture_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        gvPictures.DataBind();
        dvPicture.Visible = false;
    }
    protected void dvPicture_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        gvPictures.DataBind();
        dvPicture.Visible = false;
    }
}
