<%@ Page Title="Add Contents" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddContents.aspx.cs" Inherits="VideoGamesMgmt.VGMgmt.AddContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br /> 
    <p>
         <asp:GridView ID="selectedGameGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="699px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
        <asp:BoundField DataField="Collection_ID" HeaderText="Release ID" />
        <asp:BoundField DataField="Game_Name" HeaderText="Game Name" />
        <asp:BoundField DataField="Console_Name" HeaderText="Console Name" />
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
        <h4>Enter the game contents of the above game</h4>
    <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
    
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlgamecompleteness" CssClass="col-md-2 control-label">Game Completeness</asp:Label>
            <div class="col-md-10">
                        <asp:DropDownList ID="ddlgamecompleteness" CssClass="form-control" Width="150" runat="server" DataSourceID="SqlDataSource1" DataTextField="Completeness_Name" DataValueField="Completeness_ID">
                    </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlgamecompleteness"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The game completeness is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlgamecondition" CssClass="col-md-2 control-label">Game Condition</asp:Label>
            <div class="col-md-10">
                        <asp:DropDownList ID="ddlgamecondition" CssClass="form-control" Width="150" runat="server" DataSourceID="SqlDataSource2" DataTextField="Condition_Name" DataValueField="Condition_ID"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlgamecondition"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The game completeness field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtAmtPurchased" CssClass="col-md-2 control-label">Purchase Amount</asp:Label>
            <div class="col-md-10">
                        <asp:TextBox ID="txtAmtPurchased" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAmtPurchased"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The purchase amount field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCurMarketValue" CssClass="col-md-2 control-label">Current Market Value</asp:Label>
            <div class="col-md-10">
                        <asp:TextBox ID="txtCurMarketValue" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCurMarketValue"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The current market value field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CalPurchaseDate" CssClass="col-md-2 control-label">Purchase Date</asp:Label>
            <div class="col-md-10">
              <asp:Calendar ID="CalPurchaseDate" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>  
            </div>
        </div>
        
    
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-default" Text="Add" OnClick="btnAdd_Click" />
                <asp:Button ID="bthAddOther" runat="server" CssClass="btn btn-default" Text="Add Contents for other Collection" OnClick="bthAddOther_Click" />
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-default" Text="Finish" OnClick="btnFinish_Click" />
            </div>
        </div>

    </div>
        <p><asp:GridView ID="contentsgrid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1026px" Height="134px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
        <asp:BoundField DataField="Collection_ID" HeaderText="Release ID" />
        <asp:BoundField DataField="Game_Name" HeaderText="Game Name" />
         <asp:BoundField DataField="Console_Name" HeaderText="Console" />
         <asp:BoundField DataField="GameCompleteness" HeaderText="Game Completeness" />
         <asp:BoundField DataField="GameCondition" HeaderText="Game Condition" />
         <asp:BoundField DataField="PurchaseAmount" HeaderText="Amount Purchased" />
         <asp:BoundField DataField="CurMktValue" HeaderText="Current Market Value" />
         <asp:BoundField DataField="PurchaseDate" HeaderText="Purchase Date" />
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

                </asp:GridView></p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:videogamesmgmtConnectionString %>" ProviderName="<%$ ConnectionStrings:videogamesmgmtConnectionString.ProviderName %>" SelectCommand="SELECT Completeness_ID, Completeness_Name FROM gamecomleteness"></asp:SqlDataSource>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:videogamesmgmtConnectionString %>" ProviderName="<%$ ConnectionStrings:videogamesmgmtConnectionString.ProviderName %>" SelectCommand="SELECT Condition_ID, Condition_Name FROM conditionsmaster"></asp:SqlDataSource>
                
</asp:Content>
