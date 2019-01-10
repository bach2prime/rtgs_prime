﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ViewMessage.aspx.cs" Inherits="RtgsWeb.Message.ViewMessage" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta http-equiv="refresh" content="25" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent"
    runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <h3><b>
        Message From Admin</b></h3>
        <span style="font-size: 11px; color:rgb(15, 89, 141);">The page will automatically refresh in 25 sec.</span><br/><br/>
    <div  id="divAdminSearch" runat="server" style="float: left"> 
        From : 
            <asp:TextBox ID="tbStartDate" runat="server" Font-Names="Trebuchet MS" Font-Size="12px"
                BorderColor="#667C9D" BorderStyle="Solid" BorderWidth="1px" Height="18px" Width="80px"></asp:TextBox>
            <cc1:calendarextender id="clStartDate" runat="server" popupbuttonid="imStartDate"
                targetcontrolid="tbStartDate" format="dd/MM/yyyy">
                                        </cc1:calendarextender> 
            <asp:Image ID="imStartDate" runat="server" Height="15px" ImageUrl="~/media/images/cal2.png" />
            &nbsp To :  &nbsp<asp:TextBox ID="tbEndDate" runat="server" Font-Names="Trebuchet MS" Font-Size="12px"
                BorderColor="#667C9D" BorderStyle="Solid" BorderWidth="1px" Height="18px" Width="80px"></asp:TextBox>
            <cc1:calendarextender id="clEndDate" runat="server" popupbuttonid="imEndDate"
                targetcontrolid="tbEndDate" format="dd/MM/yyyy">                                        </cc1:calendarextender>
            <asp:Image ID="imEndDate" runat="server" Height="15px" ImageUrl="~/media/images/cal2.png" />
            &nbsp;             
    </div>
    <div id="dvBranchList" runat="server" style="float: left" Visible="false">Branch : &nbsp;  <asp:DropDownList runat="server" ID="ddlbranchlist" DataTextField="name" DataValueField="value">
                                        </asp:DropDownList></div>
        &nbsp; <asp:Button ID="btShow" runat="server" Text="Show" CssClass="buttonStyle70" onclick="btShow_Click"  /> 
     <br/>
     <br/>
    <asp:Label ID="lbMessageInfo" runat="server" Text="Label"></asp:Label>
     <p></p>     
    <div style="display: block; margin-top: 4px" runat="server" id="divbatch">
        <asp:GridView ID="gvbatch" runat="server" AutoGenerateColumns="False" Width="800px"
            AllowSorting="True" CellPadding="6" ForeColor="#333333" GridLines="Horizontal"
            Style="border-collapse: collapse; text-align: center" BorderWidth="1px" BorderColor="#E0E0E0"
            OnRowDataBound="gvbatch_RowDataBound">
            <RowStyle BackColor="#F7F7F7" ForeColor="#333333" />
            <Columns>
                <asp:BoundField HeaderText="Creation Date" DataField="CreationDate" DataFormatString="{0:dd-MM-yyyy hh:mm tt}">
                    <ItemStyle HorizontalAlign="Center" Width="200" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Subject" DataField="Subject" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="200" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Message" DataField="Message" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="hpSaveMessage" runat="server" NavigateUrl="#">Save</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#999999" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#b0b0b0" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>
    <div id="divnobatch" style="display: none; margin-top: 4px" runat="server">
        <div style="float: left; text-align: center; padding: 20" class="userBox">
            <asp:Label ID="bnotfound" runat="server" Text="Label" Font-Size="Large" ForeColor="#666666">No message available.</asp:Label>
        </div>
    </div>
    
</asp:Content>
