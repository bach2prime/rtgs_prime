<%@ Page Title="Inward: Make" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MakeItem170.aspx.cs" Inherits="RtgsWeb.Inward.MakeItem170" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Scripts/Inward/inward.make.js" />
        </Scripts>
    </asp:ScriptManager>
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
    <asp:UpdatePanel ID="downloadICE" runat="server">
        <ContentTemplate>
            <div id="divEFTItemList" runat="server">
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                </cc1:CalendarExtender>
                Settlement Date: &nbsp;
                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                &nbsp;&nbsp;
                <asp:RadioButton ID="rbCustomer" Checked="true" runat="server" Text="Customer" GroupName="TxType" />
                <asp:RadioButton ID="rbBank" runat="server" Text="Bank" GroupName="TxType" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:RadioButton ID="rbBdt" Checked="true" runat="server" Text="BDT" GroupName="Currency" />
                <asp:RadioButton ID="rbUsd" runat="server" Text="USD"                GroupName="Currency" />
                <asp:RadioButton ID="rbEur" runat="server" Text="EUR"                GroupName="Currency" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonTxList" CssClass="btn_blue" runat="server" Text="Transactions"
                    OnClick="ButtonTxListClick" />
                <hr />
                <h4>
                    <b>Inward Items for Maker</b></h4>
                <%--AllowPaging="true" PageSize="<%# PageSize %>" OnPageIndexChanging="gridviewTxList_PageIndexChanging"--%>
                <asp:GridView ID="gridviewTxList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkRow" runat="server" />
                                <%--<a href="javascript:showMakeItemDetails('<%# Eval("EdrInId") %>','edrin')">Process</a>--%>
                                <a href="MakeItemProcess.aspx?edrId=<%# Eval("EdrInId") %>&inout=edrin" target="_blank">Process</a>
                                <asp:HiddenField ID="hfEdrInId" runat="server" Value='<%# Eval("EdrInId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EdrInId" HeaderText="ID" />
                        <asp:BoundField DataField="BranchName" HeaderText="Branch Name" />
                        <asp:BoundField DataField="CreationDate" HeaderText="Created On" DataFormatString="{0:dd-MM-yyyy HH:mm:ss}" />
                        <asp:BoundField DataField="TransactionId" HeaderText="Transaction Id" />
                        <asp:BoundField DataField="TxTypeStr" HeaderText="Type" />
                        <asp:BoundField DataField="OtherBankName" HeaderText="From" />
                        <%--<asp:BoundField DataField="CompanyName" HeaderText="Company" />--%>
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
            <br />
            <b>Select </b>
            <asp:RadioButton ID="RadioButton2" Checked="true" runat="server" Text="None" GroupName="Software"
                AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
            <asp:RadioButton ID="RadioButton1" runat="server" Text="All" GroupName="Software"
                AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Selected
                Items: </b>
            <asp:Button runat="server" ID="btnDlExcel" OnClick="PerformAction" Text="Download Excel"
                CssClass="btn_blue" />&nbsp;&nbsp;
            <asp:Button runat="server" ID="btnFinalize" OnClientClick="return window.confirm('Are you sure to Finalize the selected items?');"
                OnClick="PerformAction" Text="Finalize Items" CssClass="btn_green" />&nbsp;&nbsp;
            <div style="display: none">
                <asp:LinkButton runat="server" ID="PostBack" OnClick="PbClick">abc</asp:LinkButton>
            </div>
            <%--<asp:LinqDataSource ID="LinqDataSource1" runat="server" OnSelecting="LinqDataSource1_Selecting">
            </asp:LinqDataSource>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
