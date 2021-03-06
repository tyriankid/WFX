using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Entities.Store;
using Hidistro.UI.Common.Controls;
using Hidistro.UI.ControlPanel.Utility;
using Hishop.Components.Validation;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin
{
	[AdministerCheck(true)]
	public class EditManager : AdminPage
	{
		protected System.Web.UI.WebControls.Button btnEditProfile;
		protected RoleDropDownList dropRole;
		protected System.Web.UI.WebControls.Literal lblLoginNameValue;
		protected FormatedTimeLabel lblRegsTimeValue;
		protected System.Web.UI.WebControls.TextBox txtprivateEmail;
        protected System.Web.UI.WebControls.TextBox txtAgentName;
        protected DropDownList DDLState;//账号激活状态
		private int userId;
		private void btnEditProfile_Click(object sender, System.EventArgs e)
		{
			if (this.Page.IsValid)
			{
				ManagerInfo manager = ManagerHelper.GetManager(this.userId);
				manager.Email = this.txtprivateEmail.Text;
				if (this.ValidationManageEamilr(manager))
				{
					manager.RoleId = this.dropRole.SelectedValue;
                    manager.AgentName = this.txtAgentName.Text.Trim();
                    manager.State = Convert.ToInt32(this.DDLState.SelectedValue);
					if (ManagerHelper.Update(manager))
					{
						this.ShowMsg("成功修改了当前管理员的个人资料", true);
					}
					else
					{
						this.ShowMsg("当前管理员的个人信息修改失败", false);
					}
				}
			}
		}
		private void GetAccountInfo(ManagerInfo user)
		{
			this.lblLoginNameValue.Text = user.UserName;
			this.lblRegsTimeValue.Time = user.CreateDate;
			this.dropRole.SelectedValue = user.RoleId;
			if (Globals.GetCurrentManagerUserId() == this.userId)
			{
				this.dropRole.Enabled = false;
			}
            this.txtAgentName.Text = user.AgentName;
		}
		private void GetPersonaInfo(ManagerInfo user)
		{
            if (user.State != null && user.State == 1)
            {
                this.DDLState.SelectedIndex = 0;
            }
            else if(user.State == null || user.State==0)
            {
                this.DDLState.SelectedIndex = 1;
            }
			this.txtprivateEmail.Text = user.Email;
		}
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!int.TryParse(this.Page.Request.QueryString["userId"], out this.userId))
			{
				base.GotoResourceNotFound();
			}
			else
			{
				this.btnEditProfile.Click += new System.EventHandler(this.btnEditProfile_Click);
				if (!this.Page.IsPostBack)
				{
					this.dropRole.DataBind();
					ManagerInfo manager = ManagerHelper.GetManager(this.userId);
					if (manager == null)
					{
						this.ShowMsg("匿名用户或非管理员用户不能编辑", false);
					}
					else
					{
						this.GetAccountInfo(manager);
						this.GetPersonaInfo(manager);
					}
				}
			}
		}
		private bool ValidationManageEamilr(ManagerInfo siteManager)
		{
			ValidationResults results = Validation.Validate<ManagerInfo>(siteManager, new string[]
			{
				"ValManagerEmail"
			});
			string msg = string.Empty;
			if (!results.IsValid)
			{
				foreach (ValidationResult result in (System.Collections.Generic.IEnumerable<ValidationResult>)results)
				{
					msg += Formatter.FormatErrorMessage(result.Message);
				}
				this.ShowMsg(msg, false);
			}
			return results.IsValid;
		}
	}
}
