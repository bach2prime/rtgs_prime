<%@ Page Title="Sample" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Sample.aspx.cs" Inherits="RtgsWeb.Outward.Sample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .strong
        {
            font-size: 125%;
            color: #014752;
            line-height: 1.8em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Sample Message Generation</h1>
    <hr />
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
    <table cellpadding="10" border="0">
        <tr>
            <td>
                <span class="strong">Response of Outward Sent Item</span>&nbsp;&nbsp;&nbsp; ItemId:
                <asp:DropDownList runat="server" ID="ddlOutId" DataValueField="EdrOutId" />
                <asp:DropDownList runat="server" ID="ddlOutStatus">
                    <asp:ListItem Value="ACSC">Completed</asp:ListItem>
                    <asp:ListItem Value="ACSP">In Process</asp:ListItem>
                    <asp:ListItem Value="ACCP">Future Dated</asp:ListItem>
                    <asp:ListItem Value="PDNG">Pending</asp:ListItem>
                    <asp:ListItem Value="RJCT">Rejected</asp:ListItem>
                    <asp:ListItem Value="ERRC">Error</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button runat="server" ID="idOutStatus" OnClick="idOutStatus_OnClick" Text="Generate Outward Response" />
            </td>
        </tr>
        <tr>
            <td>
                <span class="strong">Inward Return </span>&nbsp;&nbsp;(For Outward 'Completed' Item
                (Not Already Returned) &nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:Button runat="server" ID="idInRet" OnClick="idInRet_OnClick" Text="Generate Inward Return" />
            </td>
        </tr>
        <tr>
            <td>
                <span class="strong">Inward Item</span>&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:Button runat="server" ID="idtest" OnClick="idtest_OnClick" Text="Generate Sample Inward (Customer)" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button runat="server" ID="idBank" OnClick="idBank_OnClick" Text="Generate Sample Inward (Bank)" />
            </td>
        </tr>
        <tr>
            <td>
                <span class="strong">Outward Item</span>&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:Button runat="server" ID="idOut" OnClick="idOut_OnClick" Text="Generate Sample Outward" />
            </td>
        </tr>
        <tr>
            <td>
                <span class="strong">Inward Direct Debit</span>
            </td>
            <td>
                <asp:Button runat="server" ID="btnDitectDebit" OnClick="btnDitectDebit_OnClick" Text="Generate Direct Debit" />
            </td>
        </tr>
        <tr>
            <td>
                <span class="strong">ILF Incoming Item</span>&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:Button runat="server" ID="btnIlfIn" OnClick="btnIlfIn_OnClick" Text="Generate ILF Incoming" />
            </td>
        </tr>
        <tr>
            <td>
                <span class="strong">Sample Incoming Message</span>&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:Button runat="server" ID="btnMessage" OnClick="btnMessage_OnClick" Text="Generate Incoming Message" />
            </td>
        </tr>
    </table>
</asp:Content>
