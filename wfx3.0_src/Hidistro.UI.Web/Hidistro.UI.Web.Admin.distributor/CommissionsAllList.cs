using ASPNET.WebControls;
using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.Core.Enums;
using Hidistro.Entities.Members;
using Hidistro.UI.ControlPanel.Utility;
using System;
using System.Collections.Specialized;
using System.Globalization;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin.distributor
{
	public class CommissionsAllList : AdminPage
	{
		protected System.Web.UI.WebControls.Button btnSearchButton;
		private string EndTime = "";
		private string OrderId = "";
		protected Pager pager;
		protected System.Web.UI.WebControls.Repeater reCommissions;
		private string StartTime = "";
		private string StoreName = "";
		protected WebCalendar txtEndTime;
		protected System.Web.UI.WebControls.TextBox txtOrderId;
		protected WebCalendar txtStartTime;
		protected System.Web.UI.WebControls.TextBox txtStoreName;
		private void BindData()
		{
			CommissionsQuery entity = new CommissionsQuery
			{
				EndTime = this.EndTime,
				StartTime = this.StartTime,
				StoreName = this.StoreName,
				OrderNum = this.OrderId,
				PageIndex = this.pager.PageIndex,
				PageSize = this.pager.PageSize,
				SortOrder = SortAction.Desc,
				SortBy = "CommId"
			};
			Globals.EntityCoding(entity, true);
			DbQueryResult commissions = VShopHelper.GetCommissions(entity);
			this.reCommissions.DataSource = commissions.Data;
			this.reCommissions.DataBind();
			this.pager.TotalRecords = commissions.TotalRecords;
		}
		private void btnSearchButton_Click(object sender, System.EventArgs e)
		{
			this.ReBind(true);
		}
		private void LoadParameters()
		{
			if (!this.Page.IsPostBack)
			{
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["StoreName"]))
				{
					this.StoreName = base.Server.UrlDecode(this.Page.Request.QueryString["StoreName"]);
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["OrderId"]))
				{
					this.OrderId = base.Server.UrlDecode(this.Page.Request.QueryString["OrderId"]);
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["StartTime"]))
				{
					this.StartTime = base.Server.UrlDecode(this.Page.Request.QueryString["StartTime"]);
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["EndTime"]))
				{
					this.EndTime = base.Server.UrlDecode(this.Page.Request.QueryString["EndTime"]);
				}
				this.txtStoreName.Text = this.StoreName;
				this.txtOrderId.Text = this.OrderId;
				this.txtStartTime.Text = this.StartTime;
				this.txtEndTime.Text = this.EndTime;
			}
			else
			{
				this.OrderId = this.txtOrderId.Text;
				this.StoreName = this.txtStoreName.Text;
				this.StartTime = this.txtStartTime.Text;
				this.EndTime = this.txtEndTime.Text;
			}
		}
		protected void Page_Load(object sender, System.EventArgs e)
		{
			this.btnSearchButton.Click += new System.EventHandler(this.btnSearchButton_Click);
			this.LoadParameters();
			if (!base.IsPostBack)
			{
				this.BindData();
			}
		}
		private void ReBind(bool isSearch)
		{
			NameValueCollection queryStrings = new NameValueCollection();
			queryStrings.Add("StoreName", this.txtStoreName.Text);
			queryStrings.Add("OrderId", this.txtOrderId.Text);
			queryStrings.Add("StartTime", this.txtStartTime.Text);
			queryStrings.Add("EndTime", this.txtEndTime.Text);
			queryStrings.Add("pageSize", this.pager.PageSize.ToString(System.Globalization.CultureInfo.InvariantCulture));
			if (!isSearch)
			{
				queryStrings.Add("pageIndex", this.pager.PageIndex.ToString(System.Globalization.CultureInfo.InvariantCulture));
			}
			base.ReloadPage(queryStrings);
		}
	}
}
