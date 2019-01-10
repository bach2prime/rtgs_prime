<%@ Page Title="RTGS Outward: Item Add/Edit" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EditItemInst055.aspx.cs" Inherits="RtgsWeb.Outward.EditItemInst055" %>

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
            $('#tbPurpose').limit('200', '#spanPurp');

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
                        <asp:Label ID="Label1" runat="server" Text="Transaction Info"></asp:Label>
                    </legend>
                    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                    </asp:Panel>
                    <table style="width: 100%" cellpadding="10" cellspacing="0" class="dataEntryTable">
                        <tr class="evenRow">
                            <td style="width: 160px">
                                Transaction Type
                            </td>
                            <td>
                                General Financial Institution Transfer (RTGS_FICT)
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td>
                                Settlement Date
                            </td>
                            <td>
                                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                                &nbsp;&nbsp;&nbsp;
                                 <asp:DropDownList ID="ddlCurrency" runat="server" OnSelectedIndexChanged="ddlCurrency_OnSelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                &nbsp;&nbsp;
                               
                                <asp:CheckBox runat="server" ID="cbMisc" Checked="false" AutoPostBack="true" OnCheckedChanged="cbMisc_OnCheckedChanged"/>
                                  Misc&nbsp;
                            </td>
                        </tr>
                        <tr class="evenRow">
                            <td style="width: 160px">
                                Receiver Bank
                            </td>
                            <td>
                                <asp:DropDownList CssClass="dropDown" AutoPostBack="true" Width="250px" ID="DropDownListBank"
                                    runat="server" OnSelectedIndexChanged="DropDownListBank_OnSelectedIndexChanged" />
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td colspan="1">
                                Receiver A/C <%--( <span id="recvAc"></span>)--%>
                            </td>
                            <td>
                                <asp:TextBox ID="tbRcvAccountNum" Width="220px" ReadOnly="true" runat="server" MaxLength="0"
                                    CssClass="textBox"></asp:TextBox>
                                    &nbsp;&nbsp;                                    
                                    <asp:TextBox ID="tbOtherRt" Width="220px" ReadOnly="true" runat="server" MaxLength="0"
                                    CssClass="textBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="evenRow">
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
                        <tr class="oddRow">
                            <td>
                                Priority
                            </td>
                            <td colspan="1">
                                <asp:DropDownList ID="ddlPriority" runat="server">
                                    <asp:ListItem Selected="true" Value="0030">Normal</asp:ListItem>
                                    <asp:ListItem Value="0011">High</asp:ListItem>
                                    <asp:ListItem Value="0098">Low</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:Label ID="label3" runat="server" Font-Size="12px" ForeColor="#0B647D"></asp:Label>
                            </td>
                        </tr>
                        <tr class="evenRow">
                            <td>
                                Purpose (<span id="spanPurp"></span>)
                            </td>
                            <td>
                                <asp:TextBox ID="tbPurpose" Width="380px" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td colspan="2">
                                <asp:Button ID="btCreateItem" runat="server" Text="Save" CssClass="buttonStyle" OnClick="btCreateItem_Click"
                                    OnClientClick="return confirm('Are you sure to save this transaction?')" />
                                
                                 &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDeleteItem" runat="server" Text="Delete" CssClass="btn_red" OnClick="btDeleteItem_Click"
                        OnClientClick="return confirm('Are you sure to Delete this transaction?')" />
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
