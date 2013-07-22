<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MMovie.aspx.cs" Inherits="Web_Manage_MMovie" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="0" cellspacing="0" class="style2">
        <tr>
            <td style="text-align: center">
                <br />
                <asp:Label ID="Label1" runat="server" Text="فىلىم باشقۇرۇش" CssClass="Title"></asp:Label>
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvMovies" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsMovie" ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="gvMovies_SelectedIndexChanged">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                            SortExpression="ID" />
                        <asp:HyperLinkField DataNavigateUrlFields="ID" 
                            DataNavigateUrlFormatString="~/Web/Movie.aspx?id={0}" DataTextField="Name" 
                            HeaderText="فىلىم نامى" Target="_blank" />
                        <asp:ImageField DataImageUrlField="Cover" HeaderText="رەسىمى">
                            <ControlStyle Height="64px" Width="72px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="OtherName" HeaderText="باشقا نامى" 
                            SortExpression="OtherName" />
                        <asp:BoundField DataField="ReleaseTime" HeaderText="تارقىتىلغان ۋاقتى" 
                            SortExpression="ReleaseTime" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="Country" HeaderText="دۆلەت" 
                            SortExpression="Country" />
                        <asp:TemplateField HeaderText="تۈرى" SortExpression="Type">
                            <ItemTemplate>
                                <asp:LinqDataSource ID="ldsMovieCatgory" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                                    TableName="MovieCatgories" Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldsMovieCatgory" DataTextField="Name" DataValueField="ID" 
                                    Enabled="False" SelectedValue='<%# Bind("Type") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldsMovieCatgory" DataTextField="Name" DataValueField="ID" 
                                    SelectedValue='<%# Bind("Type") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsMovieCatgory" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                                    TableName="MovieCatgories" Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Language" HeaderText="تىلى" 
                            SortExpression="Language" />
                        <asp:BoundField DataField="Subtitle" HeaderText="يېزىقى" 
                            SortExpression="Subtitle" />
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:BoundField DataField="WatchCount" HeaderText="كۆرۈلىشى" ReadOnly="True" 
                            SortExpression="WatchCount" />
                        <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرلىشى" ReadOnly="True" 
                            SortExpression="DownCount" />
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى" ReadOnly="True" 
                            SortExpression="AddTime" DataFormatString="{0:d}" />
                        <asp:CommandField ShowSelectButton="True" DeleteText="ئۆچۈرۈش(!)" 
                            HeaderText="باشقۇرۇش" SelectText="تاللاش" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsMovie" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableInsert="True" 
                    EnableUpdate="True" TableName="Movies">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" 
                    Text="فىلىم قوشۇش" />
                <asp:HiddenField ID="hfSelectedMovieID" runat="server" Value="0" />
                <asp:DetailsView ID="dvoneMovie" runat="server" AutoGenerateRows="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsOneMovie" ForeColor="#333333" 
                    GridLines="None" Height="50px" Width="100%" 
                    oniteminserting="dvoneMovie_ItemInserting" style="text-align: center" >
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                    <RowStyle BackColor="#E3EAEB" HorizontalAlign="Right" />
                    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" HorizontalAlign="Right" Width="200px" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:TemplateField InsertVisible="False">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("ID","~/Web/Movie.aspx?id={0}") %>'>فىلىم بېتى</asp:HyperLink>&nbsp;
                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                    NavigateUrl='<%# Eval("ID","~/Web/Watch.aspx?id={0}") %>'>كۆرۈش</asp:HyperLink>
                                
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="تەرتىپ نومۇرى:" ReadOnly="True" 
                            SortExpression="ID" InsertVisible="False" />
                        <asp:BoundField DataField="Name" HeaderText="فىلىم نامى:" 
                            SortExpression="Name" >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cover" HeaderText="فىلىم رەسىمى:" 
                            SortExpression="Cover" />
                        <asp:BoundField DataField="OtherName" HeaderText="باشقا نامى:" 
                            SortExpression="OtherName">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="تارقىتىلغان ۋاقتى:">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" 
                                    Text='<%# Eval("ReleaseTime", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReleaseTime") %>'></asp:TextBox>
                                <cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="TextBox2">
                                </cc1:CalendarExtender>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReleaseTime") %>'></asp:TextBox>
                                <cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="TextBox2">
                                </cc1:CalendarExtender>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Country" DataFormatString="{0:d}" 
                            HeaderText="دۆلىتى:" SortExpression="Country" >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="تۈرى:">
                            <ItemTemplate>
                                <asp:LinqDataSource ID="ldsMovieCatgory" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                                    TableName="MovieCatgories" Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldsMovieCatgory" DataTextField="Name" DataValueField="ID" 
                                    Enabled="False" SelectedValue='<%# Bind("Type") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinqDataSource ID="ldsMovieCatgory" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                                    TableName="MovieCatgories" Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldsMovieCatgory" DataTextField="Name" DataValueField="ID" 
                                    SelectedValue='<%# Bind("Type") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:LinqDataSource ID="ldsMovieCatgory" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                                    TableName="MovieCatgories" Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldsMovieCatgory" DataTextField="Name" DataValueField="ID" 
                                    SelectedValue='<%# Bind("Type") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Language" 
                            HeaderText="تىلى:" SortExpression="Language" />
                        <asp:BoundField DataField="Subtitle" HeaderText="يېزىقى:" 
                            SortExpression="Subtitle" />
                        <asp:BoundField DataField="IMDBUrl" HeaderText="IMDBئادىرىس:" 
                            SortExpression="IMDBUrl"  >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IMDBID" HeaderText="IMDB تەرتىپ نومۇرى:" 
                            SortExpression="IMDBID" >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Director" HeaderText="رىژىسسور:" 
                            SortExpression="Director" >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Artst" HeaderText="ئارتىسلار:" 
                            SortExpression="Artst" >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Source" HeaderText="مەنبەسى:" 
                            SortExpression="Source" >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                            SortExpression="State" />
                        <asp:TemplateField HeaderText="چۈشەندۈرۈش:">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Descraption") %>'></asp:Label>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Descraption") %>'></asp:Label>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="300px" 
                                    Text='<%# Bind("Descraption") %>' TextMode="MultiLine" Width="500px"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="300px" 
                                    Text='<%# Bind("Descraption") %>' TextMode="MultiLine" Width="500px"></asp:TextBox>
                            </InsertItemTemplate>
                            <ControlStyle Width="95%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="WatchCount" HeaderText="كۆرۈلىشى:" ReadOnly="True" 
                            SortExpression="WatchCount" InsertVisible="False" />
                        <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرىلىشى:" ReadOnly="True" 
                            SortExpression="DownCount" InsertVisible="False" />
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى:" ReadOnly="True" 
                            SortExpression="AddTime" InsertVisible="False" />
                        <asp:BoundField DataField="WhatUrl" HeaderText="كۆرۈش ئادرىسى:" 
                            SortExpression="WhatUrl" >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:CommandField CancelText="بىكار قىلىش" EditText="تەھرىرلەش" 
                            InsertText="قوشۇش" NewText="قوشۇش" ShowEditButton="True" 
                            ShowInsertButton="True" UpdateText="ئۆزگەرتىش" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Fields>
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:LinqDataSource ID="ldsOneMovie" runat="server" 
                    ContextTypeName="dcUTWDataContext" TableName="Movies" Where="ID == @ID" 
                    EnableInsert="True" EnableUpdate="True">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfSelectedMovieID" Name="ID" 
                            PropertyName="Value" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

