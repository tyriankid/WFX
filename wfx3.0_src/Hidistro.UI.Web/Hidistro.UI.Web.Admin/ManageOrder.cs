//using ASPNET.WebControls;
//using Hidistro.ControlPanel.Members;
//using Hidistro.ControlPanel.Sales;
//using Hidistro.ControlPanel.Store;
//using Hidistro.Core;
//using Hidistro.Core.Entities;
//using Hidistro.Core.Enums;
//using Hidistro.Entities.Orders;
//using Hidistro.Entities.Promotions;
//using Hidistro.Entities.Store;
//using Hidistro.Messages;
//using Hidistro.SaleSystem.Vshop;
//using Hidistro.UI.Common.Controls;
//using Hidistro.UI.ControlPanel.Utility;
//using System;
//using System.Collections.Generic;
//using System.Collections.Specialized;
//using System.Data;
//using System.Text;
//using System.Text.RegularExpressions;
//using System.Web.UI;
//using System.Web.UI.HtmlControls;
//using System.Web.UI.WebControls;
//namespace Hidistro.UI.Web.Admin
//{
//    [PrivilegeCheck(Privilege.Orders)]
//    public class ManageOrder : AdminPage
//    {
//        protected System.Web.UI.WebControls.Button btnAcceptRefund;
//        protected System.Web.UI.WebControls.Button btnAcceptReplace;
//        protected System.Web.UI.WebControls.Button btnAcceptReturn;
//        protected System.Web.UI.WebControls.Button btnCloseOrder;
//        protected System.Web.UI.WebControls.Button btnOrderGoods;
//        protected System.Web.UI.WebControls.Button btnProductGoods;
//        protected System.Web.UI.WebControls.Button btnRefuseRefund;
//        protected System.Web.UI.WebControls.Button btnRefuseReplace;
//        protected System.Web.UI.WebControls.Button btnRefuseReturn;
//        protected System.Web.UI.WebControls.Button btnRemark;
//        protected System.Web.UI.WebControls.Button btnSearchButton;
//        protected WebCalendar calendarEndDate;
//        protected WebCalendar calendarStartDate;
//        protected CloseTranReasonDropDownList ddlCloseReason;
//        protected System.Web.UI.WebControls.DropDownList ddlIsPrinted;
//        protected System.Web.UI.WebControls.DataList dlstOrders;
//        protected RegionSelector dropRegion;
//        protected System.Web.UI.HtmlControls.HtmlInputHidden hidAdminRemark;
//        protected System.Web.UI.HtmlControls.HtmlInputHidden hidOrderId;
//        protected System.Web.UI.HtmlControls.HtmlInputHidden hidOrderTotal;
//        protected System.Web.UI.HtmlControls.HtmlInputHidden hidRefundMoney;
//        protected System.Web.UI.HtmlControls.HtmlInputHidden hidRefundType;
//        protected System.Web.UI.WebControls.HyperLink hlinkAllOrder;
//        protected System.Web.UI.WebControls.HyperLink hlinkClose;
//        protected System.Web.UI.WebControls.HyperLink hlinkHistory;
//        protected System.Web.UI.WebControls.HyperLink hlinkNotPay;
//        protected System.Web.UI.WebControls.HyperLink hlinkSendGoods;
//        protected System.Web.UI.WebControls.HyperLink hlinkTradeFinished;
//        protected System.Web.UI.WebControls.HyperLink hlinkYetPay;
//        protected PageSize hrefPageSize;
//        protected System.Web.UI.WebControls.Label lblAddress;
//        protected System.Web.UI.WebControls.Label lblContacts;
//        protected System.Web.UI.WebControls.Label lblEmail;
//        protected System.Web.UI.WebControls.Label lblOrderId;
//        protected System.Web.UI.WebControls.Label lblOrderTotal;
//        protected FormatedMoneyLabel lblOrderTotalForRemark;
//        protected System.Web.UI.WebControls.Label lblRefundRemark;
//        protected System.Web.UI.WebControls.Label lblRefundType;
//        protected System.Web.UI.WebControls.Label lblStatus;
//        protected System.Web.UI.WebControls.Label lblTelephone;
//        protected ImageLinkButton lkbtnDeleteCheck;
//        protected System.Web.UI.WebControls.DropDownList OrderFromList;
//        protected OrderRemarkImageRadioButtonList orderRemarkImageForRemark;
//        protected Pager pager;
//        protected Pager pager1;
//        protected System.Web.UI.WebControls.Label replace_lblAddress;
//        protected System.Web.UI.WebControls.Label replace_lblComments;
//        protected System.Web.UI.WebControls.Label replace_lblContacts;
//        protected System.Web.UI.WebControls.Label replace_lblEmail;
//        protected System.Web.UI.WebControls.Label replace_lblOrderId;
//        protected System.Web.UI.WebControls.Label replace_lblOrderTotal;
//        protected System.Web.UI.WebControls.Label replace_lblPostCode;
//        protected System.Web.UI.WebControls.Label replace_lblTelephone;
//        protected System.Web.UI.WebControls.TextBox replace_txtAdminRemark;
//        protected System.Web.UI.WebControls.Label return_lblAddress;
//        protected System.Web.UI.WebControls.Label return_lblContacts;
//        protected System.Web.UI.WebControls.Label return_lblEmail;
//        protected System.Web.UI.WebControls.Label return_lblOrderId;
//        protected System.Web.UI.WebControls.Label return_lblOrderTotal;
//        protected System.Web.UI.WebControls.Label return_lblRefundType;
//        protected System.Web.UI.WebControls.Label return_lblReturnRemark;
//        protected System.Web.UI.WebControls.Label return_lblTelephone;
//        protected System.Web.UI.WebControls.TextBox return_txtAdminRemark;
//        protected System.Web.UI.WebControls.TextBox return_txtRefundMoney;
//        protected ShippingModeDropDownList shippingModeDropDownList;
//        protected System.Web.UI.WebControls.TextBox txtAdminRemark;
//        protected System.Web.UI.WebControls.TextBox txtOrderId;
//        protected System.Web.UI.WebControls.TextBox txtProductName;
//        protected System.Web.UI.WebControls.TextBox txtRemark;
//        protected System.Web.UI.WebControls.TextBox txtShopTo;
//        protected System.Web.UI.WebControls.TextBox txtUserName;
//        private void BindOrders()
//        {
//            OrderQuery orderQuery = this.GetOrderQuery();
//            DbQueryResult orders = OrderHelper.GetOrders(orderQuery);
//            this.dlstOrders.DataSource = orders.Data;
//            this.dlstOrders.DataBind();
//            this.pager.TotalRecords = orders.TotalRecords;
//            this.pager1.TotalRecords = orders.TotalRecords;
//            this.txtUserName.Text = orderQuery.UserName;
//            this.txtOrderId.Text = orderQuery.OrderId;
//            this.txtProductName.Text = orderQuery.ProductName;
//            this.txtShopTo.Text = orderQuery.ShipTo;
//            this.calendarStartDate.SelectedDate = orderQuery.StartDate;
//            this.calendarEndDate.SelectedDate = orderQuery.EndDate;
//            this.lblStatus.Text = ((int)orderQuery.Status).ToString();
//            this.shippingModeDropDownList.SelectedValue = orderQuery.ShippingModeId;
//            if (orderQuery.IsPrinted.HasValue)
//            {
//                this.ddlIsPrinted.SelectedValue = orderQuery.IsPrinted.Value.ToString();
//            }
//            if (orderQuery.RegionId.HasValue)
//            {
//                this.dropRegion.SetSelectedRegionId(orderQuery.RegionId);
//            }
//        }
//        private void bindOrderType()
//        {
//            int result = 0;
//            int.TryParse(base.Request.QueryString["orderType"], out result);
//            this.OrderFromList.SelectedIndex = result;
//        }
//        protected void btnAcceptRefund_Click(object sender, System.EventArgs e)
//        {
//            string userName = ManagerHelper.GetCurrentManager().UserName;
//            if (RefundHelper.EnsureRefund(OrderHelper.GetOrderInfo(this.hidOrderId.Value).OrderId, userName, this.hidAdminRemark.Value, int.Parse(this.hidRefundType.Value), true))
//            {
//                this.BindOrders();
//                this.ShowMsg("成功的确认了订单退款", true);
//            }
//        }
//        private void btnCloseOrder_Click(object sender, System.EventArgs e)
//        {
//            OrderInfo orderInfo = OrderHelper.GetOrderInfo(this.hidOrderId.Value);
//            orderInfo.CloseReason = this.ddlCloseReason.SelectedValue;
//            if (OrderHelper.CloseTransaction(orderInfo))
//            {
//                orderInfo.OnClosed();
//                this.BindOrders();
//                Messenger.OrderClosed(MemberHelper.GetMember(orderInfo.UserId), orderInfo, orderInfo.CloseReason);
//                this.ShowMsg("关闭订单成功", true);
//            }
//            else
//            {
//                this.ShowMsg("关闭订单失败", false);
//            }
//        }
//        private void btnOrderGoods_Click(object sender, System.EventArgs e)
//        {
//            string str = "";
//            if (!string.IsNullOrEmpty(base.Request["CheckBoxGroup"]))
//            {
//                str = base.Request["CheckBoxGroup"];
//            }
//            if (str.Length <= 0)
//            {
//                this.ShowMsg("请选要下载配货表的订单", false);
//            }
//            else
//            {
//                System.Collections.Generic.List<string> list = new System.Collections.Generic.List<string>();
//                string[] array = str.Split(new char[]
//                {
//                    ','
//                });
//                for (int i = 0; i < array.Length; i++)
//                {
//                    string str2 = array[i];
//                    list.Add("'" + str2 + "'");
//                }
//                System.Data.DataSet orderGoods = OrderHelper.GetOrderGoods(string.Join(",", list.ToArray()));
//                System.Text.StringBuilder builder = new System.Text.StringBuilder();
//                builder.AppendLine("<html><head><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\"></head><body>");
//                builder.AppendLine("<table cellspacing=\"0\" cellpadding=\"5\" rules=\"all\" border=\"1\">");
//                builder.AppendLine("<caption style='text-align:center;'>配货单(仓库拣货表)</caption>");
//                builder.AppendLine("<tr style=\"font-weight: bold; white-space: nowrap;\">");
//                builder.AppendLine("<td>订单单号</td>");
//                builder.AppendLine("<td>商品名称</td>");
//                builder.AppendLine("<td>货号</td>");
//                builder.AppendLine("<td>规格</td>");
//                builder.AppendLine("<td>拣货数量</td>");
//                builder.AppendLine("<td>现库存数</td>");
//                builder.AppendLine("<td>备注</td>");
//                builder.AppendLine("</tr>");
//                foreach (System.Data.DataRow row in orderGoods.Tables[0].Rows)
//                {
//                    builder.AppendLine("<tr>");
//                    builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["OrderId"] + "</td>");
//                    builder.AppendLine("<td>" + row["ProductName"] + "</td>");
//                    builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["SKU"] + "</td>");
//                    builder.AppendLine("<td>" + row["SKUContent"] + "</td>");
//                    builder.AppendLine("<td>" + row["ShipmentQuantity"] + "</td>");
//                    builder.AppendLine("<td>" + row["Stock"] + "</td>");
//                    builder.AppendLine("<td>" + row["Remark"] + "</td>");
//                    builder.AppendLine("</tr>");
//                }
//                builder.AppendLine("</table>");
//                builder.AppendLine("</body></html>");
//                base.Response.Clear();
//                base.Response.Buffer = false;
//                base.Response.Charset = "GB2312";
//                base.Response.AppendHeader("Content-Disposition", "attachment;filename=ordergoods_" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls");
//                base.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
//                base.Response.ContentType = "application/ms-excel";
//                this.EnableViewState = false;
//                base.Response.Write(builder.ToString());
//                base.Response.End();
//            }
//        }
//        private void btnProductGoods_Click(object sender, System.EventArgs e)
//        {
//            string str = "";
//            if (!string.IsNullOrEmpty(base.Request["CheckBoxGroup"]))
//            {
//                str = base.Request["CheckBoxGroup"];
//            }
//            if (str.Length <= 0)
//            {
//                this.ShowMsg("请选要下载配货表的订单", false);
//            }
//            else
//            {
//                System.Collections.Generic.List<string> list = new System.Collections.Generic.List<string>();
//                string[] array = str.Split(new char[]
//                {
//                    ','
//                });
//                for (int i = 0; i < array.Length; i++)
//                {
//                    string str2 = array[i];
//                    list.Add("'" + str2 + "'");
//                }
//                System.Data.DataSet productGoods = OrderHelper.GetProductGoods(string.Join(",", list.ToArray()));
//                System.Text.StringBuilder builder = new System.Text.StringBuilder();
//                builder.AppendLine("<html><head><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\"></head><body>");
//                builder.AppendLine("<table cellspacing=\"0\" cellpadding=\"5\" rules=\"all\" border=\"1\">");
//                builder.AppendLine("<caption style='text-align:center;'>配货单(仓库拣货表)</caption>");
//                builder.AppendLine("<tr style=\"font-weight: bold; white-space: nowrap;\">");
//                builder.AppendLine("<td>商品名称</td>");
//                builder.AppendLine("<td>货号</td>");
//                builder.AppendLine("<td>规格</td>");
//                builder.AppendLine("<td>拣货数量</td>");
//                builder.AppendLine("<td>现库存数</td>");
//                builder.AppendLine("</tr>");
//                foreach (System.Data.DataRow row in productGoods.Tables[0].Rows)
//                {
//                    builder.AppendLine("<tr>");
//                    builder.AppendLine("<td>" + row["ProductName"] + "</td>");
//                    builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["SKU"] + "</td>");
//                    builder.AppendLine("<td>" + row["SKUContent"] + "</td>");
//                    builder.AppendLine("<td>" + row["ShipmentQuantity"] + "</td>");
//                    builder.AppendLine("<td>" + row["Stock"] + "</td>");
//                    builder.AppendLine("</tr>");
//                }
//                builder.AppendLine("</table>");
//                builder.AppendLine("</body></html>");
//                base.Response.Clear();
//                base.Response.Buffer = false;
//                base.Response.Charset = "GB2312";
//                base.Response.AppendHeader("Content-Disposition", "attachment;filename=productgoods_" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls");
//                base.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
//                base.Response.ContentType = "application/ms-excel";
//                this.EnableViewState = false;
//                base.Response.Write(builder.ToString());
//                base.Response.End();
//            }
//        }
//        private void btnRefuseRefund_Click(object sender, System.EventArgs e)
//        {
//            string userName = ManagerHelper.GetCurrentManager().UserName;
//            RefundHelper.EnsureRefund(OrderHelper.GetOrderInfo(this.hidOrderId.Value).OrderId, userName, this.hidAdminRemark.Value, int.Parse(this.hidRefundType.Value), false);
//            this.BindOrders();
//            this.ShowMsg("成功的拒绝了订单退款", true);
//        }
//        private void btnRemark_Click(object sender, System.EventArgs e)
//        {
//            if (this.txtRemark.Text.Length > 300)
//            {
//                this.ShowMsg("备忘录长度限制在300个字符以内", false);
//            }
//            else
//            {
//                Regex regex = new Regex("^(?!_)(?!.*?_$)(?!-)(?!.*?-$)[a-zA-Z0-9_一-龥-]+$");
//                if (!regex.IsMatch(this.txtRemark.Text))
//                {
//                    this.ShowMsg("备忘录只能输入汉字,数字,英文,下划线,减号,不能以下划线、减号开头或结尾", false);
//                }
//                else
//                {
//                    OrderInfo orderInfo = OrderHelper.GetOrderInfo(this.hidOrderId.Value);
//                    orderInfo.OrderId = this.hidOrderId.Value;
//                    if (this.orderRemarkImageForRemark.SelectedItem != null)
//                    {
//                        orderInfo.ManagerMark = this.orderRemarkImageForRemark.SelectedValue;
//                    }
//                    orderInfo.ManagerRemark = Globals.HtmlEncode(this.txtRemark.Text);
//                    if (OrderHelper.SaveRemark(orderInfo))
//                    {
//                        this.BindOrders();
//                        this.ShowMsg("保存备忘录成功", true);
//                    }
//                    else
//                    {
//                        this.ShowMsg("保存失败", false);
//                    }
//                }
//            }
//        }
//        protected void btnSearchButton_Click(object sender, System.EventArgs e)
//        {
//            this.ReloadOrders(true);
//        }
//        private void btnSendGoods_Click(object sender, System.EventArgs e)
//        {
//            string str = "";
//            if (!string.IsNullOrEmpty(base.Request["CheckBoxGroup"]))
//            {
//                str = base.Request["CheckBoxGroup"];
//            }
//            if (str.Length <= 0)
//            {
//                this.ShowMsg("请选要发货的订单", false);
//            }
//            else
//            {
//                this.Page.Response.Redirect(Globals.GetAdminAbsolutePath("/Sales/BatchSendOrderGoods.aspx?OrderIds=" + str));
//            }
//        }
//        protected void dlstOrders_ItemCommand(object sender, System.Web.UI.WebControls.DataListCommandEventArgs e)
//        {
//            OrderInfo orderInfo = OrderHelper.GetOrderInfo(e.CommandArgument.ToString());
//            if (orderInfo != null)
//            {
//                if (e.CommandName == "CONFIRM_PAY" && orderInfo.CheckAction(OrderActions.SELLER_CONFIRM_PAY))
//                {
//                    int num2 = 0;
//                    int num3 = 0;
//                    int groupBuyId = orderInfo.GroupBuyId;
//                    if (OrderHelper.ConfirmPay(orderInfo))
//                    {
//                        DebitNoteInfo info2 = new DebitNoteInfo();
//                        info2.NoteId = Globals.GetGenerateId();
//                        info2.OrderId = e.CommandArgument.ToString();
//                        info2.Operator = ManagerHelper.GetCurrentManager().UserName;
//                        info2.Remark = "后台" + info2.Operator + "收款成功";
//                        OrderHelper.SaveDebitNote(info2);
//                        if (orderInfo.GroupBuyId > 0)
//                        {
//                            int num4 = num2 + num3;
//                        }
//                        this.BindOrders();
//                        orderInfo.OnPayment();
//                        this.ShowMsg("成功的确认了订单收款", true);
//                    }
//                    else
//                    {
//                        this.ShowMsg("确认订单收款失败", false);
//                    }
//                }
//                else
//                {
//                    if (e.CommandName == "FINISH_TRADE" && orderInfo.CheckAction(OrderActions.SELLER_FINISH_TRADE))
//                    {
//                        if (OrderHelper.ConfirmOrderFinish(orderInfo))
//                        {
//                            MemberProcessor.RemoveUserCache(orderInfo.UserId);
//                            this.BindOrders();
//                            DistributorsBrower.UpdateCalculationCommission(orderInfo);
//                            this.ShowMsg("成功的完成了该订单", true);
//                        }
//                        else
//                        {
//                            this.ShowMsg("完成订单失败", false);
//                        }
//                    }
//                }
//            }
//        }
//        private void dlstOrders_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
//        {
//            if (e.Item.ItemType == System.Web.UI.WebControls.ListItemType.Item || e.Item.ItemType == System.Web.UI.WebControls.ListItemType.AlternatingItem)
//            {
//                OrderStatus status = (OrderStatus)System.Web.UI.DataBinder.Eval(e.Item.DataItem, "OrderStatus");
//                string str = "";
//                if (!(System.Web.UI.DataBinder.Eval(e.Item.DataItem, "Gateway") is System.DBNull))
//                {
//                    str = (string)System.Web.UI.DataBinder.Eval(e.Item.DataItem, "Gateway");
//                }
//                int num = (System.Web.UI.DataBinder.Eval(e.Item.DataItem, "GroupBuyId") != System.DBNull.Value) ? ((int)System.Web.UI.DataBinder.Eval(e.Item.DataItem, "GroupBuyId")) : 0;
//                System.Web.UI.WebControls.HyperLink link = (System.Web.UI.WebControls.HyperLink)e.Item.FindControl("lkbtnEditPrice");
//                System.Web.UI.WebControls.Label label = (System.Web.UI.WebControls.Label)e.Item.FindControl("lkbtnSendGoods");
//                ImageLinkButton button = (ImageLinkButton)e.Item.FindControl("lkbtnPayOrder");
//                ImageLinkButton button2 = (ImageLinkButton)e.Item.FindControl("lkbtnConfirmOrder");
//                System.Web.UI.WebControls.Literal literal = (System.Web.UI.WebControls.Literal)e.Item.FindControl("litCloseOrder");
//                System.Web.UI.HtmlControls.HtmlAnchor anchor = (System.Web.UI.HtmlControls.HtmlAnchor)e.Item.FindControl("lkbtnCheckRefund");
//                System.Web.UI.HtmlControls.HtmlAnchor anchor2 = (System.Web.UI.HtmlControls.HtmlAnchor)e.Item.FindControl("lkbtnCheckReturn");
//                System.Web.UI.HtmlControls.HtmlAnchor anchor3 = (System.Web.UI.HtmlControls.HtmlAnchor)e.Item.FindControl("lkbtnCheckReplace");
//                OrderStatus orderStatus = status;
//                if (orderStatus != OrderStatus.WaitBuyerPay)
//                {
//                    switch (orderStatus)
//                    {
//                    case OrderStatus.ApplyForRefund:
//                        anchor.Visible = true;
//                        break;
//                    case OrderStatus.ApplyForReturns:
//                        anchor2.Visible = true;
//                        break;
//                    case OrderStatus.ApplyForReplacement:
//                        anchor3.Visible = true;
//                        break;
//                    }
//                }
//                else
//                {
//                    link.Visible = true;
//                    literal.Visible = true;
//                    if (str != "hishop.plugins.payment.podrequest")
//                    {
//                        button.Visible = true;
//                    }
//                }
//                if (num > 0)
//                {
//                    GroupBuyStatus status2 = (GroupBuyStatus)System.Web.UI.DataBinder.Eval(e.Item.DataItem, "GroupBuyStatus");
//                    label.Visible = (status == OrderStatus.BuyerAlreadyPaid && status2 == GroupBuyStatus.Success);
//                }
//                else
//                {
//                    label.Visible = (status == OrderStatus.BuyerAlreadyPaid || (status == OrderStatus.WaitBuyerPay && str == "hishop.plugins.payment.podrequest"));
//                }
//                button2.Visible = (status == OrderStatus.SellerAlreadySent);
//            }
//        }
//        private OrderQuery GetOrderQuery()
//        {
//            OrderQuery query = new OrderQuery();
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["OrderId"]))
//            {
//                query.OrderId = Globals.UrlDecode(this.Page.Request.QueryString["OrderId"]);
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["ProductName"]))
//            {
//                query.ProductName = Globals.UrlDecode(this.Page.Request.QueryString["ProductName"]);
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["ShipTo"]))
//            {
//                query.ShipTo = Globals.UrlDecode(this.Page.Request.QueryString["ShipTo"]);
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["UserName"]))
//            {
//                query.UserName = Globals.UrlDecode(this.Page.Request.QueryString["UserName"]);
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["StartDate"]))
//            {
//                query.StartDate = new System.DateTime?(System.DateTime.Parse(this.Page.Request.QueryString["StartDate"]));
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["GroupBuyId"]))
//            {
//                query.GroupBuyId = new int?(int.Parse(this.Page.Request.QueryString["GroupBuyId"]));
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["EndDate"]))
//            {
//                query.EndDate = new System.DateTime?(System.DateTime.Parse(this.Page.Request.QueryString["EndDate"]));
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["OrderStatus"]))
//            {
//                int num = 0;
//                if (int.TryParse(this.Page.Request.QueryString["OrderStatus"], out num))
//                {
//                    query.Status = (OrderStatus)num;
//                }
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["IsPrinted"]))
//            {
//                int num2 = 0;
//                if (int.TryParse(this.Page.Request.QueryString["IsPrinted"], out num2))
//                {
//                    query.IsPrinted = new int?(num2);
//                }
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["ModeId"]))
//            {
//                int num3 = 0;
//                if (int.TryParse(this.Page.Request.QueryString["ModeId"], out num3))
//                {
//                    query.ShippingModeId = new int?(num3);
//                }
//            }
//            int num4;
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["region"]) && int.TryParse(this.Page.Request.QueryString["region"], out num4))
//            {
//                query.RegionId = new int?(num4);
//            }
//            int num5;
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["UserId"]) && int.TryParse(this.Page.Request.QueryString["UserId"], out num5))
//            {
//                query.UserId = new int?(num5);
//            }
//            int result = 0;
//            if (int.TryParse(base.Request.QueryString["orderType"], out result) && result > 0)
//            {
//                query.Type = new OrderQuery.OrderType?((OrderQuery.OrderType)result);
//            }
//            query.PageIndex = this.pager.PageIndex;
//            query.PageSize = this.pager.PageSize;
//            query.SortBy = "OrderDate";
//            query.SortOrder = SortAction.Desc;
//            return query;
//        }
//        protected void lkbtnDeleteCheck_Click(object sender, System.EventArgs e)
//        {
//            string str = "";
//            if (!string.IsNullOrEmpty(base.Request["CheckBoxGroup"]))
//            {
//                str = base.Request["CheckBoxGroup"];
//            }
//            if (str.Length <= 0)
//            {
//                this.ShowMsg("请选要删除的订单", false);
//            }
//            else
//            {
//                int num = OrderHelper.DeleteOrders("'" + str.Replace(",", "','") + "'");
//                this.BindOrders();
//                this.ShowMsg(string.Format("成功删除了{0}个订单", num), true);
//            }
//        }
//        protected void Page_Load(object sender, System.EventArgs e)
//        {
//            if (!string.IsNullOrEmpty(base.Request["isCallback"]) && base.Request["isCallback"] == "true")
//            {
//                if (string.IsNullOrEmpty(base.Request["orderId"]))
//                {
//                    base.Response.Write("{\"Status\":\"0\"}");
//                    base.Response.End();
//                    return;
//                }
//                OrderInfo orderInfo = OrderHelper.GetOrderInfo(base.Request["orderId"]);
//                System.Text.StringBuilder builder = new System.Text.StringBuilder();
//                int num;
//                string str2;
//                if (base.Request["type"] == "refund")
//                {
//                    RefundHelper.GetRefundType(base.Request["orderId"], out num, out str2);
//                }
//                else
//                {
//                    num = 0;
//                    str2 = "";
//                }
//                string str3;
//                if (num == 1)
//                {
//                    str3 = "退到预存款";
//                }
//                else
//                {
//                    str3 = "银行转帐";
//                }
//                builder.AppendFormat(",\"OrderTotal\":\"{0}\"", Globals.FormatMoney(orderInfo.GetTotal()));
//                if (!(base.Request["type"] == "replace"))
//                {
//                    builder.AppendFormat(",\"RefundType\":\"{0}\"", num);
//                    builder.AppendFormat(",\"RefundTypeStr\":\"{0}\"", str3);
//                }
//                builder.AppendFormat(",\"Contacts\":\"{0}\"", orderInfo.ShipTo);
//                builder.AppendFormat(",\"Email\":\"{0}\"", orderInfo.EmailAddress);
//                builder.AppendFormat(",\"Telephone\":\"{0}\"", (orderInfo.TelPhone + " " + orderInfo.CellPhone).Trim());
//                builder.AppendFormat(",\"Address\":\"{0}\"", orderInfo.Address);
//                builder.AppendFormat(",\"Remark\":\"{0}\"", str2.Replace("\r\n", ""));
//                builder.AppendFormat(",\"PostCode\":\"{0}\"", orderInfo.ZipCode);
//                builder.AppendFormat(",\"GroupBuyId\":\"{0}\"", (orderInfo.GroupBuyId > 0) ? orderInfo.GroupBuyId : 0);
//                base.Response.Clear();
//                base.Response.ContentType = "application/json";
//                base.Response.Write("{\"Status\":\"1\"" + builder.ToString() + "}");
//                base.Response.End();
//            }
//            this.btnAcceptRefund.Click += new System.EventHandler(this.btnAcceptRefund_Click);
//            this.btnRefuseRefund.Click += new System.EventHandler(this.btnRefuseRefund_Click);
//            this.dlstOrders.ItemDataBound += new System.Web.UI.WebControls.DataListItemEventHandler(this.dlstOrders_ItemDataBound);
//            this.btnSearchButton.Click += new System.EventHandler(this.btnSearchButton_Click);
//            this.dlstOrders.ItemCommand += new System.Web.UI.WebControls.DataListCommandEventHandler(this.dlstOrders_ItemCommand);
//            this.btnRemark.Click += new System.EventHandler(this.btnRemark_Click);
//            this.btnCloseOrder.Click += new System.EventHandler(this.btnCloseOrder_Click);
//            this.lkbtnDeleteCheck.Click += new System.EventHandler(this.lkbtnDeleteCheck_Click);
//            this.btnProductGoods.Click += new System.EventHandler(this.btnProductGoods_Click);
//            this.btnOrderGoods.Click += new System.EventHandler(this.btnOrderGoods_Click);
//            if (!this.Page.IsPostBack)
//            {
//                this.shippingModeDropDownList.DataBind();
//                this.ddlIsPrinted.Items.Clear();
//                this.ddlIsPrinted.Items.Add(new System.Web.UI.WebControls.ListItem("全部", string.Empty));
//                this.ddlIsPrinted.Items.Add(new System.Web.UI.WebControls.ListItem("已打印", "1"));
//                this.ddlIsPrinted.Items.Add(new System.Web.UI.WebControls.ListItem("未打印", "0"));
//                this.SetOrderStatusLink();
//                this.bindOrderType();
//                this.BindOrders();
//            }
//            CheckBoxColumn.RegisterClientCheckEvents(this.Page, this.Page.Form.ClientID);
//        }
//        private void ReloadOrders(bool isSearch)
//        {
//            NameValueCollection queryStrings = new NameValueCollection();
//            queryStrings.Add("UserName", this.txtUserName.Text);
//            queryStrings.Add("OrderId", this.txtOrderId.Text);
//            queryStrings.Add("ProductName", this.txtProductName.Text);
//            queryStrings.Add("ShipTo", this.txtShopTo.Text);
//            queryStrings.Add("PageSize", this.pager.PageSize.ToString());
//            queryStrings.Add("OrderType", this.OrderFromList.SelectedValue);
//            queryStrings.Add("OrderStatus", this.lblStatus.Text);
//            if (this.calendarStartDate.SelectedDate.HasValue)
//            {
//                queryStrings.Add("StartDate", this.calendarStartDate.SelectedDate.Value.ToString());
//            }
//            if (this.calendarEndDate.SelectedDate.HasValue)
//            {
//                queryStrings.Add("EndDate", this.calendarEndDate.SelectedDate.Value.ToString());
//            }
//            if (!isSearch)
//            {
//                queryStrings.Add("pageIndex", this.pager.PageIndex.ToString());
//            }
//            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["GroupBuyId"]))
//            {
//                queryStrings.Add("GroupBuyId", this.Page.Request.QueryString["GroupBuyId"]);
//            }
//            if (this.shippingModeDropDownList.SelectedValue.HasValue)
//            {
//                queryStrings.Add("ModeId", this.shippingModeDropDownList.SelectedValue.Value.ToString());
//            }
//            if (!string.IsNullOrEmpty(this.ddlIsPrinted.SelectedValue))
//            {
//                queryStrings.Add("IsPrinted", this.ddlIsPrinted.SelectedValue);
//            }
//            if (this.dropRegion.GetSelectedRegionId().HasValue)
//            {
//                queryStrings.Add("region", this.dropRegion.GetSelectedRegionId().Value.ToString());
//            }
//            base.ReloadPage(queryStrings);
//        }
//        private void SetOrderStatusLink()
//        {
//            string format = Globals.ApplicationPath + "/Admin/sales/ManageOrder.aspx?orderStatus={0}";
//            this.hlinkAllOrder.NavigateUrl = string.Format(format, 0);
//            this.hlinkNotPay.NavigateUrl = string.Format(format, 1);
//            this.hlinkYetPay.NavigateUrl = string.Format(format, 2);
//            this.hlinkSendGoods.NavigateUrl = string.Format(format, 3);
//            this.hlinkClose.NavigateUrl = string.Format(format, 4);
//            this.hlinkTradeFinished.NavigateUrl = string.Format(format, 5);
//            this.hlinkHistory.NavigateUrl = string.Format(format, 99);
//        }
//    }
//}
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ASPNET.WebControls;
using Hidistro.ControlPanel.Members;
using Hidistro.ControlPanel.Sales;
using Hidistro.ControlPanel.Store;
using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.Core.Enums;
using Hidistro.Entities.Members;
using Hidistro.Entities.Orders;
using Hidistro.Entities.Promotions;
using Hidistro.Entities.Store;
using Hidistro.Messages;
using Hidistro.SaleSystem.Vshop;
using Hidistro.UI.Common.Controls;
using Hidistro.UI.ControlPanel.Utility;

