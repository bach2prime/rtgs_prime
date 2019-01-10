<%@ Page Title="RTGS: Send Return" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SendReturn.aspx.cs" Inherits="RtgsWeb.Inward.SendReturn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Scripts/Inward/inward.make.js" />
        </Scripts>
    </asp:ScriptManager>
    <div id="divEFTItemList" runat="server">
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
        </asp:Panel>
        <%--<cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                </cc1:CalendarExtender>
                Business Date: (Please Select Last Business Date)&nbsp;
                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                &nbsp;&nbsp;
                <asp:Button ID="ButtonTxList" CssClass="buttonStyle" runat="server" Text="Transactions"
                    OnClick="ButtonTxList_Click" />
                <hr />--%>
        <h4>
            <b>Dishonored Items</b></h4>
        <%--AllowPaging="true" PageSize="<%# PageSize %>" OnPageIndexChanging="gridviewTxList_PageIndexChanging"--%>
        <asp:GridView ID="gridviewTxList" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
            <Columns>
                <asp:BoundField DataField="EdrInId" HeaderText="ID" />
                <asp:BoundField DataField="TransactionId" HeaderText="Transaction Id" />
                <asp:BoundField DataField="SettlementDate" HeaderText="Sett Date" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="OtherBankName" HeaderText="From" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:N}">
                    <ItemStyle Width="90px" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Currency" HeaderText="">
                    <ItemStyle Width="30px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="ReceiverAccount" HeaderText="A/C" />
                <asp:BoundField DataField="ReceiverName" HeaderText="Name" />
                <%--    <asp:BoundField DataField="StatusStr" HeaderText="Status" />--%>
                <asp:BoundField DataField="SenderAccount" HeaderText="Sender A/C" />
                <asp:BoundField DataField="SenderName" HeaderText="Sender Name" />
                <asp:TemplateField HeaderText="">
                    <ItemStyle Width="80px" />
                    <ItemTemplate>
                        <asp:HiddenField ID="hdEdrInId" runat="server" Value='<%# Eval("EdrInId") %>' />
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
                            OnClientClick="return window.confirm('Are you sure to Send the item?') & loading();"
                            OnClick="SendReturnItem">Send </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#5090c0" Height="15px" ForeColor="White" />
            <SelectedRowStyle CssClass="SelectedRowStyle" />
            <HeaderStyle CssClass="HeaderStyleDark" />
            <RowStyle CssClass="RowStyle" />
            <EditRowStyle CssClass="EditRowStyle" />
            <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        </asp:GridView>
    </div>
    <div style="display: none">
        <asp:LinkButton runat="server" ID="PostBack" OnClick="PbClick">abc</asp:LinkButton>
    </div>
    
     <div>
        <br />
        <div id="load" style="visibility: hidden">
            <div id="progressBackgroundFilter">
            </div>
            <div id="processMessage">
                <div style="margin: auto; width: 120px">
                    <img alt="Busy..." width="120px" src="../media/images/103.gif" />
                </div>
            </div>
        </div>
    </div>

    <%--<asp:LinqDataSource ID="LinqDataSource1" runat="server" OnSelecting="LinqDataSource1_Selecting">
            </asp:LinqDataSource>--%>
</asp:Content>
