﻿namespace Hidistro.UI.SaleSystem.CodeBehind
{
    using Hidistro.Core;
    using Hidistro.SaleSystem.Vshop;
    using Hidistro.UI.Common.Controls;
    using System;
    using System.Collections.Generic;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using Hidistro.Entities.Sales;

    [ParseChildren(true)]
    public class VShippingAddresses : VWeiXinOAuthTemplatedWebControl
    {
        private HtmlAnchor aLinkToAdd;
        private VshopTemplatedRepeater rptvShipping;

        protected override void AttachChildControls()
        {
            this.rptvShipping = (VshopTemplatedRepeater) this.FindControl("rptvShipping");
            this.aLinkToAdd = (HtmlAnchor) this.FindControl("aLinkToAdd");
            this.aLinkToAdd.HRef = Globals.ApplicationPath + "/Vshop/AddShippingAddress.aspx";
            if (Hidistro.ControlPanel.Config.CustomConfigHelper.Instance.IsProLa) this.aLinkToAdd.HRef = Globals.ApplicationPath + "/Vshop/AddShippingAddressPro.aspx";
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["returnUrl"]))
            {
                this.aLinkToAdd.HRef = this.aLinkToAdd.HRef + "?returnUrl=" + Globals.UrlEncode(this.Page.Request.QueryString["returnUrl"]);
            }
            IList<ShippingAddressInfo> shippingAddresses = MemberProcessor.GetShippingAddresses();
            if (shippingAddresses != null)
            {
                this.rptvShipping.DataSource = shippingAddresses;
                this.rptvShipping.DataBind();
            }
            PageTitle.AddSiteNameTitle("收货地址");
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.SkinName == null)
            {
                this.SkinName = "Skin-Vshippingaddresses.html";
            }
            base.OnInit(e);
        }
    }
}

