using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkPermission(ManagerType.Manager);
        if (Page.IsPostBack)
        {
            lblMSG.Visible = false;
        }
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


    protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfUserID.Value = gvUsers.SelectedRow.Cells[0].Text;
        dvUser.ChangeMode(DetailsViewMode.ReadOnly);
        dvUser.DataBind();
        dvUser.Visible = true;
    }
    protected void dvUser_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        gvUsers.DataBind();
        dvUser.Visible = false;
    }
    protected void dvUser_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        gvUsers.DataBind();
        dvUser.Visible = false;
    }
    protected void dvUser_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (e.NewValues["Password"] == null)
        {
           e.NewValues["Password"]= e.OldValues["Password"];
        }
        else
        {
                    e.NewValues["Password"] = UDev.net.Scurity.CreateHashText(e.NewValues["Password"].ToString());
        }
    }




    protected void dvUser_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        int nCount = dc.Managers.Where(p => p.Name == e.Values["Name"].ToString()).Count();
        if (nCount != 0)
        {
            lblMSG.Text = "بۇ ئىسىم تىزىملىتىلىپ بولغان! باشقا ئىسىم كىرگۈزۈڭ.";
            lblMSG.Visible = true;
            e.Cancel = true;
        }
        e.Values["Password"] = UDev.net.Scurity.CreateHashText(e.Values["Password"].ToString());
        e.Values["AddTime"] = DateTime.Now;
    }
}
