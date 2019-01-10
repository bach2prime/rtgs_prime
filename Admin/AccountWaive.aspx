<%@ Page Title="RTGS | Account Waive" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AccountWaive.aspx.cs" Inherits="RtgsWeb.Admin.AccountWaive" Culture="bn-BD"
    UICulture="bn-BD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
    
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:TextBox runat="server" ID="txtAcc"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonGetAcc" CssClass="btn_green" runat="server" Text="Search"
                    OnClick="ButtonGetAcc_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonAddAcc" CssClass="btn_blue" runat="server" Text="Add Account"
                    OnClick="ButtonAddAcc_Click" OnClientClick="return confirm('Are you sure to add this account?')" />
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelBranch" runat="server" Text="Search Result"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="" valign="top">
                <asp:GridView ID="gridviewActive" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#151515" GridLines="None" Width="50%" ViewStateMode="Enabled" OnRowDeleting="DeleteAccount">
                    <Columns>
                        <asp:CommandField DeleteText="Delete" ShowDeleteButton="True"></asp:CommandField>
                        
                        <asp:TemplateField HeaderText="Account No">
                            <ItemTemplate>
                                <asp:Label ID="lbAccno" runat="server" Text='<%# Eval("AccountNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                    <SelectedRowStyle CssClass="SelectedRowStyle" />
                    <HeaderStyle CssClass="HeaderStyleDark" />
                    <RowStyle CssClass="RowStyle" />
                    <EditRowStyle CssClass="EditRowStyle" />
                    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
