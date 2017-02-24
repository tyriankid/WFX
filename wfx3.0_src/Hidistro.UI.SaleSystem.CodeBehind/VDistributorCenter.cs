namespace Hidistro.UI.SaleSystem.CodeBehind
{
    using Hidistro.Core;
    using Hidistro.Core.Entities;
    using Hidistro.Core.Enums;
    using Hidistro.Entities.Members;
    using Hidistro.Entities.Orders;
    using Hidistro.SaleSystem.Vshop;
    using Hidistro.UI.Common.Controls;
    using System;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    [ParseChildren(true)]
    public class VDistributorCenter : VWeiXinOAuthTemplatedWebControl
    {
        private Image imgGrade;
        private HiImage imglogo;
        private Literal litdistirbutors;
        private Literal litOrders;
        private Literal litQRcode;
        private Literal litStoreNum;
        private Literal litStroeName;
        private Literal litTodayOrdersNum;
        private FormatedMoneyLabel refrraltotal;
        private FormatedMoneyLabel saletotal;

        protected override void AttachChildControls()
        {
            PageTitle.AddSiteNameTitle("店铺中心");
            int currentMemberUserId = Globals.GetCurrentMemberUserId();
            DistributorsInfo userIdDistributors = DistributorsBrower.GetUserIdDistributors(currentMemberUserId);
            if (userIdDistributors != null)
            {
                this.litTodayOrdersNum = (Literal) this.FindControl("litTodayOrdersNum");
                OrderQuery query = new OrderQuery {
                    UserId = new int?(currentMemberUserId),
                    Status = OrderStatus.Today
                };
                this.litTodayOrdersNum.Text = DistributorsBrower.GetDistributorOrderCount(query).ToString();
                this.imglogo = (HiImage) this.FindControl("imglogo");
                this.imgGrade = (Image) this.FindControl("imgGrade");
                this.litStroeName = (Literal) this.FindControl("litStroeName");
                this.saletotal = (FormatedMoneyLabel) this.FindControl("saletotal");
                this.refrraltotal = (FormatedMoneyLabel) this.FindControl("refrraltotal");
                this.litStoreNum = (Literal) this.FindControl("litStoreNum");
                this.litdistirbutors = (Literal) this.FindControl("litdistirbutors");
                this.litQRcode = (Literal) this.FindControl("litQRcode");
                this.litOrders = (Literal) this.FindControl("litOrders");
                this.litdistirbutors.Text = "<li><a href=\"ChirldrenDistributors.aspx\" class=\"shop-underling\">我的下属</a></li>";
                this.litQRcode.Text = "<li><a href=\"QRcode.aspx?ReferralId=" + userIdDistributors.UserId + "\" class=\"shop-qr\">店铺推广码</a></li>";
                this.litStroeName.Text = userIdDistributors.StoreName;
                this.saletotal.Money = userIdDistributors.OrdersTotal;
                DistributorGradeInfo distributorGradeInfo = DistributorGradeBrower.GetDistributorGradeInfo(userIdDistributors.DistriGradeId);
                if ((distributorGradeInfo != null) && (distributorGradeInfo.Ico.Length > 10))
                {
                    this.imgGrade.ImageUrl = distributorGradeInfo.Ico;
                }
                else
                {
                    this.imgGrade.Visible = false;
                }
                if (!string.IsNullOrEmpty(userIdDistributors.Logo))
                {
                    this.imglogo.ImageUrl = userIdDistributors.Logo;
                }
                else
                {
                    SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
                    if (!string.IsNullOrEmpty(masterSettings.DistributorLogoPic))
                    {
                        this.imglogo.ImageUrl = masterSettings.DistributorLogoPic.Split(new char[] { '|' })[0];
                    }
                }
                this.litStoreNum.Text = DistributorsBrower.GetDistributorNum(DistributorGrade.All).ToString();
                this.refrraltotal.Money = DistributorsBrower.GetUserCommissions(userIdDistributors.UserId, DateTime.Now);
                if (userIdDistributors.ReferralStatus == 1)
                {
                    this.litOrders.Text = "style=\"display:none;\"";
                }
            }
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.SkinName == null)
            {
                this.SkinName = "Skin-DistributorCenter.html";
            }
            base.OnInit(e);
        }
    }
}

