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
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Hidistro.SaleSystem.Vshop;


namespace Hidistro.UI.Web.Admin.distributor
{
	public class DistributorList : AdminPage
	{
		protected System.Web.UI.WebControls.Button btnSearchButton;
		private string CellPhone = "";
		protected System.Web.UI.WebControls.DropDownList DrGrade;
		protected System.Web.UI.WebControls.DropDownList DrStatus;
		private string Grade = "0";
		private string MicroSignal = "";
		protected Pager pager;
		private string RealName = "";
		protected System.Web.UI.WebControls.Repeater reDistributor;
		private string Status = "0";
		private string StoreName = "";
        private string IsAgent = "0";
		protected System.Web.UI.WebControls.TextBox txtCellPhone;
		protected System.Web.UI.WebControls.TextBox txtMicroSignal;
		protected System.Web.UI.WebControls.TextBox txtRealName;
		protected System.Web.UI.WebControls.TextBox txtStoreName;
        protected System.Web.UI.WebControls.HiddenField hiIsAgent;
        public string TypeTitle = "分销商";

		private void BindData()
		{
			DistributorsQuery entity = new DistributorsQuery
			{
				GradeId = int.Parse(this.Grade),
				StoreName = this.StoreName,
				CellPhone = this.CellPhone,
				RealName = this.RealName,
				MicroSignal = this.MicroSignal,
				ReferralStatus = int.Parse(this.Status),
                IsAgent = int.Parse(this.IsAgent),
				PageIndex = this.pager.PageIndex,
				PageSize = this.pager.PageSize,
				SortOrder = SortAction.Desc,
				SortBy = "userid"
			};
			Globals.EntityCoding(entity, true);
			DbQueryResult distributors = VShopHelper.GetDistributors(entity);
			this.reDistributor.DataSource = distributors.Data;
			this.reDistributor.DataBind();
			this.pager.TotalRecords = distributors.TotalRecords;
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
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["Grade"]))
				{
					this.Grade = base.Server.UrlDecode(this.Page.Request.QueryString["Grade"]);
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["Status"]))
				{
					this.Status = base.Server.UrlDecode(this.Page.Request.QueryString["Status"]);
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["RealName"]))
				{
					this.RealName = base.Server.UrlDecode(this.Page.Request.QueryString["RealName"]);
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["CellPhone"]))
				{
					this.CellPhone = base.Server.UrlDecode(this.Page.Request.QueryString["CellPhone"]);
				}
				if (!string.IsNullOrEmpty(this.Page.Request.QueryString["MicroSignal"]))
				{
					this.MicroSignal = base.Server.UrlDecode(this.Page.Request.QueryString["MicroSignal"]);
				}
                if (!string.IsNullOrEmpty(this.Page.Request.QueryString["isagent"]))
                {
                    this.IsAgent = base.Server.UrlDecode(this.Page.Request.QueryString["isagent"]);
                }

                this.DrGrade.DataBind();

				this.DrStatus.SelectedValue = this.Status;
				this.txtStoreName.Text = this.StoreName;
                this.DrGrade.SelectedValue = this.Grade;

				this.txtCellPhone.Text = this.CellPhone;
				this.txtMicroSignal.Text = this.MicroSignal;
				this.txtRealName.Text = this.RealName;
                this.hiIsAgent.Value = this.IsAgent;
                TypeTitle = (this.IsAgent == "1") ? "代理商" : "分销商";
			}
			else
			{
				this.Status = this.DrStatus.SelectedValue;
				this.StoreName = this.txtStoreName.Text;
				this.Grade = this.DrGrade.SelectedValue;
				this.CellPhone = this.txtCellPhone.Text;
				this.RealName = this.txtRealName.Text;
				this.MicroSignal = this.txtMicroSignal.Text;
                this.IsAgent = this.hiIsAgent.Value;
                TypeTitle = (this.IsAgent == "1") ? "代理商" : "分销商";
			}
		}


        //2015-8-20添加:填补了了冻结和解冻功能
        protected void reDistributor_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int userid =Convert.ToInt32( e.CommandArgument);
            switch (e.CommandName)
            {
                case "Frozen":
                    DistributorsBrower.FrozenCommision(userid,"1");
                    break;
                case "UnFre":
                    DistributorsBrower.FrozenCommision(userid, "0");
                    break;
                case "ReSetPwd":
                    MemberProcessor.SetPwd(userid.ToString(), "888888");
                    break;
            }

            
            if (e.CommandName == "ReSetPwd")
            {
                string uName = MemberProcessor.GetMember(userid).UserName;
                NameValueCollection queryStrings = new NameValueCollection();
                queryStrings.Add("Grade", this.DrGrade.SelectedValue);
                queryStrings.Add("StoreName", this.txtStoreName.Text);
                queryStrings.Add("CellPhone", this.txtCellPhone.Text);
                queryStrings.Add("RealName", this.txtRealName.Text);
                queryStrings.Add("MicroSignal", this.txtMicroSignal.Text);
                queryStrings.Add("Status", this.DrStatus.SelectedValue);
                queryStrings.Add("IsAgent", this.hiIsAgent.Value);
                queryStrings.Add("pageSize", this.pager.PageSize.ToString(System.Globalization.CultureInfo.InvariantCulture));
                string urlPage = base.GetPage(queryStrings);
                this.ShowMsgAndReUrl("重置成功!<br/>" + uName + "的密码目前为 888888，请通知该用户尽快修改密码！", true, urlPage);
                return;
                
            }
            this.ReBind(true);
            
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
			queryStrings.Add("Grade", this.DrGrade.SelectedValue);
			queryStrings.Add("StoreName", this.txtStoreName.Text);
			queryStrings.Add("CellPhone", this.txtCellPhone.Text);
			queryStrings.Add("RealName", this.txtRealName.Text);
			queryStrings.Add("MicroSignal", this.txtMicroSignal.Text);
			queryStrings.Add("Status", this.DrStatus.SelectedValue);
            queryStrings.Add("IsAgent", this.hiIsAgent.Value);
			queryStrings.Add("pageSize", this.pager.PageSize.ToString(System.Globalization.CultureInfo.InvariantCulture));
			if (!isSearch)
			{
				queryStrings.Add("pageIndex", this.pager.PageIndex.ToString(System.Globalization.CultureInfo.InvariantCulture));
			}
			base.ReloadPage(queryStrings);
		}
	}
}
