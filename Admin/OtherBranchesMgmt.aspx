<%@ Page Title="RTGS | Other Bank Management" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="OtherBranchesMgmt.aspx.cs" Inherits="RtgsWeb.Admin.OtherBranchesMgmt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td colspan="2">
                <asp:Panel ID="PanelErrorAllBr" runat="server" CssClass="messageBox">
                    <asp:Label ID="labelErrorAllBr" runat="server" Text="Error"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
       <%-- <tr>
            <td valign="top" colspan="2">
                <div runat="server" visible="false">
                    <fieldset class="formBoxGV">
                        <legend>
                            <asp:Label ID="Label1" runat="server" Text="Update All Branches/Accounts"></asp:Label>
                        </legend><b>Put MDB File in <span style="color: red;">EFT/Media</span> and click Parse
                            MDB</b>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="ButtonMDB" runat="server" Text="Parse MDB" CssClass="buttonStyle"
                            OnClientClick="loading()" OnClick="ButtonMDB_Click" />
                        <br />
                        <br />
                    </fieldset>
                </div>
            </td>
        </tr>--%>
        <tr>
            <td valign="top" colspan="2">
                <fieldset class="formBoxGV">
                    <legend>
                        <asp:Label ID="Label4" runat="server" Text="Update All Branches/Accounts"></asp:Label>
                    </legend>Select Excel File containing All Branches
                    <asp:FileUpload ID="FileUploadExcel" runat="server" Width="307px" />
                    <br/><br/>
                    <asp:Button ID="btParseXlsFile" runat="server" Text="Insert Branch" CssClass="buttonStyle"
                        Enabled="true" OnClientClick="loading()" OnClick="btParseXlsFile_Click" />
                    &nbsp;Format: Col B : Branch Name Col C : Routing Number; Row 1 : Header Text<br />
                    <asp:Button ID="btReadXlsFile" Visible="false" runat="server" Text="Read File" CssClass="buttonStyle"
                        Enabled="true" OnClientClick="loading()" OnClick="btReadXlsFile_Click" /> 
                        
                    <br/><br/>
                    <asp:Button ID="btParseAcc" runat="server" Text="Insert Account" CssClass="buttonStyle"
                        Enabled="true" OnClientClick="loading()" OnClick="btParseAccXlsFile_Click" />
                        Format: Col A: Acc No;  Col B: Bank Code; Col C: Currency; Row 1 : Header Text
                    <br />
                    <br/><br/>
                    <asp:Button ID="btMarkRt" runat="server" Text="Assign Routing No" CssClass="buttonStyle"
                        Enabled="true" OnClientClick="loading()" OnClick="btMarkRtXlsFile_Click" />
                        Format: Col E: Type;  Col G: Routing No; Row 1 : Header Text
                    <br />
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<br />
                <asp:DropDownList CssClass="dropDown" ID="DropDownListBank" runat="server" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonGetBranches" CssClass="btn_blue" runat="server" Text="Show Branches" OnClick="ButtonGetBranches_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonGetAcc" CssClass="btn_green" runat="server" Text="Show Accounts" OnClick="ButtonGetAcc_Click" />
                <hr />
            </td>
        </tr>
        <tr>
            <td style="width: 50%" valign="top">
                <asp:Panel runat="server" ID="panelBranches">
                    <fieldset class="formBoxGV">
                        <legend>
                            <asp:Label ID="LabelBank" runat="server" Text="Select A Bank"></asp:Label></legend>
                        <asp:Panel ID="Panel1" runat="server" Height="320px" ScrollBars="Vertical">
                            <asp:GridView ID="gridviewActive" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
                                <Columns>
                                    <asp:BoundField DataField="BranchName" HeaderText="Branch Name" />
                                    <asp:BoundField DataField="RoutingNo" HeaderText="Routing No" />
                                </Columns>
                                <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                                <SelectedRowStyle CssClass="SelectedRowStyle" />
                                <HeaderStyle CssClass="HeaderStyleDark" />
                                <RowStyle CssClass="RowStyle" />
                                <EditRowStyle CssClass="EditRowStyle" />
                                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                            </asp:GridView>
                        </asp:Panel>
                    </fieldset>
                </asp:Panel>
                <asp:Panel runat="server" ID="panelAcc">
                <fieldset class="formBoxGV">
                        <legend>
                            <asp:Label ID="LabelAcc" runat="server" Text="Accounts"></asp:Label></legend>
                        <asp:Panel ID="Panel2" runat="server" Height="320px" ScrollBars="Vertical">
                            <asp:GridView ID="gvSettAcc" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
                                <Columns>
                                    <asp:BoundField DataField="Number" HeaderText="Acc No" />
                                    <asp:BoundField DataField="Currency" HeaderText="Currency" />
                                </Columns>
                                <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                                <SelectedRowStyle CssClass="SelectedRowStyle" />
                                <HeaderStyle CssClass="HeaderStyleDark" />
                                <RowStyle CssClass="RowStyle" />
                                <EditRowStyle CssClass="EditRowStyle" />
                                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                            </asp:GridView>
                        </asp:Panel>
                    </fieldset>
                </asp:Panel>
            </td>
            <td valign="top" style="padding-left: 20px">
                <fieldset class="formBox">
                    <legend>Add New Branch</legend>Branch Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox CssClass="textBox" ID="txtName" runat="server" TabIndex="2" Width="200px"></asp:TextBox>
                    <br />
                    Routing Number&nbsp;&nbsp;
                    <asp:TextBox CssClass="textBox" ID="txtRoutingNo" runat="server" TabIndex="3" Width="100px"></asp:TextBox>
                    &nbsp; 9 Digit
                    <br />
                    Validate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBoxValidate" Checked="true" Text="" runat="server" />
                    <br />
                    <asp:Button CssClass="buttonStyle" ID="btnAddRt" runat="server" TabIndex="4" Text="Add Branch"
                        OnClick="btnAddRt_Click" />
                    <br />
                    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                    </asp:Panel>
                </fieldset>
                <fieldset class="formBox">
                    <legend>Check Digit Calculator</legend>Routing Number (8 digit)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox CssClass="textBox" ID="TextBoxCalculate" runat="server" TabIndex="5"
                        Width="100px"></asp:TextBox>
                    &nbsp;
                    <asp:Button CssClass="buttonStyle70" ID="ButtonCalculate" runat="server" TabIndex="6"
                        Text="Go" OnClick="ButtonCalculate_Click" />
                </fieldset>
                <fieldset class="formBox">
                    <legend>Add New Bank</legend>Name
                    <asp:TextBox CssClass="textBox" ID="txtNewBankName" runat="server" TabIndex="7" Width="200px"></asp:TextBox>
                    &nbsp; Short
                    <asp:TextBox CssClass="textBox" ID="txtNewBankShort" runat="server" TabIndex="8"
                        Width="100px"></asp:TextBox>
                    <br />
                    RT No
                    <asp:TextBox on CssClass="textBox" ID="txtNewBankRTNo" runat="server" TabIndex="9"
                        Width="110px"></asp:TextBox>
                    &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBoxNewBank" Checked="true" Text="Validate" runat="server" />
                    <br />
                    Swift Code
                    <asp:TextBox on CssClass="textBox" ID="txtSwiftCode" runat="server" TabIndex="9"
                        Width="110px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button CssClass="buttonStyle" ID="ButtonNewBank" runat="server" TabIndex="10"
                        Text="Add Bank" OnClick="ButtonNewBank_Click" />
                    <asp:Panel runat="server" ID="PanelNewBank" CssClass="messageBox">
                        <asp:Label Text="Error" ID="labelNewBank" runat="server"></asp:Label>
                    </asp:Panel>
                </fieldset>
            </td>
        </tr>
    </table>
    <div id="load" style="visibility: hidden">
        <div id="progressBackgroundFilter">
        </div>
        <div id="processMessage">
            <div style="margin: auto; width: 120px">
                <img alt="Busy..." width="120px" src="../media/images/103.gif" />
            </div>
        </div>
    </div>
</asp:Content>
