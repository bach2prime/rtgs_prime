<%@ Page Title="RTGS | Settings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RtgsSettings.aspx.cs" Inherits="RtgsWeb.Admin.RtgsSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox floatleft">
        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
    <div style="width: 75%; line-height: 2.5em;">
        <h3>Password Policy</h3>
        <ul>
            <li>Must have at least one uppercase, one lowercase and one numeric character</li>
            <li>Must have one special character
                <asp:RadioButtonList ID="radioSpecialChar" OnSelectedIndexChanged="radioSpecialCharChanged"
                    RepeatDirection="Horizontal" AutoPostBack="true" runat="server">
                    <asp:ListItem Selected="true">Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </li>
            <li>Minimum Length &nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtPassMinLength"
                OnTextChanged="txtPassMinLengthChanged" AutoPostBack="true"></asp:TextBox>
                minimum 6</li>
            <li>Password expires in
                <asp:TextBox runat="server" ID="txtPassExpiry" OnTextChanged="txtPassExpiryChanged"
                    AutoPostBack="true"></asp:TextBox>
                days (30-90)</li>
        </ul>

        <h3>Settings</h3>
        Balance Enquiry Interval 
             <asp:TextBox runat="server" ID="txtBalanceInterval" OnTextChanged="txtBalanceIntervalChanged"
                 AutoPostBack="true"></asp:TextBox>
        seconds
                    <br />

        Stop Outward
                   <asp:RadioButtonList ID="radioStopOutward" OnSelectedIndexChanged="radioStopOutwardChanged"
                       RepeatDirection="Horizontal" AutoPostBack="true" runat="server">
                       <asp:ListItem Selected="true">Yes</asp:ListItem>
                       <asp:ListItem>No</asp:ListItem>
                   </asp:RadioButtonList>
        <br />

        <b>Please recycle ApplicationPool in IIS to apply changed values for the following parameters</b>
        <br />
        <p>
            Transaction Start Time
        <asp:TextBox runat="server" ID="txtStartTime" OnTextChanged="txtStartTimeChanged" AutoPostBack="true"></asp:TextBox>
            ( HH.mm i.e. 10.00, 10.30)        
        </p>

        <p>
            Transaction End Time
        <asp:TextBox runat="server" ID="txtEndTime" OnTextChanged="txtEndTimeChanged" AutoPostBack="true"></asp:TextBox>
            ( HH.mm i.e. 16.00, 16.30)        
        </p>


    </div>
    <%--<h3>
        Application Settings</h3>
    <asp:Button ID="btnApp" CssClass="buttonStyle" runat="server" Font-Names="Trebuchet MS"
        Font-Size="10pt" Text="Reload" OnClick="btnApp_Click" />
    &nbsp;( Needed after add/update/delete of Banks, Branches, Transaction Codes, Return
    Reasons etc. )<br />--%>
    <br />
</asp:Content>
