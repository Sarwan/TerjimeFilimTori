using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;


namespace net.UyghurDev.IO
{
    /// <summary>
    /// Summary description for TilFileManage
    /// </summary>
    public class FileManage
    {
        public FileManage()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataTable GetFileInfo(string strPath)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name",typeof( System.String));
            dt.Columns.Add("IsFolder",typeof( System.Boolean));
            dt.Columns.Add("FileExtension", typeof( System.String));
            dt.Columns.Add("Size", typeof( System.Int64));
            dt.Columns.Add("Created", typeof( System.DateTime));
            dt.Columns.Add("Modified", typeof( System.DateTime));
            dt.BeginLoadData();

            DirectoryInfo objDir = new DirectoryInfo(strPath);
        
                
       foreach (DirectoryInfo d  in objDir.GetDirectories())
       {
            AddRowToFileInfoTable(d, dt);
       }
        
        foreach(FileInfo f in objDir.GetFiles())
        {
            AddRowToFileInfoTable(f, dt);
        }
        dt.EndLoadData();
        dt.AcceptChanges();
            //foreach (FileSystemInfo fsi in objDir.GetFileSystemInfos())
            //{
            //    if (fsi is FileInfo)
            //    {
            //    }
            //    else
            //    {
            //        DirectoryInfo di = (DirectoryInfo)fsi;
            //        CellName.Text = di.Name;
            //        CellPath.Text = di.FullName;
            //        objRow.Cells.Add(CellName);
            //        objRow.Cells.Add(CellPath);
            //    }
            //    objTable.Rows.Add(objRow);
            //}
            
            return dt;
        }


        private  void AddRowToFileInfoTable(FileSystemInfo fi , DataTable dt )
        {
        DataRow dr  = dt.NewRow();

           dr["Name"] = fi.Name;
       
        if(  fi.Attributes==FileAttributes.Directory )
        {
             dr["IsFolder"]=true;
            dr["Size"]=0;
            dr["FileExtension"] ="folder";
        }
        
        else
        {
            if (fi.Attributes != FileAttributes.Hidden)
            {
                dr["IsFolder"] = false;
                dr["Size"] = new FileInfo(fi.FullName).Length;
                dr["FileExtension"] = Path.GetExtension(fi.Name).Remove(0, 1);
            }
        }
            
          dr["Modified"] = fi.LastWriteTime;
           dr["Created"] = fi.CreationTime;
           dt.Rows.Add(dr);
        }
        public Table GetDirectoryInfo(string strPath)
        {
            return null;
        }
    }
}