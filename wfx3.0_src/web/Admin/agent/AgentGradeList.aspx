﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeFile="AgentGradeList.aspx.cs" Inherits="Hidistro.UI.Web.Admin.agent.AgentGradeList" %>
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
            <h1>代理商等级管理</h1>
            <span></span>
        </div>
        <div class="btn">
	    <a href="EditAgentGrade.aspx" class="submit_jia">添加代理商等级</a>
    </div>
        <!--搜索-->
        <!--数据列表区域-->
        <div class="datalist">
            <div class="searcharea clearfix br_search" style="display:none">
                <ul>
                    <li><span>等级名称：</span> <span>
                        <asp:TextBox ID="txtName" CssClass="forminput" runat="server" /></span>
                    </li>
                    <li>
                        <asp:Button ID="btnSearchButton" runat="server" class="searchbutton" Text="搜索" />
                    </li>
                </ul>
            </div>
            <table>
                <thead>
                    <tr class="table_title">
                        <td>
                            等级名称
                        </td>
                        <td>
                            直接佣金
                        </td>
                         <td>
                            备注
                        </td>
                        <td>
                            操作
                        </td>
                    </tr>
                </thead>
                <asp:Repeater ID="rptList" runat="server" OnItemCommand="rptList_ItemCommand" OnItemDataBound="rptList_ItemDataBound">
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td>
                                    &nbsp;<img alt="等级图标" src="<%#Eval("Ico") %>" width="16" height="16" /> <%# Eval("AgentGradeName")%></td>
                                <td><%#FormatCommissionRise(Eval("FirstCommissionRise"))%></td>
                                <td><%#Eval("Description")%>&nbsp;</td>
                                <td width="188">
                                    <span class="submit_bianji"><a style="cursor:pointer" href="EditAgentGrade.aspx?id=<%# Eval("AgentGradeId")%>&reurl=<%=LocalUrl %>">
                                        编辑</a></span>                                        
                                        <span class="submit_bianji"><asp:LinkButton ID="lbtnDel" runat="server" CommandArgument='<%#Eval("AgentGradeId") %>' CommandName="del">删除</asp:LinkButton> </span>
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
</asp:Content>
