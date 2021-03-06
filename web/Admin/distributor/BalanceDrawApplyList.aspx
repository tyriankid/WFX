﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master"
    CodeBehind="BalanceDrawApplyList.aspx.cs" Inherits="Hidistro.UI.Web.Admin.distributor.BalanceDrawApplyList" %>

<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>

<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
    <div class="dataarea mainwidth databody">
        <div class="title">
            <em>
                <img src="../images/04.gif" width="32" height="32" /></em>
            <h1>
                提现申请列表</h1>
            <span>显示未发送的分销商提现申请记录，其中使用微信红包提现步骤为：首先点击“生成微信红包”链接生成待发送的微信红包，然后在发送记录页面逐个红包发送。</span>
        </div>
        <!--搜索-->
        <!--数据列表区域-->
        <div class="datalist">
            <div class="searcharea clearfix br_search">
                <ul>
                    <li><span>店铺名：</span> <span>
                        <asp:TextBox ID="txtStoreName" CssClass="forminput" runat="server" /></span>
                    </li>
                    <li><span>申请日期：</span> <span>
                        <UI:WebCalendar runat="server" CssClass="forminput1" ID="txtRequestStartTime" Width="100" />-</span>
                        <span>
                            <UI:WebCalendar runat="server" CssClass="forminput1" ID="txtRequestEndTime" Width="100" />
                        </span></li>
                    <li>
                        <asp:Button ID="btnSearchButton" runat="server" class="searchbutton" Text="搜索" />
                    </li>
                </ul>
            </div>
            <table>
                <thead>
                    <tr class="table_title">
                        <td>
                            分销商店铺
                        </td>
                        <td>
                            申请提现金额
                        </td>
                        <td>
                            可提现金额
                        </td>
                        <td>
                            申请日期
                        </td>
                          <td>
                            手机号码
                        </td>
                          <td>
                            收款方式
                        </td>
                        <td>
                            操作
                        </td>
                    </tr>
                </thead>
                <asp:Repeater ID="reBalanceDrawRequest" runat="server" OnItemCommand="rptList_ItemCommand" OnItemDataBound="rptList_ItemDataBound">
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%# Eval("StoreName")%>&nbsp;</td>
                                <td>￥<%# Eval("Amount", "{0:F2}")%>&nbsp;</td>
                                <td>￥<%# Eval("ReferralBlance", "{0:F2}")%>&nbsp;</td>
                                <td width="180"><%# Eval("RequestTime", "{0:yyyy-MM-dd}")%>&nbsp;</td>
                                 <td width="180"><%# Eval("CellPhone")%>&nbsp;
                                </td>
                                 <td width="120">
                                     <%#formatPayType(int.Parse(Eval("RequestType").ToString()))%>
                                </td>
                                <td width="180">
                                    <span class="submit_bianji">
                                        <a <%#Eval("RequestType").ToString()!="0"?" style='color:red;cursor:pointer;' onclick=\"Apply("+ Eval("SerialID")+","+Eval("Amount")+","+Eval("ReferralBlance")+",'"+Eval("MerchantCode")+"',"+Eval("UserId")+","+Eval("RedpackRecordNum")+")\"":" style='cursor:pointer' onclick=\"if(confirm('客户选择的是【微信红包】提现，您确定要选择线下打款操作吗？')){Apply("+ Eval("SerialID")+","+Eval("Amount")+","+Eval("ReferralBlance")+",'"+Eval("MerchantCode")+"',"+Eval("UserId")+","+Eval("RedpackRecordNum")+")}\""%>>
                                        线下打款</a>
                                    </span>
                                    <span class="submit_bianji">
                                        <asp:LinkButton ID="lkBtnSendRedPack" runat="server" CommandName="sendredpack" CommandArgument='<%#Eval("SerialID") %>'>
                                            生成微信红包
                                        </asp:LinkButton>
                                    </span>
                                    <!-- 20151013 对所有商户增加一个佣金审核不通过的功能   by hj-->
                                    <span>
                                        <asp:LinkButton style="color:blue;cursor:pointer;"  id="btnRefuse" runat="server" CommandName="refuse" CommandArgument='<%#Eval("SerialID") %>'>
                                            拒绝申请
                                        </asp:LinkButton>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <div class="blank12 clearfix">
            </div>
        </div>
        <!--数据列表底部功能区域-->
        <div class="bottomPageNumber clearfix">
            <div class="pageNumber">
                <div class="pagination" style="width: auto">
                    <UI:Pager runat="server" ShowTotalPages="true" ID="pager" />
                </div>
            </div>
        </div>
    </div>
     <input type="hidden" id="hdapplyid" runat="server" />
     <input type="hidden" id="hduserid" runat="server" />
     <input type="hidden" id="hdreferralblance" runat="server" />
     <input type="hidden" id="hdredpackrecordnum" runat="server" />
    <div style="display: none;">
       <asp:Button ID="btapply" runat="server" Text="Button"  />
    </div>
    <div id="div_apply" style="display: none;">
        <div class="frame-content">
            <table>
                <tr>
                    <td>
                        收款帐号：
                    </td>
                    <td>
                        <span id="AccountNumber"></span>
                        <br />
                        <span id="AccountTime" style="color: Red"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        结算备注：
                    </td>
                    <td>
                        <textarea id="txtcontent" runat="server" style="width: 300px; height: 140px;" class="forminput"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                     
                        
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        function Apply(id, amount, referralblance, merchantcode, userid, redpackrecordnum) {
            if (parseFloat(amount) > parseFloat(referralblance)) {
                alert("申请金额大于可提现金额！");
                return false;
            }
            $("#ctl00_contentHolder_txtcontent").val("");
            $.ajax({
                url: "../VsiteHandler.ashx",
                type: 'post', dataType: 'json', timeout: 10000,
                data: { actionName: "AccountTime", UserID: userid, merchantcode: merchantcode },
                success: function (resultData) {
                    if (resultData.Time != "")
                        $("#AccountTime").text("此账号于" + resultData.Time + "被修改过！");
                    else
                        $("#AccountTime").text("");
                }
            });
            setArryText("ctl00_contentHolder_txtcontent", $("#ctl00_contentHolder_txtcontent").val().replace(/\s/g, ""));
            $("#AccountNumber").text(merchantcode);
            $("#ctl00_contentHolder_hdapplyid").val(id);
            $("#ctl00_contentHolder_hduserid").val(userid);
            $("#ctl00_contentHolder_hdreferralblance").val(amount);
            $("#ctl00_contentHolder_hdredpackrecordnum").val(redpackrecordnum);
            DialogShow("线下打款确认", 'sendapply', 'div_apply', 'ctl00_contentHolder_btapply');

        }
        //验证
        function validatorForm() {
        
            return true;
        }
        $(function () {

        });



        
    </script>
</asp:Content>
