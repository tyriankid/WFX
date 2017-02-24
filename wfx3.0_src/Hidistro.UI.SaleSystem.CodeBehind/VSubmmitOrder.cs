namespace Hidistro.UI.SaleSystem.CodeBehind
{
    using Hidistro.Core;
    using Hidistro.Entities.Sales;
    using Hidistro.SaleSystem.Vshop;
    using Hidistro.UI.Common.Controls;
    using Hidistro.UI.SaleSystem.Tags;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    [ParseChildren(true)]
    public class VSubmmitOrder : VWeiXinOAuthTemplatedWebControl
    {
        private HtmlAnchor aLinkToShipping;
        private int buyAmount;
        private Common_CouponSelect dropCoupon;
        private Common_UserRedPagerSelect dropRedPager;
        private Common_ShippingTypeSelect dropShippingType;
        private HtmlInputControl groupbuyHiddenBox;
        private int groupBuyId;
        private HtmlInputHidden hiddenCartTotal;
        private Literal litAddAddress;
        private Literal litAddress;
        private Literal litCellPhone;
        private Literal litExemption;
        private Literal litOrderTotal;
        private Literal litProductTotalPrice;
        private Literal litShipTo;
        private string productSku;
        private HtmlInputHidden regionId;
        private VshopTemplatedRepeater rptAddress;
        private VshopTemplatedRepeater rptCartProducts;
        private HtmlInputHidden selectShipTo;

        protected override void AttachChildControls()
        {
            this.litShipTo = (Literal) this.FindControl("litShipTo");
            this.litCellPhone = (Literal) this.FindControl("litCellPhone");
            this.litAddress = (Literal) this.FindControl("litAddress");
            this.rptCartProducts = (VshopTemplatedRepeater) this.FindControl("rptCartProducts");
            this.dropShippingType = (Common_ShippingTypeSelect) this.FindControl("dropShippingType");
            this.dropCoupon = (Common_CouponSelect) this.FindControl("dropCoupon");
            this.dropRedPager = (Common_UserRedPagerSelect) this.FindControl("dropRedPager");
            this.litOrderTotal = (Literal) this.FindControl("litOrderTotal");
            this.hiddenCartTotal = (HtmlInputHidden) this.FindControl("hiddenCartTotal");
            this.aLinkToShipping = (HtmlAnchor) this.FindControl("aLinkToShipping");
            this.groupbuyHiddenBox = (HtmlInputControl) this.FindControl("groupbuyHiddenBox");
            this.rptAddress = (VshopTemplatedRepeater) this.FindControl("rptAddress");
            this.selectShipTo = (HtmlInputHidden) this.FindControl("selectShipTo");
            this.regionId = (HtmlInputHidden) this.FindControl("regionId");
            Literal literal = (Literal) this.FindControl("litProductTotalPrice");
            this.litExemption = (Literal) this.FindControl("litExemption");
            this.litAddAddress = (Literal) this.FindControl("litAddAddress");
            this.litExemption.Text = "0.00";
            IList<ShippingAddressInfo> shippingAddresses = MemberProcessor.GetShippingAddresses();
            this.rptAddress.DataSource = from item in shippingAddresses
                orderby item.IsDefault
                select item;
            this.rptAddress.DataBind();
            this.rptCartProducts.ItemDataBound += new RepeaterItemEventHandler(this.rptCartProducts_ItemDataBound);
            ShippingAddressInfo info = shippingAddresses.FirstOrDefault<ShippingAddressInfo>(item => item.IsDefault);
            if (info == null)
            {
                info = (shippingAddresses.Count > 0) ? shippingAddresses[0] : null;
            }
            if (info != null)
            {
                this.litShipTo.Text = info.ShipTo;
                this.litCellPhone.Text = info.CellPhone;
                this.litAddress.Text = info.Address;
                this.selectShipTo.SetWhenIsNotNull(info.ShippingId.ToString());
                this.regionId.SetWhenIsNotNull(info.RegionId.ToString());
            }
            this.litAddAddress.Text = " href='/Vshop/AddShippingAddress.aspx?returnUrl=" + Globals.UrlEncode(HttpContext.Current.Request.Url.ToString()) + "'";
            if ((shippingAddresses == null) || (shippingAddresses.Count == 0))
            {
                this.Page.Response.Redirect(Globals.ApplicationPath + "/Vshop/AddShippingAddress.aspx?returnUrl=" + Globals.UrlEncode(HttpContext.Current.Request.Url.ToString()));
            }
            else
            {
                this.aLinkToShipping.HRef = Globals.ApplicationPath + "/Vshop/ShippingAddresses.aspx?returnUrl=" + Globals.UrlEncode(HttpContext.Current.Request.Url.ToString());
                ShoppingCartInfo shoppingCart = null;
                if (((int.TryParse(this.Page.Request.QueryString["buyAmount"], out this.buyAmount) && !string.IsNullOrEmpty(this.Page.Request.QueryString["productSku"])) && !string.IsNullOrEmpty(this.Page.Request.QueryString["from"])) && ((this.Page.Request.QueryString["from"] == "signBuy") || (this.Page.Request.QueryString["from"] == "groupBuy")))
                {
                    this.productSku = this.Page.Request.QueryString["productSku"];
                    if (int.TryParse(this.Page.Request.QueryString["groupbuyId"], out this.groupBuyId))
                    {
                        this.groupbuyHiddenBox.SetWhenIsNotNull(this.groupBuyId.ToString());
                        shoppingCart = ShoppingCartProcessor.GetGroupBuyShoppingCart(this.groupBuyId, this.productSku, this.buyAmount);
                    }
                    else
                    {
                        shoppingCart = ShoppingCartProcessor.GetShoppingCart(this.productSku, this.buyAmount);
                    }
                }
                else
                {
                    shoppingCart = ShoppingCartProcessor.GetShoppingCart();
                }
                if (shoppingCart != null)
                {
                    this.rptCartProducts.DataSource = shoppingCart.LineItems;
                    this.rptCartProducts.DataBind();
                    this.dropShippingType.ShoppingCartItemInfo = shoppingCart.LineItems;
                    this.dropShippingType.RegionId = 0;
                    this.dropShippingType.Weight = shoppingCart.Weight;
                    this.dropCoupon.CartTotal = shoppingCart.GetTotal();
                    this.dropRedPager.CartTotal = shoppingCart.GetTotal();
                    this.hiddenCartTotal.Value = literal.Text = shoppingCart.GetTotal().ToString("F2");
                    decimal num = this.DiscountMoney(shoppingCart.LineItems);
                    this.litOrderTotal.Text = (shoppingCart.GetTotal() - num).ToString("F2");
                    this.litExemption.Text = num.ToString("0.00");
                }
                else
                {
                    this.Page.Response.Redirect("/Vshop/ShoppingCart.aspx");
                }
                PageTitle.AddSiteNameTitle("订单确认");
            }
        }

        public decimal DiscountMoney(IList<ShoppingCartItemInfo> infoList)
        {
            decimal num = 0M;
            decimal num2 = 0M;
            decimal num3 = 0M;
            DataTable type = ProductBrowser.GetType();
            for (int i = 0; i < type.Rows.Count; i++)
            {
                decimal num5 = 0M;
                foreach (ShoppingCartItemInfo info in infoList)
                {
                    if (!string.IsNullOrEmpty(info.MainCategoryPath) && ((int.Parse(type.Rows[i]["ActivitiesType"].ToString()) == int.Parse(info.MainCategoryPath.Split(new char[] { '|' })[0].ToString())) || (int.Parse(type.Rows[i]["ActivitiesType"].ToString()) == 0)))
                    {
                        num5 += info.SubTotal;
                    }
                }
                if (num5 != 0M)
                {
                    DataTable allFull = ProductBrowser.GetAllFull(int.Parse(type.Rows[i]["ActivitiesType"].ToString()));
                    if (allFull.Rows.Count > 0)
                    {
                        for (int j = 0; j < allFull.Rows.Count; j++)
                        {
                            if (num5 >= decimal.Parse(allFull.Rows[allFull.Rows.Count - 1]["MeetMoney"].ToString()))
                            {
                                num2 = decimal.Parse(allFull.Rows[allFull.Rows.Count - 1]["MeetMoney"].ToString());
                                num = decimal.Parse(allFull.Rows[allFull.Rows.Count - 1]["ReductionMoney"].ToString());
                                break;
                            }
                            if (num5 <= decimal.Parse(allFull.Rows[0]["MeetMoney"].ToString()))
                            {
                                num2 = decimal.Parse(allFull.Rows[0]["MeetMoney"].ToString());
                                num += decimal.Parse(allFull.Rows[0]["ReductionMoney"].ToString());
                                break;
                            }
                            if (num5 >= decimal.Parse(allFull.Rows[j]["MeetMoney"].ToString()))
                            {
                                num2 = decimal.Parse(allFull.Rows[j]["MeetMoney"].ToString());
                                num = decimal.Parse(allFull.Rows[j]["ReductionMoney"].ToString());
                            }
                        }
                        if (num5 >= num2)
                        {
                            num3 += num;
                        }
                    }
                }
            }
            return num3;
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.SkinName == null)
            {
                this.SkinName = "Skin-VSubmmitOrder.html";
            }
            base.OnInit(e);
        }

        private void rptCartProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
        }
    }
}

