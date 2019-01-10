<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="ChPass.aspx.cs"
    Inherits="RtgsWeb.ChPass" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="media/images/favicon.ico">
    <style type="text/css">
        #txtUserName {
            cursor:not-allowed
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
    <div style="width: 400px; margin: 30px auto; padding: 0px; border: 1px solid #f0f0f0;">
        <table style="width: 100%; margin: 0px; border: 2px solid #fff; background-color: #f9f9f9;"
            cellpadding="3">
            <tr>
                <td colspan="2">
                    <h4>
                        <b>Change Password</b></h4>
                </td>
            </tr>
            <tr>
                <td style="width: 150px; padding-left: 10px;">
                    User Name
                </td>
                <td>
                    <asp:TextBox Enabled="false" CssClass="textBox" ID="txtUserName" runat="server"></asp:TextBox>
                    <%--<asp:Label runat="server" ID="lbusername"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td style="width: 150px; padding-left: 10px;">
                    Current Password
                </td>
                <td>
                    <asp:TextBox CssClass="textBox" ID="TextBoxCurrent" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 150px; padding-left: 10px;">
                    New Password
                </td>
                <td>
                    <asp:TextBox CssClass="textBox" ID="TextBoxNew1" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 150px; padding-left: 10px;">
                    Retype New Password
                </td>
                <td>
                    <asp:TextBox CssClass="textBox" ID="TextBoxNew2" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td colspan="1">
                    <asp:Button ID="ButtonChange" runat="server" CssClass="buttonStyle70" Text="Change"
                        OnClick="ButtonChange_Click" />
                </td>
            </tr>
        </table>
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox" Visible="false">
            <asp:Label runat="server" ID="labelResult"></asp:Label>
        </asp:Panel>
        <h2><a href="/Login.aspx">Login</a></h2>
    </div>
    
    </form>
</body>
</html>
