<%@ Page Title="RTGS Outward: One To Many" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="OneToMany.aspx.cs" Inherits="RtgsWeb.Outward.OneToMany" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="../Scripts/UserInterface.js"></script>
    <script type="text/javascript" src="../Scripts/amount.js"></script>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.limit-1.2.js" type="text/javascript"></script>
    <script type="text/javascript">

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
                    <%--<asp:DropDownList ID="ddlBranch" runat="server" DataTextField="BranchName" DataValueField="BranchID"
                        Font-Names="Trebuchet MS" Font-Size="10pt" AppendDataBoundItems="true">
                    </asp:DropDownList>--%>
                    &nbsp;&nbsp;&nbsp;&nbsp; File: &nbsp;&nbsp; <legend>
                        <asp:Label ID="Label4" runat="server" Text="Select Excel File"></asp:Label>
                    </legend>
                    <asp:FileUpload ID="FileUploadExcel" runat="server" Width="307px" />
                    <asp:Button ID="btParseXlsFile" runat="server" Text="Parse File" CssClass="buttonStyle"
                        OnClick="btParseXlsFile_Click" OnClientClick="loading()" />
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
                                Priority: <asp:DropDownList ID="ddlPriority" runat="server">
                                    <asp:ListItem Selected="true" Value="0030">Normal</asp:ListItem>
                                    <asp:ListItem Value="0011">High</asp:ListItem>
                                    <asp:ListItem Value="0098">Low</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                Currency: <asp:DropDownList ID="ddlCurrency" runat="server">                                  
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td>
                                Sender Name &nbsp;&nbsp;
                                <asp:TextBox CssClass="textBox" ID="tbSenderName" Width="100px" ToolTip="Max length 10"
                                    runat="server"></asp:TextBox>
                            </td>
                            <td>
                                Sender Account &nbsp;&nbsp;
                                <asp:TextBox ID="tbSenderAcc" Width="120px" ToolTip="Max length 16" runat="server"
                                    CssClass="textBox"></asp:TextBox>
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
                            <%--<asp:BoundField DataField="EdrOutId" HeaderText="Item ID" />
                            <asp:BoundField DataField="TraceNumber" HeaderText="Trace Number" ItemStyle-Wrap="False" />--%>
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
                            <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                            <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
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
                        OnClick="ButtonYes_Click" OnClientClick="loading()" />
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
