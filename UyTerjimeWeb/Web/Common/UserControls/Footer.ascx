<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="Web_Common_UserControls_Footer" %>

<table align="center" cellpadding="0" cellspacing="0" width="1024px">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="lblCopyright" runat="server" Text="ئۇيغۇرچە خەتلىك تەرجىمە فىلىم تورى 2008-2009"></asp:Label>
            <br />
            <asp:HyperLink ID="lnkSite" NavigateUrl="http://www.UyTerjime.com" 
                runat="server" ForeColor="#35A7DB" CssClass="LinkStyle" >www.UyTerjime.com</asp:HyperLink>
            <br />
            <asp:Label ID="lblPoweredBy" runat="server" Text="Powered by "></asp:Label>
            <asp:HyperLink ID="lnkPowerSite" NavigateUrl="http://www.UyghurDev.net" 
                runat="server" ForeColor="#35A7DB" CssClass="LinkStyle">UyghurDev.net</asp:HyperLink>
        </td>
    </tr>
</table>
