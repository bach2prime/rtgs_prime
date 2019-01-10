<%@ Page Title="RTGS Outward: Status" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ItemStatus055.aspx.cs" Inherits="RtgsWeb.Outward.ItemStatus055" %>

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
                            <asp:CheckBox ID="chkRow" runat="server" />
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
    <asp:Panel runat="server" ID="panelTask">
        <b>Select </b>
        <asp:RadioButton ID="RadioButton2" Checked="true" runat="server" Text="None" GroupName="Software"
            AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
        <asp:RadioButton ID="RadioButton1" runat="server" Text="All" GroupName="Software"
            AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Selected
            Items: </b>
        <asp:Button runat="server" ID="btnGetStatus" OnClientClick="return window.confirm('Are you sure to Send Query for the selected items?');"
            OnClick="SendSelected" Text="Send Query" CssClass="btn_blue" />&nbsp;&nbsp;
            
            <asp:Button runat="server" ID="btnCancelAll" OnClientClick="return window.confirm('Are you sure to Send Cancel Request for the selected items?');"
            OnClick="SendSelected" Text="Cancel Tx" CssClass="btn_red" />&nbsp;&nbsp;
            <asp:DropDownList Width="60px" runat="server" ID="ddPriority">
                                <asp:ListItem Selected="true" Value="0011">11</asp:ListItem>
                                <asp:ListItem Value="0012">12</asp:ListItem>
                                <asp:ListItem Value="0013">13</asp:ListItem>
                                <asp:ListItem Value="0014">14</asp:ListItem>
                                <asp:ListItem Value="0015">15</asp:ListItem>
                                <asp:ListItem Value="0016">16</asp:ListItem>
                                <asp:ListItem Value="0017">17</asp:ListItem>
                                <asp:ListItem Value="0018">18</asp:ListItem>
                                <asp:ListItem Value="0019">19</asp:ListItem>
                                <asp:ListItem Value="0020">20</asp:ListItem>
                                <asp:ListItem Value="0021">21</asp:ListItem>
                                <asp:ListItem Value="0022">22</asp:ListItem>
                                <asp:ListItem Value="0023">23</asp:ListItem>
                                <asp:ListItem Value="0024">24</asp:ListItem>
                                <asp:ListItem Value="0025">25</asp:ListItem>
                                <asp:ListItem Value="0026">26</asp:ListItem>
                                <asp:ListItem Value="0027">27</asp:ListItem>
                                <asp:ListItem Value="0028">28</asp:ListItem>
                                <asp:ListItem Value="0029">29</asp:ListItem>
                                <asp:ListItem Value="0030">30</asp:ListItem>
                                <asp:ListItem Value="0031">31</asp:ListItem>
                                <asp:ListItem Value="0032">32</asp:ListItem>
                                <asp:ListItem Value="0033">33</asp:ListItem>
                                <asp:ListItem Value="0034">34</asp:ListItem>
                                <asp:ListItem Value="0035">35</asp:ListItem>
                                <asp:ListItem Value="0036">36</asp:ListItem>
                                <asp:ListItem Value="0037">37</asp:ListItem>
                                <asp:ListItem Value="0038">38</asp:ListItem>
                                <asp:ListItem Value="0039">39</asp:ListItem>
                                <asp:ListItem Value="0040">40</asp:ListItem>
                                <asp:ListItem Value="0041">41</asp:ListItem>
                                <asp:ListItem Value="0042">42</asp:ListItem>
                                <asp:ListItem Value="0043">43</asp:ListItem>
                                <asp:ListItem Value="0044">44</asp:ListItem>
                                <asp:ListItem Value="0045">45</asp:ListItem>
                                <asp:ListItem Value="0046">46</asp:ListItem>
                                <asp:ListItem Value="0047">47</asp:ListItem>
                                <asp:ListItem Value="0048">48</asp:ListItem>
                                <asp:ListItem Value="0049">49</asp:ListItem>
                                <asp:ListItem Value="0050">50</asp:ListItem>
                                <asp:ListItem Value="0051">51</asp:ListItem>
                                <asp:ListItem Value="0052">52</asp:ListItem>
                                <asp:ListItem Value="0053">53</asp:ListItem>
                                <asp:ListItem Value="0054">54</asp:ListItem>
                                <asp:ListItem Value="0055">55</asp:ListItem>
                                <asp:ListItem Value="0056">56</asp:ListItem>
                                <asp:ListItem Value="0057">57</asp:ListItem>
                                <asp:ListItem Value="0058">58</asp:ListItem>
                                <asp:ListItem Value="0059">59</asp:ListItem>
                                <asp:ListItem Value="0060">60</asp:ListItem>
                                <asp:ListItem Value="0061">61</asp:ListItem>
                                <asp:ListItem Value="0062">62</asp:ListItem>
                                <asp:ListItem Value="0063">63</asp:ListItem>
                                <asp:ListItem Value="0064">64</asp:ListItem>
                                <asp:ListItem Value="0065">65</asp:ListItem>
                                <asp:ListItem Value="0066">66</asp:ListItem>
                                <asp:ListItem Value="0067">67</asp:ListItem>
                                <asp:ListItem Value="0068">68</asp:ListItem>
                                <asp:ListItem Value="0069">69</asp:ListItem>
                                <asp:ListItem Value="0070">70</asp:ListItem>
                                <asp:ListItem Value="0071">71</asp:ListItem>
                                <asp:ListItem Value="0072">72</asp:ListItem>
                                <asp:ListItem Value="0073">73</asp:ListItem>
                                <asp:ListItem Value="0074">74</asp:ListItem>
                                <asp:ListItem Value="0075">75</asp:ListItem>
                                <asp:ListItem Value="0076">76</asp:ListItem>
                                <asp:ListItem Value="0077">77</asp:ListItem>
                                <asp:ListItem Value="0078">78</asp:ListItem>
                                <asp:ListItem Value="0079">79</asp:ListItem>
                                <asp:ListItem Value="0080">80</asp:ListItem>
                                <asp:ListItem Value="0081">81</asp:ListItem>
                                <asp:ListItem Value="0082">82</asp:ListItem>
                                <asp:ListItem Value="0083">83</asp:ListItem>
                                <asp:ListItem Value="0084">84</asp:ListItem>
                                <asp:ListItem Value="0085">85</asp:ListItem>
                                <asp:ListItem Value="0086">86</asp:ListItem>
                                <asp:ListItem Value="0087">87</asp:ListItem>
                                <asp:ListItem Value="0088">88</asp:ListItem>
                                <asp:ListItem Value="0090">90</asp:ListItem>
                                <asp:ListItem Value="0091">91</asp:ListItem>
                                <asp:ListItem Value="0092">92</asp:ListItem>
                                <asp:ListItem Value="0093">93</asp:ListItem>
                                <asp:ListItem Value="0094">94</asp:ListItem>
                                <asp:ListItem Value="0095">95</asp:ListItem>
                                <asp:ListItem Value="0096">96</asp:ListItem>
                                <asp:ListItem Value="0097">97</asp:ListItem>
                                <asp:ListItem Value="0098">98</asp:ListItem>
                                <asp:ListItem Value="0099">Settle-or-Reject</asp:ListItem>
                            </asp:DropDownList>
            <asp:Button runat="server" ID="btnChangePriority" OnClientClick="return window.confirm('Are you sure to Send Priority Change Request for the selected items?');"
            OnClick="SendSelected" Text="Change Priority" CssClass="btn_green" />&nbsp;&nbsp;
    </asp:Panel>
</asp:Content>
