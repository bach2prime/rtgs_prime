﻿<%@ Page Title="RTGS | Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="RtgsWeb.Admin.Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Scripts/Inward/inward.make.js" />
        </Scripts>
    </asp:ScriptManager>
    <h2>
        <b>Search Items</b></h2>
    <table cellpadding="5" style="width: 100%" bgcolor="#F5f5f5">
        <tr>
            <td valign="top">
                Type<br />
                <asp:DropDownList ID="ddlType" Width="100px" runat="server">
                    <asp:ListItem Value="10">Inward</asp:ListItem>
                    <asp:ListItem Value="11">OutwardReverse</asp:ListItem>
                    <asp:ListItem Value="0">Outward</asp:ListItem>
                    <asp:ListItem Value="1">InwardReverse</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td valign="top">
                Date<br />
                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px" ></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="Image1"
                    TargetControlID="tbsettDate">
                </cc1:CalendarExtender>
                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                &nbsp; To&nbsp;
                <asp:TextBox ID="tbDateTo" runat="server" CssClass="textBox" Width="80px" ></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="Image2"
                    TargetControlID="tbDateTo">
                </cc1:CalendarExtender>
                <asp:Image ID="Image2" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
            </td>
            <td valign="top">
                Bank<br />
                <asp:DropDownList ID="ddlBanks" Width="150px" runat="server" >
                </asp:DropDownList>
            </td>
            <td valign="top">
                Amount<br />
                <asp:TextBox ID="tbAmntFrom" runat="server" CssClass="textBox" Width="100px" ></asp:TextBox>
                &nbsp;to
                <asp:TextBox ID="tbAmntTo" runat="server" CssClass="textBox" Width="100px" ></asp:TextBox>
                <br />
            </td>
            <td valign="top">
            </td>
        </tr>
        <tr>
            <td>
                Sender Name
                <br />
                <asp:TextBox ID="tbSendName" runat="server" CssClass="textBox" Width="200px" ></asp:TextBox>
            </td>
            <td>
                Sender A/C
                <br />
                <asp:TextBox ID="tbSendAcc" runat="server" CssClass="textBox" Width="200px" ></asp:TextBox>
            </td>
                        <td>
                Receiver Name
                <br />
                <asp:TextBox ID="tbRecvName" runat="server" CssClass="textBox" Width="200px" ></asp:TextBox>
            </td>
            <td>
                Receiver A/C
                <br />
                <asp:TextBox ID="tbRecvAcc" runat="server" CssClass="textBox" Width="200px" ></asp:TextBox>
            </td>
            <td>
                &nbsp;
                <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="buttonStyle" OnClientClick="loading()"
                    OnClick="BtnSearch_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="BtnClear" runat="server" Text="Reset" CssClass="buttonStyle70" OnClientClick="loading()"
                    OnClick="BtnClear_Click" />
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False" CellPadding="7"
        ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" AllowPaging="True"
        OnPageIndexChanging="gvItems_PageIndexChanging">
        <Columns>
            <%--<asp:TemplateField>
                <ItemTemplate>
                    <a href="javascript:showOutwardItemDetails('<%# Eval("EdrId") %>','<%# Eval("ItemType") %>')">
                        Details</a>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:BoundField DataField="SettlementDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
            <asp:BoundField DataField="BranchName" HeaderText="Own Branch" />
            <asp:BoundField DataField="EdrId" HeaderText="ID" />
            <asp:BoundField DataField="TransactionId" HeaderText="Trace" />
            <asp:BoundField DataField="OtherBankName" HeaderText="Bank" />
            <asp:BoundField DataField="OtherBranchName" HeaderText="Branch" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" />
            <asp:BoundField DataField="Currency" HeaderText="" />
            <asp:BoundField DataField="SenderAccount" HeaderText="Sender A/C" />
            <asp:BoundField DataField="SenderName" HeaderText="Sender Name" />
            <asp:BoundField DataField="ReceiverAccount" HeaderText="Recv A/C" />
            <asp:BoundField DataField="ReceiverName" HeaderText="Recv Name"/>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:HiddenField ID="hdBatchID" runat="server" Value='<%# Eval("EdrId") %>' />
                    <%--<asp:LinkButton ID="lockbt" runat="server" OnClick="ShowDetails"></asp:LinkButton>--%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast"
            NextPageText="Next" PageButtonCount="20" PreviousPageText="Prev" />
        <PagerStyle BackColor="#87B6D9" Height="12px" ForeColor="White" />
        <SelectedRowStyle CssClass="SelectedRowStyle" />
        <HeaderStyle CssClass="HeaderStyleDark" />
        <RowStyle CssClass="RowStyle" />
        <EditRowStyle CssClass="EditRowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    </asp:GridView>
    <br />
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
        <asp:Label Text="Result" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
    <%--<asp:LinqDataSource ID="linqDSItems" runat="server"
        AutoPage="False" onselecting="linqDSItems_Selecting">
    </asp:LinqDataSource>--%>
</asp:Content>
