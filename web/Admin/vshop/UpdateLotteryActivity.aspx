﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateLotteryActivity.aspx.cs" Inherits="Hidistro.UI.Web.Admin.vshop.UpdateLotteryActivity" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>

<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<%@ Import Namespace="Hidistro.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server" ClientIDMode="Static">
<div class="areacolumn clearfix">
        <div class="columnright">
            <div class="title">
                <em>
                    <img src="../images/01.gif" width="32" height="32" /></em>
                <h1>
                    <asp:Literal ID="LitTitle" runat="server">大转盘编辑</asp:Literal></h1>
                <span><asp:Literal ID="Litdesc" runat="server">大转盘编辑</asp:Literal></span>
            </div>
            <div class="formitem validator2">
                <ul>
                    <!-- <p id="ctl00_contentHolder_dropArticleCategoryTip">选择文章的所属分类</p>-->
                    <li><span class="formitemtitle Pw_100">活动名称：<em>*</em></span>
                        <asp:TextBox ID="txtActiveName" runat="server" CssClass="forminput"></asp:TextBox>
                        <p id="txtTopicNameTip">
                            限制在60个字符以内</p>
                    </li>
                    <li> <span class="formitemtitle Pw_100">开始时间：<em >*</em></span>
          <ui:webcalendar runat="server" CssClass="forminput" ID="calendarStartDate" />
                        <span style="float:left">&nbsp;至&nbsp;</span> <ui:webcalendar runat="server" CssClass="forminput" ID="calendarEndDate" />
          </li>
                         <li><span class="formitemtitle Pw_100">关键字：<em>*</em></span>
                        <asp:TextBox ID="txtKeyword" runat="server" CssClass="forminput"></asp:TextBox>
                         <p id="txtKeywordTip">
                            关键字不能为空</p>
                       </li>

                    <li><span class="formitemtitle Pw_100">可抽奖次数：<em>*</em></span><asp:TextBox ID="txtMaxNum" runat="server"
                        CssClass="forminput" Text="1"></asp:TextBox>
                        次
                         <p id="txtMaxNumTip">
                            只能为正整数</p>
                        </li>
                    <li><span class="formitemtitle Pw_100">活动简介：</span>
                        <asp:TextBox ID="txtdesc" runat="server" Rows="5" Height="100px" Width="300px" CssClass="forminput"
                            TextMode="MultiLine"></asp:TextBox>
                    </li>
                    <li><span class="formitemtitle Pw_100">一等奖描述：<em>*</em></span>
                        <asp:TextBox ID="txtPrize1" runat="server" CssClass="forminput"></asp:TextBox>
                        <span style="float:left">&nbsp;奖品数量：&nbsp;</span>
                        <asp:TextBox ID="txtPrize1Num" CssClass="forminput" runat="server"></asp:TextBox>
                          <span style="float:left">&nbsp;中奖概率：&nbsp;</span><asp:TextBox ID="txtProbability1" CssClass="forminput" runat="server" ></asp:TextBox>
                         %<p id="txtPrize1Tip">
                            一等奖描述不能为空</p>
                        </li>
                    <li><span class="formitemtitle Pw_100">二等奖描述：<em>*</em></span>
                        <asp:TextBox ID="txtPrize2" runat="server" CssClass="forminput"></asp:TextBox>
                        <span style="float:left">&nbsp;奖品数量：&nbsp;</span>
                        <asp:TextBox ID="txtPrize2Num" CssClass="forminput" runat="server"></asp:TextBox>
                          <span style="float:left">&nbsp;中奖概率：&nbsp;</span><asp:TextBox ID="txtProbability2" CssClass="forminput" runat="server" ></asp:TextBox>
                         %<p id="txtPrize2Tip">
                            二等奖描述不能为空</p>
                        </li>
                    <li><span class="formitemtitle Pw_100">三等奖描述：<em>*</em></span>
                        <asp:TextBox ID="txtPrize3" runat="server" CssClass="forminput"></asp:TextBox>
                        <span style="float:left">&nbsp;奖品数量：&nbsp;</span><asp:TextBox ID="txtPrize3Num" CssClass="forminput" runat="server"></asp:TextBox>
                         <span style="float:left">&nbsp;中奖概率：&nbsp;</span><asp:TextBox ID="txtProbability3" CssClass="forminput" runat="server"></asp:TextBox>
                        %<p id="txtPrize3Tip">
                            二等奖描述不能为空</p>
                        </li>
                        <li>
                            <asp:CheckBox ID="ChkOpen" runat="server" onclick="CheckOpen()" />
                            开启四五六等奖&nbsp;
                       
                        </li>
                    <li class="hiddenli"><span class="formitemtitle Pw_100">四等奖描述：</span>
                        <asp:TextBox ID="txtPrize4" runat="server" CssClass="forminput"></asp:TextBox>
                        <span style="float:left">&nbsp;奖品数量：&nbsp;</span><asp:TextBox ID="txtPrize4Num" CssClass="forminput" runat="server"></asp:TextBox>
                        <span style="float:left">&nbsp;中奖概率：&nbsp;</span><asp:TextBox ID="txtProbability4" CssClass="forminput" runat="server"></asp:TextBox>%
                        </li>
                    <li class="hiddenli"><span class="formitemtitle Pw_100">五等奖描述：</span>
                        <asp:TextBox ID="txtPrize5" runat="server" CssClass="forminput"></asp:TextBox>
                        <span style="float:left">&nbsp;奖品数量：&nbsp;</span><asp:TextBox ID="txtPrize5Num" CssClass="forminput" runat="server"></asp:TextBox>
                        <span style="float:left">&nbsp;中奖概率：&nbsp;</span><asp:TextBox ID="txtProbability5" CssClass="forminput" runat="server" ></asp:TextBox>%
                        </li>
                    <li class="hiddenli"><span class="formitemtitle Pw_100">六等奖描述：</span>
                    <asp:TextBox ID="txtPrize6" runat="server" CssClass="forminput"></asp:TextBox>
                        <span style="float:left">&nbsp;奖品数量：&nbsp;</span><asp:TextBox ID="txtPrize6Num" CssClass="forminput" runat="server"></asp:TextBox>
                         <span style="float:left">&nbsp;中奖概率：&nbsp;</span><asp:TextBox ID="txtProbability6" CssClass="forminput" runat="server" ></asp:TextBox>%
                         </li>
                       
                        <li> <span class="formitemtitle Pw_100">图片封面：</span>
            <asp:FileUpload ID="fileUpload" CssClass="forminput" runat="server" />
            图片尺寸建议：320px * 200px
            <div class="Pa_128 Pg_8 clear">
              <table width="300" border="0" cellspacing="0">
                <tr>
                <td width="80"> <Hi:HiImage runat="server" ID="imgPic" CssClass="Img100_60"/></td><td width="80" align="left"> 
                    <Hi:ImageLinkButton Id="btnPicDelete" runat="server" IsShow="true"  Text="删除" 
                        onclick="btnPicDelete_Click" /></td></tr>
                  <tr><td width="160" colspan="2"></td>
                </tr>
              </table>
              </div>
          </li>
                </ul>
                <ul class="btn Pa_100 clearfix">
                    <asp:Button ID="btnUpdateActivity" runat="server" OnClientClick="return PageIsValid();"
                        Text="保 存" CssClass="submit_DAqueding" onclick="btnUpdateActivity_Click" />
                </ul>
            </div>
        </div>
    </div>
    <div class="databottom">
        <div class="databottom_bg">
        </div>
    </div>
    <div class="bottomarea testArea">
        <!--顶部logo区域-->
    </div>
    <asp:HiddenField runat="server" ID="hiActivityType" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="validateHolder" runat="server">
