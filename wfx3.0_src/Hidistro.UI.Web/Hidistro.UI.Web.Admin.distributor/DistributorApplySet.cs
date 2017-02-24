using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.UI.ControlPanel.Utility;
using kindeditor.Net;
using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin.distributor
{
    public class DistributorApplySet : AdminPage
    {
        protected KindeditorControl ApplicationDescription;
        protected System.Web.UI.WebControls.Button btnSave;
        protected KindeditorControl fkContent;
        protected System.Web.UI.HtmlControls.HtmlInputRadioButton radiorequestoff;
        protected System.Web.UI.HtmlControls.HtmlInputRadioButton radiorequeston;

        protected System.Web.UI.HtmlControls.HtmlInputRadioButton radioCommissionon;
        protected System.Web.UI.HtmlControls.HtmlInputRadioButton radioCommissionoff;

        protected System.Web.UI.HtmlControls.HtmlInputRadioButton radioProfitoff;
        protected System.Web.UI.HtmlControls.HtmlInputRadioButton radioProfit;

        protected System.Web.UI.WebControls.TextBox txtApplySet;
        protected System.Web.UI.HtmlControls.HtmlInputText txtrequestmoney;


        protected void btnSave_Click(object sender, System.EventArgs e)
        {
            SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
            masterSettings.ApplicationDescription = this.ApplicationDescription.Text.Trim();
            masterSettings.DistributorDescription = this.fkContent.Text;
            masterSettings.MentionNowMoney = this.txtApplySet.Text.Trim();
            masterSettings.IsRequestDistributor = this.radiorequeston.Checked;
            masterSettings.EnableCommission = this.radioCommissionon.Checked;
            masterSettings.EnableProfit = this.radioProfit.Checked;

            if (masterSettings.IsRequestDistributor)
            {
                string s = this.txtrequestmoney.Value.Trim();
                int result = 0;
                if (!int.TryParse(s, out result) || result < 0)
                {
                    this.ShowMsg("请输入必须大于等于0的整数申请分销商条件金额", false);
                    return;
                }
                masterSettings.FinishedOrderMoney = result;
            }
            SettingsManager.Save(masterSettings);
            this.ShowMsg("修改成功", true);
        }
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
                this.ApplicationDescription.Text = masterSettings.ApplicationDescription;
                this.fkContent.Text = masterSettings.DistributorDescription;
                this.txtApplySet.Text = masterSettings.MentionNowMoney;
                this.txtrequestmoney.Value = masterSettings.FinishedOrderMoney.ToString();
                this.radiorequeston.Checked = true;
                if (!masterSettings.IsRequestDistributor)
                {
                    this.radiorequestoff.Checked = true;
                }

                if (masterSettings.EnableCommission)
                {
                    this.radioCommissionon.Checked = true;
                }
                else
                {
                    this.radioCommissionoff.Checked = true;
                }

                if (masterSettings.EnableProfit)
                {
                    this.radioProfit.Checked = true;
                }
                else
                {
                    this.radioProfitoff.Checked = true;
                }
            }
        }
    }
}
