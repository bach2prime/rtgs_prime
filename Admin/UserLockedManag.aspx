<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserLockedManag.aspx.cs" Inherits="RtgsWeb.Admin.UserLockedManag" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-left: 50px; padding-right: 50px">
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="" ID="labelError" runat="server"></asp:Label>
        </asp:Panel>

        <table style="padding-left: 20px">
            <tr>
                <td>User Id or Code
                &nbsp;&nbsp;&nbsp;
               <asp:TextBox runat="server" ID="tbUserName" />
                    &nbsp;&nbsp;&nbsp;
                 <asp:Button ID="ButtonGetUser" CssClass="btn_green" runat="server" Text="Get Users"
                     OnClick="ButtonGetUser_Click" />

                </td>
            </tr>

        </table>
        <input type="hidden" runat="server" id="inputUserId" name="inputUserId" value="0" />
        <div id="dvUserInfo" style="display: none;" runat="server">
            <fieldset>
              <legend>User Info</legend>  
                
                <table cellpadding="5" id="tbUserInfo" style="padding-left: 20px">
                    <tr >
                        <td>
                            <asp:Label Text="Full Name :" runat="server" />
                        </td>
                        <td>
                            <asp:Label runat="server" ID="lbName"></asp:Label>
                            
                        </td>
                       
                    </tr>
                
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button Text="Unlock" runat="server" OnClick="btnUnlock_OnClick" ID="btnUnlock" />
                             <br />
                        </td>
                       
                    </tr>
                </table>
            </fieldset>

        </div>
    </div>
</asp:Content>