<script type="text/javascript">
    $(document).ready(function () { CheckOpen()});
    function CheckOpen() {
        if ($("#ChkOpen:checked").length>0) {
            $(".hiddenli").show();
        }
        else {
            $(".hiddenli").hide();
        }
    }
    function InitValidators() {
        initValid(new InputValidator('txtActiveName', 1, 60, false, null, '关键字，长度限制在60个字符以内'));
        initValid(new InputValidator('txtKeyword', 1, 60, false, null, '关键字，长度限制在60个字符以内'));
        initValid(new InputValidator('txtMaxNum', 1, 10, false, '[0-9]\\d*', '可抽奖次数不能为空，且是整数'));
        appendValid(new NumberRangeValidator('txtMaxNum', 1, 999999999, '可抽奖次数需要大于0'));
        initValid(new InputValidator('txtPrize1', 1, 60, false, null, '奖品描述不能为空'));
        initValid(new InputValidator('txtPrize2', 1, 60, false, null, '奖品描述不能为空'));
        initValid(new InputValidator('txtPrize3', 1, 60, false, null, '奖品描述不能为空'));
    }
    function InitData() {
        switch ($("#<%=hiActivityType.ClientID%>").val()) {
            case "9"://微信红包
                $(".formitemtitle.Pw_100").each(function () {
                    $(this).html($(this).html().replace("描述", "金额(元)"));
                });
                $("p[id^='txtPrize']").each(function () {
                    $(this).html($(this).html().replace("描述", "金额(元)"));
                });
                /*initValid(new InputValidator('txtPrize1', 1, 3, false, '[0-9]\\d*', '奖品金额不能为空，且是整数'));
                initValid(new InputValidator('txtPrize2', 1, 3, false, '[0-9]\\d*', '奖品金额不能为空，且是整数'));
                initValid(new InputValidator('txtPrize3', 1, 3, false, '[0-9]\\d*', '奖品金额不能为空，且是整数'));*/
                break;
            default:
                break;
        }
    }
    $(document).ready(function () { InitData(); InitValidators(); });
</script>
</asp:Content>
