<%@ Page Title="RTGS | End-of-Day" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SettlementReport.aspx.cs" Inherits="RtgsWeb.Message.SettlementReport"
    UICulture="bn-BD" Culture="bn-BD" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--    <meta http-equiv="refresh" content="25" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
    <h3>
        <b>End-of-Day Reports</b></h3>

    <table style="width: 1000px">
        <tr>
            <td valign="top" style="padding-right: 20px">
                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                <asp:HiddenField ID="DateHiddenField" runat="server" Value="" />
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                </cc1:CalendarExtender>
                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                <asp:Button ID="btShow" runat="server" Text="Reload" CssClass="buttonStyle" OnClick="btShow_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <div style="display: block; margin-top: 4px" runat="server" id="divbatch">
                    <asp:GridView ID="gvBalance" runat="server" AutoGenerateColumns="False" Width="1000px"
                        AllowSorting="True" CellPadding="6" ForeColor="#333333" GridLines="None" Style="border-collapse: collapse;
                        text-align: left" BorderWidth="0px" BorderColor="#ffffff">
                        <Columns>
                            <asp:BoundField HeaderText="Currency" DataField="Currency" />
                            <asp:BoundField HeaderText="Report Time" DataField="CreationTime" DataFormatString="{0:dd-MM-yyyy HH:mm:ss}" />
                            <asp:BoundField HeaderText="A/C No" DataField="Number" />
                            <asp:BoundField HeaderText="Prev Closed" DataField="BlPRCD" DataFormatString="{0:N}" />
                            <asp:BoundField HeaderText="Opening Booked" DataField="BlOPBD" DataFormatString="{0:N}" />
                            <asp:BoundField HeaderText="Closing Booked" DataField="BlCLBD" DataFormatString="{0:N}" />
                            <asp:BoundField HeaderText="Closing Available" DataField="BlCLAV" DataFormatString="{0:N}" />
                            <asp:BoundField HeaderText="Forward Available" DataField="BlFWAV" DataFormatString="{0:N}" />
                            <asp:BoundField HeaderText="Reserved Balance" DataField="BlRESV" DataFormatString="{0:N}" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDetails" runat="server" CommandArgument='<%# Eval("Id") + ";" +  Eval("Currency")%>'
                                        OnCommand="lnkDetails" Text="Details">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
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
            </td>
        </tr>
    </table>

    <div style="margin-top: 4px" runat="server" id="divEntries" visible="false">
            <h3>Transactions</h3>

        <%--<div style="width: 100%; padding-top: 0px;">--%>

        <asp:ScriptManager ID="ScriptManager" runat="server">
        </asp:ScriptManager>

        <div style="padding: 5px; background-color: #fff; border: 1px solid #f0f0f0;">
            <table width="100%" cellpadding="0" cellspacing="0" style="padding-left: 0px;">
                <tr>
                    <td style="padding: 10px; border: 0px solid #c5c5c0; background-color: #fff; overflow: auto"
                        valign="top">
                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" BorderWidth="0px" Font-Names="Verdana" ShowPrintButton="true" ShowRefreshButton="true"
                            Font-Size="8pt" Width="100%" Visible="true" BackColor="White" Height="469px"
                            ShowZoomControl="False">
                        </rsweb:ReportViewer>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
