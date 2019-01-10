<%@ Page Title="RTGS Outward: Item Add/Edit" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="LiquidityReturn.aspx.cs" Inherits="RtgsWeb.Outward.LiquidityReturn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="../Scripts/UserInterface.js"></script>
    <script type="text/javascript" src="../Scripts/amount.js"></script>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.limit-1.2.js" type="text/javascript"></script>
    <script type="text/javascript">

        function OnFocusOutForm(event) {
            document.getElementById("labelAmountWord").innerHTML = toWord(document.getElementById("tbAmount").value
            , document.getElementById("ddlCurrency").value
            );
        }

        $(document).ready(function () {

            //$('#tbRcvAccountNum').limit('34', '#recvAc');
            //$('#tbSenderAcc').limit('34', '#sendAc');
            //$('#tbSenderName').limit('70', '#sendName');
            //$('#tbRcvName').limit('70', '#recvName');
        });

    </script>
    <script type="text/javascript">
        function f1() {
            window.open("GetRoutingNo.aspx");
        }
        function showPopUp() {

            var a = new Array;
            a[0] = 1;
            a[1] = 4;

            var url = 'GetRoutingNo.aspx';
            var r = window.showModalDialog(url, a, "dialogwidth: 780px; dialogheight:150px; resizable: yes; dialogHide:yes");
            //var formid = document.getElementsByTagName("form");
            //if (r != null) {
            //  window.location.reload(true);
            //}
            document.getElementById("tbReceiveBankBranch").value = r;
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField runat="server" ID="hfEdrOutId" Value="" />
    <table cellpadding="10" cellspacing="0" width="100%">
        <tr>
            <td style="width: 80%" valign="top">
                <fieldset class="formBoxGV">
                    <legend>
                        <asp:Label ID="Label1" runat="server" Text="ILF Return"></asp:Label>
                    </legend>
                    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                    </asp:Panel>
                    <table style="width: 100%" cellpadding="10" cellspacing="0" class="dataEntryTable">
                        <tr class="evenRow">
                            <td style="width: 160px">
                                Currency
                            </td>
                            <td>
                                <%--<asp:DropDownList ID="ddlTxType2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTxType_OnSelectedIndexChanged">
                                    <asp:ListItem Selected="true" Value="0">ILF Return</asp:ListItem>
                                    <asp:ListItem Value="1">General Financial Institution transfer</asp:ListItem>
                                </asp:DropDownList>--%>
                                <asp:DropDownList ID="ddlCurrency" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCurrency_OnSelectedIndexChanged">
                                
                                </asp:DropDownList>
                            </td>
                            <%--<td>
                                Effective Entry Date&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                            </td>--%>
                        </tr>
                        <tr class="oddRow">
                            <td>
                                Settlement Date
                            </td>
                            <td>
                               <%-- <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />--%>
                                <asp:Label Text="" ID="labelSettDate" runat="server" />
                            </td>
                        </tr>
                        <tr class="evenRow">
                            <td>
                                Settlement Account <%--( <span id="sendAc"></span>)--%>
                            </td>
                            <td>
                                <asp:TextBox ID="tbSenderAcc" Width="220px" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td style="width: 160px">
                                ILF Account <%--( <span id="recvAc"></span>)--%>
                            </td>
                            <td>
                                <asp:TextBox ID="tbRcvAccountNum" Width="220px" runat="server" MaxLength="0" CssClass="textBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="evenRow">
                            <td>
                                ILF Net Today
                            </td>
                            <td>
                                <asp:Label Text="0" ID="labelAmountPending" runat="server" />
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td>
                                Amount
                            </td>
                            <td colspan="1">
                                <asp:TextBox ID="tbAmount" Width="220px" runat="server" onblur="javascript:return OnFocusOutForm()"
                                    CssClass="textBox" MaxLength="13"></asp:TextBox>
                                <br />
                                <asp:Label ID="labelAmountWord" runat="server" Font-Size="12px" ForeColor="#0B647D"></asp:Label>
                            </td>
                        </tr>
                        <tr class="evenRow">
                            <td colspan="2">
                                <asp:Button ID="btCreateItem" runat="server" Text="Save" CssClass="buttonStyle" OnClick="btCreateItem_Click"
                                    OnClientClick="return confirm('Are you sure to save this transaction?')" />
                                <%--OnClientClick="loading()"--%>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
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
