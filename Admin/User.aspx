<%@ Page Title="RTGS | User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="User.aspx.cs" Inherits="RtgsWeb.Admin.User" Culture="bn-BD" UICulture="bn-BD" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:DropDownList Font-Size="14px" CssClass="dropDown" ID="DropDownListBranch" AppendDataBoundItems="true"
                    runat="server">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                
                <asp:TextBox runat="server" placeholder="CODE" ID="tbCode" />
                <asp:Button ID="ButtonGetUser" CssClass="btn_green" runat="server" Text="Get Users"
                    OnClick="ButtonGetUser_Click" />
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <b>
                    <asp:Label ID="LabelBranch" runat="server" Text="User"></asp:Label>
                </b>
                <hr />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <div style="width: 90%; overflow: scroll; padding: 5px 0 20px 0">
                    <asp:GridView ID="gridviewActive" runat="server" AutoGenerateColumns="true" CellPadding="4"
                        ForeColor="#151515" GridLines="None" Width="130%" ViewStateMode="Enabled" OnSelectedIndexChanging="gridviewActive_SelectedIndexChanging">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True">
                                
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdUserID" runat="server" Value='<%# Eval("UserID") %>' />
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
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <b>Add / Edit User</b><hr />
            </td>
        </tr>
        <tr>
            <td style="" valign="top">
                <table cellpadding="5" cellspacing="0" width="90%">
                    <tr>
                        <td class="rightAlign">ID
                        </td>
                        <td>
                            <asp:Label ID="LabelUserID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">User Name
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="TextBoxName" runat="server" TabIndex="2" Width="140px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">Full Name
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtFullName" runat="server" TabIndex="2" Width="200px"
                                MaxLength="99"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">Phone No
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtPhoneNo" runat="server" TabIndex="2" Width="140px"
                                MaxLength="20"></asp:TextBox>
                            &nbsp;optional
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">Employee ID
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtCode" runat="server" TabIndex="2" Width="140px"
                                MaxLength="20"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">Role
                        </td>
                        <td>
                            <asp:DropDownList CssClass="dropDown" AppendDataBoundItems="true" ID="ddlRole" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">BDT Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitBdt" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitBdt" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitBdt" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">USD Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitUsd" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitUsd" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitUsd" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">EUR Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitEur" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitEur" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitEur" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">JPY Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitJpy" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitJpy" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitJpy" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">GBP Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitGbp" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitGbp" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitGbp" runat="server" Width="140px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <asp:Panel runat="server" ID="panelStatus">
                        <tr>
                            <td class="rightAlign">Active
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBoxInactive" Text="Make Inactive" runat="server" />
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td style="padding-top: 20px;" colspan="2">
                            <asp:Button CssClass="btn_green" ID="btnAddUser" runat="server" TabIndex="4" Text="Add / Update"
                                OnClick="btnAddUser_Click" />
                            &nbsp;
                            <asp:Button CssClass="btn_blue" ID="btnResetPassword" runat="server" TabIndex="4" Text="Reset Password"
                                OnClick="btnResetPassword_Click" />
                            &nbsp;
                            <asp:Button CssClass="btn_red" ID="btnClear" runat="server" TabIndex="5" Text="Clear"
                                OnClick="btnClear_Click" />
                            &nbsp;
                            <asp:Button CssClass="btn_yellow" ID="brnUnlock" Visible="false" runat="server" TabIndex="5" Text="Unlock"
                                OnClick="brnUnlock_Click" />
                            <br />
                            <br />
                            <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                                <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <h2>User Report</h2>
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td colspan="2">Branch&nbsp;&nbsp;
                <asp:DropDownList CssClass="dropDown" ID="ddlBranchReport" AppendDataBoundItems="true"
                    runat="server">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonUserReport" CssClass="btn_green" runat="server" Text="Get Report"
                    OnClick="ButtonUserReport_Click" />
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                    Width="100%" Visible="False" BackColor="White" Height="469px" ShowZoomControl="False">
                    <LocalReport ReportPath="">
                    </LocalReport>
                </rsweb:ReportViewer>
            </td>
        </tr>
    </table>
</asp:Content>
