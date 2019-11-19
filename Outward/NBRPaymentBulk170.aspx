<%@ Page Title="RTGS Outward: One To Many" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="NBRPaymentBulk170.aspx.cs" Inherits="RtgsWeb.Outward.NBRPaymentBulk170" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="../Scripts/UserInterface.js"></script>
    <script type="text/javascript" src="../Scripts/amount.js"></script>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.limit-1.2.js" type="text/javascript"></script>
    <style type="text/css">
        .aspNetDisabled, input:disabled:hover {
            cursor: not-allowed;
        }

        .OutputDataCls {
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">

        function ConfirmAndLoading(msg) {
            var a = window.confirm(msg);
            if (a)
                return loading();
            else
                return false;
        }

        function OnFocusOutForm(event) {
            document.getElementById("labelAmountWord").innerHTML = toWord(document.getElementById("tbAmount").value);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td style="width: 80%" valign="top">
                <fieldset class="formBoxGV">
                    &nbsp;&nbsp;&nbsp;&nbsp; File: &nbsp;&nbsp; <legend>
                        <asp:Label ID="Label4" runat="server" Text="Select Excel File"></asp:Label>
                    </legend>
                    <asp:FileUpload ID="FileUploadExcel" runat="server" Width="307px" />
                    &nbsp;
                    <asp:Button ID="btParseXlsFile" runat="server" Text="Parse File" CssClass="buttonStyle"
                        OnClick="btParseXlsFile_Click" OnClientClick="loading()" />
                    &nbsp;
                    <asp:Button ID="btValidateXlsFile" runat="server" Text="Validate File" CssClass="buttonStyle"
                        OnClick="btnValidateXlsFile_Click" OnClientClick="loading()" />
                    <span style="width: 120px; margin-left: 75px"><a href="../media/SampleExcel170.xls">Sample Excel</a> </span>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td style="width: 80%" valign="top">
                <fieldset class="formBoxGV">
                    <legend>
                        <asp:Label ID="Label1" runat="server" Text="Sender Info"></asp:Label>
                        &nbsp;<asp:Image AlternateText="Help" ID="Image2" ImageUrl="~/media/images/help.png"
                            Width="18px" runat="server" ToolTip="(5) = 5 chars left. Optional fields may be blank" />
                    </legend>
                    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                    </asp:Panel>
                    <table style="width: 100%" cellpadding="4" cellspacing="0" class="dataEntryTable">
                        <tr class="evenRow">                           
                            <td>
                                Settlement Date&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                            </td>
                             <td>
                                Priority: <asp:DropDownList ID="ddlPriority" runat="server" Enabled="false">
                                    <asp:ListItem Selected="true" Value="0030">Normal</asp:ListItem>
                                    <asp:ListItem Value="0011">High</asp:ListItem>
                                    <asp:ListItem Value="0098">Low</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                Currency: <asp:DropDownList ID="ddlCurrency" runat="server" Enabled="false">                                  
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td>
                                Sender Name &nbsp;&nbsp;
                                <asp:Label ID="lbSenderName" runat="server" Text="" />
                            </td>
                            <td>
                                Sender Account &nbsp;&nbsp;
                                <asp:Label ID="lbSenderAcc" runat="server" Text="" />
                            </td>
                        </tr>
                        <tr class="evenRow">
                            <td>
                                Sender Name (CBS) &nbsp;&nbsp;
                                <asp:Label ID="lbSenderNameCBS" runat="server" Text="" />
                            </td>
                            <td>
                                Sender Balance &nbsp;&nbsp;
                                <asp:Label ID="lbSenderBalance" runat="server" Text="" />
                            </td>
                        </tr>
                         <tr class="oddRow">
                            <td>
                                Sender Mobile Number &nbsp;&nbsp;
                                <asp:Label ID="lbSenderMobNum" runat="server" Text="" />
                            </td>
                             <td>
                                 Sender Email &nbsp;&nbsp;
                                <asp:Label ID="lbSenderEmail" runat="server" Text="" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <fieldset class="formBoxGV">
        <legend>
            <asp:Label ID="Label2" runat="server" Text="Receiver Info"></asp:Label>
            &nbsp;<asp:Image AlternateText="Help" ID="Image3" ImageUrl="~/media/images/help.png"
                Width="18px" runat="server" ToolTip="(5) = 5 chars left. Optional fields may be blank" />
        </legend>
        <table width="100%" class="dataEntryTable" cellpadding="4" cellspacing="0">
            <tr class="evenRow">
                <td>
                    <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" OnRowDataBound="gridviewItems_RowDataBound"
                        ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="ReceivingBankRt" HeaderText="Bank" />                            
                            <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:N}">
                                <ItemStyle Width="90px" HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Currency" HeaderText="">
                                <ItemStyle Width="30px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="ReceiverAcc" HeaderText="Recv A/C" />
                            <asp:BoundField DataField="ReceiverName" HeaderText="Recv Name" ItemStyle-Width="70px"
                                ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="ReceiverEmail" HeaderText="Receiver Email" />
                            <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                            <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                            <asp:BoundField DataField="ErrorMessage" HeaderText="Error Message" />
                        </Columns>
                        <FooterStyle BackColor="#6FA7D1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                        <SelectedRowStyle CssClass="SelectedRowStyle" />
                        <HeaderStyle CssClass="HeaderStyleDark" />
                        <RowStyle CssClass="RowStyle" />
                        <EditRowStyle CssClass="EditRowStyle" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr class="evenRow">
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr class="evenRow">
                <td>
                    <asp:Button ID="BtInsertItems" runat="server" Text="Insert Items" CssClass="buttonStyle"
                        OnClick="ButtonYes_Click" OnClientClick="return ConfirmAndLoading('This Batch will be sent to checker. Are you sure?');" />
                    &nbsp;
                    <asp:Button ID="BtnCancelItems" runat="server" Text="Cancel Batch" CssClass="buttonStyle"
                        OnClick="BtnCancelItems_Click" OnClientClick="return ConfirmAndLoading('This Batch will be canceled. Are you sure?');" />
                </td>
            </tr>
        </table>
        
    </fieldset>
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
</asp:Content>
