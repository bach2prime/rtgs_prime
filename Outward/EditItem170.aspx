<%@ Page Title="RTGS Outward: Item Add/Edit" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EditItem170.aspx.cs" Inherits="RtgsWeb.Outward.EditItem170" %>

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

            $('#tbRcvAccountNum').limit('17', '#recvAc');
            $('#tbSenderAcc').limit('14', '#sendAc');
            $('#tbSenderName').limit('70', '#sendName');
            $('#tbRcvName').limit('70', '#recvName');
            $('#txtPurpose').limit('200', '#spanPurpose');
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
    <fieldset class="formBoxGV">
        <legend>
            <asp:Label ID="Label1" runat="server" Text="Sender Info"></asp:Label>
        </legend>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width: 800px" valign="top">
                    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                    </asp:Panel>
                    <table style="width: 100%" cellpadding="8" cellspacing="0" class="dataEntryTable">
                        <tr class="evenRow">
                            <td style="width: 160px">
                                Transaction Type
                            </td>
                            <td>
                                Single Customer Payment Transfer (RTGS_SSCT)
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
                                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                            </td>
                        </tr>
                        <tr class="evenRow">
                            <td>
                                Sender Account (<span id="sendAc"></span>)
                            </td>
                            <td>
                                <asp:TextBox ID="tbSenderAcc" Width="220px" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button Text="Get Info" CssClass="btn_green" OnClick="OnClickGetInfo" runat="server" />
                            </td>
                        </tr>
                        
                        <asp:Panel runat="server" ID="panelSenderName">
                            <tr class="oddRow">
                                <td>
                                    Sender Name (<span id="sendName"></span>)
                                </td>
                                <td>
                                    <asp:TextBox ID="tbSenderName" Width="380px" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>
                                    Mobile No 
                                    <asp:Label runat="server" ID="lbMobileNo"></asp:Label>
                                    <%--<asp:TextBox ID="tbMobileNo" Width="130px" Enabled="False" runat="server" CssClass="textBox" MaxLength="13"></asp:TextBox>--%>
                                </td>
                            </tr>
                        </asp:Panel>

                        <tr class="evenRow">
                            <td>Sender Email</td>
                            <td>
                                <asp:TextBox ID="tbSenderEmail" runat="server" Width="220px" CssClass="textBox" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td>
                                Amount
                            </td>
                            <td colspan="1">
                                <asp:TextBox ID="tbAmount" Width="220px" runat="server" onblur="javascript:return OnFocusOutForm()"
                                    CssClass="textBox" MaxLength="13"></asp:TextBox>
                                <asp:DropDownList ID="ddlCurrency" runat="server">
                                </asp:DropDownList>
                                &nbsp;&nbsp;
                                <asp:Label Text="" ID="labelBalance" runat="server" />
                                <br />
                                <asp:Label ID="labelAmountWord" runat="server" Font-Size="12px" ForeColor="#0B647D"></asp:Label>
                            </td>
                        </tr>
                        <tr class="evenRow">
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
                        <tr class="oddRow">
                            <td>
                                Purpose (<span id="spanPurpose"></span>)
                            </td>
                            <td>
                                <asp:TextBox ID="txtPurpose" Width="380px" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top" style="padding: 0px 20px">
                    <img id="imgSign" runat="server" visible="false" src="../media/images/sign.png" width="250"
                        style="border: 1px solid #888888;" />
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="formBoxGV">
        <legend>
            <asp:Label ID="Label2" runat="server" Text="Receiver Info"></asp:Label>
        </legend>
        <table width="800px" class="dataEntryTable" cellpadding="8" cellspacing="0">
            <tr class="oddRow">
                <td style="width: 160px">
                    Receiver Bank
                </td>
                <td>
                    <%--<asp:TextBox ID="tbReceiveBankBranch" Width="380px" ToolTip="" runat="server" CssClass="textBox"></asp:TextBox>                    
                    &nbsp;<input type="button" onclick="showPopUp();" value="..." />--%>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:DropDownList CssClass="dropDown" AutoPostBack="true" Width="250px" ID="DropDownListBank"
                        runat="server" OnSelectedIndexChanged="DropDownListBank_SelectedIndexChanged" />
                    &nbsp; Branch:&nbsp;
                    <asp:DropDownList Width="220px" CssClass="dropDown" DataTextField="BranchName" DataValueField="RoutingNo"
                        ID="DropDownListBranch" runat="server" />
                    
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownListBank" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr class="evenRow">
                <td colspan="1">
                    Receiver A/C ( <span id="recvAc"></span>)
                </td>
                <td>
                    <asp:TextBox ID="tbRcvAccountNum" Width="220px" runat="server" MaxLength="0" CssClass="textBox"></asp:TextBox>
                </td>
            </tr>
            <asp:Panel runat="server" ID="panelRecvName">
                <tr class="oddRow">
                    <td>
                        Receiver Name ( <span id="recvName"></span>)
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="tbRcvName" Width="380px" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>
                    </td>
                </tr>
            </asp:Panel>
            <tr class="evenRow">
                <td>Receiver Email</td>
                <td>
                    <asp:TextBox ID="tbReceiverEmail" runat="server" Width="220px" CssClass="textBox" MaxLength="100"></asp:TextBox>
                </td>
            </tr>
            <tr class="oddRow">
                <td colspan="2">
                    <asp:Button ID="btCreateItem" runat="server" Text="Save" CssClass="btn_blue" OnClick="btCreateItem_Click"
                        OnClientClick="return confirm('Are you sure to save this transaction?')" />
                    <%--OnClientClick="loading()"--%>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDeleteItem" runat="server" Text="Delete" CssClass="btn_blue" OnClick="btDeleteItem_Click"
                        OnClientClick="return confirm('Are you sure to Delete this transaction?')" />
                    
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
