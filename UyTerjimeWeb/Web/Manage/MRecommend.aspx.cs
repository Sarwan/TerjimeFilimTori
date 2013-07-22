using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Manage_MRecommend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkPermission(ManagerType.Editor);

            lblMSG.Visible = false;
       
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

    //private void MovieData()
    //{
    //    //dcUTWDataContext dc = new dcUTWDataContext();
    //    //var Movies = dc.Movies.Where(p => p.State == true).Select(p => new { p.ID, p.Name,isThere= dc.Recommends.Select(r=>r.MovieID).Contains(p.ID)});
        
    //}


    //private Boolean isRecommend(int nID)
    //{
    //    dcUTWDataContext dc = new dcUTWDataContext();
    //    Boolean bln = dc.Recommends.Where(p => p.MovieID == nID).Select(p=>p.MovieID).Contains(nID);
    //    return bln;
    //}

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        dcUTWDataContext dc=new dcUTWDataContext();
        if (dc.Recommends.Select(p => p.MovieID).Contains(Convert.ToInt64(ddlMovies.SelectedValue)) == false)
        {
            Recommend rcm = new Recommend();
            rcm.MovieID = Convert.ToInt64(ddlMovies.SelectedValue);
            rcm.State = true;
            rcm.AddTime = DateTime.Now;
            dc.Recommends.InsertOnSubmit(rcm);
            dc.SubmitChanges();
        }
        else
        {
            lblMSG.Visible = true;
        }
        gvRecommends.DataBind();
    }
}
