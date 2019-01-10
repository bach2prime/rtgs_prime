<%@ Page Title="RTGS | Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="BranchHome.aspx.cs" Inherits="RtgsWeb.BranchHome" Culture="bn-BD"
    UICulture="bn-BD" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta http-equiv="refresh" content="120">
    <script>
        function startTimer(duration, display) {
            var timer = duration, minutes, seconds;
            setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    timer = duration;
                }
            }, 1000);
        }

        window.onload = function () {
            var fiveMinutes = 60 * 2,
        display = document.querySelector('#time');
            startTimer(fiveMinutes, display);
            document.getElementById("timebox").style.visibility = "visible";
        };

        $(document).ready(function () {
            $('#gridviewItems tr').eq(2).css("border-bottom", "1px solid #CCCCCC");
            $('#gridviewItems tr').eq(4).css("border-bottom", "1px solid #CCCCCC");

            $('#gridviewItems tr').eq(1).addClass("AlterRowStyleWhite");
            $('#gridviewItems tr').eq(2).addClass("AlterRowStyleWhite");

            $('#gridviewItems tr').eq(3).addClass("RowStyleWhite");
            $('#gridviewItems tr').eq(4).addClass("RowStyleWhite");


        });


    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        .LinkBox {
            float: left;
            width: 300px;
            padding: 15px;
        }

        .Link {
            padding: 10px 20px;
            background: #eee;
        }

        .linkButton {
            padding: 7px 3px;
            font-size: 100%;
            text-decoration: none;
            line-height: 1.5em;
            min-width: 135px;
            display: inline-block;
        }
    </style>
    <div style="padding: 0 20px 20px">
        <table width="1000px">
            <tr>
                <td>
                    <h2>
                        <asp:Label ID="lblHeader" runat="server" Text="RTGS Solution: Branch Dashboard"></asp:Label>
                    </h2>
                </td>
                <td style="width: 180px">
                    <div id="timebox" style="visibility: hidden; color: #036EC5; float: none">
                        Next update in <span id="time">02:00</span> minutes
                    </div>
                </td>
                <td>
                    <a href="/BranchHome.aspx">
                        <img src="/media/images/reload.png" /></a>
                </td>
                <td align="right" valign="bottom">
                    <a href="Message/ViewMessage.aspx" style="text-decoration: none;">
                        <img style="visibility: hidden" src="media/images/mail.png" width="24px" border="none" />&nbsp;
                        <asp:Label ID="lbMessage" Visible="false" runat="server" ForeColor="#04549D" Font-Size="18px"
                            Style="font-weight: 700"></asp:Label>
                    </a>
                </td>
            </tr>
        </table>
        <table style="margin-bottom: 20px; width: 1100px">
            <tr>
                <td style="width: 50%; padding-right: 20px" valign="top">
                    <table style="margin-left: 0px; width: 600px; background-color: #f0f0f0" cellpadding="10px">
                        <tr>
                            <td style="font-weight: normal; font-size: 130%; color: #333">
                                <asp:Label runat="server" Text="" ID="LabelNetDate"></asp:Label>
                            </td>
                            <td align="right">
                                <%--style="font-weight: bold; font-size: 150%; color: red">--%>
                                <%--<a href="/Report/Report.aspx" style="font-size: 2em; text-decoration: none">--%>
                                <span style="font-size: 2em; color: #076199">
                                    <asp:Label Visible="false" runat="server" Text="0" ID="LabelNetAmount"></asp:Label></span>
                                <%--</a>--%>
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                    <asp:GridView Style="margin-left: 0px; width: 600px; font-size: 90%" ID="gridviewItems"
                        runat="server" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333"
                        GridLines="None" BorderColor="#fff" ViewStateMode="Enabled" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField>
                                <ItemStyle HorizontalAlign="Left" Width="30%"></ItemStyle>
                                <ItemTemplate>
                                    <a href='<%# Eval("Link") %>'>
                                        <%# Eval("Type") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Count" DataField="CrCount">
                                <ItemStyle></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="BDT" DataField="CrAmount" DataFormatString="{0:N}">
                                <ItemStyle Width="18%"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Count" DataField="CrCountUsd">
                                <ItemStyle></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="USD" DataField="CrAmountUsd" DataFormatString="{0:N}">
                                <ItemStyle Width="18%"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Count" DataField="CrCountEur">
                                <ItemStyle></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="EUR" DataField="CrAmountEur" DataFormatString="{0:N}">
                                <ItemStyle Width="18%"></ItemStyle>
                            </asp:BoundField>
                               <asp:BoundField HeaderText="Count" DataField="CrCountGbp">
                                <ItemStyle></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="GBP" DataField="CrAmountGbp" DataFormatString="{0:N}">
                                <ItemStyle Width="18%"></ItemStyle>
                            </asp:BoundField>
                               <asp:BoundField HeaderText="Count" DataField="CrCountJpy">
                                <ItemStyle></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="JPY" DataField="CrAmountJpy" DataFormatString="{0:N}">
                                <ItemStyle Width="18%"></ItemStyle>
                            </asp:BoundField>
                            <%--<asp:BoundField HeaderText="Debit Items" DataField="DrCount"></asp:BoundField>
                            <asp:BoundField HeaderText="Debit Amount" DataField="DrAmount" DataFormatString="{0:N}">
                            </asp:BoundField>--%>
                        </Columns>
                        <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                        <%--<RowStyle CssClass="RowStyleWhite" />--%>
                        <%--<AlternatingRowStyle CssClass="AlterRowStyleWhite" />--%>
                    </asp:GridView>
                </td>
                <td valign="top" style="width: 50%; padding-right: 20px">
                    <table cellpadding="7" cellspacing="0" style="color: #333; width: 100%; font-size: 100%; margin-bottom: 10px">
                        <tr>
                            <td colspan="1" style="margin-left: 0px; font-size: 110%; background-color: #f0f0f0">Outward
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                Outward
                            </td>
                        </tr>--%>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkReadyToCheck">ReadyToCheck (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkRemake">Remake (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkReadySend">ReadyToSend (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkSent">Sent (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkSentFailed">SendingFailed (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkSentAck">ACK (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkSentNak">NAK (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkFutureDated">Inactive (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkPending">Queued (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkProcessing">In Process (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkCancelled">Cancelled (0)</asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkRejected">Rejected (0)</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="RowStyleWhite" style="text-align: left">
                                <span style="width: 100px; display: inline-block">Return</span>

                            </td>
                        </tr>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="" runat="server" ID="linkORNotComp">
                                    Not Completed (0)
                                </asp:HyperLink>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="" runat="server" ID="linkORComp">
                                    Completed (0)
                                </asp:HyperLink>

                            </td>
                        </tr>
                    </table>

                </td>

               <%-- <td valign="top" style="width: 20%; padding-right: 20px">
                    <table cellpadding="15" cellspacing="0" style="color: #444; font-size: 100%">
                        <tr>
                            <td colspan="2" style="margin-left: 0px; font-size: 110%; background-color: #f0f0f0">Update
                            </td>
                        </tr>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">Last Inward Received:
                            </td>
                            <td class="AlterRowStyleWhite">
                                <asp:Label Text="" ID="lbInRecvTime" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="RowStyleWhite" style="text-align: left">Last Inward Return Received:
                            </td>
                            <td class="RowStyleWhite">
                                <asp:Label Text="" ID="lbInRetRecvTime" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>--%>
            </tr>
        </table>
    </div>
    <script>
        var a = document.getElementById("lblHeader");
        a.innerHTML = a.innerHTML.replace("Mr.", "");
    </script>
</asp:Content>
