<%@ Page Title="RTGS | Message" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MessageBank.aspx.cs" Inherits="RtgsWeb.Message.MessageBank" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--    <meta http-equiv="refresh" content="25" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <%--<span style="font-size: 11px; color:rgb(15, 89, 141);">The page will automatically refresh in 25 sec.</span><br/><br/>--%>
    <table>
        <tr>
            <td valign="top" style="padding-right: 20px">
                <h3>
                    <b>Message List</b></h3><br/>
                <div id="divAdminSearch" runat="server" style="float: left">
                    From :
                    <asp:TextBox ID="tbStartDate" runat="server" Height="18px" Width="80px"></asp:TextBox>
                    <cc1:CalendarExtender ID="clStartDate" runat="server" PopupButtonID="imStartDate"
                        TargetControlID="tbStartDate" Format="dd/MM/yyyy">
                    </cc1:CalendarExtender>
                    <asp:Image ID="imStartDate" runat="server" Height="15px" ImageUrl="~/media/images/cal2.png" />
                    &nbsp To : &nbsp<asp:TextBox ID="tbEndDate" runat="server" Height="18px" Width="80px"></asp:TextBox>
                    <cc1:CalendarExtender ID="clEndDate" runat="server" PopupButtonID="imEndDate" TargetControlID="tbEndDate"
                        Format="dd/MM/yyyy">
                    </cc1:CalendarExtender>
                    <asp:Image ID="imEndDate" runat="server" Height="15px" ImageUrl="~/media/images/cal2.png" />
                    &nbsp;
                </div>
                <%--<div id="dvBranchList" runat="server" style="float: left" visible="false">
        Branch : &nbsp;
        <asp:DropDownList runat="server" ID="ddlbranchlist" DataTextField="name" DataValueField="value">
        </asp:DropDownList>
    </div>--%>
                &nbsp;
                <asp:Button ID="btShow" runat="server" Text="Show" CssClass="buttonStyle70" OnClick="btShow_Click" />
                <br />
                <br />
                <asp:Label ID="lbMessageInfo" runat="server" Text="Label"></asp:Label>
                <p>
                </p>
                <div style="display: block; margin-top: 4px" runat="server" id="divbatch">
                    <asp:GridView ID="gvbatch" runat="server" AutoGenerateColumns="False" Width="700px"
                        AllowSorting="True" CellPadding="6" ForeColor="#333333" GridLines="None" Style="border-collapse: collapse;
                        text-align: left" BorderWidth="0px" BorderColor="#ffffff">
                        <Columns>
                            <asp:BoundField HeaderText="Creation Date" DataField="CreationTime" DataFormatString="{0:dd-MM-yyyy hh:mm tt}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="To/From" DataField="ShortName" />
                            <asp:BoundField HeaderText="Message" DataField="Message" />                            
                            <asp:BoundField HeaderText="Incoming?" DataField="IsIncoming" />
                        </Columns>
                        <FooterStyle BackColor="#6FA7D1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                        <SelectedRowStyle CssClass="SelectedRowStyle" />
                        <HeaderStyle CssClass="HeaderStyleDark" />
                        <RowStyle CssClass="RowStyle" />
                        <EditRowStyle CssClass="EditRowStyle" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                </div>
                <div id="divnobatch" style="display: none; margin-top: 4px" runat="server">
                    <div style="float: left; text-align: center; padding: 20" class="userBox">
                        <asp:Label ID="bnotfound" runat="server" Text="Label" Font-Size="Large" ForeColor="#666666">No message available.</asp:Label>
                    </div>
                </div>
            </td>
            <td valign="top" style="padding-left: 20px; margin-left:20px; border-left: 1px solid #ddd" >
                <h3>
                    <b>Send Message</b></h3><br/>
                <table cellpadding="8">
                    <tr>
                        <td>
                            To
                        </td>
                        <td>
                        <asp:DropDownList DataTextField="ShortName" 
                        DataValueField="BankCode" CssClass="dropDown" AutoPostBack="true" Width="250px" ID="DropDownListBank"
                        runat="server"  />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Message
                        </td>
                        <td>
                            <asp:TextBox ID="tbMessage" Columns="20" runat="server" Height="100px" TextMode="MultiLine"
                                Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Send" CssClass="buttonStyle70" OnClick="btSend_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                                <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
