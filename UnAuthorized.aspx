<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UnAuthorized.aspx.cs" Inherits="RtgsWeb.UnAuthorized" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="color: Red; padding: 20px">        
        <asp:Label Text="" ID="message" runat="server" />
        <a runat="server" id="linkChPass" href="/ChPass.aspx">Change Password</a>
    </div>
</asp:Content>
