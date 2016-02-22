<%@ Page Title="Add Console" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewConsole.aspx.cs" Inherits="VideoGamesMgmt.VGMgmt.AddNewConsole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br />
    <div class="form-horizontal">
        <h4>Add New Console</h4>
    <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtConsoleName" CssClass="col-md-2 control-label">Console Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtConsoleName" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConsoleName"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The console name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlConsoleType" CssClass="col-md-2 control-label">Console Type</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlConsoleType" CssClass="form-control" Width="150" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Cartridge</asp:ListItem>
                    <asp:ListItem>CD</asp:ListItem>
                    <asp:ListItem>DVD</asp:ListItem>
                    <asp:ListItem>BD</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlConsoleType"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The console type field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="bthAdd" runat="server" Text="Add" CssClass="btn btn-default" OnClick="bthAdd_Click" />
            </div>
        </div>
</div>
        <asp:GridView AutoGenerateColumns="false" ID="consolegrid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <Columns>
        <asp:BoundField DataField="Console_ID" HeaderText="Console ID" />
        <asp:BoundField DataField="Console_Name" HeaderText="Console Name" />
        <asp:BoundField DataField="Console_Type" HeaderText="Console Type" />
            </Columns>
            
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
</asp:Content>
