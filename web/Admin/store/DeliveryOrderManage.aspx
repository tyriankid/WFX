<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DeliveryOrderManage.aspx.cs" Inherits="Hidistro.UI.Web.Admin.DeliveryOrderManage" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>

<%@ Import Namespace="Hidistro.Core" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHolder" runat="server">
	<div class="dataarea mainwidth databody">
     <div class="title">
          <em><img src="../images/03.gif" width="32" height="32" /></em>
          <h1>配送单列表</h1>
          <span>配送单列表页面，可在此查看、检索配送单的相关信息</span>
      </div>
     <div class="datalist">
		<!--搜索-->
        <div class="clearfix search_titxt2">
		    <div class="searcharea clearfix" style="padding:3px 0px 10px 0px;">
		        <ul>
                    <li><span>订单ID：</span><span><asp:TextBox ID="txtOrderId" runat="server" CssClass="forminput"  /></span></li>
                    <li><span>配送员：</span><span><asp:DropDownList ID="DDLDeliveryMember" runat="server"></asp:DropDownList></span></li>
                    <li><span>配送状态：</span><span><asp:DropDownList ID="DDLDeliveryState" runat="server">
                        <asp:ListItem Value="-1">全部</asp:ListItem>
                        <asp:ListItem Value="0">已接单</asp:ListItem>
                        <asp:ListItem Value="1">配送中</asp:ListItem>
                        <asp:ListItem Value="2">已送达</asp:ListItem>
                        </asp:DropDownList></span></li>
		            <li><span>下单时间：</span></li>
		            <li>
		                <UI:WebCalendar CalendarType="StartDate" ID="calendarStartDate" runat="server" cssclass="forminput" />
		                <span class="Pg_1010">至</span>
		                <UI:WebCalendar ID="calendarEndDate" runat="server" CalendarType="EndDate" cssclass="forminput" />
		            </li>
		            <li><asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="searchbutton"/></li>
		        </ul>
		    </div>
		</div>
		<!--结束-->
         <div class="functionHandleArea clearfix">
			<!--分页功能-->
			<div class="pageHandleArea">
				<ul>
					<li class="paginalNum"><span>每页显示数量：</span><UI:PageSize runat="server" ID="hrefPageSize" /></li>
				</ul>
			</div>
			<div class="pageNumber">
				<div class="pagination">
                <UI:Pager runat="server" ShowTotalPages="false" ID="pager1" />
            </div>
			</div>
			<!--结束-->

			<div class="blank8 clearfix"></div>
		</div>		
		<!--数据列表区域-->
	 
	    <UI:Grid runat="server" ID="grdDeliveryOrders" Width="100%" AllowSorting="true" ShowOrderIcons="true" GridLines="None" DataKeyNames="DeliveryOrderId" CssClass="goods-list" 
                    SortOrder="Desc"  AutoGenerateColumns="false" HeaderStyle-CssClass="table_title">
                    
                    <Columns>                            
                        
                        <asp:TemplateField ItemStyle-Width="15%" HeaderText="配送员姓名" HeaderStyle-CssClass="td_right td_left">
                            <itemtemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                         </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="15%" HeaderText="订单号" HeaderStyle-CssClass="td_right td_left">
                            <itemtemplate>
                                <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("OrderId") %>'></asp:Label>
                         </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="联系方式"  ItemStyle-Width="200" HeaderStyle-CssClass="td_right td_left">
                            <itemtemplate>
                             <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                          </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="配送状态"  ItemStyle-Width="100" HeaderStyle-CssClass="td_right td_left">
                            <itemtemplate>
                             <asp:Label ID="lblState" runat="server" Text='<%# Eval("State").ToInt()==0?"已接单":Eval("State").ToInt()==1?"配送中":"已送达" %>' ></asp:Label>
                          </itemtemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="配送时间"  ItemStyle-Width="300" HeaderStyle-CssClass="td_right td_left">
                            <itemtemplate>
                             <asp:Label ID="lblAddTime" runat="server" Text='<%# Eval("AddTime") %>' ></asp:Label>
                          </itemtemplate>
                        </asp:TemplateField>


                    </Columns>
                </UI:Grid>
		  <div class="blank12 clearfix"></div>
      </div>
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

<%--彻底删除--%>
<div id="deleteProduct" style="display: none;">
    <div class="frame-content">
        是否删除图片：<asp:CheckBox ID="chkDeleteImage" Text="删除图片" Checked="true" runat="server" onclick="javascript:SetPenetrationStatus(this)" />
    </div>
</div>

<div style="display:none">
<asp:Button ID="btnOK" runat="server" Text="彻底删除商品" CssClass="submit_DAqueding" />
 <input type="hidden" id="hdPenetrationStatus" value="1" runat="server" />
<input runat="server" type="hidden" id="currentProductId" />
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="validateHolder" runat="server">
<script type="text/javascript">

</script>
</asp:Content>