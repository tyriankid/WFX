using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hidistro.Core;
using Hidistro.Entities.Members;
using Hidistro.Entities.Orders;
using Hidistro.SaleSystem.Vshop;
using Hidistro.UI.Common.Controls;

namespace Hidistro.UI.SaleSystem.CodeBehind
{
    [ParseChildren(true), WeiXinOAuth(Common.Controls.WeiXinOAuthPage.VMemberCenter)]
    public class VMemberCenter : VWeiXinOAuthTemplatedWebControl
    {
        private Image image;
        private Literal litExpenditure;
        private Literal litMemberGrade;
        private Literal litUserName;
        private Literal litWaitForPayCount;
        private Literal litWaitForRecieveCount;
        private Literal litWaitForReplace;

        protected override void AttachChildControls()
        {
            PageTitle.AddSiteNameTitle("会员中心");
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember != null)
            {
                this.litUserName = (Literal)this.FindControl("litUserName");
                this.image = (Image)this.FindControl("image");
                this.litExpenditure = (Literal)this.FindControl("litExpenditure");
                this.litExpenditure.SetWhenIsNotNull(currentMember.Expenditure.ToString("F2"));
                this.litMemberGrade = (Literal)this.FindControl("litMemberGrade");
                MemberGradeInfo memberGrade = MemberProcessor.GetMemberGrade(currentMember.GradeId);
                if (memberGrade != null)
                {
                    this.litMemberGrade.SetWhenIsNotNull(memberGrade.Name);
                }
                this.litUserName.Text = string.IsNullOrEmpty(currentMember.RealName) ? currentMember.UserName : currentMember.RealName;
                if (!string.IsNullOrEmpty(currentMember.UserHead))
                {
                    this.image.ImageUrl = currentMember.UserHead;
                }
                this.Page.Session["stylestatus"] = "1";
                this.litWaitForRecieveCount = (Literal)this.FindControl("litWaitForRecieveCount");
                this.litWaitForPayCount = (Literal)this.FindControl("litWaitForPayCount");
                this.litWaitForReplace = (Literal)this.FindControl("litWaitForReplace");
                OrderQuery query = new OrderQuery
                {
                    Status = OrderStatus.WaitBuyerPay
                };
                int userOrderCount = MemberProcessor.GetUserOrderCount(Globals.GetCurrentMemberUserId(), query);
                this.litWaitForPayCount.SetWhenIsNotNull((userOrderCount > 0) ? ("<i class=\"border-circle\">" + userOrderCount.ToString() + "<i>") : "");
                query.Status = OrderStatus.SellerAlreadySent;
                userOrderCount = MemberProcessor.GetUserOrderCount(Globals.GetCurrentMemberUserId(), query);
                this.litWaitForRecieveCount.SetWhenIsNotNull((userOrderCount > 0) ? ("<i class=\"border-circle\">" + userOrderCount.ToString() + "<i>") : "");
                int userOrderReturnCount = MemberProcessor.GetUserOrderReturnCount(Globals.GetCurrentMemberUserId());
                this.litWaitForReplace.SetWhenIsNotNull((userOrderReturnCount > 0) ? ("<i class=\"border-circle\">" + userOrderReturnCount.ToString() + "<i>") : "");
            }
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.SkinName == null)
            {
                this.SkinName = "Skin-VMemberCenter.html";
            }
            base.OnInit(e);
        }
    }
}

