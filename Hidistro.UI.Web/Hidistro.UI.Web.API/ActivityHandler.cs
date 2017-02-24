using Hidistro.ControlPanel.Commodities;
using Hidistro.ControlPanel.Promotions;
using Hidistro.ControlPanel.Store;
using Hidistro.Entities.Commodities;
using Hidistro.Entities.Members;
using Hidistro.Entities.Orders;
using Hidistro.Entities.Sales;
using Hidistro.SaleSystem.Vshop;
using Hidistro.UI.SaleSystem.CodeBehind;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using WxPayAPI;
namespace Hidistro.UI.Web.API
{
    /*
     活动相关的无刷新操作
     */
    public class ActivityHandler : System.Web.IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        private IDictionary<string, string> jsondict = new Dictionary<string, string>();

        
        public void ProcessRequest(System.Web.HttpContext context)
        {
            string text = context.Request["action"];
            switch (text)
            {
                case "goSign":
                    this.goSign(context);
                    break;
                case "getDiscountTotal":
                    this.getDiscountTotal(context);
                    break;
            }
        }

        /// <summary>
        /// 进行签到操作
        /// </summary>
        /// <param name="context"></param>
        private void goSign(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            string getPoints = PromoteHelper.GoSign(currentMember).ToString();


            context.Response.Write("{\"success\":true,\"points\":\"" + getPoints + "\"}");

        }

