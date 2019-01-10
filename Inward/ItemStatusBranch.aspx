<%@ Page Title="RTGS Inward: Status" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ItemStatusBranch.aspx.cs" Inherits="RtgsWeb.Inward.ItemStatusBranch"
    UICulture="bn-BD" Culture="bn-BD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .linkButton
        {
            padding: 10px 8px;
            font-size: 110%;
            text-decoration: none;
            line-height: 2em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100%">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td style="width: 70%">
                    <fieldset id="fsSummary" runat="server" class="formBoxGV">
                        <legend>
                            <asp:Label ID="LabelBank" runat="server" Text="Inward"></asp:Label>
                        </legend>
                        <asp:Panel ID="panelInwardLinks" runat="server">
                        </asp:Panel>
                        <%--<asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkInward">Inward (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkDd">Direct Debit (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkDishonored">Dishonored (0)</asp:LinkButton>
                        --%><%--<asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkCbsXls">Get CBS Excel (BDT)</asp:LinkButton>--%>
                    </fieldset>
                </td>
                <td style="width: 30%">
                    <fieldset id="Fieldset2" runat="server" class="formBoxGV">
                        <legend>
                            <asp:Label ID="Label2" runat="server" Text="Return"></asp:Label>
                        </legend>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="LinkCompleted">Completed (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="LinkNotCompleted">Not Completed (0)</asp:LinkButton>
                    </fieldset>
                </td>
                <%--<td style="width: 20%">
                    <fieldset id="Fieldset3" runat="server" class="formBoxGV">
                        <legend>
                            <asp:Label ID="Label3" runat="server" Text="Links"></asp:Label>
                        </legend><a href="/Inward/SendReturn.aspx" class="linkButton">Send Reverse</a>
                    </fieldset>
                </td>--%>
            </tr>
        </table>
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
        </asp:Panel>
        <fieldset id="itemList" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="LabelItems" runat="server" Text="Items"></asp:Label></legend>
            <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
                ForeColor="#151515" GridLines="None" Width="95%" ViewStateMode="Enabled" ShowFooter="false">
                <Columns>
                    <asp:BoundField DataField="EdrInId" HeaderText="ID">
                        <ItemStyle Width="25px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                    <asp:BoundField DataField="SettlementDate" HeaderText="Sett Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="TxTypeStr" HeaderText="Type" />
                    <asp:BoundField DataField="TransactionId" HeaderText="Transaction ID" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:N}">
                        <ItemStyle Width="90px" HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Currency" HeaderText="">
                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="OtherBankName" HeaderText="Sender Bank" />
                    <asp:BoundField DataField="SenderAccount" HeaderText="Sender A/C" />
                    <asp:BoundField DataField="SenderName" HeaderText="Sender Name" />
                    <asp:BoundField DataField="ReceiverAccount" HeaderText="Recv A/C" />
                    <asp:BoundField DataField="ReceiverName" HeaderText="Recv Name" ItemStyle-Width="70px"
                        ItemStyle-Wrap="False" />
                    <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                    <asp:BoundField DataField="ReturnReason" HeaderText="Code" />
                    <asp:BoundField DataField="ReturnReasonInfo" HeaderText="Info" />
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
