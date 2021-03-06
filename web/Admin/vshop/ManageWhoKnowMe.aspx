﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageWhoKnowMe.aspx.cs" Inherits="Hidistro.UI.Web.Admin.vshop.ManageWhoKnowMe" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>

<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<%@ Import Namespace="Hidistro.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
    <style>    table  tr td object {
        float:left}
        .dataarea .datalist table span {text-indent: 0px;
        }
    </style>
    <script type="text/javascript" src="/Utility/swfupload/swfobject.js"></script>
    <script type="text/javascript">
        function copySuccess() {
            alert("该活动链接地址已经复制，你可以使用Ctrl+V 粘贴！");
        }
        var myHerf = window.location.host;
        var myproto = window.location.protocol;
        function bindFlashCopyButton(value, containerID) {
            var flashvars = {
                content: encodeURIComponent(myproto + "//" + myHerf + applicationPath + value),
                uri: '/Utility/swfupload/flash_copy_btn.png'
            };
            var params = {
                wmode: "transparent",
                allowScriptAccess: "always"
            };
            swfobject.embedSWF("/Utility/swfupload/clipboard.swf", containerID, "23", "12", "9.0.0", null, flashvars, params);
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHolder" runat="server" ClientIDMode="Static">
    <div class="dataarea mainwidth databody">
    <div class="title"> <em><img src="../images/01.gif" width="32" height="32" /></em>
      <h1>微信问答活动管理
        </h1>
        
     <span>您可以在此管理好您的微信答题活动，并在自定义回复中使用它们。</span></div>
    <!-- 添加按钮-->
    <!--结束-->
    <!--数据列表区域-->
    <div class="datalist">
    	<div class="searcharea clearfix br_search singbtn">
             <span class="signicon"></span>
			 <a  id="addactivity" href="addWKM.aspx">添加活动</a>
		</div>
          <asp:Repeater ID="rpWhoKnowMe" runat="server"  onitemcommand="rpWhoKnowMe_ItemCommand" >
                    <HeaderTemplate>
                        <table border="0" cellspacing="0" width="80%" cellpadding="0">
                            <tr class="table_title">
                                <td>
                                  活动名称
                                </td>
                                <td>活动开始时间</td>
                                  <td>活动结束时间
                                </td>
                                <td style="width: 260px;">
                                    操作
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                              <%#Eval("TitleDescription")%>
                            </td>
                            <td><%#Eval("StartDate","{0:yyyy-MM-dd}")%></td>
                            <td>
                             <%#Eval("EndDate","{0:yyyy-MM-dd}")%>
                            </td>
                          <td><span class="submit_bianji" style="width: 23px; float: left; padding-top: 6px;line-height: 23px;height: 23px;padding-right:2px;"><span id="spcopy<%#Container.ItemIndex+1 %>" title="复制"></span></span>
                              <span class="submit_bianji"><a href='UpdateWKM.aspx?id=<%#Eval("id")%>' style="padding-left: 18px;">编辑</a></span>
                              <span class="submit_bianji"><a href='setWKMDetail.aspx?id=<%#Eval("id")%>' style="padding-left: 18px;">设置附加属性</a></span>
                              <span class="submit_bianji"><asp:LinkButton ID="Lkbtndel" CommandName="del" CommandArgument='<%#Eval("id")%>' runat="server">删除</asp:LinkButton></span>
                              <script> bindFlashCopyButton("<%# GetUrl(DataBinder.Eval(Container.DataItem, "ID"))%>", 'spcopy<%#Container.ItemIndex+1 %>');</script>
                               </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table></FooterTemplate>
                </asp:Repeater>        
                
    </div>
    <!--数据列表底部功能区域-->

      <div class="page">
            <div class="page">
                <div class="bottomPageNumber clearfix">
                    <div class="pageNumber">
                        <div class="pagination">
                            <UI:Pager runat="server" ShowTotalPages="true" ID="pager" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
  </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="validateHolder" runat="server">
</asp:Content>
