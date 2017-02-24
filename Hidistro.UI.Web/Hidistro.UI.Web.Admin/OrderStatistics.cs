using ASPNET.WebControls;
using Hidistro.ControlPanel.Sales;
using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Core.Enums;
using Hidistro.Entities.Orders;
using Hidistro.Entities.Store;
using Hidistro.UI.ControlPanel.Utility;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Globalization;
using System.Text;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin
{
	[PrivilegeCheck(Privilege.OrderStatistics)]
	public class OrderStatistics : AdminPage
	{
		protected System.Web.UI.WebControls.LinkButton btnCreateReport;
		protected System.Web.UI.WebControls.Button btnSearchButton;
		protected WebCalendar calendarEndDate;
		protected WebCalendar calendarStartDate;
		private System.DateTime? dateEnd;
		private System.DateTime? dateStart;
		protected System.Web.UI.WebControls.Label lblPageCount;
		protected System.Web.UI.WebControls.Label lblSearchCount;
		private string orderId;
		protected Pager pager;
		protected System.Web.UI.WebControls.Repeater rp_orderStatistics;
		private string shipTo;
		protected System.Web.UI.WebControls.TextBox txtOrderId;
		protected System.Web.UI.WebControls.TextBox txtShipTo;
		protected System.Web.UI.WebControls.TextBox txtUserName;
		private string userName;
        protected System.Web.UI.HtmlControls.HtmlInputHidden specialHideShow;
        protected DropDownList ddlGuestType;
        protected DropDownList ddlSender;
        private string guestType;//用户类型
        private string sender;//门店id
		private void BindUserOrderStatistics()
		{
			OrderQuery userOrder = new OrderQuery
			{
				UserName = this.userName,
				ShipTo = this.shipTo,
				StartDate = this.dateStart,
				EndDate = this.dateEnd,
				OrderId = this.orderId,
				PageSize = this.pager.PageSize,
				PageIndex = this.pager.PageIndex,
				SortBy = "OrderDate",
				SortOrder = SortAction.Desc,
                Sender = this.sender
			};
			OrderStatisticsInfo userOrders = SalesHelper.GetUserOrders(userOrder);
            this.pager.TotalRecords = userOrders.TotalCount;
            //爽爽挝啡需要将利润改为堂食客户和微信客户的区分
            userOrders.OrderTbl.Columns.Add("guestType");//客户种类 堂食用户或者微信用户 
            if (Hidistro.ControlPanel.Config.CustomConfigHelper.Instance.AutoShipping)
            {
                this.ddlGuestType.Visible = true;
                this.ddlGuestType.SelectedIndex=0;
                if (guestType == "堂食用户") { this.ddlGuestType.SelectedIndex = 1; }
                else if (guestType == "手机用户") { this.ddlGuestType.SelectedIndex = 2; }
                if (guestType != "全部")//对结果集进行过滤
                {
                    foreach (DataRow row in userOrders.OrderTbl.Rows)
                    {
                        if (this.guestType == "堂食用户")
                        {
                            if (row["UserName"].ToString() != "[堂食用户]") { row.Delete(); }
                        }
                        else if (this.guestType == "手机用户")
                        {
                            if (row["UserName"].ToString() == "[堂食用户]") { row.Delete(); }
                        }
                    }
                    userOrders.OrderTbl.AcceptChanges();
                    this.pager.TotalRecords = userOrders.OrderTbl.Rows.Count;
                }
                ddlSender.SelectedValue = this.sender;
            }
            else
            {
                this.ddlGuestType.Visible = false;
                this.ddlSender.Visible = false;
            }
			this.rp_orderStatistics.DataSource = userOrders.OrderTbl;
			this.rp_orderStatistics.DataBind();
			
			this.lblPageCount.Text = string.Format("当前页共计<span class=\"colorG\">{0}</span>个 <span style=\"padding-left:10px;\">订单金额共计</span><span class=\"colorG\">{1}</span>元 <span style=\"padding-left:10px;\">订单毛利润共计</span><span class=\"colorG\">{2}</span>元 ", userOrders.OrderTbl.Rows.Count, Globals.FormatMoney(userOrders.TotalOfPage), Globals.FormatMoney(userOrders.ProfitsOfPage));
			this.lblSearchCount.Text = string.Format("当前查询结果共计<span class=\"colorG\">{0}</span>个 <span style=\"padding-left:10px;\">订单金额共计</span><span class=\"colorG\">{1}</span>元 <span style=\"padding-left:10px;\">订单毛利润共计</span><span class=\"colorG\">{2}</span>元 ", userOrders.TotalCount, Globals.FormatMoney(userOrders.TotalOfSearch), Globals.FormatMoney(userOrders.ProfitsOfSearch));
		
        }
		private void btnCreateReport_Click(object sender, System.EventArgs e)
		{
			OrderQuery userOrder = new OrderQuery
			{
				UserName = this.userName,
				ShipTo = this.shipTo,
				StartDate = this.dateStart,
				EndDate = this.dateEnd,
				OrderId = this.orderId,
				PageSize = this.pager.PageSize,
				PageIndex = this.pager.PageIndex,
				SortBy = "OrderDate",
				SortOrder = SortAction.Desc
			};
			OrderStatisticsInfo userOrdersNoPage = SalesHelper.GetUserOrdersNoPage(userOrder);
			System.Text.StringBuilder builder = new System.Text.StringBuilder();
			builder.AppendLine("<table cellspacing=\"0\" cellpadding=\"5\" rules=\"all\" border=\"1\">");
			builder.AppendLine("<tr style=\"font-weight: bold; white-space: nowrap;\">");
			builder.AppendLine("<td>订单号</td>");
			builder.AppendLine("<td>下单时间</td>");
			builder.AppendLine("<td>总订单金额</td>");
			builder.AppendLine("<td>昵称</td>");
			builder.AppendLine("<td>收货人</td>");
			builder.AppendLine("<td>利润</td>");
			builder.AppendLine("</tr>");
			foreach (System.Data.DataRow row in userOrdersNoPage.OrderTbl.Rows)
			{
				builder.AppendLine("<tr>");
				builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["OrderId"].ToString() + "</td>");
				builder.AppendLine("<td>" + row["OrderDate"].ToString() + "</td>");
				builder.AppendLine("<td>" + row["Total"].ToString() + "</td>");
				builder.AppendLine("<td>" + row["UserName"].ToString() + "</td>");
				builder.AppendLine("<td>" + row["ShipTo"].ToString() + "</td>");
				builder.AppendLine("<td>" + row["Profits"].ToString() + "</td>");
				builder.AppendLine("</tr>");
			}
			builder.AppendLine("<tr>");
			builder.AppendLine("<td>当前查询结果共计," + userOrdersNoPage.TotalCount + "</td>");
			builder.AppendLine("<td>订单金额共计," + userOrdersNoPage.TotalOfSearch + "</td>");
			builder.AppendLine("<td>订单毛利润共计," + userOrdersNoPage.ProfitsOfSearch + "</td>");
			builder.AppendLine("<td></td>");
			builder.AppendLine("</tr>");
			builder.AppendLine("</table>");
			this.Page.Response.Clear();
			this.Page.Response.Buffer = false;
			this.Page.Response.Charset = "GB2312";
			this.Page.Response.AppendHeader("Content-Disposition", "attachment;filename=UserOrderStatistics.xls");
			this.Page.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
			this.Page.Response.ContentType = "application/ms-excel";
			this.Page.EnableViewState = false;
			this.Page.Response.Write(builder.ToString());
			this.Page.Response.End();
		}
		private void btnSearchButton_Click(object sender, System.EventArgs e)
		{
			this.ReBind(true);
		}
		private void LoadParameters()
		{
            //传递爽爽挝啡的特殊名到前端,前端用jquery进行相应的功能隐藏
            if (Hidistro.ControlPanel.Config.CustomConfigHelper.Instance.AutoShipping)
            {
                this.specialHideShow.Value = "sswk";//爽爽挝啡
            }
			if (!this.Page.IsPostBack)
			{
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["userName"]))
				{
					this.userName = base.Server.UrlDecode(this.Page.Request.QueryString["userName"]);
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["shipTo"]))
				{
					this.shipTo = base.Server.UrlDecode(this.Page.Request.QueryString["shipTo"]);
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["dateStart"]))
				{
					this.dateStart = new System.DateTime?(System.DateTime.Parse(this.Page.Request.QueryString["dateStart"]));
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["dateEnd"]))
				{
					this.dateEnd = new System.DateTime?(System.DateTime.Parse(this.Page.Request.QueryString["dateEnd"]));
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["orderId"]))
				{
					this.orderId = Globals.UrlDecode(this.Page.Request.QueryString["orderId"]);
				}
                if (!string.IsNullOrEmpty(this.Page.Request.QueryString["guestType"]))
                {
                    this.guestType = Globals.UrlDecode(this.Page.Request.QueryString["guestType"]);
                }
                if (!string.IsNullOrEmpty(this.Page.Request.QueryString["sender"]))
                {
                    this.sender = Globals.UrlDecode(this.Page.Request.QueryString["sender"]);
                }
				this.txtUserName.Text = this.userName;
				this.txtShipTo.Text = this.shipTo;
				this.calendarStartDate.SelectedDate = this.dateStart;
				this.calendarEndDate.SelectedDate = this.dateEnd;
				this.txtOrderId.Text = this.orderId;
			}
			else
			{
				this.userName = this.txtUserName.Text;
				this.shipTo = this.txtShipTo.Text;
				this.dateStart = this.calendarStartDate.SelectedDate;
				this.dateEnd = this.calendarEndDate.SelectedDate;
				this.orderId = this.txtOrderId.Text;
			}
		}
		protected override void OnInitComplete(System.EventArgs e)
		{
			base.OnInitComplete(e);
			this.btnSearchButton.Click += new System.EventHandler(this.btnSearchButton_Click);
			this.btnCreateReport.Click += new System.EventHandler(this.btnCreateReport_Click);
		}
		protected void Page_Load(object sender, System.EventArgs e)
		{
			this.LoadParameters();
			if (!this.Page.IsPostBack)
			{
                //子账号的过滤查询
                this.ddlSender.Visible = true;
                ddlSender.Items.Add(new ListItem { Text = "全部", Value = "" });
                DataTable dtmanagers = ManagerHelper.GetAllManagers();
                ManagerInfo currentManager = ManagerHelper.GetCurrentManager();
                RoleInfo roleinfo = ManagerHelper.GetRole(currentManager.RoleId);
                foreach (DataRow row in dtmanagers.Rows)
                {
                    ListItem item = new ListItem
                    {
                        Text = row["UserName"].ToString() + ":" + row["AgentName"].ToString(),
                        Value = row["UserId"].ToString()
                    };
                    if (roleinfo.RoleName != "超级管理员")
                    {
                        if (currentManager.UserId == row["UserId"].ToInt())
                        {
                            this.ddlSender.Items.Clear();
                            ddlSender.Items.Add(item);
                            this.sender = currentManager.UserId.ToString();
                        }
                    }
                }
				this.BindUserOrderStatistics();
			}
		}
		private void ReBind(bool isSearch)
		{
			NameValueCollection queryStrings = new NameValueCollection();
			queryStrings.Add("userName", this.txtUserName.Text);
			queryStrings.Add("shipTo", this.txtShipTo.Text);
			queryStrings.Add("dateStart", this.calendarStartDate.SelectedDate.ToString());
			queryStrings.Add("dateEnd", this.calendarEndDate.SelectedDate.ToString());
			queryStrings.Add("orderId", this.txtOrderId.Text);
            queryStrings.Add("guestType", this.ddlGuestType.SelectedValue.ToString());
            queryStrings.Add("sender", this.ddlSender.SelectedValue.ToString());
			if (!isSearch)
			{
				queryStrings.Add("pageIndex", this.pager.PageIndex.ToString(System.Globalization.CultureInfo.InvariantCulture));
			}
			base.ReloadPage(queryStrings);
		}
		protected void rp_orderStatistics_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
		{
			System.Web.UI.WebControls.Repeater repeater = (System.Web.UI.WebControls.Repeater)e.Item.FindControl("rp_orderitem");
			string orderId = ((System.Data.DataRowView)e.Item.DataItem)["OrderId"].ToString();
			if (orderId != "")
			{
				repeater.DataSource = OrderHelper.GetOrderInfo(orderId).LineItems.Values;
				repeater.DataBind();
			}
		}
	}
}
