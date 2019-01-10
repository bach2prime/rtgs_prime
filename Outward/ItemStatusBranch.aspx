<%@ Page Title="RTGS Outward: Status" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ItemStatusBranch.aspx.cs" Inherits="RtgsWeb.Outward.ItemStatusBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .linkButton
        {
            padding: 7px 3px;
            font-size: 110%;
            text-decoration: none;
            line-height: 1em;
            min-width: 115px;
            display: inline-block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100%">
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td style="width: 15%">
                    <fieldset id="fsSummary" runat="server" class="formBoxGV">
                        <legend>
                            <asp:Label ID="LabelBank" runat="server" Text="Branch"></asp:Label></legend>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkForChecker">ReadyToCheck (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkRemake">Remake (0)</asp:LinkButton>
                    </fieldset>
                </td>
                <td style="width: 67%">
                    <fieldset id="Fieldset1" runat="server" class="formBoxGV">
                        <legend>
                            <asp:Label ID="Label1" runat="server" Text="Head Office"></asp:Label></legend>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkReadySend">ReadyToSend (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkSent">Sent (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkSentFailed">SendingFailed (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkSentAck">Ack (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkSentNak">Nak (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkFutureDated">Inactive (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkPending">Queued (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkProcessing">In Process (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkCancelled">Cancelled (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkRejected">Rejected (0)</asp:LinkButton>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkCompleted">Settled (0)</asp:LinkButton>
                        <b><asp:HyperLink runat="server" ID="linkSendOutward" NavigateUrl="">Send Outward</asp:HyperLink></b>
                    </fieldset>
                </td>
                <td>
                    <fieldset id="Fieldset2" runat="server" class="formBoxGV" style="height: 85px">
                        <legend>
                            <asp:Label ID="Label2" runat="server" Text="Reverse"></asp:Label></legend>
                        <asp:LinkButton CssClass="linkButton" OnClick="LinkButtonClicked" runat="server"
                            ID="linkReturn">Reverse Received (0)</asp:LinkButton>
                    </fieldset>
                </td>
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
                    <asp:TemplateField HeaderText="">
                        <ItemStyle Width="60px" />
                        <ItemTemplate>                            
                            <asp:HiddenField ID="hdEdrOutId" runat="server" Value='<%# Eval("EdrOutId") %>' />
                            <asp:Label runat="server"><%# Eval("EdrOutId") %></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                    <asp:BoundField DataField="SettlementDate" HeaderText="Sett Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="TxTypeStr" HeaderText="Tx Type" />
                    <asp:BoundField DataField="ItemTypeStr" HeaderText="Type" />
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
                    <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                    <asp:BoundField DataField="ReturnReason" HeaderText="Code" />
                    <asp:BoundField DataField="ReturnReasonInfo" HeaderText="Info" />
                    <asp:BoundField DataField="ParentTxId" HeaderText="Main Tx ID" />
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
    <br />
    
</asp:Content>
