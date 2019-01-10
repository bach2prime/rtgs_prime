<%@ Page Title="RTGS Outward: Check" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="CheckItemReturn170.aspx.cs" Inherits="RtgsWeb.Outward.CheckItemReturn170"
    UICulture="bn-BD" Culture="bn-BD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100%">
        <%--<fieldset id="freeBatches" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="LabelBank" runat="server" Text="Ready Batches"></asp:Label></legend>
            <table cellpadding="10">
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlBranch" runat="server" DataTextField="BranchName" DataValueField="BranchID"
                            Font-Names="Trebuchet MS" Font-Size="10pt" AppendDataBoundItems="true">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button CssClass="buttonStyle" ID="ButtonGetBatches" runat="server" Text="Get Batches"
                            OnClientClick="loading()" />
                    </td>
                </tr>
            </table>
        </fieldset>--%>
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
        </asp:Panel>
         <%--(max 10 items shown)--%>
        <fieldset id="itemList" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="Label1" runat="server" Text="Outward Items to Check"></asp:Label></legend>
            <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
                ForeColor="#151515" GridLines="None" Width="95%" ViewStateMode="Enabled" ShowFooter="false"
                AllowPaging="true" PageSize="20" OnPageIndexChanging="gridviewItems_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemStyle Width="180px" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRow" runat="server" />
                            <asp:HiddenField ID="hdEdrOutId" runat="server" Value='<%# Eval("EdrOutId") %>' />
                            <%--<asp:LinkButton ID="LinkButtonRm" runat="server" ForeColor="Green" OnClick="UpdateItem"
                                OnClientClick="return window.confirm('Are you sure to send the item to maker?');">Remake</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <%--<asp:LinkButton ID="LinkButtonRej" runat="server" ForeColor="Red" OnClientClick="return window.confirm('Are you sure to delete the item?');"
                                OnClick="ButtonDeleteItemYes_Click">Delete </asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <asp:LinkButton ID="LinkButtonCehcked" runat="server" ForeColor="Blue" OnClientClick="return window.confirm('The Item will be ready for sending. Are you sure?');"
                                OnClick="UpdateItem">Checked </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EdrOutId" HeaderText="Item ID">
                        <ItemStyle Width="25px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SettlementDate" HeaderText="Sett Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="TxTypeStr" HeaderText="Type" />
                    <asp:BoundField DataField="TransactionId" HeaderText="Transaction ID" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:N}">
                        <ItemStyle Width="90px" HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Currency" HeaderText="">
                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="SenderAccount" HeaderText="Sender A/C" />
                    <asp:BoundField DataField="SenderName" HeaderText="Sender Name" />
                    <asp:BoundField DataField="OtherBankName" HeaderText="Recv Bank" />
                    <asp:BoundField DataField="OtherBranchName" HeaderText="Recv Branch" />
                    <asp:BoundField DataField="ReceiverAccount" HeaderText="Recv A/C" />
                    <asp:BoundField DataField="ReceiverName" HeaderText="Recv Name" ItemStyle-Width="70px"
                        ItemStyle-Wrap="False" />
                    <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                    <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                </Columns>
                <FooterStyle BackColor="#6FA7D1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                <SelectedRowStyle CssClass="SelectedRowStyle" />
                <HeaderStyle CssClass="HeaderStyleDark" />
                <RowStyle CssClass="RowStyle" />
                <EditRowStyle CssClass="EditRowStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            </asp:GridView>
        </fieldset>
        <br />
        <b>Select </b>
       <%-- <asp:RadioButton ID="RadioButton2" Checked="true" runat="server" Text="None" GroupName="Software"
            AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
        <asp:RadioButton ID="RadioButton1" runat="server" Text="All" GroupName="Software"
            AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <b>Selected Items: </b>--%>
        <%--<asp:Button runat="server" ID="btnCheckAll" OnClientClick="return window.confirm('The Item will be ready for sending. Are you sure?');"
            OnClick="CheckSelected" Text="Checked" CssClass="btn_blue" />&nbsp;&nbsp;--%>
        <%--<asp:Button runat="server" ID="btnRemakeAll" OnClientClick="return window.confirm('Are you sure to send the item to maker?');"
            OnClick="RemakeSelected" Text="Remake" CssClass="btn_red" />--%>
        <%--<asp:Button runat="server" ID="btnExcel" OnClick="GetExcel" Text="Excel" CssClass="btn_green" />--%>
    </div>
</asp:Content>
