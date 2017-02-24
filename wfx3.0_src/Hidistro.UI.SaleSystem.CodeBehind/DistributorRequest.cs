namespace Hidistro.UI.SaleSystem.CodeBehind
{
    using Hidistro.Entities.Members;
    using Hidistro.SaleSystem.Vshop;
    using Hidistro.UI.Common.Controls;
    using System;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    [ParseChildren(true)]
    public class DistributorRequest : VWeiXinOAuthTemplatedWebControl
    {
        private Literal litBackImg;

        protected override void AttachChildControls()
        {
            PageTitle.AddSiteNameTitle("申请分销");
            this.Page.Session["stylestatus"] = "2";
            DistributorsInfo userIdDistributors = DistributorsBrower.GetUserIdDistributors(MemberProcessor.GetCurrentMember().UserId);
            if ((userIdDistributors != null) && (userIdDistributors.UserId > 0))
            {
                this.Page.Response.Redirect("DistributorCenter.aspx", true);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.SkinName == null)
            {
                this.SkinName = "Skin-VDistributorRequest.html";
            }
            base.OnInit(e);
        }
    }
}

