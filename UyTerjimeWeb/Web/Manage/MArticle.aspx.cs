using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MArticle : System.Web.UI.Page
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


    protected void gvArticles_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfArticleID.Value = gvArticles.SelectedRow.Cells[0].Text;
        dvArticle.ChangeMode(DetailsViewMode.ReadOnly);
        dvArticle.Visible = true;
    }
    protected void dvArticle_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["AddTime"] = DateTime.Now;
        e.Values["ManagerID"] = Session["Manager"] == null ? 0 : (Session["Manager"] as Manager).ID;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        dvArticle.ChangeMode(DetailsViewMode.Insert);
        dvArticle.Visible = true;
    }
    protected void dvArticle_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        gvArticles.DataBind();
        dvArticle.Visible = false;

    }
    protected void dvArticle_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        gvArticles.DataBind();
        dvArticle.Visible = false;
    }
}
