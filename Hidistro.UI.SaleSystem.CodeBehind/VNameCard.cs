﻿namespace Hidistro.UI.SaleSystem.CodeBehind
{
    using Hidistro.Entities.Members;
    using Hidistro.SaleSystem.Vshop;
    using Hidistro.UI.Common.Controls;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    [ParseChildren(true)]
    public class VNameCard : VshopTemplatedWebControl
    {
        protected override void AttachChildControls()
        {
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember != null)
            {
                Image image = (System.Web.UI.WebControls.Image)this.FindControl("image");
                Literal litUserName = (Literal)this.FindControl("litUserName");
                HtmlInputText control = (HtmlInputText) this.FindControl("txtRealName");
                HtmlInputText text2 = (HtmlInputText) this.FindControl("txtPhone");
                HtmlInputText text3 = (HtmlInputText) this.FindControl("txtMicroSignal");
                control.SetWhenIsNotNull(currentMember.RealName);
                text2.SetWhenIsNotNull(currentMember.CellPhone);
                text3.SetWhenIsNotNull(currentMember.MicroSignal);
                litUserName.Text = string.IsNullOrEmpty(currentMember.RealName) ? currentMember.UserName : currentMember.RealName;
                if (!string.IsNullOrEmpty(currentMember.UserHead))
                {
                    image.ImageUrl = currentMember.UserHead;
                }
            }
            PageTitle.AddSiteNameTitle("我的名片");
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.SkinName == null)
            {
                this.SkinName = "skin-VNameCard.html";
            }
            base.OnInit(e);
        }
    }
}

