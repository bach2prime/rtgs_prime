<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceTest.aspx.cs" Inherits="RtgsWeb.Admin.ServiceTest" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table cellpadding="0" cellspacing="20">
            <tr class="evenRow">
                <td>Account Number
                </td>
                <td>
                    <asp:TextBox ID="tbSenderAcc" Width="220px" runat="server" CssClass="textBox"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" OnClick="OnClickGetInfo" Text="Get Info" CssClass="btn_green"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Result
                </td>
                <td>
                    <asp:Label runat="server" ID="labelName"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
