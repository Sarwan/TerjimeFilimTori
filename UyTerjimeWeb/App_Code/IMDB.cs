using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;

namespace net.UyghurDev.Tools
{
    public class IMDB
    {
        public IMDB()
        {
           
        }

        public String getRating(string tID)
        {

            try
            {
                string strUrl = "http://www.imdb.com/title/" + tID + "/";
                HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(strUrl);
                myRequest.AllowAutoRedirect = true;
                myRequest.Method = "GET";
                myRequest.Timeout = 6000;
                WebResponse myResponse = myRequest.GetResponse();
                StreamReader sr = new StreamReader(myResponse.GetResponseStream());
                string strPage = sr.ReadToEnd();

                sr.Close();
                myResponse.Close();



                string pat = @"<b>([0-9/\.]+)*.?</b>";
                Regex reg = new Regex(pat);
                string rating = reg.Match(strPage).Groups[1].Value;
                return rating;
            }
            catch
            {

                return "---";
            }
        }
    }
}