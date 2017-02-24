using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.UI.Common.Controls;
using Hidistro.UI.ControlPanel.Utility;
using Hishop.Components.Validation;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;
namespace Hidistro.UI.Web.Admin
{
    [AdministerCheck(true)]
    public class ThirdWayManage : AdminPage
    {
        protected System.Web.UI.WebControls.Button btnOK;
        protected System.Web.UI.HtmlControls.HtmlInputHidden hidSubInfo;//使用双分隔符存放   起送距离[ ]公里, 到 [ ]公里,  起送价 [ ], 配送费 [ ];

        protected void btnOK_Click(object sender, System.EventArgs e)
        {
            SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
            string roadPriceInfo = this.hidSubInfo.Value;
            masterSettings.thirdWayDiscountInfo = roadPriceInfo;
            SettingsManager.Save(masterSettings);
            this.ShowMsg("保存成功", true);
        }
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
                this.hidSubInfo.Value = masterSettings.thirdWayDiscountInfo;
            }
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
        }

    }
}
