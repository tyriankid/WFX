using ASPNET.WebControls;
using Hidistro.ControlPanel.Commodities;
using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.Entities.Commodities;
using Hidistro.Entities.Store;
using Hidistro.UI.ControlPanel.Utility;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Globalization;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin
{
	[PrivilegeCheck(Privilege.ProductTypes)]
	public class ProductTypes : AdminPage
	{
		protected System.Web.UI.WebControls.Button btnSearchButton;
		protected Grid grdProductTypes;
		protected Pager pager;
		private string searchkey;
		protected System.Web.UI.WebControls.TextBox txtSearchText;
		private void BindTypes()
		{
			ProductTypeQuery query = new ProductTypeQuery
			{
				TypeName = this.searchkey,
				PageIndex = this.pager.PageIndex,
				PageSize = this.pager.PageSize
			};
			DbQueryResult productTypes = ProductTypeHelper.GetProductTypes(query);
			this.grdProductTypes.DataSource = productTypes.Data;
			this.grdProductTypes.DataBind();
			this.pager.TotalRecords = productTypes.TotalRecords;
		}
		private void btnSearchButton_Click(object sender, System.EventArgs e)
		{
			this.ReBind(true);
		}
		private void grdProductTypes_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
		{
			int typeId = (int)this.grdProductTypes.DataKeys[e.RowIndex].Value;
			System.Collections.Generic.IList<AttributeInfo> attributes = ProductTypeHelper.GetAttributes(typeId, AttributeUseageMode.Choose);
			if (ProductTypeHelper.DeleteProductType(typeId))
			{
				foreach (AttributeInfo info in attributes)
				{
					foreach (AttributeValueInfo info2 in info.AttributeValues)
					{
						StoreHelper.DeleteImage(info2.ImageUrl);
					}
				}
				this.BindTypes();
				this.ShowMsg("成功删除了一个商品类型", true);
			}
			else
			{
				this.ShowMsg("删除商品类型失败, 可能有商品正在使用该类型", false);
			}
		}
		private void LoadParameters()
		{
			if (!this.Page.IsPostBack)
			{
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["searchKey"]))
				{
					this.searchkey = Globals.UrlDecode(this.Page.Request.QueryString["searchKey"]);
				}
				this.txtSearchText.Text = this.searchkey;
			}
			else
			{
				this.searchkey = this.txtSearchText.Text.Trim();
			}
		}
		protected override void OnInitComplete(System.EventArgs e)
		{
			base.OnInitComplete(e);
			this.btnSearchButton.Click += new System.EventHandler(this.btnSearchButton_Click);
			this.grdProductTypes.RowDeleting += new System.Web.UI.WebControls.GridViewDeleteEventHandler(this.grdProductTypes_RowDeleting);
		}
		protected void Page_Load(object sender, System.EventArgs e)
		{
			this.LoadParameters();
			if (!this.Page.IsPostBack)
			{
				this.BindTypes();
			}
		}
		private void ReBind(bool isSearch)
		{
			NameValueCollection queryStrings = new NameValueCollection();
			queryStrings.Add("searchKey", this.txtSearchText.Text);
			queryStrings.Add("pageSize", "10");
			if (!isSearch)
			{
				queryStrings.Add("pageIndex", this.pager.PageIndex.ToString(System.Globalization.CultureInfo.InvariantCulture));
			}
			base.ReloadPage(queryStrings);
		}
	}
}
