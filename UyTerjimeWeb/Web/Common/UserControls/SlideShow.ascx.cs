using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Web_Common_SlideShow : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getImages();
    }

    private void getImages()
    {
        dcUTWDataContext dc = new dcUTWDataContext();
        var advs=dc.Advertizements.Where(p => p.State == true);
        StringBuilder sbImages = new StringBuilder();
        bool blnFrist = true;
        foreach(var adv in advs)
        {
            if (blnFrist)
            {
                sbImages.AppendLine("<div class=\"active\">");
                blnFrist = false;
            }
            else
            {
                sbImages.AppendLine("<div>");
            }
                 sbImages.AppendLine("<a href=\""+adv.NavUrl+"\"><img src=\""+adv.Url+"\" alt=\""+adv.Title+"\" /></a>");
            sbImages.AppendLine("</div>");
        }

        ltrlImages.Text = sbImages.ToString();
    }
}
