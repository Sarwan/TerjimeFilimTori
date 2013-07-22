using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;

namespace UDev.net
{
    /// <summary>
    /// <para> بىخەتەرلىك مەشغۇلاتلىرى</para>
    /// <para>ئەسەر ھوقۇقى ئۇيغۇر يۇمشاق دىتال ئىجادىيەت تورىغا مەنسۇپ</para>
    /// <para>بۇ تىپتا بىخەتەرلىككە ئائىت مۇلازىمەتلەر تەمىنلىنىدۇ</para>
    ///  </summary>
    /// <author>سارۋان</author>
    /// <version>
    /// <para>1.00   2006-11-25 </para>
    /// </version>
    public class Scurity
    {
        public Scurity()
        {

        }
        /// <summary>
        /// <para>چۇۋالچاق كود ھاسىل قىلىش</para>
        /// <para>كودى ھاسىل قىلىدۇ MD5</para>
        /// </summary>
        /// <param name="strMessage">ئەسلى تېكىست</param>
        /// <returns>چۇۋالچاق كود</returns>
        public static String CreateHashText(String strMessage)
        {
            MD5CryptoServiceProvider objMD5 = new MD5CryptoServiceProvider();
            Byte[] objByteValue = System.Text.Encoding.UTF8.GetBytes(strMessage);
            String strResult = Convert.ToBase64String(objMD5.ComputeHash(objByteValue));
            objMD5.Clear();
            return strResult;
        }
    }
}