namespace Hidistro.UI.Web.Admin
{
    [PrivilegeCheck(Privilege.Orders)]
    public class ManageOrder : AdminPage
    {
        protected string Reurl = string.Empty;

        protected HyperLink hlinkAllOrder;

        protected HyperLink hlinkNotPay;

        protected HyperLink hlinkYetPay;

        protected HyperLink hlinkSendGoods;

        protected HyperLink hlinkTradeFinished;

        protected HyperLink hlinkClose;

        protected HyperLink hlinkHistory;

        protected WebCalendar calendarStartDate;

        protected WebCalendar calendarEndDate;

        protected TextBox txtUserName;

        protected TextBox txtOrderId;

        protected Label lblStatus;

        protected TextBox txtProductName;

        protected TextBox txtShopTo;

        protected DropDownList ddlIsPrinted;

        protected ShippingModeDropDownList shippingModeDropDownList;

        protected RegionSelector dropRegion;

        protected DropDownList OrderFromList;

        protected Button btnSearchButton;

        protected PageSize hrefPageSize;

        protected Pager pager1;

        protected ImageLinkButton lkbtnDeleteCheck;

        protected HtmlInputHidden hidOrderId;

        protected DataList dlstOrders;

        protected Pager pager;

        protected CloseTranReasonDropDownList ddlCloseReason;

