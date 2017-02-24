using ASPNET.WebControls;
using Hidistro.ControlPanel.Commodities;
using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Entities.Commodities;
using Hidistro.Entities.Store;
using Hidistro.UI.ControlPanel.Utility;
using System;
using System.Data;
using System.Web.UI.WebControls;
namespace Hidistro.UI.Web.Admin.product
{
    [PrivilegeCheck(Privilege.EditProducts)]
    public class SendDeliveryUser : AdminPage
    {
        protected System.Web.UI.WebControls.Button btnSaveInfo;
        protected Repeater SelectedDeliveryUsers;
        protected int storeId =0;
        protected string orderId;

        private void BindProduct()
        {

            string where = "";
            if (storeId > 0)
            {
                where += "storeid = " + this.storeId + " and DeliveryState = 0 and [state] = 0";
            }
            else
            {
                where += " DeliveryState = 0 and [state] = 0";
            }
            this.SelectedDeliveryUsers.DataSource = StoreHelper.GetDeliveryMemberList(where); //ProductHelper.GetTopStoreProductBaseInfo();
            this.SelectedDeliveryUsers.DataBind();
        }

        private void btnSaveInfo_Click(object sender, System.EventArgs e)
        {
            
            if (storeId <= 0 || string.IsNullOrEmpty(orderId))
            {
                this.CloseWindow();
            }
            bool flag = false;

            foreach (RepeaterItem rs in SelectedDeliveryUsers.Items)
            {
                System.Web.UI.HtmlControls.HtmlInputCheckBox chb = ((System.Web.UI.HtmlControls.HtmlInputCheckBox)rs.FindControl("chkboxDeliveryUserId"));
                if (chb.Checked)
                {
                    string deliveryUserId = chb.Value;
                    DeliveryOrderInfo info = new DeliveryOrderInfo{
                        OrderId = this.orderId,
                        DeliveryUserId = deliveryUserId.ToInt(),
                        AddTime = DateTime.Now,
                        State = 1,
                        StoreId = this.storeId,
                    };
                    if (StoreHelper.SetDeliveryUser(info))
                    {
                        flag = true;
                        break;
                    }
                    
                }

            }

            if (flag)
            {
                this.ShowMsg("配送员分配成功！", true);
                this.CloseWindow();
            }
            /*
            System.Data.DataTable dt = new System.Data.DataTable();
            dt.Columns.Add("ProductId");
            dt.Columns.Add("ProductName");
            dt.Columns.Add("ProductCode");
            dt.Columns.Add("MarketPrice");
            if (this.grdSelectedProducts.Rows.Count > 0)
            {
                decimal result = 0m;
                foreach (System.Web.UI.WebControls.GridViewRow row in this.grdSelectedProducts.Rows)
                {
                    int num = (int)this.grdSelectedProducts.DataKeys[row.RowIndex].Value;
                    System.Web.UI.WebControls.TextBox box = row.FindControl("txtProductName") as System.Web.UI.WebControls.TextBox;
                    System.Web.UI.WebControls.TextBox box2 = row.FindControl("txtProductCode") as System.Web.UI.WebControls.TextBox;
                    System.Web.UI.WebControls.TextBox box3 = row.FindControl("txtMarketPrice") as System.Web.UI.WebControls.TextBox;
                    if (!string.IsNullOrEmpty(box3.Text.Trim()) && !decimal.TryParse(box3.Text.Trim(), out result))
                    {
                        break;
                    }
                    if (string.IsNullOrEmpty(box3.Text.Trim()))
                    {
                        result = 0m;
                    }
                    System.Data.DataRow row2 = dt.NewRow();
                    row2["ProductId"] = num;
                    row2["ProductName"] = Globals.HtmlEncode(box.Text.Trim());
                    row2["ProductCode"] = Globals.HtmlEncode(box2.Text.Trim());
                    if (result >= 0m)
                    {
                        row2["MarketPrice"] = result;
                    }
                    dt.Rows.Add(row2);
                }
                if (ProductHelper.UpdateProductBaseInfo(dt))
                {
                    this.CloseWindow();
                }
                else
                {
                    this.ShowMsg("批量修改商品信息失败", false);
                }
                this.BindProduct();
            }
             */ 
        }
        protected void Page_Load(object sender, System.EventArgs e)
        {
            this.btnSaveInfo.Click += new System.EventHandler(this.btnSaveInfo_Click);
            this.orderId = this.Page.Request.QueryString["orderid"];
            //获取当前子账号门店
            ManagerInfo currentManager = ManagerHelper.GetCurrentManager();
            storeId = ManagerHelper.getClientUserIdBySenderId(currentManager.UserId);
            if (!this.Page.IsPostBack)
            {
                this.BindProduct();
            }
        }
    }
}
