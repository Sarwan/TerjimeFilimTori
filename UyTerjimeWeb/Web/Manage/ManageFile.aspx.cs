using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using net.UyghurDev.IO;
using System.IO;

public partial class Web_FileManagement_MFile : System.Web.UI.Page
{
    string strSiteUrl = "";
    string strRootPath = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        checkPermission(ManagerType.Manager);
        //strSiteUrl = Request.Url.OriginalString;
        //int Length = Request.Url.OriginalString.IndexOf("/", 10) + 1;
        //strSiteUrl = Request.Url.OriginalString.Substring(0, Length);
        strSiteUrl = "http://www.UyTerjime.com/";
        strRootPath = Request.PhysicalApplicationPath + "\\Web\\Files\\";
        if (!this.Page.IsPostBack)
        {
            showFiles(strRootPath);
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


    /// <summary>
    /// 
    /// </summary>
    /// <param name="strPath"></param>
    private void showFiles(string strPath)
    {
        if (!strPath.ToLower().Contains("\\web\\files\\"))
        {
            strPath = strRootPath;
        }
        
            ViewState["CurrentPath"] = strPath;
            FileManage objFileManage = new FileManage();
            gvFiles.DataSource = objFileManage.GetFileInfo(strPath);
            gvFiles.DataBind();
        

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvFiles_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (((CheckBox)GridView1.SelectedRow.Cells[2].Controls[0]).Checked == true)
            if(gvFiles.SelectedRow.Cells[4].Text=="True")
        {
            String strName = gvFiles.SelectedRow.Cells[2].Text.Trim();
            String strPath = (String)ViewState["CurrentPath"];
            showFiles(strPath + "\\" + strName + "\\");
        }
        else
        {
            String strName = gvFiles.SelectedRow.Cells[2].Text.Trim();
            String strPath = (String)ViewState["CurrentPath"];
            FileInfo fi = new FileInfo(strPath + "\\" + strName);
            string FileUrl = strSiteUrl + "Web/" + fi.FullName.Substring(fi.FullName.LastIndexOf("Files")).Replace('\\', '/');
            txtUrl.Text = FileUrl;
        }
    }


    protected void btnUp_Click(object sender, EventArgs e)
    {
        DirectoryInfo objDi = new DirectoryInfo((String)ViewState["CurrentPath"]);
        if (Path.GetFullPath(Server.MapPath("Files")) != objDi.FullName)
        {
            showFiles(objDi.Parent.FullName);
        }
    }
    protected void btnHome_Click(object sender, EventArgs e)
    {
        DirectoryInfo objDi = new DirectoryInfo((String)ViewState["CurrentPath"]);
        if (Path.GetFullPath(strRootPath) != objDi.FullName)
        {
            showFiles(Path.GetFullPath(strRootPath));
        }
    }
    protected void btnCreateFolder_Click(object sender, EventArgs e)
    {
        String strPath = (String)ViewState["CurrentPath"];
        System.IO.Directory.CreateDirectory(strPath + "/" +txtFolderName.Text);
        showFiles(strPath);
        txtFolderName.Text = "";
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (fuFile.PostedFile.ContentLength != 0)
        {
            if (fuFile.PostedFile.ContentLength > 3000000)
            {
                //SSException.Show(this.Label_FileSizeExceedException.Text);
                Response.Write("size large!");
                Response.Write(fuFile.PostedFile.ContentLength.ToString());
            }
            else
            {
                String strPath = (String)ViewState["CurrentPath"];
                String fileName = Path.GetFileName(fuFile.PostedFile.FileName);
                String destPath = Path.Combine(strPath, fileName);
                fuFile.PostedFile.SaveAs(destPath);
                showFiles((String)ViewState["CurrentPath"]);
                Response.Write("file sended");
            }
        }
    }


    protected void gvFiles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            if (gvFiles.Rows[e.RowIndex].Cells[4].Text.Trim().ToLower() == "true")
            {
                String strName = gvFiles.Rows[e.RowIndex].Cells[2].Text.Trim();
                String strPath = (String)ViewState["CurrentPath"];
                System.IO.Directory.Delete(strPath + "\\" + strName);
                showFiles(strPath);
            }
            else
            {
                String strName = gvFiles.Rows[e.RowIndex].Cells[2].Text.Trim();
                String strPath = (String)ViewState["CurrentPath"];
                System.IO.File.Delete(strPath + "\\" + strName);
                showFiles(strPath);
            }
        }
        catch (Exception  ee )
        {
            Response.Write(ee.Message);
        }
    
    }
}
