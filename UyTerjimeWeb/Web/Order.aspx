<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Web_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style3">
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server" CssClass="Title" 
                    Text="فىلىم زاكاز قىلىش"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:DetailsView ID="dvOrder" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsOrder" DefaultMode="Insert" 
                    ForeColor="#333333" GridLines="None" Height="50px" 
                    ondatabinding="dvOrder_DataBinding" ondatabound="dvOrder_DataBound" 
                    onitemcreated="dvOrder_ItemCreated" oniteminserting="dvOrder_ItemInserting" 
                    onload="dvOrder_Load" Width="80%" oniteminserted="dvOrder_ItemInserted">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" Width="150px" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" 
                            SortExpression="UserID" Visible="False" />
                        <asp:BoundField DataField="MovieTitle" HeaderText="فىلىم نامى"  ReadOnly="True" 
                            SortExpression="MovieTitle">
                        <ControlStyle Width="90%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MovieID" HeaderText="MovieID" ReadOnly="True" 
                            SortExpression="MovieID" Visible="False" InsertVisible="False" />
                        <asp:TemplateField HeaderText="سانى">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    SelectedValue='<%# Bind("Count", "{0:N}") %>'>
                                    <asp:ListItem Selected="True">1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="forLTR" 
                                    SelectedValue='<%# Bind("Count", "{0:N}") %>' Width="150px">
                                    <asp:ListItem Selected="True">1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    SelectedValue='<%# Bind("Count", "{0:N}") %>'>
                                    <asp:ListItem Selected="True">1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ھۆججەت فورماتى">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    DataSourceID="ldsFileFormat" DataTextField="FileFormat1" 
                                    DataValueField="ID" SelectedValue='<%# Bind("FileFormat") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="forLTR" 
                                    DataSourceID="ldsFileFormat" DataTextField="FileFormat1" DataValueField="ID" 
                                    Width="150px" SelectedValue='<%# Bind("FileFormat") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsFileFormat" runat="server" 
                                    ContextTypeName="dcUTWDataContext" OrderBy="ID" TableName="FileFormats" 
                                    Where="Enable == @Enable">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    DataSourceID="ldsFileFormat" DataTextField="FileFormat1" 
                                    DataValueField="ID" SelectedValue='<%# Bind("FileFormat") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="دىسكا تىپى">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" 
                                    DataSource='<%# Eval("DiscType1") %>' DataSourceID="ldsDiscType" 
                                    DataTextField="DiscType1" DataValueField="ID" 
                                    SelectedValue='<%# Bind("DiscType") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="forLTR" 
                                    DataSourceID="ldsDiscType" DataTextField="DiscType1" DataValueField="ID" 
                                    SelectedValue='<%# Bind("DiscType") %>' Width="150px">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsDiscType" runat="server" 
                                    ContextTypeName="dcUTWDataContext" OrderBy="ID" TableName="DiscTypes" 
                                    Where="Enable == @Enable">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" 
                                    DataSource='<%# Eval("DiscType1") %>' DataSourceID="ldsDiscType" 
                                    DataTextField="DiscType1" DataValueField="ID" 
                                    SelectedValue='<%# Bind("DiscType") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ئىنىقلىقى">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" 
                                    DataSourceID="ldsResolution" DataTextField="Resolution1" DataValueField="ID" 
                                    SelectedValue='<%# Bind("Resolution") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" CssClass="forLTR" 
                                    DataSourceID="ldsResolution" DataTextField="Resolution1" DataValueField="ID" 
                                    SelectedValue='<%# Bind("Resolution") %>' Width="150px">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsResolution" runat="server" 
                                    ContextTypeName="dcUTWDataContext" OrderBy="ID" TableName="Resolutions" 
                                    Where="Enable == @Enable">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" 
                                    DataSourceID="ldsResolution" DataTextField="Resolution1" DataValueField="ID" 
                                    SelectedValue='<%# Bind("Resolution") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <ControlStyle CssClass="forLTR" />
                            <ItemStyle />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Phone" HeaderText="تېلېفۇن" SortExpression="Phone">
                        <ControlStyle Width="90%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Address" HeaderText="ئادرىسى" 
                            SortExpression="Address">
                        <ControlStyle Width="90%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="ئېلخەت" SortExpression="Email">
                        <ControlStyle Width="90%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Memo" HeaderText="ئىزاھات" SortExpression="Memo">
                        <ControlStyle Width="90%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" 
                            SortExpression="Date" Visible="False" />
                        <asp:BoundField DataField="Sate" HeaderText="Sate" ReadOnly="True" 
                            SortExpression="Sate" Visible="False" />
                        <asp:CommandField ShowEditButton="True" ShowInsertButton="True" 
                            CancelText="بىكار قىلىش" InsertText="يوللاش" />
                    </Fields>
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <InsertRowStyle BackColor="#E6FFFF" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:HiddenField ID="hfMovieTitle" runat="server" Value="Iron Man" />
                <asp:LinqDataSource ID="ldsOrder" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="Notes" Where="MovieID == @MovieID">
                    <WhereParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="MovieID" QueryStringField="ID" 
                            Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

