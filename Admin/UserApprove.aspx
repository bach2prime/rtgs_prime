<%@ Page Title="RTGS | User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UserApprove.aspx.cs" Inherits="RtgsWeb.Admin.UserApprove" Culture="bn-BD"
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
          <%--      <asp:DropDownList Font-Size="14px" CssClass="dropDown" ID="DropDownListBranch2" AppendDataBoundItems="true"
                    runat="server">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;--%>
                <asp:Button ID="ButtonGetUser" CssClass="btn_green" runat="server" Text="Get Pending Users"
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
            <td style="" valign="top">
                 <div style="width: 90%; overflow: scroll; padding: 5px 0 20px 0">
                <asp:GridView ID="gridviewActive" runat="server" AutoGenerateColumns="true" CellPadding="4"
                    ForeColor="#151515" GridLines="None" Width="130%" ViewStateMode="Enabled" OnSelectedIndexChanging="gridviewActive_SelectedIndexChanging">
                    <Columns>
                        <asp:CommandField SelectText="Approve" ShowSelectButton="True"></asp:CommandField>
                        
                        <%-- <asp:BoundField DataField="Name" HeaderText="User Name" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="PhoneNo" HeaderText="Phone No" />--%>
                        <%-- <asp:BoundField DataField="MakeLimit" HeaderText="Make Limit" DataFormatString="{0:N}" />
                        <asp:BoundField DataField="CheckLimit" HeaderText="Check Limit" DataFormatString="{0:N}" />
                       <asp:BoundField DataField="ActivityStatus" HeaderText="Status 0=Active" />--%>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdUserID" runat="server" Value='<%# Eval("UserID") %>' />
                                <asp:LinkButton ID="lockbt" runat="server" Text="Details" OnClick="ShowDetails"></asp:LinkButton>
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
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
