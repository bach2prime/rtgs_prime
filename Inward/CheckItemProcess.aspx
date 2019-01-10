<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckItemProcess.aspx.cs"
    Inherits="RtgsWeb.Inward.CheckItemProcess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Details</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body style="font-size: 100%; padding:10px; min-width:97%">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            
            <asp:ScriptReference Path="~/Scripts/jquery-1.4.1.min.js" />
            <asp:ScriptReference Path="../Scripts/Inward/inward.make.js" />
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UPCheckItem" runat="server">
        <ContentTemplate>
            <input type="hidden" id="cheque_id" runat="server" value="" />
            <table style="width: 100%">                
                <tr>
                    <td align="left">
                        <asp:Label ID="Label3" runat="server" Text="Transaction No" Font-Size="14px"></asp:Label>
                        :&nbsp;&nbsp;
                        <asp:Label ID="LabelTraceNumber" runat="server" Font-Bold="True" Font-Underline="False"></asp:Label>
                    </td>
                    
                </tr>
                
            </table>
            
                <h3>
                    Transaction Details</h3>
                <table style="width: 100%;" cellspacing="0" cellpadding="5">
                    <tr>
                        <td style="width: 50%;">
                            Receiver Details
                        </td>
                        <td>
                            Originator Details
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:GridView Style="text-align: left" ID="gridviewReceiver" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#151515" GridLines="None" ShowHeader="false" HorizontalAlign="Left"
                                Width="100%" ViewStateMode="Enabled">
                                <Columns>
                                    <asp:BoundField DataField="Name">
                                        <ItemStyle Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Value">
                                        <ItemStyle />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="HeaderStyleDark" HorizontalAlign="Left" />
                                <RowStyle CssClass="RowStyle" Font-Size="14px"/>
                                <AlternatingRowStyle CssClass="AlternatingRowStyle"  Font-Size="14px"/>
                            </asp:GridView>
                        </td>
                        <td valign="top" style="margin-left: 40px">
                            <asp:GridView Style="text-align: left" ID="gridviewOriginator" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#151515" GridLines="None" ShowHeader="false" HorizontalAlign="Left"
                                Width="100%" ViewStateMode="Enabled">
                                <Columns>
                                    <asp:BoundField DataField="Name">
                                        <ItemStyle Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Value">
                                        <ItemStyle />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="HeaderStyleDark" HorizontalAlign="Left" />
                                <RowStyle CssClass="RowStyle" Font-Size="14px"/>
                                <AlternatingRowStyle CssClass="AlternatingRowStyle"  Font-Size="14px"/>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <table id="tableReturnEntry" style="width: 50%;" cellspacing="0" cellpadding="5"
                    runat="server">
                    <tr>
                        <td style="width: 100%;">
                            Return Details
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gridviewReturnGenerated" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#151515" GridLines="None" HorizontalAlign="Left" ShowHeader="false"
                                Style="text-align: left" ViewStateMode="Enabled" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Name">
                                        <ItemStyle Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Value">
                                        <ItemStyle />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="HeaderStyleDark" HorizontalAlign="Left" />
                                <RowStyle CssClass="RowStyle"  Font-Size="14px" />
                                <AlternatingRowStyle CssClass="AlternatingRowStyle"  Font-Size="14px" />
                            </asp:GridView>
                        </td>
                        
                    </tr>
                </table>
                
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Return Reason"></asp:Label>
                    <asp:DropDownList ID="comboRejectReasons" runat="server" DataTextField="FullName"
                        DataValueField="Code">
                    </asp:DropDownList>
                </p>
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox" Visible="False">
                    <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
                <br/>
                <p style="clear: both; text-align: left;">
                    <%--<asp:Button ID="Previous" runat="server" Text="Previous" CssClass="buttonStyle" OnClick="ProcessEdrItem" />
            <asp:Button ID="Next" runat="server" Text="Next" CssClass="buttonStyle" OnClick="ProcessEdrItem" />--%>
                    <asp:Button ID="Return" runat="server" style="color: #e90707" CssClass="buttonStyle" Text="Return"
                        OnClick="ProcessEdrItem" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <asp:Button ID="btnAccept" runat="server" CssClass="buttonStyle" style="color: #064706" Text="Honor" OnClick="ProcessEdrItem" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <button class="buttonStyle" id="cancel" type="button" onclick="window.returnValue ='cancel'; window.close();">
                        Close</button>
                </p>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
