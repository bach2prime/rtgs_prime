<%@ Page Title="Certificates" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CertManager.aspx.cs" Inherits="RtgsWeb.Admin.CertManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <h2>
        Certificate Management</h2>
    <br />
    <table cellpadding="10" cellspacing="0" style="width: 600px">
        <tr class="RowStyleWhite" style="text-align: left">
            <td class="rightAlign" style="width: 250px">
                Common Name (CN) in the Certificate
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtCn" Width="240px" />
            </td>
        </tr>
        <tr class="AlterRowStyleWhite" style="text-align: left">
            <td class="rightAlign">
                Expires On
            </td>
            <td>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                </cc1:CalendarExtender>
                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
            </td>
        </tr>
        <tr class="RowStyleWhite" style="text-align: left">
            <td class="rightAlign">
                <asp:Button ID="Button1" Text="Add/Update" OnClick="SubmitRequest" runat="server" />
            </td>
            <td>
            </td>
        </tr>
        <tr class="AlterRowStyleWhite" style="text-align: left">
            <td colspan="2">
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                    <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br />
    <h2>
        <asp:LinkButton runat="server" ID="linkCert" OnClick="linkCert_OnClick">Download Certificate</asp:LinkButton>
    </h2>
    <h3>
        Test Signature</h3>
    <p>
        <asp:TextBox runat="server" ID="txtMessage" Width="800px" TextMode="MultiLine" Rows="5"  /></p>
        
    <p>
    <asp:LinkButton runat="server" ID="lbTest" OnClick="lbTest_OnClick">Sign Message</asp:LinkButton>
    </p>
</asp:Content>
