<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Watch.aspx.cs" Inherits="Web_Watch" %>
<%@ Register assembly="System.Web.Silverlight" namespace="System.Web.UI.SilverlightControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" border="0" align="center">
<tr>
<td></td>
<td style="text-align: center">
    <asp:MediaPlayer ID="mpWatch" runat="server" AutoLoad="False" Height="576px" 
                MediaSkinSource="~/Web/Common/PlayerSkin/Simple.xaml" 
                MediaSource="~/Web/Common/Media/winvideo-8-IIS7_Playlists.wmv" Width="720px">
            </asp:MediaPlayer>
</td>
<td></td>
</tr>
</table>

</asp:Content>