        protected FormatedMoneyLabel lblOrderTotalForRemark;

        protected OrderRemarkImageRadioButtonList orderRemarkImageForRemark;

        protected TextBox txtRemark;

        protected Label lblOrderId;

        protected Label lblOrderTotal;

        protected Label lblRefundType;

        protected Label lblRefundRemark;

        protected Label lblContacts;

        protected Label lblEmail;

        protected Label lblTelephone;

        protected Label lblAddress;

        protected TextBox txtAdminRemark;

        protected Label return_lblOrderId;

        protected Label return_lblOrderTotal;

        protected Label return_lblRefundType;

        protected Label return_lblReturnRemark;

        protected Label return_lblContacts;

        protected Label return_lblEmail;

        protected Label return_lblTelephone;

        protected Label return_lblAddress;

        protected TextBox return_txtRefundMoney;

        protected TextBox return_txtAdminRemark;

        protected Label replace_lblOrderId;

        protected Label replace_lblOrderTotal;

        protected Label replace_lblComments;

        protected Label replace_lblContacts;

        protected Label replace_lblEmail;

        protected Label replace_lblTelephone;

        protected Label replace_lblAddress;

        protected Label replace_lblPostCode;

        protected TextBox replace_txtAdminRemark;

        protected HtmlInputHidden hidOrderTotal;

