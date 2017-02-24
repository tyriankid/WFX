namespace Hidistro.UI.SaleSystem.CodeBehind
{
    using Hidistro.Core;
    using Hidistro.Entities.Members;
    using Hidistro.SaleSystem.Vshop;
    using Hidistro.UI.Common.Controls;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    [ParseChildren(true)]
    public class VRequestCommissions : VWeiXinOAuthTemplatedWebControl
    {
        private HtmlInputHidden hidmoney;
        private Literal litmaxmoney;
        private HtmlAnchor requestcommission;
        private HtmlAnchor requestcommission1;
        private HtmlInputText txtaccount;
        private HtmlInputText txtmoney;
        private HtmlInputText txtmoneyweixin;

        protected override void AttachChildControls()
        {
            PageTitle.AddSiteNameTitle("申请提现");
            this.litmaxmoney = (Literal) this.FindControl("litmaxmoney");
            this.txtaccount = (HtmlInputText) this.FindControl("txtaccount");
            this.txtmoney = (HtmlInputText) this.FindControl("txtmoney");
            this.txtmoneyweixin = (HtmlInputText) this.FindControl("txtmoneyweixin");
            this.hidmoney = (HtmlInputHidden) this.FindControl("hidmoney");
            this.requestcommission = (HtmlAnchor) this.FindControl("requestcommission");
            this.requestcommission1 = (HtmlAnchor) this.FindControl("requestcommission1");
            DistributorsInfo userIdDistributors = DistributorsBrower.GetUserIdDistributors(Globals.GetCurrentMemberUserId());
            this.txtaccount.Value = userIdDistributors.RequestAccount;
            this.litmaxmoney.Text = userIdDistributors.ReferralBlance.ToString("F2");
            decimal result = 0M;
            if (decimal.TryParse(SettingsManager.GetMasterSettings(false).MentionNowMoney, out result) && (result > 0M))
            {
                this.litmaxmoney.Text = ((userIdDistributors.ReferralBlance / result) * result).ToString("F2");
                this.txtmoney.Attributes["placeholder"] = "请输入大于等于" + result + "元的金额,并且是整数";
                this.txtmoneyweixin.Attributes["placeholder"] = "请输入大于等于" + result + "元的金额,并且是整数";
                this.hidmoney.Value = result.ToString();
            }
            if (DistributorsBrower.IsExitsCommionsRequest())
            {
                this.requestcommission.Disabled = true;
                this.requestcommission.InnerText = "您的申请正在审核当中";
                this.requestcommission1.Disabled = true;
                this.requestcommission1.InnerText = "您的申请正在审核当中";
            }
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.SkinName == null)
            {
                this.SkinName = "Skin-RequestCommissions.html";
            }
            base.OnInit(e);
        }
    }
}

