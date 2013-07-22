<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Web_Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Src="Common/UserControls/SlideShow.ascx" TagName="SlideShow" TagPrefix="uc1" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.DynamicData" TagPrefix="cc1" %>

<%@ Register Src="Common/UserControls/Catgory.ascx" TagName="Catgory" TagPrefix="uc2" %>

<%@ Register Src="Common/UserControls/TopNew.ascx" TagName="TopNew" TagPrefix="uc3" %>

<%@ Register Src="Common/UserControls/TopWatch.ascx" TagName="TopWatch" TagPrefix="uc4" %>
<%@ Register Src="Common/UserControls/TopDown.ascx" TagName="TopDown" TagPrefix="uc5" %>

<%@ Register Src="Common/UserControls/Recommends.ascx" TagName="Recommends" TagPrefix="uc6" %>

<%@ Register Src="Common/UserControls/TextLinks.ascx" TagName="TextLinks" TagPrefix="uc7" %>
<%@ Register Src="Common/UserControls/ImageLinks.ascx" TagName="ImageLinks" TagPrefix="uc8" %>
<%@ Register Src="~/Web/Common/UserControls/Catgory.ascx" TagPrefix="uc1" TagName="Catgory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table cellpadding="0" cellspacing="0" width="1024px">
        <tr>
            <td>

                <uc1:SlideShow ID="SlideShow1" runat="server" />

            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="1024px" border="2px" style="border-bottom-color: #CCCCCC; border-bottom-style: solid;">
                    <tr>
                        <td width="200px" valign="top">
                            <table align="right" cellpadding="0" cellspacing="0" width="200px" dir="rtl">
                               <%-- <tr>
                                    <td bgcolor="#F4F4F4" class="SideBarHeader">
                                        <asp:Label ID="lblCatgoryTitle" runat="server" Text="فىلىم تۈرلىرى"></asp:Label>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td>
                                        <uc1:Catgory runat="server" ID="Catgory" />
                                        <%--<asp:LinkButton ID="lbtnAll" runat="server" OnClick="lbtnAll_Click">بارلىق</asp:LinkButton>
                                        <asp:DataList ID="DataList1" runat="server" DataSourceID="ldsCatgory">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnCatgory" runat="server"
                                                    CommandArgument='<%# Eval("ID") %>' Text='<%# Eval("Name") %>'
                                                    OnClick="lbtnCatgory_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:DataList>
                                        
                                        <asp:LinqDataSource ID="ldsCatgory" runat="server"
                                            ContextTypeName="dcUTWDataContext" OrderBy="ID" Select="new (ID, Name)"
                                            TableName="MovieCatgories" Where="State == @State">
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>--%>
                                        <asp:HiddenField ID="hfCatgory" runat="server" Value="0" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                        <uc7:TextLinks ID="TextLinks1" runat="server" Count="5" />

                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                        <uc8:ImageLinks ID="ImageLinks1" runat="server" Count="5" />

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <center>
                                            <uc6:Recommends ID="Recommends1" runat="server" />
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">

                                        <uc3:TopNew ID="TopNew1" runat="server" Count="3" />
                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>

                                        <uc4:TopWatch ID="TopWatch1" runat="server" Count="3" />

                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <center>
                                            <uc5:TopDown ID="TopDown1" runat="server" Count="3" />
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td width="824px" valign="top">

                            <asp:GridView ID="gvMovies" runat="server" AllowPaging="True"
                                AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="ID" ForeColor="#333333" GridLines="None"
                                PageSize="20" Width="100%" ShowHeader="False" UseAccessibleHeader="False"
                                OnPageIndexChanging="gvMovies_PageIndexChanging">
                                <RowStyle BackColor="#EFF3FB" />
                                <Columns>
                                    <asp:ImageField DataImageUrlField="Cover">
                                        <ControlStyle Height="128px" Width="96px" />
                                        <ItemStyle Height="128px" Width="96px" />
                                    </asp:ImageField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top" width="40%">فىلىم نامى:<asp:HyperLink ID="HyperLink1" runat="server"
                                                        NavigateUrl='<%# Eval("ID", "~/Web/Movie.aspx?id={0}") %>'
                                                        Text='<%# Eval("Name") %>'></asp:HyperLink>
                                                        (<asp:Label ID="Label1" runat="server" Text='<%# Eval("OtherName") %>'></asp:Label>
                                                        )<br />
                                                        تارقىتىلغان ۋاقتى:<asp:Label ID="Label2" runat="server"
                                                            Text='<%# Eval("ReleaseTime", "{0:d}") %>'></asp:Label>
                                                        <br />
                                                        تىلى:<asp:Label ID="Label3" runat="server" Text='<%# Eval("Language") %>'></asp:Label>
                                                        <br />
                                                        يېزىقى:<asp:Label ID="Label4" runat="server" Text='<%# Eval("Subtitle") %>'></asp:Label>
                                                        <br />
                                                        دۆلىتى:<asp:Label ID="Label5" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                                                        <br />
                                                        <asp:HyperLink ID="HyperLink2" runat="server"
                                                            NavigateUrl='<%# Eval("ID", "~/Web/Watch.aspx?id={0}") %>'>كۆرۈش</asp:HyperLink>
                                                    </td>
                                                    <td valign="top" width="60%">&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Reduce( Eval("Descraption").ToString()) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:LinqDataSource ID="ldsMovies" runat="server"
                                ContextTypeName="dcUTWDataContext" OrderBy="AddTime desc, ID desc"
                                TableName="Movies" Where="State == @State">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</asp:Content>

