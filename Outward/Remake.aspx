<%@ Page Title="RTGS Outward: Remake" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Remake.aspx.cs" Inherits="RtgsWeb.Outward.Remake"  UICulture="bn-BD" Culture="bn-BD" %>

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
        <fieldset id="itemList" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="Label1" runat="server" Text="Outward Items to send (max 10 items shown)"></asp:Label></legend>
            <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
                ForeColor="#151515" GridLines="None" Width="95%" ViewStateMode="Enabled" ShowFooter="false"
                AllowPaging="true" OnRowDataBound="gridviewItems_RowDataBound" PageSize="100"
                OnPageIndexChanging="gridviewItems_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="EdrOutId" HeaderText="Item ID">
                        <ItemStyle Width="25px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SettlementDate" HeaderText="Sett Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="ItemTypeStr" HeaderText="Type" />
                    <asp:BoundField DataField="TxTypeStr" HeaderText="Tx Type" />
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
                    <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                    <asp:TemplateField HeaderText="">
                        <ItemStyle Width="80px" />
                        <ItemTemplate>
                            <asp:HiddenField ID="hdEdrOutId" runat="server" Value='<%# Eval("EdrOutId") %>' />
                            <asp:HiddenField ID="hdCategoryPurpose" runat="server" Value='<%# Eval("CategoryPurpose") %>' />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButtonRm" runat="server" ForeColor="Green" OnClick="UpdateItem">Edit</asp:LinkButton>
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
        </fieldset>
    </div>
</asp:Content>
