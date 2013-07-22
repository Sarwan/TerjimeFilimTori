using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MMenu : System.Web.UI.Page
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
}
