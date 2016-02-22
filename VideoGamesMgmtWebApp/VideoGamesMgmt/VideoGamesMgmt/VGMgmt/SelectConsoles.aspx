<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectConsoles.aspx.cs" Inherits="VideoGamesMgmt.VGMgmt.AskConsoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    <h4>Select the Console for above game</h4>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlconsoles" CssClass="col-md-2 control-label">Select Console</asp:Label>
            <div class="col-md-10">
                        <asp:DropDownList ID="ddlconsoles" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control" Width="150" DataTextField="Console_Name" DataValueField="Console_ID">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlconsoles"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The game category field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="addButton" CssClass="btn btn-default" runat="server" Text="Add" OnClick="addButton_Click"/>
            </div>
        </div>
        <p></p>
        

                <asp:GridView ID="consolesgrid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="688px" OnSelectedIndexChanged="consolesgrid_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
        <asp:BoundField DataField="ReleaseID" HeaderText="Release ID" />
        <asp:BoundField DataField="GameName" HeaderText="Game Name" />
        <asp:BoundField DataField="ConsoleName" HeaderText="Console" />
        <asp:BoundField DataField="ConsoleType" HeaderText="Console Type" />



                        <asp:BoundField />
                        <asp:CommandField SelectText="Add Contents" ShowSelectButton="True" />
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
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:videogamesmgmtConnectionString %>" ProviderName="<%$ ConnectionStrings:videogamesmgmtConnectionString.ProviderName %>" SelectCommand="SELECT Console_ID, Console_Name FROM consoles"></asp:SqlDataSource>
</asp:Content>
