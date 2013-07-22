<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="Web_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ID" DataSourceID="ldsMovies" ForeColor="#333333" GridLines="None" Width="100%">
        <RowStyle BackColor="#FAFAFA" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="~/Web/Movie.aspx?ID={0}" DataTextField="Name" 
                HeaderText="فىلىم نامى" SortExpression="ID" />
            <asp:ImageField DataImageUrlField="Cover" HeaderText="رەسىمى">
                <ControlStyle Height="120px" Width="80px" />
            </asp:ImageField>
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="~/Web/Watch.aspx?id={0}" HeaderText="كۆرۈش" 
                Text="كۆرۈش" />
            <asp:BoundField DataField="OtherName" HeaderText="باشقا نامى" 
                SortExpression="OtherName" />
            <asp:BoundField DataField="ReleaseTime" HeaderText="تارقىتىلغان ۋاقىت" 
                SortExpression="ReleaseTime" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Country" HeaderText="دۆلىتى" 
                SortExpression="Country" />
            <asp:TemplateField HeaderText="تۈرى" SortExpression="Type">
                <ItemTemplate>
                    <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("Type") %>' />
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="ldsMovieCat">
                        <EditItemTemplate>
                            ID:
                            <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                            <br />
                            Name:
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            ID:
                            <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                            <br />
                            Name:
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:LinqDataSource ID="ldsMovieCat" runat="server" 
                        ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                        TableName="MovieCatgories" Where="State == @State &amp;&amp; ID == @ID">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                            <asp:ControlParameter ControlID="hfCatID" DefaultValue="0" Name="ID" 
                                PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Language" HeaderText="تىلى" 
                SortExpression="Language" />
            <asp:BoundField DataField="Subtitle" HeaderText="يېزىقى" 
                SortExpression="Subtitle" />
            <asp:BoundField DataField="WatchCount" HeaderText="كۆرۈلىشى" 
                SortExpression="WatchCount" />
            <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرىلىشى" 
                SortExpression="DownCount" />
            <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى" 
                SortExpression="AddTime" DataFormatString="{0:d}" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#E8E8E8" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="black" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="white" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsMovies" runat="server" 
        ContextTypeName="dcUTWDataContext" OrderBy="AddTime desc, ID desc" 
        TableName="Movies" Where="State == @State">
        <WhereParameters>
            <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>

