using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Linq;

public partial class Web_Common_MasterPages_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            setMenu();
        }
    }

    private void setMenu()
    {
        
        CreateMainMenu(mnuMain);
        CreateChildMenu(mnuMain);
    }

    private void CreateMainMenu(System.Web.UI.WebControls.Menu objMenu)
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        var mnus=dc.Menus.Where(p => p.State == true && p.Parent==0).Take(10);

        foreach (var mnuItem in mnus)
        { 
          objMenu.Items.Add(createMenuItem(mnuItem.Title,mnuItem.ID.ToString(),mnuItem.Url));
        
        }
        
    }

    private void CreateChildMenu(System.Web.UI.WebControls.Menu mnuMain)
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        var mnus = dc.Menus.Where(p => p.State == true&& p.Parent!=0);
        foreach (var mnu in mnus)
        {
            int nMenuID = getMenuID(mnu.Parent.ToString(), mnuMain);
            if(nMenuID > -1)
            {
                mnuMain.Items[nMenuID].ChildItems.Add(createMenuItem(mnu.Title,mnu.ID.ToString(),mnu.Url));
            }
        }
        
    }

    

    /// <summary>
    /// تىزىملىك ئەزاسى قۇرۇش
    /// </summary>
    /// <param name="strText">تېكىستى</param>
    /// <param name="strValue">قىممىتى</param>
    /// <param name="strNav">ئۇلىنىشى</param>
    /// <returns>تىزىملىك ئەزاسى</returns>
    private MenuItem createMenuItem(string strText, string strValue, string strNav)
    {
        MenuItem objMenuItem = new MenuItem();
        objMenuItem.Text = strText.Trim();
        objMenuItem.Value = strValue.Trim();
        objMenuItem.NavigateUrl = strNav.Trim();
        return objMenuItem;
    }

    /// <summary>
    /// ئاساسى تىزىملىكنىڭ نۇمۇرىنى ئېلىش
    /// </summary>
    /// <param name="strValue">قىممىتى</param>
    /// <param name="objMenu">تىزىملىك ئوبىكتى</param>
    /// <returns>پۈتۈن سان- تىزىملىك تەرتىپ نۇمۇرى</returns>
    private int getMenuID(string strValue, System.Web.UI.WebControls.Menu objMenu)
    {
        string sValue = strValue.Trim();
        int intTemp = -1;
        for (int intFor = 0; intFor < objMenu.Items.Count; intFor++)
        {
            if (objMenu.Items[intFor].Value == sValue)
            {
                intTemp = intFor;
                break;
            }
        }
        return intTemp;
    }
}