        protected HtmlInputHidden hidRefundType;

        protected HtmlInputHidden hidRefundMoney;

        protected HtmlInputHidden hidAdminRemark;

        protected Button btnCloseOrder;

        protected Button btnAcceptRefund;

        protected Button btnRefuseRefund;

        protected Button btnAcceptReturn;

        protected Button btnRefuseReturn;

        protected Button btnAcceptReplace;

        protected Button btnRefuseReplace;

        protected Button btnRemark;

        protected Button btnOrderGoods;

        protected Button btnProductGoods;

        private void bindOrderType()
        {
            int result = 0;
            int.TryParse(base.Request.QueryString["orderType"], out result);
            this.OrderFromList.SelectedIndex = result;
        }

        private void btnRefuseRefund_Click(object obj, EventArgs eventArg)
        {
            string userName = ManagerHelper.GetCurrentManager().UserName;
            OrderInfo orderInfo = OrderHelper.GetOrderInfo(hidOrderId.Value);
            RefundHelper.EnsureRefund(orderInfo.OrderId, userName, this.hidAdminRemark.Value, int.Parse(this.hidRefundType.Value), false);
            this.BindOrders();
            this.ShowMsg("成功的拒绝了订单退款", true);
        }

        private void btnCloseOrder_Click(object sender, System.EventArgs e)
        {
            OrderInfo orderInfo = OrderHelper.GetOrderInfo(this.hidOrderId.Value);
            orderInfo.CloseReason = this.ddlCloseReason.SelectedValue;
            if (OrderHelper.CloseTransaction(orderInfo))
            {
                orderInfo.OnClosed();
                this.BindOrders();
                Messenger.OrderClosed(MemberHelper.GetMember(orderInfo.UserId), orderInfo, orderInfo.CloseReason);
                this.ShowMsg("关闭订单成功", true);
            }
            else
            {
                this.ShowMsg("关闭订单失败", false);
            }
        }

