using ASPNET.WebControls;
using Hidistro.ControlPanel.Commodities;
using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.Core.Enums;
using Hidistro.Entities.Commodities;
using Hidistro.Entities.Store;
using Hidistro.UI.Common.Controls;
using Hidistro.UI.ControlPanel.Utility;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin
{
    public class DeliveryOrderManage : AdminPage
	{
		protected System.Web.UI.WebControls.Button btnOK;
		protected System.Web.UI.WebControls.Button btnSearch;
        protected System.Web.UI.WebControls.DropDownList DDLDeliveryMember;
        protected System.Web.UI.WebControls.DropDownList DDLDeliveryState;
		protected WebCalendar calendarEndDate;
		protected WebCalendar calendarStartDate;

		private System.DateTime? endDate;
        protected Grid grdDeliveryOrders;

        private string OrderId;
        private int StoreId;

		protected PageSize hrefPageSize;
		protected Pager pager;
		protected Pager pager1;
		private System.DateTime? startDate;
        protected System.Web.UI.WebControls.TextBox txtOrderId;

		private void BindProducts()
		{
            
            
			this.LoadParameters();
            DeliveryOrderQuery entity = new DeliveryOrderQuery
			{
                OrderId = this.OrderId,
                DeliveryUserId = this.DDLDeliveryMember.SelectedValue.ToInt(),
				StartDate = this.startDate,
				EndDate = this.endDate,
				PageSize = this.pager.PageSize,
				PageIndex = this.pager.PageIndex,
				SortOrder = SortAction.Desc,
				SortBy = "DO.AddTime",
                StoreId = StoreId,
                State = this.DDLDeliveryState.SelectedValue.ToInt(),
			};

			Globals.EntityCoding(entity, true);

            DbQueryResult orderList = StoreHelper.GetDeliveryOrderList(entity);

            this.grdDeliveryOrders.DataSource = orderList.Data;
            this.grdDeliveryOrders.DataBind();
            this.pager1.TotalRecords = (this.pager.TotalRecords = orderList.TotalRecords);
		}


		private void btnSearch_Click(object sender, System.EventArgs e)
		{
			this.ReloadProductOnSales(true);
		}

		private void LoadParameters()
		{

			if (!string.IsNullOrEmpty(this.Page.Request.QueryString["startDate"]))
			{
				this.startDate = new System.DateTime?(System.DateTime.Parse(this.Page.Request.QueryString["startDate"]));
			}
			if (!string.IsNullOrEmpty(this.Page.Request.QueryString["endDate"]))
			{
				this.endDate = new System.DateTime?(System.DateTime.Parse(this.Page.Request.QueryString["endDate"]));
			}
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["OrderId"]))
            {
                this.txtOrderId.Text = (this.Page.Request.QueryString["OrderId"]);
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["DeliveryUserId"]))
            {
                this.DDLDeliveryMember.SelectedValue = (this.Page.Request.QueryString["DeliveryUserId"]);
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["State"]))
            {
                this.DDLDeliveryState.SelectedValue = (this.Page.Request.QueryString["State"]);
            }
			
			this.calendarStartDate.SelectedDate = this.startDate;
			this.calendarEndDate.SelectedDate = this.endDate;
		}
		protected void Page_Load(object sender, System.EventArgs e)
		{
			this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            ManagerInfo currentManager = ManagerHelper.GetCurrentManager();
            this.StoreId = currentManager.ClientUserId.ToInt();
            //门店的下拉框
            DataTable dtDeliveryMember = StoreHelper.GetDeliveryMemberList("storeid = "+StoreId);
            DDLDeliveryMember.Items.Add("全部");
            foreach (DataRow row in dtDeliveryMember.Rows)
            {
                ListItem item = new ListItem();
                item.Text = row["UserName"].ToString();
                item.Value = row["deliveryUserId"].ToString();
                DDLDeliveryMember.Items.Add(item);
            }


			if (!this.Page.IsPostBack)
			{
				this.BindProducts();
			}
			CheckBoxColumn.RegisterClientCheckEvents(this.Page, this.Page.Form.ClientID);
		}
		private void ReloadProductOnSales(bool isSearch)
		{
			NameValueCollection queryStrings = new NameValueCollection();
            if (!string.IsNullOrEmpty(this.txtOrderId.Text.Trim()))
            {
                queryStrings.Add("OrderId", Globals.UrlEncode(this.txtOrderId.Text.Trim()));
            }
            if (this.DDLDeliveryMember.SelectedValue != "-1")
            {
                queryStrings.Add("DeliveryUserId", this.DDLDeliveryMember.SelectedValue);
            }
            if (this.DDLDeliveryState.SelectedValue != "-1")
            {
                queryStrings.Add("State", this.DDLDeliveryState.SelectedValue);
            }
            

			queryStrings.Add("pageSize", this.pager.PageSize.ToString());
			if (!isSearch)
			{
				queryStrings.Add("pageIndex", this.pager.PageIndex.ToString());
			}
			if (this.calendarStartDate.SelectedDate.HasValue)
			{
				queryStrings.Add("startDate", this.calendarStartDate.SelectedDate.Value.ToString());
			}
			if (this.calendarEndDate.SelectedDate.HasValue)
			{
				queryStrings.Add("endDate", this.calendarEndDate.SelectedDate.Value.ToString());
			}
			base.ReloadPage(queryStrings);
		}
	}
}
