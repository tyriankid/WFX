using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.UI.ControlPanel.Utility;

namespace Hidistro.UI.Web.Admin
{
    [AdministerCheck(true)]
    public class ThirdWayManage : AdminPage
    {
        protected System.Web.UI.WebControls.Button btnOK;
        protected System.Web.UI.HtmlControls.HtmlInputHidden hidSubInfo;
        protected System.Web.UI.HtmlControls.HtmlInputHidden hidStoreId;
        private static int storeId;

        protected void btnOK_Click(object sender, System.EventArgs e)
        {
            SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
            string infos = this.hidSubInfo.Value;

            masterSettings.thirdWayDiscountInfo = infos;
            SettingsManager.Save(masterSettings);
            this.ShowMsg("保存成功", true);
        }
        protected void Page_Load(object sender, System.EventArgs e)
        {
            storeId = ManagerHelper.GetCurrentManager().ClientUserId.ToInt();
            if (!this.Page.IsPostBack)
            {
                SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
                this.hidSubInfo.Value = masterSettings.thirdWayDiscountInfo;
                this.hidStoreId.Value = storeId.ToString();
            }
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
        }

    }
}
