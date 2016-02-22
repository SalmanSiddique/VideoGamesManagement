<%@ Page Title="Add Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddGameCategories.aspx.cs" Inherits="VideoGamesMgmt.VGMgmt.MultipleGameCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br />
    <p><asp:GridView ID="selectedGameGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="699px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
        <asp:BoundField DataField="Game_ID" HeaderText="Game ID" />
        <asp:BoundField DataField="Game_Name" HeaderText="Game Name" />
        <asp:BoundField DataField="Game_Desc" HeaderText="Game Description" />
        <asp:BoundField DataField="Game_Title" HeaderText="Game Title" />
            </Columns>
                                      <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                      </asp:GridView></p>
    <div class="form-horizontal">
        <h4>Please select the category for this game</h4>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlCategories" CssClass="col-md-2 control-label">Game Category</asp:Label>
            <div class="col-md-10">
                        <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control" Width="150" DataSourceID="SqlDataSource1" DataTextField="Category_Name" DataValueField="Category_ID"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCategories"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The game category field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Add Category" OnClick="Button1_Click" />
                <asp:Button ID="Button2" CssClass="btn btn-default" runat="server" Text="Next" OnClick="Button2_Click" />
            </div>
        </div>
        
        <asp:GridView ID="categoriesgrid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="261px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
        <asp:BoundField DataField="GameName" HeaderText="Game Name" />
        <asp:BoundField DataField="GameCat" HeaderText="Game Category" />


                        <asp:BoundField />
                    </Columns>

                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

                </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:videogamesmgmtConnectionString %>" ProviderName="<%$ ConnectionStrings:videogamesmgmtConnectionString.ProviderName %>" SelectCommand="SELECT Category_ID, Category_Name FROM categoriesmaster"></asp:SqlDataSource>    
    </div>
</asp:Content>
