<%@ Page Title="RTGS" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="RtgsWeb.About" Culture="bn-BD" UICulture="bn-BD" %>

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

            $('#gridviewItems tr').eq(1).addClass("AlterRowStyleWhite");
            $('#gridviewItems tr').eq(2).addClass("AlterRowStyleWhite");
            $('#gridviewItems tr').eq(3).addClass("AlterRowStyleWhite");
            $('#gridviewItems tr').eq(4).addClass("RowStyleWhite");
            $('#gridviewItems tr').eq(5).addClass("RowStyleWhite");
            $('#gridviewItems tr').eq(8).addClass("AlterRowStyleWhite");
            $('#gridviewItems tr').eq(7).addClass("AlterRowStyleWhite");
            $('#gridviewItems tr').eq(6).addClass("RowStyleWhite"); //ILF

            //$('#gridviewItems tr').eq(2).css("border-bottom", "1px solid #CCCCCC");
            $('#gridviewItems tr').eq(3).css("border-bottom", "1px solid #CCCCCC");
            $('#gridviewItems tr').eq(5).css("border-bottom", "1px solid #CCCCCC");
            $('#gridviewItems tr').eq(8).css("border-bottom", "1px solid #CCCCCC");

            $('#gridviewItems tr').eq(6).find('td').each(function () { $(this).html(""); });
            $('#gridviewItems tr').eq(6).find('td').eq(0).html("ILF");

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

        #gridviewItems a, #gvIlf a, #tableLinks a {
            text-decoration: none;
        }

        .linkButton {
            padding: 8px 10px 8px 0px;
            font-size: 100%;
            text-decoration: none;
            line-height: 1.5em;
            min-width: 105px;
            display: inline-block;
        }
    </style>
    <div style="padding: 0 20px 20px">
        <table width="900px">
            <tr>
                <td style="width: 350px">
                    <h2>
                        <asp:Label ID="lblHeader" runat="server" Text="RTGS Solution: Central Dashboard"></asp:Label>
                    </h2>
                </td>
                <td style="width: 180px">
                    <div id="timebox" style="visibility: hidden; color: #036EC5; float: none">
                        Next update in <span id="time">02:00</span> minutes
                    </div>
                </td>
                <td>
                    <a href="/About.aspx">
                        <img src="/media/images/reload.png" /></a>
                </td>
                <td align="right" valign="bottom">
                    <a href="Message/ViewMessage.aspx" style="text-decoration: none;">
                        <img style="visibility: hidden" src="media/images/mail.png" width="24px" border="none" />&nbsp;
                        <%--Messages Today--%>
                        <asp:Label ID="lbMessage" Visible="false" runat="server" ForeColor="#04549D" Font-Size="18px"
                            Style="font-weight: 700"></asp:Label>
                    </a>
                </td>
            </tr>
        </table>
        <table style="margin-bottom: 20px;">
            <tr>
                <td style="padding-right: 20px; width: 660px" valign="top">
                    <asp:GridView Style="margin-left: 0px; width: 100%; font-size: 90%" ID="gvBalance"
                        runat="server" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333"
                        GridLines="None" BorderColor="#fff" ViewStateMode="Enabled" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdCurrency" runat="server" Value='<%# Eval("Currency") %>' />
                                    <asp:LinkButton ID="LinkButtonCamt060" runat="server" ForeColor="Blue"
                                        OnClick="SendCamt060"><%# Eval("Currency") %> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField HeaderText="Opening" DataField="OpBl" DataFormatString="{0:N}"></asp:BoundField>
                            <asp:BoundField HeaderText="Current" DataField="CurrBl"></asp:BoundField>
                            <asp:BoundField HeaderText="Cr Items" DataField="CrCount" />
                            <asp:BoundField HeaderText="Cr Amount" DataField="CrAmount" DataFormatString="{0:N}"></asp:BoundField>
                            <asp:BoundField HeaderText="Dr Items" DataField="DrCount" />
                            <asp:BoundField HeaderText="Dr Amount" DataField="DrAmount" DataFormatString="{0:N}"></asp:BoundField>
                        </Columns>
                        <HeaderStyle CssClass="HeaderStyleWhiteLeft" HorizontalAlign="Left" />
                        <%--<RowStyle CssClass="RowStyleWhite" />--%>
                        <%--<AlternatingRowStyle CssClass="AlterRowStyleWhite" />--%>
                    </asp:GridView>
                    <%--<table style="margin-left: 0px; width: 100%; border: 1px solid #eee;" cellpadding="7px"
                        cellspacing="0">
                        <tr style="font-weight: normal; background-color: #f9f9f9; font-size: 110%; color: rgba(5, 93, 134, 1)">
                            <td>
                            </td>
                            <td>
                                BDT
                            </td>
                            <td>
                                USD
                            </td>
                            <td>
                                EUR
                            </td>
                        </tr>
                        <tr style="font-weight: normal; background-color: #ffffff; font-size: 110%; color: rgba(5, 93, 134, 1)">
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Opening"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelBdtOp" runat="server" Text="0"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelUsdOp" runat="server" Text="0"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelEurOp" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        <tr style="font-weight: normal; background-color: #ffffff; font-size: 110%; color: rgba(5, 93, 134, 1)">
                            <td>
                                <asp:Label ID="Label22" runat="server" Text="Current"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelBdtCurr" runat="server" Text="0"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelUsdCurr" runat="server" Text="0"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelEurCurr" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                    </table>--%>
                    <table style="margin-left: 0px; width: 100%; background-color: #f0f0f0; margin-top: 10px;"
                        cellpadding="4px">
                        <tr>
                            <td style="font-weight: normal; font-size: 120%; color: rgba(5, 93, 134, 1)">
                                <asp:Label runat="server" Text="" ID="LabelNetDate"></asp:Label>
                            </td>
                            <td align="right">
                                <span style="font-size: 1.7em; color: #076199">
                                    <asp:Label Visible="false" runat="server" Text="0" ID="LabelNetAmount"></asp:Label></span>
                                &nbsp;&nbsp;
                                <%--OnSelectedIndexChanged="ddlCurrency_OnSelectedIndexChanged"--%>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView Style="margin-left: 0px; width: 100%; font-size: 90%" ID="gridviewItems"
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
                                <ItemStyle Width="11%"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Count" DataField="CrCountUsd">
                                <ItemStyle></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="USD" DataField="CrAmountUsd" DataFormatString="{0:N}">
                                <ItemStyle Width="11%"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Count" DataField="CrCountEur">
                                <ItemStyle></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="EUR" DataField="CrAmountEur" DataFormatString="{0:N}">
                                <ItemStyle Width="11%"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Count" DataField="CrCountJpy">
                                <ItemStyle></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="JPY" DataField="CrAmountJpy" DataFormatString="{0:N}">
                                <ItemStyle Width="11%"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Count" DataField="CrCountGbp">
                                <ItemStyle></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="GBP" DataField="CrAmountGbp" DataFormatString="{0:N}">
                                <ItemStyle Width="10%"></ItemStyle>
                            </asp:BoundField>
                            <%--<asp:BoundField HeaderText="Debit Items" DataField="DrCount"></asp:BoundField>
                            <asp:BoundField HeaderText="Debit Amount" DataField="DrAmount" DataFormatString="{0:N}">
                            </asp:BoundField>--%>
                        </Columns>
                        <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                        <%--<RowStyle CssClass="RowStyleWhite" />--%>
                        <%--<AlternatingRowStyle CssClass="AlterRowStyleWhite" />--%>
                    </asp:GridView>
                    <table style="margin-left: 0px; width: 100%;" cellpadding="5px">
                        <tr style="font-weight: normal; background-color: #f9f9f9; font-size: 95%; color: #055d86;">
                            <td>
                                <asp:Label runat="server" Text="" ID="LabelNetIlfDate"></asp:Label>
                            </td>
                            <td style="width: 15%" align="right">
                                <asp:Label runat="server" Text="0" ID="LabelNetIlf"></asp:Label>
                            </td>
                            <td style="width: 15%" align="right">
                                <asp:Label runat="server" Text="0" ID="LabelNetIlfU"></asp:Label>
                            </td>
                            <td style="width: 15%" align="right">
                                <asp:Label runat="server" Text="0" ID="LabelNetIlfE"></asp:Label>
                            </td>
                            <td style="width: 15%" align="right">
                                <asp:Label runat="server" Text="0" ID="LabelNetIlfJ"></asp:Label>
                            </td>
                            <td style="width: 15%" align="right">
                                <asp:Label runat="server" Text="0" ID="LabelNetIlfG"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top" style="width: 340px">
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
                                <span style="width: 100px; display: inline-block">Out Reverse</span>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="" runat="server" ID="linkORNotComp">Not Completed (0)</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">
                                <span style="width: 100px; display: inline-block">ILF Return</span>
                                <%--<asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkIlfAtBranch">Not Sent (0)</asp:HyperLink>--%>
                                <asp:HyperLink CssClass="linkButton" NavigateUrl="#" runat="server" ID="linkIlfNotComp">Not Completed (0)</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="7" cellspacing="0" style="color: #333; width: 100%; font-size: 100%">
                        <tr>
                            <td colspan="1" style="margin-left: 0px; font-size: 110%; background-color: #f0f0f0">Last Receive Time
                            </td>
                            <td colspan="1" style="margin-left: 0px; font-size: 90%; background-color: #f0f0f0"></td>
                        </tr>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">Inward:
                            </td>
                            <td class="AlterRowStyleWhite">
                                <asp:Label Text="" ID="lbInRecvTime" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="RowStyleWhite" style="text-align: left">Inward Reverse:
                            </td>
                            <td class="RowStyleWhite">
                                <asp:Label Text="" ID="lbInRetRecvTime" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">Direct Debit:
                            </td>
                            <td class="AlterRowStyleWhite">
                                <asp:Label Text="" ID="lbInDirDr" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="RowStyleWhite" style="text-align: left">Text Message:
                            </td>
                            <td class="RowStyleWhite">
                                <asp:Label Text="" ID="lbTxtMessage" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">STP Retry:&nbsp;
                                <asp:Label Text="" ID="lblStpCount" runat="server" />
                            </td>
                            <td class="AlterRowStyleWhite">
                                <asp:Label Text="" ID="lblStpTime" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <table style="margin-left: 20px; width: 200px; font-size: 100%" cellpadding="8px"
                        id="tableLinks">
                        <tr>
                            <td style="font-weight: normal; background-color: #f0f0f0; font-size: 130%; color: rgba(5, 93, 134, 1)">
                                <asp:Label ID="Label1" runat="server" Text="Quick Links"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">
                                <asp:HyperLink runat="server" ID="linkSendOutward" NavigateUrl="">
                            Send Outward & ILF
                                </asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="RowStyleWhite" style="text-align: left">
                                <asp:HyperLink runat="server" ID="linkSendReturn" NavigateUrl="/Inward/SendReturn.aspx">
                            Send Outward Reverse
                                </asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">
                                <asp:HyperLink runat="server" ID="linkOutStatus" NavigateUrl="">
                            Outward Summary </asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="RowStyleWhite" style="text-align: left">
                                <asp:HyperLink runat="server" ID="linkInStatus" NavigateUrl="">
                            Inward Summary </asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="AlterRowStyleWhite" style="text-align: left">
                                <a href="/Report/Report.aspx">Report</a>
                            </td>
                        </tr>
                        <tr>
                            <td class="RowStyleWhite" style="text-align: left">
                                <a href="/Message/MessageBank.aspx">Bank Message</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <asp:Panel runat="server" ID="panelBach">
                    <td valign="top">
                        <table style="margin-left: 20px; width: 200px; font-size: 100%" cellpadding="8px">
                            <tr>
                                <td style="font-weight: normal; background-color: #f0f0f0; font-size: 130%; color: rgba(5, 93, 134, 1)">
                                    <asp:Label ID="Label2" runat="server" Text="EFT"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="RowStyleWhite" style="text-align: left">
                                    <asp:Label runat="server" ID="lbEftNet"></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </td>
                </asp:Panel>
            </tr>
        </table>
    </div>
    <script>
        var a = document.getElementById("lblHeader");
        a.innerHTML = a.innerHTML.replace("Mr.", "");
    </script>
</asp:Content>
