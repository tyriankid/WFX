using ASPNET.WebControls;
using Hidistro.ControlPanel.Store;
using Hidistro.UI.Common.Controls;
using Hidistro.UI.ControlPanel.Utility;
using System;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin.vshop
{
	public class HomeProductSetting : AdminPage
	{
		protected ImageLinkButton btnDeleteAll;
		protected System.Web.UI.WebControls.LinkButton btnFinish;
		protected Grid grdHomeProducts;
		protected System.Web.UI.HtmlControls.HtmlInputHidden hdtopic;
		private void BindHomeProducts()
		{
			this.grdHomeProducts.DataSource = VShopHelper.GetHomeProducts();
			this.grdHomeProducts.DataBind();
		}
		private void btnDeleteAll_Click(object sender, System.EventArgs e)
		{
			if (VShopHelper.RemoveAllHomeProduct())
			{
				base.Response.Redirect(System.Web.HttpContext.Current.Request.Url.ToString(), true);
			}
		}
		protected void btnFinish_Click(object sender, System.EventArgs e)
		{
			foreach (System.Web.UI.WebControls.GridViewRow row in this.grdHomeProducts.Rows)
			{
				int result = 0;
				System.Web.UI.WebControls.TextBox box = (System.Web.UI.WebControls.TextBox)row.FindControl("txtSequence");
				if (int.TryParse(box.Text.Trim(), out result))
				{
					VShopHelper.UpdateHomeProductSequence(System.Convert.ToInt32(this.grdHomeProducts.DataKeys[row.DataItemIndex].Value), result);
				}
			}
			this.BindHomeProducts();
		}
		private void grdHomeProducts_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
		{
			if (VShopHelper.RemoveHomeProduct((int)this.grdHomeProducts.DataKeys[e.RowIndex].Value))
			{
				base.Response.Redirect(System.Web.HttpContext.Current.Request.Url.ToString(), true);
			}
		}
		protected void Page_Load(object sender, System.EventArgs e)
		{
			this.btnDeleteAll.Click += new System.EventHandler(this.btnDeleteAll_Click);
			this.grdHomeProducts.RowDeleting += new System.Web.UI.WebControls.GridViewDeleteEventHandler(this.grdHomeProducts_RowDeleting);
			if (!this.Page.IsPostBack)
			{
				this.BindHomeProducts();
			}
		}
	}
}
