<%@ Page Title="RTGS Outward: Item Add/Edit" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="SendByFtp.aspx.cs" Inherits="RtgsWeb.Outward.SendByFtp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"> 
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
        </asp:Panel>
    <div style="padding: 0px; border: 1px solid #f0f0f0;">
        <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
            cellpadding="5">
            <tr>                
                <td>
                    <asp:Label Text="0 Outward Files" Font-Bold="True" ID="lbXmlCount" runat="server" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnRefresh" runat="server" Text="Reload" CssClass="btn_green" OnClick="btnRefresh_Click"
                        OnClientClick="loading()" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSendAll" runat="server" Text="Send All" CssClass="btn_blue"
                        OnClientClick="loading()" onclick="btnSendAll_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnFtp" runat="server" Text="Test FTP" CssClass="btn_green" OnClick="btnFtp_Click"
                        OnClientClick="loading()" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
