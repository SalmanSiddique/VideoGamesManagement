<%@ Page Title="Add Game" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="VideoGamesMgmt.Insert" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br />
    <div class="form-horizontal">
    <h4>Add a new Video Game</h4>
    <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
    
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtGameTitle" CssClass="col-md-2 control-label">Game Title</asp:Label>
            <div class="col-md-10">
                        <asp:TextBox ID="txtGameTitle" CssClass="form-control" runat="server" Width="129px"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGameTitle"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The game title is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtGameName" CssClass="col-md-2 control-label">Game Name</asp:Label>
            <div class="col-md-10">
                                <asp:TextBox ID="txtGameName" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGameName"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The game name field is required." />
            </div>
        </div>

        <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtGameDesc" CssClass="col-md-2 control-label">Game Description</asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtGameDesc" CssClass="form-control" runat="server" TextMode="MultiLine" Width="246px" Rows="4"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGameDesc"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The game description field is required." />
            </div>
        </div>
        
        
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="Button1" runat="server" Text="Next" CssClass="btn btn-default" OnClick="Button1_Click1" />
            </div>
        </div>
        
        </div>

    </asp:Content>