<%@ Page Title="RTGS | Message" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BusinessDay.aspx.cs" Inherits="RtgsWeb.Message.BusinessDay" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--    <meta http-equiv="refresh" content="25" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
    <h3>
                    <b>Get Business Day</b></h3>
    <%--<span style="font-size: 11px; color:rgb(15, 89, 141);">The page will automatically refresh in 25 sec.</span><br/><br/>--%>
    <table style="width: 900px">
        <tr>
            <td valign="top" style="padding-right: 20px">
                
                &nbsp;
                <asp:Button ID="btSend" runat="server" Text="Send Request" CssClass="buttonStyle"
                    OnClick="btSend_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btShow" runat="server" Text="Show Response" CssClass="buttonStyle"
                    OnClick="btShow_Click" />
                    &nbsp;&nbsp;&nbsp;
                <%--<asp:Button ID="btSendReq" runat="server" Text="Acc Report Req" CssClass="buttonStyle"
                    OnClick="btSendReq_Click" />--%>
                <br /><br />
                <%--<asp:Label ID="lbMessageInfo" runat="server" Text="Label"></asp:Label>--%>
                <div style="display: block; margin-top: 4px" runat="server" id="divbatch">
                    <asp:GridView ID="gvbatch" runat="server" AutoGenerateColumns="False" Width="850px"
                        AllowSorting="True" CellPadding="6" ForeColor="#333333" GridLines="None" Style="border-collapse: collapse;
                        text-align: left" BorderWidth="0px" BorderColor="#ffffff">
                        <Columns>
                            <asp:BoundField HeaderText="Sett Date" DataField="SettDate" DataFormatString="{0:dd-MM-yyyy}" />
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField HeaderText="Scheduled At" DataField="Scheduled" DataFormatString="{0:dd-MM-yyyy HH:mm:ss}" />
                            <asp:BoundField HeaderText="Started At" DataField="Started" DataFormatString="{0:dd-MM-yyyy HH:mm:ss}" />
                            <asp:BoundField HeaderText="Ended At" DataField="Ended" DataFormatString="{0:dd-MM-yyyy HH:mm:ss}" />
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
        </tr>
    </table>
</asp:Content>