        /// <summary>
        /// 满减活动等打折活动
        /// </summary>
        /// <param name="order"></param>
        /// <param name="ActivitiesId"></param>
        /// <param name="ActivitiesName"></param>
        /// <returns></returns>
        public void getDiscountTotal(System.Web.HttpContext context)
        {
            ShoppingCartInfo shoppingCart;
            shoppingCart = ShoppingCartProcessor.GetShoppingCart(ManagerHelper.GetCurrentManager().UserId);
            OrderInfo order = ShoppingProcessor.ConvertShoppingCartToOrder(shoppingCart, false, false, false);
            if (null == order)
            {
                context.Response.Write("{\"success\":false,\"discount\":\"" + 0 + "\"}");
                return;
            } 

            decimal num = new decimal(0);
            decimal num1 = new decimal(0);
            decimal num2 = new decimal(0);
            LineItemInfo lineItemInfo = new LineItemInfo();

            System.Data.DataTable type = ProductBrowser.GetType();
            for (int i = 0; i < type.Rows.Count; i++)
            {
                string str = "";
                string str1 = "";
                decimal subTotal = new decimal(0);
                foreach (KeyValuePair<string, LineItemInfo> lineItem in order.LineItems)
                {
                    lineItemInfo = lineItem.Value;
                    if (string.IsNullOrEmpty(lineItemInfo.MainCategoryPath))
                    {
                        continue;
                    }
                    int num3 = int.Parse(type.Rows[i]["ActivitiesType"].ToString());
                    string mainCategoryPath = lineItemInfo.MainCategoryPath;
                    char[] chrArray = new char[] { '|' };
                    if (num3 == int.Parse(mainCategoryPath.Split(chrArray)[0].ToString()))
                    {
                        subTotal = subTotal + lineItemInfo.GetSubTotal();
                    }
                    if (int.Parse(type.Rows[i]["ActivitiesType"].ToString()) != 0)
                    {
                        continue;
                    }
                    subTotal = subTotal + lineItemInfo.GetSubTotal();
                }
                if (subTotal != new decimal(0))
                {
                    //获取所有活动列表
                    System.Data.DataTable allFull = ProductBrowser.GetAllFull(int.Parse(type.Rows[i]["ActivitiesType"].ToString()));



                    if (allFull.Rows.Count > 0)//如果存在活动时进入
                    {
                        //2017-2 如果活动实体类包含了门店id,那么该活动仅对当前门店生效,
                        
                        int currentOrderStoreId =Convert.ToInt32(context.Request["storeid"]);//当前订单的门店id
                        int currentActivityStoreId = 0;//当前活动的门店id
                        int num0=0;

                        int num4 = 0;
                        while (true)
                        {
                            if (num4 >= allFull.Rows.Count)
                            {
                                break;
                            }

                            else if (subTotal >= decimal.Parse(allFull.Rows[allFull.Rows.Count - 1]["MeetMoney"].ToString()))
                            {
                                num1 = decimal.Parse(allFull.Rows[allFull.Rows.Count - 1]["MeetMoney"].ToString());
                                num = decimal.Parse(allFull.Rows[allFull.Rows.Count - 1]["ReductionMoney"].ToString());
                                currentActivityStoreId =int.TryParse(allFull.Rows[allFull.Rows.Count - 1]["storeid"].ToString(),out num0)?Convert.ToInt32(allFull.Rows[allFull.Rows.Count - 1]["storeid"]):num0;
                                str = string.Concat(allFull.Rows[allFull.Rows.Count - 1]["ActivitiesId"].ToString(), ",");
                                str1 = string.Concat(allFull.Rows[allFull.Rows.Count - 1]["ActivitiesName"].ToString(), ",");
                                break;
                            }
                            else if (subTotal <= decimal.Parse(allFull.Rows[0]["MeetMoney"].ToString()))
                            {
                                num1 = decimal.Parse(allFull.Rows[0]["MeetMoney"].ToString());
                                num = num + decimal.Parse(allFull.Rows[0]["ReductionMoney"].ToString());
                                currentActivityStoreId = int.TryParse(allFull.Rows[allFull.Rows.Count - 1]["storeid"].ToString(), out num0) ? Convert.ToInt32(allFull.Rows[allFull.Rows.Count - 1]["storeid"]) : num0;
                                str = string.Concat(allFull.Rows[0]["ActivitiesId"].ToString(), ",");
                                str1 = string.Concat(allFull.Rows[0]["ActivitiesName"].ToString(), ",");
                                break;
                            }
                            else
                            {
                                if (subTotal >= decimal.Parse(allFull.Rows[num4]["MeetMoney"].ToString()))
                                {
                                    num1 = decimal.Parse(allFull.Rows[num4]["MeetMoney"].ToString());
                                    num = decimal.Parse(allFull.Rows[num4]["ReductionMoney"].ToString());
                                    currentActivityStoreId = int.TryParse(allFull.Rows[allFull.Rows.Count - 1]["storeid"].ToString(), out num0) ? Convert.ToInt32(allFull.Rows[allFull.Rows.Count - 1]["storeid"]) : num0;
                                    str = string.Concat(allFull.Rows[num4]["ActivitiesId"].ToString(), ",");
                                    str1 = string.Concat(allFull.Rows[num4]["ActivitiesName"].ToString(), ",");
                                }
                                num4++;
                            }
                        }
                        if (subTotal >= num1)
                        {
                            //如果当前门店id不等于当前活动门店id,返回0元,活动id与活动名为null
                            if (currentOrderStoreId != 0 && currentOrderStoreId != currentActivityStoreId)
                            {
                                context.Response.Write("{\"success\":false,\"discount\":\"" + 0 + "\"}");
                                return ;
                            }

                            num2 = num2 + num;
                            foreach (KeyValuePair<string, LineItemInfo> keyValuePair in order.LineItems)
                            {
                                LineItemInfo value = keyValuePair.Value;
                                if (string.IsNullOrEmpty(value.MainCategoryPath))
                                {
                                    continue;
                                }
                                int num5 = int.Parse(type.Rows[i]["ActivitiesType"].ToString());
                                string mainCategoryPath1 = value.MainCategoryPath;
                                char[] chrArray1 = new char[] { '|' };
                                if (num5 != int.Parse(mainCategoryPath1.Split(chrArray1)[0].ToString()) && int.Parse(type.Rows[i]["ActivitiesType"].ToString()) != 0)
                                {
                                    continue;
                                }
                                value.PromotionName = str1.Substring(0, str1.Length - 1);
                                value.PromotionId = int.Parse(str.Substring(0, str.Length - 1));
                            }
                        }
                    }
                }
            }
            context.Response.Write("{\"success\":true,\"discount\":\"" + num2.ToString("F0") + "\"}");
            return;
        }





    }
}