        private void btnOrderGoods_Click(object sender, System.EventArgs e)
        {
            string str = "";
            if (!string.IsNullOrEmpty(base.Request["CheckBoxGroup"]))
            {
                str = base.Request["CheckBoxGroup"];
            }
            if (str.Length <= 0)
            {
                this.ShowMsg("请选要下载配货表的订单", false);
            }
            else
            {
                System.Collections.Generic.List<string> list = new System.Collections.Generic.List<string>();
                string[] array = str.Split(new char[]
                {
                    ','
                });
                for (int i = 0; i < array.Length; i++)
                {
                    string str2 = array[i];
                    list.Add("'" + str2 + "'");
                }
                System.Data.DataSet orderGoods = OrderHelper.GetOrderGoods(string.Join(",", list.ToArray()));
                System.Text.StringBuilder builder = new System.Text.StringBuilder();
                builder.AppendLine("<html><head><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\"></head><body>");
                builder.AppendLine("<table cellspacing=\"0\" cellpadding=\"5\" rules=\"all\" border=\"1\">");
                builder.AppendLine("<caption style='text-align:center;'>配货单(仓库拣货表)</caption>");
                builder.AppendLine("<tr style=\"font-weight: bold; white-space: nowrap;\">");
                builder.AppendLine("<td>订单单号</td>");
                builder.AppendLine("<td>商品名称</td>");
                builder.AppendLine("<td>货号</td>");
                builder.AppendLine("<td>规格</td>");
                builder.AppendLine("<td>拣货数量</td>");
                builder.AppendLine("<td>现库存数</td>");
                builder.AppendLine("<td>备注</td>");
                builder.AppendLine("</tr>");
                foreach (System.Data.DataRow row in orderGoods.Tables[0].Rows)
                {
                    builder.AppendLine("<tr>");
                    builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["OrderId"] + "</td>");
                    builder.AppendLine("<td>" + row["ProductName"] + "</td>");
                    builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["SKU"] + "</td>");
                    builder.AppendLine("<td>" + row["SKUContent"] + "</td>");
                    builder.AppendLine("<td>" + row["ShipmentQuantity"] + "</td>");
                    builder.AppendLine("<td>" + row["Stock"] + "</td>");
                    builder.AppendLine("<td>" + row["Remark"] + "</td>");
                    builder.AppendLine("</tr>");
                }
                builder.AppendLine("</table>");
                builder.AppendLine("</body></html>");
                base.Response.Clear();
                base.Response.Buffer = false;
                base.Response.Charset = "GB2312";
                base.Response.AppendHeader("Content-Disposition", "attachment;filename=ordergoods_" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls");
                base.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
                base.Response.ContentType = "application/ms-excel";
                this.EnableViewState = false;
                base.Response.Write(builder.ToString());
                base.Response.End();
            }
        }
        private void btnProductGoods_Click(object sender, System.EventArgs e)
        {
            string str = "";
            if (!string.IsNullOrEmpty(base.Request["CheckBoxGroup"]))
            {
                str = base.Request["CheckBoxGroup"];
            }
            if (str.Length <= 0)
            {
                this.ShowMsg("请选要下载配货表的订单", false);
            }
            else
            {
                System.Collections.Generic.List<string> list = new System.Collections.Generic.List<string>();
                string[] array = str.Split(new char[]
                {
                    ','
                });
                for (int i = 0; i < array.Length; i++)
                {
                    string str2 = array[i];
                    list.Add("'" + str2 + "'");
                }
                System.Data.DataSet productGoods = OrderHelper.GetProductGoods(string.Join(",", list.ToArray()));
                System.Text.StringBuilder builder = new System.Text.StringBuilder();
                builder.AppendLine("<html><head><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\"></head><body>");
                builder.AppendLine("<table cellspacing=\"0\" cellpadding=\"5\" rules=\"all\" border=\"1\">");
                builder.AppendLine("<caption style='text-align:center;'>配货单(仓库拣货表)</caption>");
                builder.AppendLine("<tr style=\"font-weight: bold; white-space: nowrap;\">");
                builder.AppendLine("<td>商品名称</td>");
                builder.AppendLine("<td>货号</td>");
                builder.AppendLine("<td>规格</td>");
                builder.AppendLine("<td>拣货数量</td>");
                builder.AppendLine("<td>现库存数</td>");
                builder.AppendLine("</tr>");
                foreach (System.Data.DataRow row in productGoods.Tables[0].Rows)
                {
                    builder.AppendLine("<tr>");
                    builder.AppendLine("<td>" + row["ProductName"] + "</td>");
                    builder.AppendLine("<td style=\"vnd.ms-excel.numberformat:@\">" + row["SKU"] + "</td>");
                    builder.AppendLine("<td>" + row["SKUContent"] + "</td>");
                    builder.AppendLine("<td>" + row["ShipmentQuantity"] + "</td>");
                    builder.AppendLine("<td>" + row["Stock"] + "</td>");
                    builder.AppendLine("</tr>");
                }
                builder.AppendLine("</table>");
                builder.AppendLine("</body></html>");
                base.Response.Clear();
                base.Response.Buffer = false;
                base.Response.Charset = "GB2312";
                base.Response.AppendHeader("Content-Disposition", "attachment;filename=productgoods_" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls");
                base.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
                base.Response.ContentType = "application/ms-excel";
                this.EnableViewState = false;
                base.Response.Write(builder.ToString());
                base.Response.End();
            }
        }

        private void dlstOrders_ItemDataBound(object obj, DataListItemEventArgs dataListItemEventArg)
        {
            bool flag;
            if (dataListItemEventArg.Item.ItemType == ListItemType.Item || dataListItemEventArg.Item.ItemType == ListItemType.AlternatingItem)
            {
                OrderStatus orderStatu = (OrderStatus)DataBinder.Eval(dataListItemEventArg.Item.DataItem, "OrderStatus");
                string str = "";
                if (!(DataBinder.Eval(dataListItemEventArg.Item.DataItem, "Gateway") is DBNull))
                {
                    str = (string)DataBinder.Eval(dataListItemEventArg.Item.DataItem, "Gateway");
                }
                int num = (DataBinder.Eval(dataListItemEventArg.Item.DataItem, "GroupBuyId")) != DBNull.Value ? (int)DataBinder.Eval(dataListItemEventArg.Item.DataItem, "GroupBuyId") : 0;
                HyperLink hyperLink = (HyperLink)dataListItemEventArg.Item.FindControl("lkbtnEditPrice");
                Label label = (Label)dataListItemEventArg.Item.FindControl("lkbtnSendGoods");
                ImageLinkButton imageLinkButton = (ImageLinkButton)dataListItemEventArg.Item.FindControl("lkbtnPayOrder");
                ImageLinkButton imageLinkButton1 = (ImageLinkButton)dataListItemEventArg.Item.FindControl("lkbtnConfirmOrder");
                Literal literal = (Literal)dataListItemEventArg.Item.FindControl("litCloseOrder");
                HtmlAnchor htmlAnchor = (HtmlAnchor)dataListItemEventArg.Item.FindControl("lkbtnCheckRefund");
                HtmlAnchor htmlAnchor1 = (HtmlAnchor)dataListItemEventArg.Item.FindControl("lkbtnCheckReturn");
                HtmlAnchor htmlAnchor2 = (HtmlAnchor)dataListItemEventArg.Item.FindControl("lkbtnCheckReplace");
                if (orderStatu == OrderStatus.WaitBuyerPay)
                {
                    hyperLink.Visible = true;
                    literal.Visible = true;
                    if (str != "hishop.plugins.payment.podrequest")
                    {
                        imageLinkButton.Visible = true;
                    }
                }
                if (orderStatu == OrderStatus.ApplyForRefund)
                {
                    htmlAnchor.Visible = true;
                }
                if (orderStatu == OrderStatus.ApplyForReturns)
                {
                    htmlAnchor1.Visible = true;
                }
                if (orderStatu == OrderStatus.ApplyForReplacement)
                {
                    htmlAnchor2.Visible = true;
                }
                if (num <= 0)
                {
                    Label label1 = label;
                    if (orderStatu == OrderStatus.BuyerAlreadyPaid)
                    {
                        flag = true;
                    }
                    else
                    {
                        flag = (orderStatu != OrderStatus.WaitBuyerPay ? false : str == "hishop.plugins.payment.podrequest");
                    }
                    label1.Visible = flag;
                }
                else
                {
                    GroupBuyStatus groupBuyStatu = (GroupBuyStatus)DataBinder.Eval(dataListItemEventArg.Item.DataItem, "GroupBuyStatus");
                    label.Visible = (orderStatu != OrderStatus.BuyerAlreadyPaid ? false : groupBuyStatu == GroupBuyStatus.Success);
                }
                imageLinkButton1.Visible = orderStatu == OrderStatus.SellerAlreadySent;
            }
        }

        private void btnSendGoods_Click(object sender, System.EventArgs e)
        {
            string str = "";
            if (!string.IsNullOrEmpty(base.Request["CheckBoxGroup"]))
            {
                str = base.Request["CheckBoxGroup"];
            }
            if (str.Length <= 0)
            {
                this.ShowMsg("请选要发货的订单", false);
            }
            else
            {
                this.Page.Response.Redirect(Globals.GetAdminAbsolutePath("/Sales/BatchSendOrderGoods.aspx?OrderIds=" + str));
            }
        }



        private void BindOrders()
        {
            OrderQuery orderQuery = this.GetOrderQuery();
            DbQueryResult orders = OrderHelper.GetOrders(orderQuery);
            this.dlstOrders.DataSource = orders.Data;
            this.dlstOrders.DataBind();
            this.pager.TotalRecords = orders.TotalRecords;
            this.pager1.TotalRecords = orders.TotalRecords;
            this.txtUserName.Text = orderQuery.UserName;
            this.txtOrderId.Text = orderQuery.OrderId;
            this.txtProductName.Text = orderQuery.ProductName;
            this.txtShopTo.Text = orderQuery.ShipTo;
            this.calendarStartDate.SelectedDate = orderQuery.StartDate;
            this.calendarEndDate.SelectedDate = orderQuery.EndDate;
            this.lblStatus.Text = orderQuery.Status.ToString();
            this.shippingModeDropDownList.SelectedValue = orderQuery.ShippingModeId;
            if (orderQuery.IsPrinted.HasValue)
            {
                this.ddlIsPrinted.SelectedValue = orderQuery.IsPrinted.Value.ToString();
            }
            if (orderQuery.RegionId.HasValue)
            {
                this.dropRegion.SetSelectedRegionId(orderQuery.RegionId);
            }
        }

        private OrderQuery GetOrderQuery()
        {
            OrderQuery query = new OrderQuery();
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["OrderId"]))
            {
                query.OrderId = Globals.UrlDecode(this.Page.Request.QueryString["OrderId"]);
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["ProductName"]))
            {
                query.ProductName = Globals.UrlDecode(this.Page.Request.QueryString["ProductName"]);
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["ShipTo"]))
            {
                query.ShipTo = Globals.UrlDecode(this.Page.Request.QueryString["ShipTo"]);
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["UserName"]))
            {
                query.UserName = Globals.UrlDecode(this.Page.Request.QueryString["UserName"]);
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["StartDate"]))
            {
                query.StartDate = new System.DateTime?(System.DateTime.Parse(this.Page.Request.QueryString["StartDate"]));
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["GroupBuyId"]))
            {
                query.GroupBuyId = new int?(int.Parse(this.Page.Request.QueryString["GroupBuyId"]));
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["EndDate"]))
            {
                query.EndDate = new System.DateTime?(System.DateTime.Parse(this.Page.Request.QueryString["EndDate"]));
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["OrderStatus"]))
            {
                int num = 0;
                if (int.TryParse(this.Page.Request.QueryString["OrderStatus"], out num))
                {
                    query.Status = (OrderStatus)num;
                }
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["IsPrinted"]))
            {
                int num2 = 0;
                if (int.TryParse(this.Page.Request.QueryString["IsPrinted"], out num2))
                {
                    query.IsPrinted = new int?(num2);
                }
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["ModeId"]))
            {
                int num3 = 0;
                if (int.TryParse(this.Page.Request.QueryString["ModeId"], out num3))
                {
                    query.ShippingModeId = new int?(num3);
                }
            }
            int num4;
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["region"]) && int.TryParse(this.Page.Request.QueryString["region"], out num4))
            {
                query.RegionId = new int?(num4);
            }
            int num5;
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["UserId"]) && int.TryParse(this.Page.Request.QueryString["UserId"], out num5))
            {
                query.UserId = new int?(num5);
            }
            int result = 0;
            if (int.TryParse(base.Request.QueryString["orderType"], out result) && result > 0)
            {
                query.Type = new OrderQuery.OrderType?((OrderQuery.OrderType)result);
            }
            query.PageIndex = this.pager.PageIndex;
            query.PageSize = this.pager.PageSize;
            query.SortBy = "OrderDate";
            query.SortOrder = SortAction.Desc;
            return query;
        }

        private void ReloadOrders(bool isSearch)
        {
            NameValueCollection queryStrings = new NameValueCollection();
            queryStrings.Add("UserName", this.txtUserName.Text);
            queryStrings.Add("OrderId", this.txtOrderId.Text);
            queryStrings.Add("ProductName", this.txtProductName.Text);
            queryStrings.Add("ShipTo", this.txtShopTo.Text);
            queryStrings.Add("PageSize", this.pager.PageSize.ToString());
            queryStrings.Add("OrderType", this.OrderFromList.SelectedValue);
            queryStrings.Add("OrderStatus", this.lblStatus.Text);
            if (this.calendarStartDate.SelectedDate.HasValue)
            {
                queryStrings.Add("StartDate", this.calendarStartDate.SelectedDate.Value.ToString());
            }
            if (this.calendarEndDate.SelectedDate.HasValue)
            {
                queryStrings.Add("EndDate", this.calendarEndDate.SelectedDate.Value.ToString());
            }
            if (!isSearch)
            {
                queryStrings.Add("pageIndex", this.pager.PageIndex.ToString());
            }
            if (!string.IsNullOrEmpty(this.Page.Request.QueryString["GroupBuyId"]))
            {
                queryStrings.Add("GroupBuyId", this.Page.Request.QueryString["GroupBuyId"]);
            }
            if (this.shippingModeDropDownList.SelectedValue.HasValue)
            {
                queryStrings.Add("ModeId", this.shippingModeDropDownList.SelectedValue.Value.ToString());
            }
            if (!string.IsNullOrEmpty(this.ddlIsPrinted.SelectedValue))
            {
                queryStrings.Add("IsPrinted", this.ddlIsPrinted.SelectedValue);
            }
            if (this.dropRegion.GetSelectedRegionId().HasValue)
            {
                queryStrings.Add("region", this.dropRegion.GetSelectedRegionId().Value.ToString());
            }
            base.ReloadPage(queryStrings);
        }
        private void SetOrderStatusLink()
        {
            string format = Globals.ApplicationPath + "/Admin/sales/ManageOrder.aspx?orderStatus={0}";
            this.hlinkAllOrder.NavigateUrl = string.Format(format, 0);
            this.hlinkNotPay.NavigateUrl = string.Format(format, 1);
            this.hlinkYetPay.NavigateUrl = string.Format(format, 2);
            this.hlinkSendGoods.NavigateUrl = string.Format(format, 3);
            this.hlinkClose.NavigateUrl = string.Format(format, 4);
            this.hlinkTradeFinished.NavigateUrl = string.Format(format, 5);
            this.hlinkHistory.NavigateUrl = string.Format(format, 99);
        }

        private void btnRemark_Click(object sender, System.EventArgs e)
        {
            if (this.txtRemark.Text.Length > 300)
            {
                this.ShowMsg("备忘录长度限制在300个字符以内", false);
            }
            else
            {
                Regex regex = new Regex("^(?!_)(?!.*?_$)(?!-)(?!.*?-$)[a-zA-Z0-9_一-龥-]+$");
                if (!regex.IsMatch(this.txtRemark.Text))
                {
                    this.ShowMsg("备忘录只能输入汉字,数字,英文,下划线,减号,不能以下划线、减号开头或结尾", false);
                }
                else
                {
                    OrderInfo orderInfo = OrderHelper.GetOrderInfo(this.hidOrderId.Value);
                    orderInfo.OrderId = this.hidOrderId.Value;
                    if (this.orderRemarkImageForRemark.SelectedItem != null)
                    {
                        orderInfo.ManagerMark = this.orderRemarkImageForRemark.SelectedValue;
                    }
                    orderInfo.ManagerRemark = Globals.HtmlEncode(this.txtRemark.Text);
                    if (OrderHelper.SaveRemark(orderInfo))
                    {
                        this.BindOrders();
                        this.ShowMsg("保存备忘录成功", true);
                    }
                    else
                    {
                        this.ShowMsg("保存失败", false);
                    }
                }
            }
        }

        protected void btnAcceptRefund_Click(object sender, EventArgs e)
        {
            string userName = ManagerHelper.GetCurrentManager().UserName;
            if (RefundHelper.EnsureRefund(OrderHelper.GetOrderInfo(this.hidOrderId.Value).OrderId, userName, this.hidAdminRemark.Value, int.Parse(this.hidRefundType.Value), true))
            {
                this.BindOrders();
                this.ShowMsg("成功的确认了订单退款", true);
            }
        }

        protected void btnSearchButton_Click(object sender, EventArgs e)
        {
            this.ReloadOrders(true);
        }

        protected void dlstOrders_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            bool flag = false;
            OrderInfo orderInfo = OrderHelper.GetOrderInfo(e.CommandArgument.ToString());
            if (orderInfo != null)
            {
                if (e.CommandName == "CONFIRM_PAY" && orderInfo.CheckAction(OrderActions.SELLER_CONFIRM_PAY))
                {
                    int groupBuyId = orderInfo.GroupBuyId;
                    if (!OrderHelper.ConfirmPay(orderInfo))
                    {
                        this.ShowMsg("确认订单收款失败", false);
                        return;
                    }
                    DebitNoteInfo debitNoteInfo = new DebitNoteInfo();

                    debitNoteInfo.NoteId = Globals.GetGenerateId();
                    debitNoteInfo.OrderId = e.CommandArgument.ToString();
                    debitNoteInfo.Operator = ManagerHelper.GetCurrentManager().UserName;
                    debitNoteInfo.Remark = string.Concat("后台", debitNoteInfo.Operator, "收款成功");

                    OrderHelper.SaveDebitNote(debitNoteInfo);
                    if (orderInfo.GroupBuyId > 0)
                    { }
                    this.BindOrders();
                    orderInfo.OnPayment();
                    this.ShowMsg("成功的确认了订单收款", true);
                    return;
                }
                if (e.CommandName == "FINISH_TRADE" && orderInfo.CheckAction(OrderActions.SELLER_FINISH_TRADE))
                {
                    Dictionary<string, LineItemInfo> lineItems = orderInfo.LineItems;
                    LineItemInfo lineItemInfo = new LineItemInfo();
                    foreach (KeyValuePair<string, LineItemInfo> lineItem in lineItems)
                    {
                        lineItemInfo = lineItem.Value;
                        if (lineItemInfo.OrderItemsStatus != OrderStatus.ApplyForRefund && lineItemInfo.OrderItemsStatus != OrderStatus.ApplyForReturns)
                        {
                            continue;
                        }
                        flag = true;
                    }
                    if (!flag)
                    {
                        if (!OrderHelper.ConfirmOrderFinish(orderInfo))
                        {
                            this.ShowMsg("完成订单失败", false);
                            return;
                        }
                        this.BindOrders();
                        DistributorsBrower.UpdateCalculationCommission(orderInfo);
                        foreach (LineItemInfo value in orderInfo.LineItems.Values)
                        {
                            if (value.OrderItemsStatus.ToString() != OrderStatus.SellerAlreadySent.ToString())
                            {
                                continue;
                            }
                            RefundHelper.UpdateOrderGoodStatu(orderInfo.OrderId, value.SkuId, 5);
                        }
                        this.ShowMsg("成功的完成了该订单", true);
                        return;
                    }
                    this.ShowMsg("订单中商品有退货(款)不允许完成!", false);
                }
            }
        }

        protected void lkbtnDeleteCheck_Click(object sender, System.EventArgs e)
        {
            string str = "";
            if (!string.IsNullOrEmpty(base.Request["CheckBoxGroup"]))
            {
                str = base.Request["CheckBoxGroup"];
            }
            if (str.Length <= 0)
            {
                this.ShowMsg("请选要删除的订单", false);
            }
            else
            {
                int num = OrderHelper.DeleteOrders("'" + str.Replace(",", "','") + "'");
                this.BindOrders();
                this.ShowMsg(string.Format("成功删除了{0}个订单", num), true);
            }
        }


        protected void Page_Load(object sender, EventArgs e)
		{
			int num;
			string str;
			string str1;
			this.Reurl = base.Request.Url.ToString();
			if (!this.Reurl.Contains("?"))
			{
				ManageOrder manageOrder = this;
				manageOrder.Reurl = string.Concat(manageOrder.Reurl, "?pageindex=1");
			}
			this.Reurl = Regex.Replace(this.Reurl, @"&t=(\d+)", "");
			this.Reurl = Regex.Replace(this.Reurl, @"(\?)t=(\d+)", "?");
			if ((string.IsNullOrEmpty(base.Request["isCallback"]) ? false : base.Request["isCallback"] == "true"))
			{
				if (string.IsNullOrEmpty(base.Request["ReturnsId"]))
				{
					base.Response.Write("{\"Status\":\"0\"}");
					base.Response.End();
					return;
				}
				OrderInfo orderInfo = OrderHelper.GetOrderInfo(base.Request["orderId"]);
				StringBuilder stringBuilder = new StringBuilder();
				if (base.Request["type"] != "refund")
				{
					num = 0;
					str = "";
				}
				else
				{
					RefundHelper.GetRefundType(base.Request["orderId"], out num, out str);
				}
				str1 = (num != 1 ? "银行转帐" : "退到预存款");
				stringBuilder.AppendFormat(",\"OrderTotal\":\"{0}\"", Globals.FormatMoney(orderInfo.GetTotal()));
				if (base.Request["type"] != "replace")
				{
					stringBuilder.AppendFormat(",\"RefundType\":\"{0}\"", num);
					stringBuilder.AppendFormat(",\"RefundTypeStr\":\"{0}\"", str1);
				}
				stringBuilder.AppendFormat(",\"Contacts\":\"{0}\"", orderInfo.ShipTo);
				stringBuilder.AppendFormat(",\"Email\":\"{0}\"", orderInfo.EmailAddress);
				stringBuilder.AppendFormat(",\"Telephone\":\"{0}\"", string.Concat(orderInfo.TelPhone, " "), orderInfo.CellPhone.Trim());
				stringBuilder.AppendFormat(",\"Address\":\"{0}\"", orderInfo.Address);
				stringBuilder.AppendFormat(",\"Remark\":\"{0}\"", str.Replace(",", ""));
				stringBuilder.AppendFormat(",\"PostCode\":\"{0}\"", orderInfo.ZipCode);
				stringBuilder.AppendFormat(",\"GroupBuyId\":\"{0}\"", (orderInfo.GroupBuyId > 0 ? orderInfo.GroupBuyId : 0));
				base.Response.Clear();
				base.Response.ContentType = "application/json";
				base.Response.Write(string.Concat("{\"Status\":\"1\"", stringBuilder.ToString(), "}"));
				base.Response.End();
			}
			this.btnAcceptRefund.Click += new EventHandler(this.btnAcceptRefund_Click);
			this.btnRefuseRefund.Click += new EventHandler(this.btnRefuseRefund_Click);
			this.dlstOrders.ItemDataBound += new DataListItemEventHandler(this.dlstOrders_ItemDataBound);
			this.btnSearchButton.Click += new EventHandler(this.btnSearchButton_Click);
			this.dlstOrders.ItemCommand += new DataListCommandEventHandler(this.dlstOrders_ItemCommand);
			this.btnRemark.Click += new EventHandler(this.btnRemark_Click);
			this.btnCloseOrder.Click += new EventHandler(this.btnCloseOrder_Click);
			this.lkbtnDeleteCheck.Click += new EventHandler(this.lkbtnDeleteCheck_Click);
			this.btnProductGoods.Click += new EventHandler(this.btnProductGoods_Click);
			this.btnOrderGoods.Click += new EventHandler(this.btnOrderGoods_Click);
			if (!this.Page.IsPostBack)
			{
				this.shippingModeDropDownList.DataBind();
				this.ddlIsPrinted.Items.Clear();
				this.ddlIsPrinted.Items.Add(new ListItem("全部", string.Empty));
				this.ddlIsPrinted.Items.Add(new ListItem("已打印", "1"));
				this.ddlIsPrinted.Items.Add(new ListItem("未打印", "0"));
				this.SetOrderStatusLink();
				this.bindOrderType();
				this.BindOrders();
			}
			CheckBoxColumn.RegisterClientCheckEvents(this.Page, this.Page.Form.ClientID);
		}
    }
}