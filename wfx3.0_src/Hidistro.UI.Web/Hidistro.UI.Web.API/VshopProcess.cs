using Hidistro.Core;
using Hidistro.Core.Entities;
using Hidistro.Entities;
using Hidistro.Entities.Comments;
using Hidistro.Entities.Commodities;
using Hidistro.Entities.Members;
using Hidistro.Entities.Orders;
using Hidistro.Entities.Promotions;
using Hidistro.Entities.Sales;
using Hidistro.Entities.VShop;
using Hidistro.Messages;
using Hidistro.SaleSystem.Vshop;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
namespace Hidistro.UI.Web.API
{
    public class VshopProcess : System.Web.IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


        private void AddCommissions(HttpContext httpContext)
        {
            httpContext.Response.ContentType = "text/json";
            string str = "";
            if (DistributorsBrower.IsExitsCommionsRequest())
            {
                str = "{\"success\":false,\"msg\":\"您的申请正在审核中！\"}";
            }
            else if (this.CheckAddCommissions(httpContext, ref str))
            {
                string str1 = httpContext.Request["account"].Trim();
                decimal num = decimal.Parse(httpContext.Request["commissionmoney"].Trim());
                int num1 = 0;
                int.TryParse(httpContext.Request["requesttype"].Trim(), out num1);
                BalanceDrawRequestInfo balanceDrawRequestInfo = new BalanceDrawRequestInfo()
                {
                    MerchanCade = str1,
                    Amount = num,
                    RequesType = num1
                };
                str = (!DistributorsBrower.AddBalanceDrawRequest(balanceDrawRequestInfo) ? "{\"success\":false,\"msg\":\"真实姓名或手机号未填写！\"}" : "{\"success\":true,\"msg\":\"申请成功！\"}");
            }
            httpContext.Response.Write(str);
            httpContext.Response.End();
        }

        //private void AddCommissions(System.Web.HttpContext context)
        //{
        //    context.Response.ContentType = "text/json";
        //    string msg = "";
        //    if (this.CheckAddCommissions(context, ref msg))
        //    {
        //        string str2 = context.Request["account"].Trim();
        //        decimal num = decimal.Parse(context.Request["commissionmoney"].Trim());
        //        BalanceDrawRequestInfo balancerequestinfo = new BalanceDrawRequestInfo
        //        {
        //            MerchanCade = str2,
        //            Amount = num
        //        };
        //        if (DistributorsBrower.AddBalanceDrawRequest(balancerequestinfo))
        //        {
        //            msg = "{\"success\":true,\"msg\":\"申请成功！\"}";
        //        }
        //        else
        //        {
        //            msg = "{\"success\":false,\"msg\":\"真实姓名或手机号未填写！\"}";
        //        }
        //    }
        //    context.Response.Write(msg);
        //    context.Response.End();
        //}
        //public void AddDistributor(System.Web.HttpContext context)
        //{
        //    context.Response.ContentType = "text/plain";
        //    System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //    if (this.CheckRequestDistributors(context, sb))
        //    {
        //        DistributorsInfo distributors = new DistributorsInfo
        //        {
        //            RequestAccount = context.Request["acctount"].Trim(),
        //            StoreName = context.Request["stroename"].Trim(),
        //            StoreDescription = context.Request["descriptions"].Trim(),
        //            BackImage = context.Request["backimg"].Trim()
        //        };
        //        System.Web.HttpPostedFile file = context.Request.Files["logo"];
        //        distributors.Logo = "";
        //        if (file != null && !string.IsNullOrEmpty(file.FileName))
        //        {
        //            distributors.Logo = this.UploadFileImages(context, file);
        //        }
        //        if (DistributorsBrower.AddDistributors(distributors))
        //        {
        //            if (System.Web.HttpContext.Current.Request.Cookies["Vshop-Member"] != null)
        //            {
        //                string name = "Vshop-ReferralId";
        //                System.Web.HttpContext.Current.Response.Cookies[name].Expires = System.DateTime.Now.AddDays(-1.0);
        //                System.Web.HttpCookie cookie = new System.Web.HttpCookie(name)
        //                {
        //                    Value = Globals.GetCurrentMemberUserId().ToString(),
        //                    Expires = System.DateTime.Now.AddYears(10)
        //                };
        //                System.Web.HttpContext.Current.Response.Cookies.Add(cookie);
        //            }
        //            context.Response.Write("OK");
        //            context.Response.End();
        //        }
        //        else
        //        {
        //            context.Response.Write("添加失败");
        //            context.Response.End();
        //        }
        //    }
        //    else
        //    {
        //        context.Response.Write(sb.ToString() ?? "");
        //        context.Response.End();
        //    }
        //}

        //   private bool CheckRequestDistributors(System.Web.HttpContext context, System.Text.StringBuilder sb)
        //{
        //    bool result;
        //    if (string.IsNullOrEmpty(context.Request["stroename"]))
        //    {
        //        sb.AppendFormat("请输入店铺名称", new object[0]);
        //        result = false;
        //    }
        //    else
        //    {
        //        if (context.Request["stroename"].Length > 20)
        //        {
        //            sb.AppendFormat("请输入店铺名称字符不多于20个字符", new object[0]);
        //            result = false;
        //        }
        //        else
        //        {
        //            if (string.IsNullOrEmpty(context.Request["acctount"]))
        //            {
        //                sb.AppendFormat("请输入提现账号", new object[0]);
        //                result = false;
        //            }
        //            else
        //            {
        //                if (string.IsNullOrEmpty(context.Request["backimg"]))
        //                {
        //                    sb.AppendFormat("请选择店铺背景", new object[0]);
        //                    result = false;
        //                }
        //                else
        //                {
        //                    if (!string.IsNullOrEmpty(context.Request["descriptions"]) && context.Request["descriptions"].Trim().Length > 30)
        //                    {
        //                        sb.AppendFormat("店铺描述字不能多于30个字", new object[0]);
        //                        result = false;
        //                    }
        //                    else
        //                    {
        //                        result = true;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    return result;
        //}

        private bool CheckRequestDistributors(HttpContext httpContext, StringBuilder stringBuilder)
        {

            if (string.IsNullOrEmpty(httpContext.Request["stroename"]))
            {
                stringBuilder.AppendFormat("请输入店铺名称", new object[0]);
                return false;
            }

            if (httpContext.Request["stroename"].Length > 20)
            {
                stringBuilder.AppendFormat("请输入店铺名称字符不多于20个字符", new object[0]);
                return false;
            }

            if (string.IsNullOrEmpty(httpContext.Request["descriptions"]) || httpContext.Request["descriptions"].Trim().Length <= 30)
            {
                return true;
            }

            stringBuilder.AppendFormat("店铺描述字不能多于30个字", new object[0]);

            return false;

        }



        public void AddDistributor(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            StringBuilder stringBuilder = new StringBuilder();
            if (!this.CheckRequestDistributors(context, stringBuilder))
            {
                context.Response.Write(string.Concat("{\"success\":false,\"msg\":\"", stringBuilder.ToString(), "\"}"));
                return;
            }
            DistributorsInfo distributorsInfo = new DistributorsInfo()
            {
                RequestAccount = context.Request["acctount"].Trim(),
                StoreName = context.Request["stroename"].Trim(),
                StoreDescription = context.Request["descriptions"].Trim(),
                BackImage = context.Request["BackImage"].Trim(),
                Logo = context.Request["logo"].Trim(),
                DistriGradeId = DistributorGradeBrower.GetIsDefaultDistributorGradeInfo().GradeId
            };
            if (!DistributorsBrower.AddDistributors(distributorsInfo))
            {
                context.Response.Write("{\"success\":false,\"msg\":\"店铺名称已存在，请重新输入店铺名称\"}");
                return;
            }
            if (HttpContext.Current.Request.Cookies["Vshop-Member"] != null)
            {
                string str = "Vshop-ReferralId";
                HttpContext.Current.Response.Cookies[str].Expires = DateTime.Now.AddDays(-1);
                HttpCookie httpCookie = new HttpCookie(str)
                {
                    Value = Globals.GetCurrentMemberUserId().ToString(),
                    Expires = DateTime.Now.AddYears(10)
                };
                HttpContext.Current.Response.Cookies.Add(httpCookie);
            }
            context.Response.Write("{\"success\":true}");
        }


        //分销商下加商品
        private void DeleteDistributorProducts(System.Web.HttpContext context)
        {

            if (!string.IsNullOrEmpty(context.Request["Params"]))
            {
                string json = context.Request["Params"];

                JObject source = JObject.Parse(json);

                if (source.Count > 0)
                {
                    List<int> productIds = (from s in source.Values() select (int)s).ToList<int>();
                    DistributorsBrower.DeleteDistributorProductIds(productIds);
                    // DistributorsBrower.DeleteDistributorProductIds((
                    //    from s in source.Values()
                    //   select System.Convert.ToInt32(s)).ToList<int>());
                }

            }

            context.Response.Write("{\"success\":\"true\",\"msg\":\"保存成功\"}");

            context.Response.End();

        }

        //分销商上架商品
        private void AddDistributorProducts(System.Web.HttpContext context)
        {
            //无法将类型为“Newtonsoft.Json.Linq.JValue”的对象强制转换为类型“System.IConvertible”。

            if (!string.IsNullOrEmpty(context.Request["Params"]))
            {

                string json = context.Request["Params"];

                JObject source = JObject.Parse(json);

                if (source.Count > 0)
                {

                    List<int> productIds = (from s in source.Values() select (int)s).ToList<int>();

                    DistributorsBrower.AddDistributorProductId(productIds);

                }

            }

            context.Response.Write("{\"success\":\"true\",\"msg\":\"保存成功\"}");
            context.Response.End();
        }
        private void AddFavorite(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                context.Response.Write("{\"success\":false, \"msg\":\"请先登录才可以收藏商品\"}");
            }
            else
            {
                if (ProductBrowser.AddProductToFavorite(System.Convert.ToInt32(context.Request["ProductId"]), currentMember.UserId))
                {
                    context.Response.Write("{\"success\":true}");
                }
                else
                {
                    context.Response.Write("{\"success\":false, \"msg\":\"提交失败\"}");
                }
            }
        }
        private void AddProductConsultations(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            ProductConsultationInfo productConsultation = new ProductConsultationInfo
            {
                ConsultationDate = System.DateTime.Now,
                ConsultationText = context.Request["ConsultationText"],
                ProductId = System.Convert.ToInt32(context.Request["ProductId"]),
                UserEmail = currentMember.Email,
                UserId = currentMember.UserId,
                UserName = currentMember.UserName
            };
            if (ProductBrowser.InsertProductConsultation(productConsultation))
            {
                context.Response.Write("{\"success\":true}");
            }
            else
            {
                context.Response.Write("{\"success\":false, \"msg\":\"提交失败\"}");
            }
        }
        private void AddProductReview(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            int productId = System.Convert.ToInt32(context.Request["ProductId"]);
            int num2;
            int num3;
            ProductBrowser.LoadProductReview(productId, currentMember.UserId, out num2, out num3);
            if (num2 == 0)
            {
                context.Response.Write("{\"success\":false, \"msg\":\"您没有购买此商品(或此商品的订单尚未完成)，因此不能进行评论\"}");
            }
            else
            {
                if (num3 >= num2)
                {
                    context.Response.Write("{\"success\":false, \"msg\":\"您已经对此商品进行过评论(或此商品的订单尚未完成)，因此不能再次进行评论\"}");
                }
                else
                {
                    ProductReviewInfo review = new ProductReviewInfo
                    {
                        ReviewDate = System.DateTime.Now,
                        ReviewText = context.Request["ReviewText"],
                        ProductId = productId,
                        UserEmail = currentMember.Email,
                        UserId = currentMember.UserId,
                        UserName = currentMember.UserName
                    };
                    if (ProductBrowser.InsertProductReview(review))
                    {
                        context.Response.Write("{\"success\":true}");
                    }
                    else
                    {
                        context.Response.Write("{\"success\":false, \"msg\":\"提交失败\"}");
                    }
                }
            }
        }
        private void AddShippingAddress(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                context.Response.Write("{\"success\":false}");
            }
            else
            {
                ShippingAddressInfo shippingAddress = new ShippingAddressInfo
                {
                    Address = context.Request.Form["address"],
                    CellPhone = context.Request.Form["cellphone"],
                    ShipTo = context.Request.Form["shipTo"],
                    Zipcode = "12345",
                    IsDefault = true,
                    UserId = currentMember.UserId,
                    RegionId = System.Convert.ToInt32(context.Request.Form["regionSelectorValue"])
                };
                if (MemberProcessor.AddShippingAddress(shippingAddress) > 0)
                {
                    context.Response.Write("{\"success\":true}");
                }
                else
                {
                    context.Response.Write("{\"success\":false}");
                }
            }
        }
        private void AddSignUp(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            int activityid = System.Convert.ToInt32(context.Request["id"]);
            string str = System.Convert.ToString(context.Request["code"]);
            LotteryTicketInfo lotteryTicket = VshopBrowser.GetLotteryTicket(activityid);
            if (!string.IsNullOrEmpty(lotteryTicket.InvitationCode) && lotteryTicket.InvitationCode != str)
            {
                context.Response.Write("{\"success\":false, \"msg\":\"邀请码不正确\"}");
            }
            else
            {
                if (lotteryTicket.EndTime < System.DateTime.Now)
                {
                    context.Response.Write("{\"success\":false, \"msg\":\"活动已结束\"}");
                }
                else
                {
                    if (lotteryTicket.OpenTime < System.DateTime.Now)
                    {
                        context.Response.Write("{\"success\":false, \"msg\":\"报名已结束\"}");
                    }
                    else
                    {
                        if (VshopBrowser.GetUserPrizeRecord(activityid) == null)
                        {
                            PrizeRecordInfo model = new PrizeRecordInfo
                            {
                                ActivityID = activityid
                            };
                            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
                            model.UserID = currentMember.UserId;
                            model.UserName = currentMember.UserName;
                            model.IsPrize = true;
                            model.Prizelevel = "已报名";
                            model.PrizeTime = new System.DateTime?(System.DateTime.Now);
                            VshopBrowser.AddPrizeRecord(model);
                            context.Response.Write("{\"success\":true, \"msg\":\"报名成功\"}");
                        }
                        else
                        {
                            context.Response.Write("{\"success\":false, \"msg\":\"你已经报名了，请不要重复报名！\"}");
                        }
                    }
                }
            }
        }
        private void AddTicket(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            int activityid = System.Convert.ToInt32(context.Request["activityid"]);
            LotteryTicketInfo lotteryTicket = VshopBrowser.GetLotteryTicket(activityid);
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember != null && !lotteryTicket.GradeIds.Contains(currentMember.GradeId.ToString()))
            {
                context.Response.Write("{\"success\":false, \"msg\":\"您的会员等级不在此活动范内\"}");
            }
            else
            {
                if (lotteryTicket.EndTime < System.DateTime.Now)
                {
                    context.Response.Write("{\"success\":false, \"msg\":\"活动已结束\"}");
                }
                else
                {
                    if (System.DateTime.Now < lotteryTicket.OpenTime)
                    {
                        context.Response.Write("{\"success\":false, \"msg\":\"抽奖还未开始\"}");
                    }
                    else
                    {
                        if (VshopBrowser.GetCountBySignUp(activityid) < lotteryTicket.MinValue)
                        {
                            context.Response.Write("{\"success\":false, \"msg\":\"还未达到人数下限\"}");
                        }
                        else
                        {
                            PrizeRecordInfo userPrizeRecord = VshopBrowser.GetUserPrizeRecord(activityid);
                            try
                            {
                                if (!lotteryTicket.IsOpened)
                                {
                                    VshopBrowser.OpenTicket(activityid);
                                    userPrizeRecord = VshopBrowser.GetUserPrizeRecord(activityid);
                                }
                                else
                                {
                                    if (!string.IsNullOrWhiteSpace(userPrizeRecord.RealName) && !string.IsNullOrWhiteSpace(userPrizeRecord.CellPhone))
                                    {
                                        context.Response.Write("{\"success\":false, \"msg\":\"您已经抽过奖了\"}");
                                        return;
                                    }
                                }
                                if (userPrizeRecord == null || string.IsNullOrEmpty(userPrizeRecord.PrizeName))
                                {
                                    context.Response.Write("{\"success\":false, \"msg\":\"很可惜,你未中奖\"}");
                                    return;
                                }
                                if (!userPrizeRecord.PrizeTime.HasValue)
                                {
                                    userPrizeRecord.PrizeTime = new System.DateTime?(System.DateTime.Now);
                                    VshopBrowser.UpdatePrizeRecord(userPrizeRecord);
                                }
                            }
                            catch (System.Exception exception)
                            {
                                context.Response.Write("{\"success\":false, \"msg\":\"" + exception.Message + "\"}");
                                return;
                            }
                            context.Response.Write("{\"success\":true, \"msg\":\"恭喜你获得" + userPrizeRecord.Prizelevel + "\"}");
                        }
                    }
                }
            }
        }
        private void AddUserPrize(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            int result = 1;
            int.TryParse(context.Request["activityid"], out result);
            string str = context.Request["prize"];
            LotteryActivityInfo lotteryActivity = VshopBrowser.GetLotteryActivity(result);
            PrizeRecordInfo model = new PrizeRecordInfo
            {
                PrizeTime = new System.DateTime?(System.DateTime.Now),
                UserID = Globals.GetCurrentMemberUserId(),
                ActivityName = lotteryActivity.ActivityName,
                ActivityID = result,
                Prizelevel = str
            };
            string text = str;
            switch (text)
            {
                case "一等奖":
                    model.PrizeName = lotteryActivity.PrizeSettingList[0].PrizeName;
                    model.IsPrize = true;
                    goto IL_216;
                case "二等奖":
                    model.PrizeName = (model.PrizeName = lotteryActivity.PrizeSettingList[1].PrizeName);
                    model.IsPrize = true;
                    goto IL_216;
                case "三等奖":
                    model.PrizeName = lotteryActivity.PrizeSettingList[2].PrizeName;
                    model.IsPrize = true;
                    goto IL_216;
                case "四等奖":
                    model.PrizeName = lotteryActivity.PrizeSettingList[3].PrizeName;
                    model.IsPrize = true;
                    goto IL_216;
                case "五等奖":
                    model.PrizeName = lotteryActivity.PrizeSettingList[4].PrizeName;
                    model.IsPrize = true;
                    goto IL_216;
                case "六等奖":
                    model.PrizeName = lotteryActivity.PrizeSettingList[5].PrizeName;
                    model.IsPrize = true;
                    goto IL_216;
            }
            model.IsPrize = false;
        IL_216:
            VshopBrowser.AddPrizeRecord(model);
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.Append("{");
            builder.Append("\"Status\":\"OK\"");
            builder.Append("}");
            context.Response.Write(builder);
        }

        private bool CheckAddCommissions(HttpContext httpContext, ref string strPointers)
        {
            int num = 0;
            int.TryParse(httpContext.Request["requesttype"].Trim(), out num);
            if (num != 0)
            {
                num = 1;
            }
            if (num == 1 && string.IsNullOrEmpty(httpContext.Request["account"].Trim()))
            {
                strPointers = "{\"success\":false,\"msg\":\"支付宝账号不允许为空！\"}";
                return false;
            }
            if (string.IsNullOrEmpty(httpContext.Request["commissionmoney"].Trim()))
            {
                strPointers = "{\"success\":false,\"msg\":\"提现金额不允许为空！\"}";
                return false;
            }
            if (decimal.Parse(httpContext.Request["commissionmoney"].Trim()) <= new decimal(0))
            {
                strPointers = "{\"success\":false,\"msg\":\"提现金额必须大于0的纯数字！\"}";
                return false;
            }
            if (!(new System.Text.RegularExpressions.Regex("^[0-9]*[1-9][0-9]*$").IsMatch(httpContext.Request["commissionmoney"].Trim())))
            {
                strPointers = "{\"success\":false,\"msg\":\"请输入正整数！\"}";
                return false;
            }
            decimal num1 = new decimal(0);
            decimal.TryParse(SettingsManager.GetMasterSettings(false).MentionNowMoney, out num1);
            if (num1 > new decimal(0) && decimal.Parse(httpContext.Request["commissionmoney"].Trim()) < new decimal(0))
            {
                strPointers = string.Concat("{\"success\":false,\"msg\":\"提现金额必须大于等于", num1.ToString(), "元！\"}");
                return false;
            }
            DistributorsInfo currentDistributors = DistributorsBrower.GetCurrentDistributors();
            if (decimal.Parse(httpContext.Request["commissionmoney"].Trim()) <= currentDistributors.ReferralBlance)
            {
                return true;
            }
            strPointers = "{\"success\":false,\"msg\":\"提现金额必须为小于现有佣金余额！\"}";
            return false;
        }

        //private bool CheckAddCommissions(System.Web.HttpContext context, ref string msg)
        //{
        //    bool result2;
        //    if (string.IsNullOrEmpty(context.Request["account"].Trim()))
        //    {
        //        msg = "{\"success\":false,\"msg\":\"支付宝账号不允许为空！\"}";
        //        result2 = false;
        //    }
        //    else
        //    {
        //        if (string.IsNullOrEmpty(context.Request["commissionmoney"].Trim()))
        //        {
        //            msg = "{\"success\":false,\"msg\":\"提现金额不允许为空！\"}";
        //            result2 = false;
        //        }
        //        else
        //        {
        //            if (decimal.Parse(context.Request["commissionmoney"].Trim()) <= 0m)
        //            {
        //                msg = "{\"success\":false,\"msg\":\"提现金额必须大于0的纯数字！\"}";
        //                result2 = false;
        //            }
        //            else
        //            {
        //                decimal result = 0m;
        //                decimal.TryParse(SettingsManager.GetMasterSettings(false).MentionNowMoney, out result);
        //                if (result > 0m && decimal.Parse(context.Request["commissionmoney"].Trim()) % result != 0m)
        //                {
        //                    msg = "{\"success\":false,\"msg\":\"提现金额必须为" + result.ToString() + "的倍数！\"}";
        //                    result2 = false;
        //                }
        //                else
        //                {
        //                    DistributorsInfo currentDistributors = DistributorsBrower.GetCurrentDistributors();
        //                    if (decimal.Parse(context.Request["commissionmoney"].Trim()) > currentDistributors.ReferralBlance)
        //                    {
        //                        msg = "{\"success\":false,\"msg\":\"提现金额必须为小于现有佣金余额！\"}";
        //                        result2 = false;
        //                    }
        //                    else
        //                    {
        //                        result2 = true;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    return result2;
        //}
        private void CheckFavorite(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                context.Response.Write("{\"success\":false}");
            }
            else
            {
                if (ProductBrowser.ExistsProduct(System.Convert.ToInt32(context.Request["ProductId"]), currentMember.UserId))
                {
                    context.Response.Write("{\"success\":true}");
                }
                else
                {
                    context.Response.Write("{\"success\":false}");
                }
            }
        }

        private bool CheckUpdateDistributors(HttpContext httpContext, StringBuilder stringBuilder)
        {

            if (string.IsNullOrEmpty(httpContext.Request["stroename"]))
            {
                stringBuilder.Append("请输入店铺名称");
                return false;
            }

            if (httpContext.Request["stroename"].Length > 20)
            {
                stringBuilder.Append("请输入店铺名称字符不多于20个字符");
                return false;
            }

            if (string.IsNullOrEmpty(httpContext.Request["descriptions"]) || httpContext.Request["descriptions"].Trim().Length <= 30)
            {
                return true;
            }

            stringBuilder.Append("店铺描述字不能多于30个字");

            return false;

        }

        //private bool CheckUpdateDistributors(System.Web.HttpContext context, System.Text.StringBuilder sb)
        //{
        //    bool result;
        //    if (string.IsNullOrEmpty(context.Request["VDistributorInfo$txtstorename"]))
        //    {
        //        sb.AppendFormat("请输入店铺名称", new object[0]);
        //        result = false;
        //    }
        //    else
        //    {
        //        if (context.Request["VDistributorInfo$txtstorename"].Length > 20)
        //        {
        //            sb.AppendFormat("请输入店铺名称字符不多于20个字符", new object[0]);
        //            result = false;
        //        }
        //        else
        //        {
        //            if (string.IsNullOrEmpty(context.Request["VDistributorInfo$hdbackimg"]))
        //            {
        //                sb.AppendFormat("请选择店铺背景", new object[0]);
        //                result = false;
        //            }
        //            else
        //            {
        //                if (!string.IsNullOrEmpty(context.Request["VDistributorInfo$txtdescription"]) && context.Request["VDistributorInfo$txtdescription"].Trim().Length > 30)
        //                {
        //                    sb.AppendFormat("店铺描述字不能多于30个字", new object[0]);
        //                    result = false;
        //                }
        //                else
        //                {
        //                    result = true;
        //                }
        //            }
        //        }
        //    }
        //    return result;
        //}

        private void DelFavorite(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            if (ProductBrowser.DeleteFavorite(System.Convert.ToInt32(context.Request["favoriteId"])) == 1)
            {
                context.Response.Write("{\"success\":true}");
            }
            else
            {
                context.Response.Write("{\"success\":false, \"msg\":\"取消失败\"}");
            }
        }
        private void DelShippingAddress(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                context.Response.Write("{\"success\":false}");
            }
            else
            {
                int userId = currentMember.UserId;
                if (MemberProcessor.DelShippingAddress(System.Convert.ToInt32(context.Request.Form["shippingid"]), userId))
                {
                    context.Response.Write("{\"success\":true}");
                }
                else
                {
                    context.Response.Write("{\"success\":false}");
                }
            }
        }

        //确认收货
        private void FinishOrder(HttpContext httpContext)
        {
            httpContext.Response.ContentType = "application/json";
            bool flag = false;
            string str = Convert.ToString(httpContext.Request["orderId"]);
            OrderInfo orderInfo = ShoppingProcessor.GetOrderInfo(str);
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
            if (flag)
            {
                httpContext.Response.Write("{\"success\":false, \"msg\":\"订单中商品有退货(款)不允许完成\"}");
                return;
            }
            if (orderInfo == null || !MemberProcessor.ConfirmOrderFinish(orderInfo))
            {
                httpContext.Response.Write("{\"success\":false, \"msg\":\"订单当前状态不允许完成\"}");
                return;
            }
            DistributorsBrower.UpdateCalculationCommission(orderInfo);//增加佣金记录、更新分销商的有效推广佣金和订单总额
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
            int num = 0;
            if (masterSettings.IsRequestDistributor && !string.IsNullOrEmpty(masterSettings.FinishedOrderMoney.ToString()) && currentMember.Expenditure >= masterSettings.FinishedOrderMoney)
            {
                num = 1;
            }
            foreach (LineItemInfo value in orderInfo.LineItems.Values)
            {
                if (value.OrderItemsStatus.ToString() != OrderStatus.SellerAlreadySent.ToString())
                {
                    continue;
                }
                ShoppingProcessor.UpdateOrderGoodStatu(orderInfo.OrderId, value.SkuId, 5);
            }
            DistributorsInfo distributorsInfo = new DistributorsInfo();
            distributorsInfo = DistributorsBrower.GetUserIdDistributors(orderInfo.UserId);
            if (distributorsInfo != null && distributorsInfo.UserId > 0)
            {
                num = 0;
            }
            httpContext.Response.Write(string.Concat("{\"success\":true,\"isapply\":", num, "}"));
        }

        //private void FinishOrder(System.Web.HttpContext context)
        //{
        //    context.Response.ContentType = "application/json";
        //    OrderInfo orderInfo = ShoppingProcessor.GetOrderInfo(System.Convert.ToString(context.Request["orderId"]));
        //    if (orderInfo != null && MemberProcessor.ConfirmOrderFinish(orderInfo))
        //    {
        //        DistributorsBrower.UpdateCalculationCommission(orderInfo);
        //        SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
        //        //MemberProcessor.RemoveUserCache(orderInfo.UserId);
        //        MemberInfo currentMember = MemberProcessor.GetCurrentMember();
        //        DistributorsInfo userIdDistributors = new DistributorsInfo();
        //        userIdDistributors = DistributorsBrower.GetUserIdDistributors(orderInfo.UserId);
        //        int num = 0;
        //        if (masterSettings.IsRequestDistributor && (userIdDistributors == null || userIdDistributors.UserId == 0) && !string.IsNullOrEmpty(masterSettings.FinishedOrderMoney.ToString()) && currentMember.Expenditure >= masterSettings.FinishedOrderMoney)
        //        {
        //            num = 1;
        //        }
        //        context.Response.Write("{\"success\":true,\"isapply\":" + num + "}");
        //    }
        //    else
        //    {
        //        context.Response.Write("{\"success\":false, \"msg\":\"订单当前状态不允许完成\"}");
        //    }
        //}
        private string GenerateOrderId()
        {
            string str = string.Empty;
            System.Random random = new System.Random();
            for (int i = 0; i < 7; i++)
            {
                int num = random.Next();
                str += ((char)(48 + (ushort)(num % 10))).ToString();
            }
            return System.DateTime.Now.ToString("yyyyMMdd") + str;
        }
        private void GetPrize(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            int result = 1;
            int.TryParse(context.Request["activityid"], out result);
            LotteryActivityInfo lotteryActivity = VshopBrowser.GetLotteryActivity(result);
            int userPrizeCount = VshopBrowser.GetUserPrizeCount(result);
            if (MemberProcessor.GetCurrentMember() == null)
            {
                MemberInfo member = new MemberInfo();
                string generateId = Globals.GetGenerateId();
                member.GradeId = MemberProcessor.GetDefaultMemberGrade();
                member.UserName = "";
                member.OpenId = "";
                member.CreateDate = System.DateTime.Now;
                member.SessionId = generateId;
                member.SessionEndTime = System.DateTime.Now;
                MemberProcessor.CreateMember(member);
                member = MemberProcessor.GetMember(generateId);
                System.Web.HttpCookie cookie = new System.Web.HttpCookie("Vshop-Member")
                {
                    Value = member.UserId.ToString(),
                    Expires = System.DateTime.Now.AddYears(10)
                };
                System.Web.HttpContext.Current.Response.Cookies.Add(cookie);
            }
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.Append("{");
            if (userPrizeCount >= lotteryActivity.MaxNum)
            {
                builder.Append("\"No\":\"-1\"");
                builder.Append("}");
                context.Response.Write(builder.ToString());
            }
            else
            {
                if (System.DateTime.Now < lotteryActivity.StartTime || System.DateTime.Now > lotteryActivity.EndTime)
                {
                    builder.Append("\"No\":\"-3\"");
                    builder.Append("}");
                    context.Response.Write(builder.ToString());
                }
                else
                {
                    PrizeQuery page = new PrizeQuery
                    {
                        ActivityId = result
                    };
                    System.Collections.Generic.List<PrizeRecordInfo> prizeList = VshopBrowser.GetPrizeList(page);
                    int num3 = 0;
                    int num4 = 0;
                    int num5 = 0;
                    if (prizeList != null && prizeList.Count > 0)
                    {
                        num3 = prizeList.Count((PrizeRecordInfo a) => a.Prizelevel == "一等奖");
                        num4 = prizeList.Count((PrizeRecordInfo a) => a.Prizelevel == "二等奖");
                        num5 = prizeList.Count((PrizeRecordInfo a) => a.Prizelevel == "三等奖");
                    }
                    PrizeRecordInfo model = new PrizeRecordInfo
                    {
                        PrizeTime = new System.DateTime?(System.DateTime.Now),
                        UserID = Globals.GetCurrentMemberUserId(),
                        ActivityName = lotteryActivity.ActivityName,
                        ActivityID = result,
                        IsPrize = true
                    };
                    System.Collections.Generic.List<PrizeSetting> prizeSettingList = lotteryActivity.PrizeSettingList;
                    decimal num6 = prizeSettingList[0].Probability * 100m;
                    decimal num7 = prizeSettingList[1].Probability * 100m;
                    decimal num8 = prizeSettingList[2].Probability * 100m;
                    int num9 = new System.Random(System.Guid.NewGuid().GetHashCode()).Next(1, 10001);
                    if (prizeSettingList.Count > 3)
                    {
                        decimal num10 = prizeSettingList[3].Probability * 100m;
                        decimal num11 = prizeSettingList[4].Probability * 100m;
                        decimal num12 = prizeSettingList[5].Probability * 100m;
                        int num13 = prizeList.Count((PrizeRecordInfo a) => a.Prizelevel == "四等奖");
                        int num14 = prizeList.Count((PrizeRecordInfo a) => a.Prizelevel == "五等奖");
                        int num15 = prizeList.Count((PrizeRecordInfo a) => a.Prizelevel == "六等奖");
                        if (num9 < num6 && prizeSettingList[0].PrizeNum > num3)
                        {
                            builder.Append("\"No\":\"9\"");
                            model.Prizelevel = "一等奖";
                            model.PrizeName = prizeSettingList[0].PrizeName;
                        }
                        else
                        {
                            if (num9 < num7 && prizeSettingList[1].PrizeNum > num4)
                            {
                                builder.Append("\"No\":\"11\"");
                                model.Prizelevel = "二等奖";
                                model.PrizeName = prizeSettingList[1].PrizeName;
                            }
                            else
                            {
                                if (num9 < num8 && prizeSettingList[2].PrizeNum > num5)
                                {
                                    builder.Append("\"No\":\"1\"");
                                    model.Prizelevel = "三等奖";
                                    model.PrizeName = prizeSettingList[2].PrizeName;
                                }
                                else
                                {
                                    if (num9 < num10 && prizeSettingList[3].PrizeNum > num13)
                                    {
                                        builder.Append("\"No\":\"3\"");
                                        model.Prizelevel = "四等奖";
                                        model.PrizeName = prizeSettingList[3].PrizeName;
                                    }
                                    else
                                    {
                                        if (num9 < num11 && prizeSettingList[4].PrizeNum > num14)
                                        {
                                            builder.Append("\"No\":\"5\"");
                                            model.Prizelevel = "五等奖";
                                            model.PrizeName = prizeSettingList[4].PrizeName;
                                        }
                                        else
                                        {
                                            if (num9 < num12 && prizeSettingList[5].PrizeNum > num15)
                                            {
                                                builder.Append("\"No\":\"7\"");
                                                model.Prizelevel = "六等奖";
                                                model.PrizeName = prizeSettingList[5].PrizeName;
                                            }
                                            else
                                            {
                                                model.IsPrize = false;
                                                builder.Append("\"No\":\"0\"");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        if (num9 < num6 && prizeSettingList[0].PrizeNum > num3)
                        {
                            builder.Append("\"No\":\"9\"");
                            model.Prizelevel = "一等奖";
                            model.PrizeName = prizeSettingList[0].PrizeName;
                        }
                        else
                        {
                            if (num9 < num7 && prizeSettingList[1].PrizeNum > num4)
                            {
                                builder.Append("\"No\":\"11\"");
                                model.Prizelevel = "二等奖";
                                model.PrizeName = prizeSettingList[1].PrizeName;
                            }
                            else
                            {
                                if (num9 < num8 && prizeSettingList[2].PrizeNum > num5)
                                {
                                    builder.Append("\"No\":\"1\"");
                                    model.Prizelevel = "三等奖";
                                    model.PrizeName = prizeSettingList[2].PrizeName;
                                }
                                else
                                {
                                    model.IsPrize = false;
                                    builder.Append("\"No\":\"0\"");
                                }
                            }
                        }
                    }
                    builder.Append("}");
                    if (context.Request["activitytype"] != "scratch")
                    {
                        VshopBrowser.AddPrizeRecord(model);
                    }
                    context.Response.Write(builder.ToString());
                }
            }
        }
        public void GetShippingTypes(System.Web.HttpContext context)
        {
            int regionId = System.Convert.ToInt32(context.Request["regionId"]);
            int groupbuyId = (!string.IsNullOrWhiteSpace(context.Request["groupBuyId"])) ? System.Convert.ToInt32(context.Request["groupBuyId"]) : 0;
            int num2;
            ShoppingCartInfo shoppingCart;
            if (int.TryParse(context.Request["buyAmount"], out num2) && !string.IsNullOrWhiteSpace(context.Request["productSku"]))
            {
                string productSkuId = System.Convert.ToString(context.Request["productSku"]);
                if (groupbuyId > 0)
                {
                    shoppingCart = ShoppingCartProcessor.GetGroupBuyShoppingCart(groupbuyId, productSkuId, num2);
                }
                else
                {
                    shoppingCart = ShoppingCartProcessor.GetShoppingCart(productSkuId, num2);
                }
            }
            else
            {
                shoppingCart = ShoppingCartProcessor.GetShoppingCart();
            }
            System.Collections.Generic.IEnumerable<int> source =
                from item in ShoppingProcessor.GetShippingModes()
                select item.ModeId;
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            if (source != null && source.Count<int>() > 0)
            {
                foreach (int num3 in source)
                {
                    ShippingModeInfo shippingMode = ShoppingProcessor.GetShippingMode(num3, true);
                    decimal num4 = 0m;
                    if (shoppingCart.LineItems.Count != shoppingCart.LineItems.Count((ShoppingCartItemInfo a) => a.IsfreeShipping))
                    {
                        num4 = ShoppingProcessor.CalcFreight(regionId, shoppingCart.Weight, shippingMode);
                    }
                    builder.Append(string.Concat(new string[]
					{
						",{\"modelId\":\"",
						shippingMode.ModeId.ToString(),
						"\",\"text\":\"",
						shippingMode.Name,
						"： ￥",
						num4.ToString("F2"),
						"\",\"freight\":\"",
						num4.ToString("F2"),
						"\"}"
					}));
                }
                if (builder.Length > 0)
                {
                    builder.Remove(0, 1);
                }
            }
            builder.Insert(0, "{\"data\":[").Append("]}");
            context.Response.ContentType = "application/json";
            context.Response.Write(builder.ToString());
        }
        private void ProcessAddToCartBySkus(System.Web.HttpContext context)
        {
            if (MemberProcessor.GetCurrentMember() == null)
            {
                context.Response.Write("{\"Status\":-1}");
            }
            else
            {
                context.Response.ContentType = "application/json";
                int quantity = int.Parse(context.Request["quantity"], System.Globalization.NumberStyles.None);
                string skuId = context.Request["productSkuId"];
                int categoryId = int.Parse(context.Request["categoryid"], NumberStyles.None);
                ShoppingCartProcessor.AddLineItem(skuId, quantity, categoryId);
                ShoppingCartInfo shoppingCart = ShoppingCartProcessor.GetShoppingCart();
                context.Response.Write(string.Concat(new string[]
				{
					"{\"Status\":\"OK\",\"TotalMoney\":\"",
					shoppingCart.GetTotal().ToString(".00"),
					"\",\"Quantity\":\"",
					shoppingCart.GetQuantity().ToString(),
					"\"}"
				}));
            }
        }
        private void ProcessChageQuantity(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string skuId = context.Request["skuId"];
            int result = 1;
            int.TryParse(context.Request["quantity"], out result);
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.Append("{");
            int skuStock = ShoppingCartProcessor.GetSkuStock(skuId);
            if (result > skuStock)
            {
                builder.AppendFormat("\"Status\":\"{0}\"", skuStock);
                result = skuStock;
            }
            else
            {
                builder.Append("\"Status\":\"OK\",");
                ShoppingCartProcessor.UpdateLineItemQuantity(skuId, (result > 0) ? result : 1);
                builder.AppendFormat("\"TotalPrice\":\"{0}\"", ShoppingCartProcessor.GetShoppingCart().GetAmount());
            }
            builder.Append("}");
            context.Response.ContentType = "application/json";
            context.Response.Write(builder.ToString());
        }
        private void ProcessDeleteCartProduct(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string skuId = context.Request["skuId"];
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            ShoppingCartProcessor.RemoveLineItem(skuId);
            builder.Append("{");
            builder.Append("\"Status\":\"OK\"");
            builder.Append("}");
            context.Response.ContentType = "application/json";
            context.Response.Write(builder.ToString());
        }
        private void ProcessGetSkuByOptions(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            int productId = int.Parse(context.Request["productId"], System.Globalization.NumberStyles.None);
            string str = context.Request["options"];
            if (string.IsNullOrEmpty(str))
            {
                context.Response.Write("{\"Status\":\"0\"}");
            }
            else
            {
                if (str.EndsWith(","))
                {
                    str = str.Substring(0, str.Length - 1);
                }
                SKUItem item = ShoppingProcessor.GetProductAndSku(MemberProcessor.GetCurrentMember(), productId, str);
                if (item == null)
                {
                    context.Response.Write("{\"Status\":\"1\"}");
                }
                else
                {
                    System.Text.StringBuilder builder = new System.Text.StringBuilder();
                    builder.Append("{");
                    builder.Append("\"Status\":\"OK\",");
                    builder.AppendFormat("\"SkuId\":\"{0}\",", item.SkuId);
                    builder.AppendFormat("\"SKU\":\"{0}\",", item.SKU);
                    builder.AppendFormat("\"Weight\":\"{0}\",", item.Weight);
                    builder.AppendFormat("\"Stock\":\"{0}\",", item.Stock);
                    builder.AppendFormat("\"SalePrice\":\"{0}\"", item.SalePrice.ToString("F2"));
                    builder.Append("}");
                    context.Response.ContentType = "application/json";
                    context.Response.Write(builder.ToString());
                }
            }
        }
        public void ProcessRequest(System.Web.HttpContext context)
        {
            string text = context.Request["action"];
            switch (text)
            {
                case "AddToCartBySkus":
                    this.ProcessAddToCartBySkus(context);
                    break;
                case "GetSkuByOptions":
                    this.ProcessGetSkuByOptions(context);
                    break;
                case "DeleteCartProduct":
                    this.ProcessDeleteCartProduct(context);
                    break;
                case "ChageQuantity":
                    this.ProcessChageQuantity(context);
                    break;
                case "Submmitorder":
                    this.ProcessSubmmitorder(context);
                    break;
                case "SubmitMemberCard":
                    this.ProcessSubmitMemberCard(context);
                    break;
                case "AddShippingAddress":
                    this.AddShippingAddress(context);
                    break;
                case "DelShippingAddress":
                    this.DelShippingAddress(context);
                    break;
                case "SetDefaultShippingAddress":
                    this.SetDefaultShippingAddress(context);
                    break;
                case "UpdateShippingAddress":
                    this.UpdateShippingAddress(context);
                    break;
                case "GetPrize":
                    this.GetPrize(context);
                    break;
                case "Vote":
                    this.Vote(context);
                    break;
                case "SubmitActivity":
                    this.SubmitActivity(context);
                    break;
                case "AddSignUp":
                    this.AddSignUp(context);
                    break;
                case "AddTicket":
                    this.AddTicket(context);
                    break;
                case "FinishOrder":
                    this.FinishOrder(context);
                    break;
                case "AddUserPrize":
                    this.AddUserPrize(context);
                    break;
                case "SubmitWinnerInfo":
                    this.SubmitWinnerInfo(context);
                    break;
                case "SetUserName":
                    this.SetUserName(context);
                    break;
                case "AddProductConsultations":
                    this.AddProductConsultations(context);
                    break;
                case "AddProductReview":
                    this.AddProductReview(context);
                    break;
                case "AddFavorite":
                    this.AddFavorite(context);
                    break;
                case "DelFavorite":
                    this.DelFavorite(context);
                    break;
                case "CheckFavorite":
                    this.CheckFavorite(context);
                    break;
                case "Logistic":
                    this.SearchExpressData(context);
                    break;
                case "GetShippingTypes":
                    this.GetShippingTypes(context);
                    break;
                case "UserLogin":
                    this.UserLogin(context);
                    break;
                case "RegisterUser":
                    this.RegisterUser(context);
                    break;
                case "AddDistributor":
                    this.AddDistributor(context);
                    break;
                case "SetDistributorMsg":
                    this.SetDistributorMsg(context);
                    break;
                case "DeleteProducts":
                    this.DeleteDistributorProducts(context);
                    break;
                case "AddDistributorProducts":
                    this.AddDistributorProducts(context);
                    break;
                case "UpdateDistributor":
                    this.UpdateDistributor(context);
                    break;
                case "AddCommissions":
                    this.AddCommissions(context);
                    break;
                case "RequestReturn":
                    this.RequestReturn(context);
                    break;
                case "EditPassword":
                    this.EditPassword(context);
                    break;
                case "GetOrderRedPager":
                    this.GetOrderRedPager(context);
                    break;
                case "AdjustCommissions":
                    this.AdjustCommssions(context);
                    break;
            }
        }
        private void ProcessSubmitMemberCard(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                context.Response.Write("{\"success\":false}");
            }
            else
            {
                currentMember.Address = context.Request.Form.Get("address");
                currentMember.RealName = context.Request.Form.Get("name");
                currentMember.CellPhone = context.Request.Form.Get("phone");
                currentMember.QQ = context.Request.Form.Get("qq");
                if (!string.IsNullOrEmpty(currentMember.QQ))
                {
                    currentMember.Email = currentMember.QQ + "@qq.com";
                }
                currentMember.VipCardNumber = SettingsManager.GetMasterSettings(true).VipCardPrefix + currentMember.UserId.ToString();
                currentMember.VipCardDate = new System.DateTime?(System.DateTime.Now);
                string s = MemberProcessor.UpdateMember(currentMember) ? "{\"success\":true}" : "{\"success\":false}";
                context.Response.Write(s);
            }
        }

        //生成订单
        private void ProcessSubmmitorder(System.Web.HttpContext context)
        {

            context.Response.ContentType = "application/json";
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.Append("{");
            int result = 0;
            int PaymentTypeId = 0;
            string str = context.Request["couponCode"];                             //优惠券代码
            int redpagerid = 0;
            int.TryParse(context.Request["redpagerid"], out redpagerid);            //红包ID
            int shippingId = int.Parse(context.Request["shippingId"]);              //商品ID
            int groupbuyId;
            bool flag = int.TryParse(context.Request["groupbuyId"], out groupbuyId); //团购ID
            string remark = context.Request["remark"];                               //订单备注
            int buyAmount = 0;                                                       //购买数量
            ShoppingCartInfo shoppingCart;
            if (int.TryParse(context.Request["buyAmount"], out buyAmount) && !string.IsNullOrEmpty(context.Request["productSku"]) && !string.IsNullOrEmpty(context.Request["from"]) && (context.Request["from"] == "signBuy" || context.Request["from"] == "groupBuy"))
            {
                string productSkuId = context.Request["productSku"];
                if (context.Request["from"] == "signBuy")
                {
                    shoppingCart = ShoppingCartProcessor.GetShoppingCart(productSkuId, buyAmount);//得到购物车信息()
                }
                else
                {
                    shoppingCart = ShoppingCartProcessor.GetGroupBuyShoppingCart(groupbuyId, productSkuId, buyAmount);
                }
            }
            else
            {
                shoppingCart = ShoppingCartProcessor.GetShoppingCart();
            }
            OrderInfo orderInfo = ShoppingProcessor.ConvertShoppingCartToOrder(shoppingCart, false, false);
            if (orderInfo == null)
            {
                builder.Append("\"Status\":\"None\"");
            }
            else
            {
                orderInfo.OrderId = this.GenerateOrderId();
                orderInfo.OrderDate = System.DateTime.Now;
                MemberInfo currentMember = MemberProcessor.GetCurrentMember();
                orderInfo.UserId = currentMember.UserId;
                orderInfo.Username = currentMember.UserName;
                orderInfo.EmailAddress = currentMember.Email;
                orderInfo.RealName = currentMember.RealName;
                orderInfo.QQ = currentMember.QQ;
                orderInfo.Remark = remark;
                string activitiesId = "";
                string activitiesName = "";
                orderInfo.DiscountAmount = this.DiscountMoney(orderInfo, out activitiesId, out activitiesName);
                orderInfo.ActivitiesId = activitiesId;
                orderInfo.ActivitiesName = activitiesName;
                if (flag)
                {
                    GroupBuyInfo groupBuy = GroupBuyBrowser.GetGroupBuy(groupbuyId);
                    orderInfo.GroupBuyId = groupbuyId;
                    orderInfo.NeedPrice = groupBuy.NeedPrice;
                    orderInfo.GroupBuyStatus = groupBuy.Status;
                }
                orderInfo.OrderStatus = OrderStatus.WaitBuyerPay;
                orderInfo.RefundStatus = RefundStatus.None;
                orderInfo.ShipToDate = context.Request["shiptoDate"];
                if (System.Web.HttpContext.Current.Request.Cookies["Vshop-ReferralId"] != null)
                {
                    orderInfo.ReferralUserId = int.Parse(System.Web.HttpContext.Current.Request.Cookies.Get("Vshop-ReferralId").Value);
                }
                else
                {
                    orderInfo.ReferralUserId = 0;
                }
                ShippingAddressInfo shippingAddress = MemberProcessor.GetShippingAddress(shippingId);
                if (shippingAddress != null)
                {
                    orderInfo.ShippingRegion = RegionHelper.GetFullRegion(shippingAddress.RegionId, "，");
                    orderInfo.RegionId = shippingAddress.RegionId;
                    orderInfo.Address = shippingAddress.Address;
                    orderInfo.ZipCode = shippingAddress.Zipcode;
                    orderInfo.ShipTo = shippingAddress.ShipTo;
                    orderInfo.TelPhone = shippingAddress.TelPhone;
                    orderInfo.CellPhone = shippingAddress.CellPhone;
                    MemberProcessor.SetDefaultShippingAddress(shippingId, MemberProcessor.GetCurrentMember().UserId);
                }
                if (int.TryParse(context.Request["shippingType"], out result))
                {
                    ShippingModeInfo shippingMode = ShoppingProcessor.GetShippingMode(result, true);
                    if (shippingMode != null)
                    {
                        orderInfo.ShippingModeId = shippingMode.ModeId;
                        orderInfo.ModeName = shippingMode.Name;
                        if (shoppingCart.LineItems.Count != shoppingCart.LineItems.Count((ShoppingCartItemInfo a) => a.IsfreeShipping))
                        {
                            orderInfo.AdjustedFreight = (orderInfo.Freight = ShoppingProcessor.CalcFreight(orderInfo.RegionId, shoppingCart.Weight, shippingMode));
                        }
                        else
                        {
                            orderInfo.AdjustedFreight = (orderInfo.Freight = 0m);
                        }
                    }
                }
                if (int.TryParse(context.Request["paymentType"], out PaymentTypeId))
                {
                    orderInfo.PaymentTypeId = PaymentTypeId;
                    switch (PaymentTypeId)
                    {
                        case -1:
                        case 0:
                            {
                                orderInfo.PaymentType = "货到付款";
                                orderInfo.Gateway = "hishop.plugins.payment.podrequest";
                                break;
                            }
                        case 88:
                            {
                                orderInfo.PaymentType = "微信支付";
                                orderInfo.Gateway = "hishop.plugins.payment.weixinrequest";
                                break;
                            }
                        case 99:
                            {
                                orderInfo.PaymentType = "线下付款";
                                orderInfo.Gateway = "hishop.plugins.payment.offlinerequest";
                                break;
                            }
                        default:
                            {
                                PaymentModeInfo paymentMode = ShoppingProcessor.GetPaymentMode(PaymentTypeId);
                                if (paymentMode != null)
                                {
                                    orderInfo.PaymentTypeId = paymentMode.ModeId;
                                    orderInfo.PaymentType = paymentMode.Name;
                                    orderInfo.Gateway = paymentMode.Gateway;
                                }
                                break;
                            }
                    }
                    #region 注释
                    //int num5 = PaymentTypeId;
                    //switch (num5)
                    //{
                    //    case -1:
                    //    case 0:
                    //        orderInfo.PaymentType = "货到付款";
                    //        orderInfo.Gateway = "hishop.plugins.payment.podrequest";
                    //        break;
                    //    default:
                    //        if (num5 != 88)
                    //        {
                    //            if (num5 != 99)
                    //            {
                    //                PaymentModeInfo paymentMode = ShoppingProcessor.GetPaymentMode(PaymentTypeId);
                    //                if (paymentMode != null)
                    //                {
                    //                    orderInfo.PaymentTypeId = paymentMode.ModeId;
                    //                    orderInfo.PaymentType = paymentMode.Name;
                    //                    orderInfo.Gateway = paymentMode.Gateway;
                    //                }
                    //            }
                    //            else
                    //            {
                    //                orderInfo.PaymentType = "线下付款";
                    //                orderInfo.Gateway = "hishop.plugins.payment.offlinerequest";
                    //            }
                    //        }
                    //        else
                    //        {
                    //            orderInfo.PaymentType = "微信支付";
                    //            orderInfo.Gateway = "hishop.plugins.payment.weixinrequest";
                    //        }
                    //        break;
                    //}
                    #endregion
                }
                if (!string.IsNullOrEmpty(str))
                {
                    CouponInfo couponInfo = ShoppingProcessor.UseCoupon(shoppingCart.GetTotal(), str);
                    orderInfo.CouponName = couponInfo.Name;
                    if (couponInfo.Amount.HasValue)
                    {
                        orderInfo.CouponAmount = couponInfo.Amount.Value;
                    }
                    orderInfo.CouponCode = str;
                    orderInfo.CouponValue = couponInfo.DiscountValue;
                }
                if (redpagerid > 0)
                {
                    UserRedPagerInfo userRedPagerByRedPagerID = UserRedPagerBrower.GetUserRedPagerByRedPagerID(redpagerid);
                    if (userRedPagerByRedPagerID != null && !userRedPagerByRedPagerID.IsUsed && userRedPagerByRedPagerID.ExpiryTime > System.DateTime.Now)
                    {
                        orderInfo.RedPagerActivityName = userRedPagerByRedPagerID.RedPagerActivityName;
                        orderInfo.RedPagerAmount = userRedPagerByRedPagerID.Amount;
                        orderInfo.RedPagerID = new int?(userRedPagerByRedPagerID.RedPagerID);
                        orderInfo.RedPagerOrderAmountCanUse = userRedPagerByRedPagerID.OrderAmountCanUse;
                    }
                }
                try
                {
                    this.SetOrderItemStatus(orderInfo);
                    this.InsertCalculationCommission(orderInfo.OrderId, orderInfo);//计算返佣
                    if (ShoppingProcessor.CreatOrder(orderInfo))
                    {
                        ShoppingCartProcessor.ClearShoppingCart();
                        Messenger.OrderCreated(orderInfo, currentMember);
                        SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
                        if (!string.IsNullOrEmpty(masterSettings.ManageOpenID))
                        {
                            MemberInfo openIdMember = MemberProcessor.GetOpenIdMember(masterSettings.ManageOpenID);
                            if (openIdMember != null)
                            {
                                Messenger.OrderCreatedSendManage(orderInfo, openIdMember);
                            }
                        }
                        builder.Append("\"Status\":\"OK\",");
                        builder.AppendFormat("\"OrderId\":\"{0}\"", orderInfo.OrderId);
                    }
                    else
                    {
                        builder.Append("\"Status\":\"Error\"");
                    }
                }
                catch (OrderException exception)
                {
                    builder.Append("\"Status\":\"Error\"");
                    builder.AppendFormat(",\"ErrorMsg\":\"{0}\"", exception.Message);
                }
            }
            builder.Append("}");
            context.Response.ContentType = "application/json";
            context.Response.Write(builder.ToString());
        }

        public decimal DiscountMoney(OrderInfo order, out string ActivitiesId, out string ActivitiesName)
        {
            decimal num = new decimal(0);
            decimal num1 = new decimal(0);
            decimal num2 = new decimal(0);
            LineItemInfo lineItemInfo = new LineItemInfo();
            ActivitiesId = "";
            ActivitiesName = "";
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
                    System.Data.DataTable allFull = ProductBrowser.GetAllFull(int.Parse(type.Rows[i]["ActivitiesType"].ToString()));
                    if (allFull.Rows.Count > 0)
                    {
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
                                str = string.Concat(allFull.Rows[allFull.Rows.Count - 1]["ActivitiesId"].ToString(), ",");
                                str1 = string.Concat(allFull.Rows[allFull.Rows.Count - 1]["ActivitiesName"].ToString(), ",");
                                break;
                            }
                            else if (subTotal <= decimal.Parse(allFull.Rows[0]["MeetMoney"].ToString()))
                            {
                                num1 = decimal.Parse(allFull.Rows[0]["MeetMoney"].ToString());
                                num = num + decimal.Parse(allFull.Rows[0]["ReductionMoney"].ToString());
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
                                    str = string.Concat(allFull.Rows[num4]["ActivitiesId"].ToString(), ",");
                                    str1 = string.Concat(allFull.Rows[num4]["ActivitiesName"].ToString(), ",");
                                }
                                num4++;
                            }
                        }
                        if (subTotal >= num1)
                        {
                            ActivitiesId = string.Concat(ActivitiesId, str);
                            ActivitiesName = string.Concat(ActivitiesName, str1);
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
            if (!string.IsNullOrEmpty(ActivitiesName))
            {
                ActivitiesName = ActivitiesName.Substring(0, ActivitiesName.Length - 1);
                ActivitiesId = ActivitiesId.Substring(0, ActivitiesId.Length - 1);
            }
            return num2;
        }


        public void SetOrderItemStatus(OrderInfo order)
        {
            System.Collections.Generic.Dictionary<string, LineItemInfo> lineItems = order.LineItems;
            LineItemInfo lineItemInfo = new LineItemInfo();
            foreach (System.Collections.Generic.KeyValuePair<string, LineItemInfo> current in lineItems)
            {
                lineItemInfo = current.Value;
                lineItemInfo.OrderItemsStatus = OrderStatus.WaitBuyerPay;
            }
        }

        /// <summary>
        /// 计算订单明细中的三级返佣信息(存在分销商信息才计算)[jinhb,20150818，增加返佣方式：根据配置可按销售价、利润来计算]
        /// [jinhb,20150818,加入无限代理算法，在此方法中的三级返佣要确认其代理身份，计算时加上代理的佣金上浮。
        ///                 三级向上的代理，层次是活动的，不在此计算，应在确认收贷时更新到对应的代理佣金中去]
        /// </summary>
        public bool InsertCalculationCommission(string orderid, OrderInfo order)
        {
            //order.ReferralUserId 订单的所属分销ID,没有为0
            DistributorsInfo userIdDistributors = DistributorsBrower.GetUserIdDistributors(order.ReferralUserId);
            bool result = false;
            if (userIdDistributors != null)
            {
                decimal d = 0m;     //FirstCommissionRise 直接佣金上浮(百分比)
                decimal d2 = 0m;    //SecondCommissionRise 二级佣金上浮(百分比)[上一级]
                decimal d3 = 0m;    //ThirdCommissionRise 三级佣金上浮(百分比)[上二级]
                decimal dAgent = 0m, d2Agent = 0m, d3Agent = 0m;     //代理佣金上浮(百分比)
                System.Data.DataView defaultView = DistributorGradeBrower.GetAllDistributorGrade().DefaultView; //当前系统中所有分销商等级
                System.Data.DataView defaultViewAgent = DistributorGradeBrower.GetAllAgentGrade().DefaultView;  //当前系统中所有代理商等级

                #region 直接佣金上浮、代理佣金上浮
                if (userIdDistributors.DistriGradeId.ToString() != "0")
                {
                    defaultView.RowFilter = " GradeId=" + userIdDistributors.DistriGradeId;
                        d = decimal.Parse(defaultView[0]["FirstCommissionRise"].ToString());
                }
                if (userIdDistributors.IsAgent==1 && userIdDistributors.AgentGradeId.ToString() != "0") {
                    defaultViewAgent.RowFilter = " AgentGradeId=" + userIdDistributors.AgentGradeId;
                    if (defaultViewAgent.Count > 0)
                        dAgent = decimal.Parse(defaultViewAgent[0]["FirstCommissionRise"].ToString());
                }
                #endregion 直接佣金上浮、代理佣金上浮
                if (!string.IsNullOrEmpty(userIdDistributors.ReferralPath))
                {
                    string[] array = userIdDistributors.ReferralPath.Split(new char[]
					{
						'|'
					});
                    if (array.Length == 1)
                    {
                        #region 二级佣金上浮[上一级]、代理佣金上浮
                        DistributorsInfo userIdDistributors2 = DistributorsBrower.GetUserIdDistributors(int.Parse(array[0]));
                        if (userIdDistributors2.DistriGradeId.ToString() != "0")
                        {
                            defaultView.RowFilter = " GradeId=" + userIdDistributors2.DistriGradeId;
                            if (defaultView.Count > 0)
                                d2 = decimal.Parse(defaultView[0]["SecondCommissionRise"].ToString());
                        }
                        if (userIdDistributors2.IsAgent == 1 && userIdDistributors2.AgentGradeId.ToString() != "0")
                        {
                            defaultViewAgent.RowFilter = " AgentGradeId=" + userIdDistributors2.AgentGradeId;
                            if (defaultViewAgent.Count > 0)
                                d2Agent = decimal.Parse(defaultViewAgent[0]["FirstCommissionRise"].ToString());
                        }
                        #endregion 二级佣金上浮[上一级]、代理佣金上浮
                    }
                    else
                    {
                        #region 二级和三级佣金上浮[上一级、上二级]、代理佣金上浮
                        DistributorsInfo userIdDistributors3 = DistributorsBrower.GetUserIdDistributors(int.Parse(array[1]));
                        if (userIdDistributors3.DistriGradeId.ToString() != "0")
                        {
                            defaultView.RowFilter = " GradeId=" + userIdDistributors3.DistriGradeId;
                            if (defaultView.Count > 0)
                                d2 = decimal.Parse(defaultView[0]["SecondCommissionRise"].ToString());
                        }
                        if (userIdDistributors3.IsAgent == 1 && userIdDistributors3.AgentGradeId.ToString() != "0")
                        {
                            defaultViewAgent.RowFilter = " AgentGradeId=" + userIdDistributors3.AgentGradeId;
                            if (defaultViewAgent.Count > 0)
                                d2Agent = decimal.Parse(defaultViewAgent[0]["FirstCommissionRise"].ToString());
                        }
                        DistributorsInfo userIdDistributors4 = DistributorsBrower.GetUserIdDistributors(int.Parse(array[0]));
                        if (userIdDistributors4.DistriGradeId.ToString() != "0")
                        {
                            defaultView.RowFilter = " GradeId=" + userIdDistributors4.DistriGradeId;
                            if (defaultView.Count > 0)
                                d3 = decimal.Parse(defaultView[0]["ThirdCommissionRise"].ToString());
                        }
                        if (userIdDistributors4.IsAgent == 1 && userIdDistributors4.AgentGradeId.ToString() != "0")
                        {
                            defaultViewAgent.RowFilter = " AgentGradeId=" + userIdDistributors4.AgentGradeId;
                            if (defaultViewAgent.Count > 0)
                                d3Agent = decimal.Parse(defaultViewAgent[0]["FirstCommissionRise"].ToString());
                        }
                        #endregion 二级和三级佣金上浮[上一级、上二级]、代理佣金上浮
                    }
                }
                System.Collections.Generic.Dictionary<string, LineItemInfo> lineItems = order.LineItems;
                LineItemInfo lineItemInfo = new LineItemInfo();
                System.Data.DataView defaultView2 = CategoryBrowser.GetAllCategories().DefaultView;     //当前系统中所有商品分类
                foreach (System.Collections.Generic.KeyValuePair<string, LineItemInfo> current in lineItems)
                {
                    #region 计算订单明细中的三级返佣信息
                    lineItemInfo = current.Value;
                    System.Data.DataTable productCategories = ProductBrowser.GetProductCategories(lineItemInfo.ProductId);  //获取当前商品分类
                    if (productCategories.Rows.Count > 0 && productCategories.Rows[0][0].ToString() != "0")
                    {
                        defaultView2.RowFilter = " CategoryId=" + productCategories.Rows[0][0];
                        string text = defaultView2[0]["FirstCommission"].ToString();    //直接销售佣金(百分比)
                        string text2 = defaultView2[0]["SecondCommission"].ToString();  //上一级销售佣金(百分比)
                        string text3 = defaultView2[0]["ThirdCommission"].ToString();   //上二级销售佣金(百分比)
                        if (!string.IsNullOrEmpty(text) && !string.IsNullOrEmpty(text2) && !string.IsNullOrEmpty(text3))
                        {
                            //根据配置文件来处理(按销售价或利润计算返佣)[jinhb,20150818，返佣方式]
                            if (!SettingsManager.GetMasterSettings(false).EnableProfit)
                            {
                                //计算订单明细中的返佣金额: (佣金上浮+销售佣金)/100.00*实际单价*数量
                                lineItemInfo.ItemsCommission = (decimal.Parse(text) + d + dAgent) / 100m * lineItemInfo.GetSubTotal();
                                lineItemInfo.SecondItemsCommission = (decimal.Parse(text2) + d2 + d2Agent) / 100m * lineItemInfo.GetSubTotal();
                                lineItemInfo.ThirdItemsCommission = (decimal.Parse(text3) + d3 + d3Agent) / 100m * lineItemInfo.GetSubTotal();
                            }
                            else
                            {
                                //计算订单明细中的返佣金额: (佣金上浮+销售佣金)/100.00*实际利润*数量
                                lineItemInfo.ItemsCommission = (decimal.Parse(text) + d + dAgent) / 100m * lineItemInfo.GetSubTotalProfit();
                                lineItemInfo.SecondItemsCommission = (decimal.Parse(text2) + d2 + d2Agent) / 100m * lineItemInfo.GetSubTotalProfit();
                                lineItemInfo.ThirdItemsCommission = (decimal.Parse(text3) + d3 + d3Agent) / 100m * lineItemInfo.GetSubTotalProfit();
                            }
                        }
                    }
                    #endregion 计算订单明细中的三级返佣信息
                }
            }
            return result;
        }


        public void RegisterUser(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string username = context.Request["userName"];
            string sourceData = context.Request["password"];
            string str3 = context.Request["passagain"];
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.Append("{");
            if (sourceData == str3)
            {
                MemberInfo info = new MemberInfo();
                if (MemberProcessor.GetusernameMember(username) == null)
                {
                    MemberInfo member = new MemberInfo();
                    string generateId = Globals.GetGenerateId();
                    member.GradeId = MemberProcessor.GetDefaultMemberGrade();
                    member.UserName = username;
                    member.CreateDate = System.DateTime.Now;
                    member.SessionId = generateId;
                    member.SessionEndTime = System.DateTime.Now.AddYears(10);
                    member.Password = HiCryptographer.Md5Encrypt(sourceData);
                    MemberProcessor.CreateMember(member);
                    MemberInfo info2 = MemberProcessor.GetMember(generateId);
                    if (System.Web.HttpContext.Current.Request.Cookies["Vshop-Member"] != null)
                    {
                        System.Web.HttpContext.Current.Response.Cookies["Vshop-Member"].Expires = System.DateTime.Now.AddDays(-1.0);
                        System.Web.HttpCookie cookie = new System.Web.HttpCookie("Vshop-Member")
                        {
                            Value = info2.UserId.ToString(),
                            Expires = System.DateTime.Now.AddYears(10)
                        };
                        System.Web.HttpContext.Current.Response.Cookies.Add(cookie);
                    }
                    else
                    {
                        System.Web.HttpCookie cookie2 = new System.Web.HttpCookie("Vshop-Member")
                        {
                            Value = info2.UserId.ToString(),
                            Expires = System.DateTime.Now.AddYears(10)
                        };
                        System.Web.HttpContext.Current.Response.Cookies.Add(cookie2);
                    }
                    context.Session["userid"] = info2.UserId.ToString();
                    builder.Append("\"Status\":\"OK\"");
                }
                else
                {
                    builder.Append("\"Status\":\"-1\"");
                }
            }
            else
            {
                builder.Append("\"Status\":\"-2\"");
            }
            builder.Append("}");
            context.Response.Write(builder.ToString());
        }
        private void SearchExpressData(System.Web.HttpContext context)
        {
            string s = string.Empty;
            if (!string.IsNullOrEmpty(context.Request["OrderId"]))
            {
                string orderId = context.Request["OrderId"];
                OrderInfo orderInfo = ShoppingProcessor.GetOrderInfo(orderId);
                if (orderInfo != null && (orderInfo.OrderStatus == OrderStatus.SellerAlreadySent || orderInfo.OrderStatus == OrderStatus.Finished) && !string.IsNullOrEmpty(orderInfo.ExpressCompanyAbb))
                {
                    s = Express.GetExpressData(orderInfo.ExpressCompanyAbb, orderInfo.ShipOrderNumber, 0);
                }
            }
            context.Response.ContentType = "application/json";
            context.Response.Write(s);
            context.Response.End();
        }
        private void SetDefaultShippingAddress(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                context.Response.Write("{\"success\":false}");
            }
            else
            {
                int userId = currentMember.UserId;
                if (MemberProcessor.SetDefaultShippingAddress(System.Convert.ToInt32(context.Request.Form["shippingid"]), userId))
                {
                    context.Response.Write("{\"success\":true}");
                }
                else
                {
                    context.Response.Write("{\"success\":false}");
                }
            }
        }
        public void SetDistributorMsg(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            currentMember.VipCardDate = new System.DateTime?(System.DateTime.Now);
            currentMember.CellPhone = context.Request["CellPhone"];
            currentMember.MicroSignal = context.Request["MicroSignal"];
            currentMember.RealName = context.Request["RealName"];
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.Append("{");
            if (MemberProcessor.UpdateMember(currentMember))
            {
                builder.Append("\"Status\":\"OK\"");
            }
            else
            {
                builder.Append("\"Status\":\"Error\"");
            }
            builder.Append("}");
            context.Response.Write(builder.ToString());
        }
        public void SetUserName(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            currentMember.UserName = context.Request["userName"];
            currentMember.VipCardDate = new System.DateTime?(System.DateTime.Now);
            currentMember.CellPhone = context.Request["CellPhone"];
            currentMember.QQ = context.Request["QQ"];
            if (!string.IsNullOrEmpty(currentMember.QQ))
            {
                currentMember.Email = currentMember.QQ + "@qq.com";
            }
            currentMember.RealName = context.Request["RealName"];
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.Append("{");
            if (MemberProcessor.UpdateMember(currentMember))
            {
                builder.Append("\"Status\":\"OK\"");
            }
            else
            {
                builder.Append("\"Status\":\"Error\"");
            }
            builder.Append("}");
            context.Response.Write(builder.ToString());
        }
        private void SubmitActivity(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                context.Response.Write("{\"success\":false}");
            }
            else
            {
                ActivityInfo activity = VshopBrowser.GetActivity(System.Convert.ToInt32(context.Request.Form.Get("id")));
                if (System.DateTime.Now < activity.StartDate || System.DateTime.Now > activity.EndDate)
                {
                    context.Response.Write("{\"success\":false, \"msg\":\"报名还未开始或已结束\"}");
                }
                else
                {
                    ActivitySignUpInfo info = new ActivitySignUpInfo
                    {
                        ActivityId = System.Convert.ToInt32(context.Request.Form.Get("id")),
                        Item1 = context.Request.Form.Get("item1"),
                        Item2 = context.Request.Form.Get("item2"),
                        Item3 = context.Request.Form.Get("item3"),
                        Item4 = context.Request.Form.Get("item4"),
                        Item5 = context.Request.Form.Get("item5"),
                        RealName = currentMember.RealName,
                        SignUpDate = System.DateTime.Now,
                        UserId = currentMember.UserId,
                        UserName = currentMember.UserName
                    };
                    string s = string.IsNullOrEmpty(VshopBrowser.SaveActivitySignUp(info)) ? "{\"success\":true}" : "{\"success\":false, \"msg\":\"你已经报过名了,请勿重复报名\"}";
                    context.Response.Write(s);
                }
            }
        }
        private void SubmitWinnerInfo(System.Web.HttpContext context)
        {
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                context.Response.Write("{\"success\":false}");
            }
            else
            {
                int activityId = System.Convert.ToInt32(context.Request.Form.Get("id"));
                string realName = context.Request.Form.Get("name");
                string cellPhone = context.Request.Form.Get("phone");
                string s = VshopBrowser.UpdatePrizeRecord(activityId, currentMember.UserId, realName, cellPhone) ? "{\"success\":true}" : "{\"success\":false}";
                context.Response.ContentType = "application/json";
                context.Response.Write(s);
            }
        }

        private void UpdateDistributor(HttpContext httpContext)
        {
            httpContext.Response.ContentType = "text/json";
            StringBuilder stringBuilder = new StringBuilder();
            if (!this.CheckUpdateDistributors(httpContext, stringBuilder))
            {
                httpContext.Response.Write(string.Concat("{\"success\":false,\"msg\":\"", stringBuilder.ToString(), "\"}"));
                return;
            }
            DistributorsInfo currentDistributors = DistributorsBrower.GetCurrentDistributors(Globals.GetCurrentMemberUserId());
            currentDistributors.StoreName = httpContext.Request["stroename"].Trim();
            currentDistributors.StoreDescription = httpContext.Request["descriptions"].Trim();
            currentDistributors.BackImage = httpContext.Request["backimg"].Trim();
            currentDistributors.RequestAccount = httpContext.Request["accountname"].Trim();
            currentDistributors.Logo = httpContext.Request["logo"].Trim();
            if (DistributorsBrower.UpdateDistributorMessage(currentDistributors))
            {
                httpContext.Response.Write("{\"success\":true}");
                return;
            }
            httpContext.Response.Write("{\"success\":false,\"msg\":\"店铺名称已存在，请重新命名!\"}");
        }

        //private void UpdateDistributor(System.Web.HttpContext context)
        //{
        //    context.Response.ContentType = "text/plain";
        //    System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //    if (this.CheckUpdateDistributors(context, sb))
        //    {
        //        DistributorsInfo currentDistributors = DistributorsBrower.GetCurrentDistributors(Globals.GetCurrentMemberUserId());
        //        currentDistributors.StoreName = context.Request["VDistributorInfo$txtstorename"].Trim();
        //        currentDistributors.StoreDescription = context.Request["VDistributorInfo$txtdescription"].Trim();
        //        currentDistributors.BackImage = context.Request["VDistributorInfo$hdbackimg"].Trim();
        //        System.Web.HttpPostedFile file = context.Request.Files["logo"];
        //        if (file != null && !string.IsNullOrEmpty(file.FileName))
        //        {
        //            currentDistributors.Logo = this.UploadFileImages(context, file);
        //        }
        //        if (DistributorsBrower.UpdateDistributor(currentDistributors))
        //        {
        //            context.Response.Write("OK");
        //            context.Response.End();
        //        }
        //        else
        //        {
        //            context.Response.Write("添加失败");
        //            context.Response.End();
        //        }
        //    }
        //    else
        //    {
        //        context.Response.Write(sb.ToString() ?? "");
        //        context.Response.End();
        //    }
        //}

        private void UpdateShippingAddress(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                context.Response.Write("{\"success\":false}");
            }
            else
            {
                ShippingAddressInfo shippingAddress = new ShippingAddressInfo
                {
                    Address = context.Request.Form["address"],
                    CellPhone = context.Request.Form["cellphone"],
                    ShipTo = context.Request.Form["shipTo"],
                    Zipcode = "12345",
                    UserId = currentMember.UserId,
                    ShippingId = System.Convert.ToInt32(context.Request.Form["shippingid"]),
                    RegionId = System.Convert.ToInt32(context.Request.Form["regionSelectorValue"])
                };
                if (MemberProcessor.UpdateShippingAddress(shippingAddress))
                {
                    context.Response.Write("{\"success\":true}");
                }
                else
                {
                    context.Response.Write("{\"success\":false}");
                }
            }
        }
        private string UploadFileImages(System.Web.HttpContext context, System.Web.HttpPostedFile file)
        {
            string virtualPath = string.Empty;
            string result;
            if (file != null && !string.IsNullOrEmpty(file.FileName))
            {
                string str2 = Globals.GetStoragePath() + "/Logo";
                string str3 = System.Guid.NewGuid().ToString("N", System.Globalization.CultureInfo.InvariantCulture) + System.IO.Path.GetExtension(file.FileName);
                virtualPath = str2 + "/" + str3;
                string str4 = System.IO.Path.GetExtension(file.FileName).ToLower();
                if (!str4.Equals(".gif") && !str4.Equals(".jpg") && !str4.Equals(".png") && !str4.Equals(".bmp"))
                {
                    context.Response.Write("你上传的文件格式不正确！上传格式有(.gif、.jpg、.png、.bmp)");
                    context.Response.End();
                }
                if (file.ContentLength > 1048576)
                {
                    context.Response.Write("你上传的文件不能大于1048576KB!请重新上传！");
                    context.Response.End();
                }
                file.SaveAs(context.Request.MapPath(virtualPath));
                result = virtualPath;
            }
            else
            {
                context.Response.Write("图片上传失败!");
                context.Response.End();
                result = virtualPath;
            }
            return result;
        }
        public void UserLogin(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            MemberInfo usernameMember = new MemberInfo();
            string username = context.Request["userName"];
            string sourceData = context.Request["password"];
            usernameMember = MemberProcessor.GetusernameMember(username);
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.Append("{");
            if (usernameMember == null)
            {
                builder.Append("\"Status\":\"-1\"");
                builder.Append("}");
                context.Response.Write(builder.ToString());
            }
            else
            {
                if (usernameMember.Password == HiCryptographer.Md5Encrypt(sourceData))
                {
                    DistributorsInfo userIdDistributors = new DistributorsInfo();
                    userIdDistributors = DistributorsBrower.GetUserIdDistributors(usernameMember.UserId);
                    if (userIdDistributors != null && userIdDistributors.UserId > 0)
                    {
                        System.Web.HttpContext.Current.Response.Cookies["Vshop-ReferralId"].Expires = System.DateTime.Now.AddDays(-1.0);
                        System.Web.HttpCookie cookie = new System.Web.HttpCookie("Vshop-ReferralId")
                        {
                            Value = Globals.UrlEncode(userIdDistributors.UserId.ToString()),
                            Expires = System.DateTime.Now.AddYears(1)
                        };
                        System.Web.HttpContext.Current.Response.Cookies.Add(cookie);
                    }
                    if (System.Web.HttpContext.Current.Request.Cookies["Vshop-Member"] != null)
                    {
                        System.Web.HttpContext.Current.Response.Cookies["Vshop-Member"].Expires = System.DateTime.Now.AddDays(-1.0);
                        System.Web.HttpCookie cookie2 = new System.Web.HttpCookie("Vshop-Member")
                        {
                            Value = usernameMember.UserId.ToString(),
                            Expires = System.DateTime.Now.AddYears(10)
                        };
                        System.Web.HttpContext.Current.Response.Cookies.Add(cookie2);
                    }
                    else
                    {
                        System.Web.HttpCookie cookie3 = new System.Web.HttpCookie("Vshop-Member")
                        {
                            Value = Globals.UrlEncode(usernameMember.UserId.ToString()),
                            Expires = System.DateTime.Now.AddYears(1)
                        };
                        System.Web.HttpContext.Current.Response.Cookies.Add(cookie3);
                    }
                    context.Session["userid"] = usernameMember.UserId.ToString();
                    builder.Append("\"Status\":\"OK\"");
                }
                else
                {
                    builder.Append("\"Status\":\"-2\"");
                }
                builder.Append("}");
                context.Response.Write(builder.ToString());
            }
        }
        private void Vote(System.Web.HttpContext context)
        {
            context.Response.ContentType = "application/json";
            int result = 1;
            int.TryParse(context.Request["voteId"], out result);
            string itemIds = context.Request["itemIds"];
            itemIds = itemIds.Remove(itemIds.Length - 1);
            if (MemberProcessor.GetCurrentMember() == null)
            {
                MemberInfo member = new MemberInfo();
                string generateId = Globals.GetGenerateId();
                member.GradeId = MemberProcessor.GetDefaultMemberGrade();
                member.UserName = "";
                member.OpenId = "";
                member.CreateDate = System.DateTime.Now;
                member.SessionId = generateId;
                member.SessionEndTime = System.DateTime.Now;
                MemberProcessor.CreateMember(member);
                member = MemberProcessor.GetMember(generateId);
                System.Web.HttpCookie cookie = new System.Web.HttpCookie("Vshop-Member")
                {
                    Value = member.UserId.ToString(),
                    Expires = System.DateTime.Now.AddYears(10)
                };
                System.Web.HttpContext.Current.Response.Cookies.Add(cookie);
            }
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.Append("{");
            if (VshopBrowser.Vote(result, itemIds))
            {
                builder.Append("\"Status\":\"OK\"");
            }
            else
            {
                builder.Append("\"Status\":\"Error\"");
            }
            builder.Append("}");
            context.Response.Write(builder.ToString());
        }

        /// <summary>
        /// 退货，退款请求
        /// </summary>
        /// <param name="context"></param>
        public void RequestReturn(HttpContext context)
        {

            context.Response.ContentType = "application/json";

            RefundInfo refundInfo = new RefundInfo();

            refundInfo.OrderId = context.Request["orderid"];
            refundInfo.ApplyForTime = DateTime.Now;
            refundInfo.RefundRemark = context.Request["Reason"];
            refundInfo.HandleStatus = RefundInfo.Handlestatus.NoneAudit;
            refundInfo.Account = context.Request["Account"];
            refundInfo.RefundMoney = decimal.Parse(context.Request["Money"]);
            refundInfo.ProductId = int.Parse(context.Request["productid"]);

            StringBuilder stringBuilder = new StringBuilder();

            refundInfo.UserId = MemberProcessor.GetCurrentMember().UserId;

            int num = 7;

            refundInfo.RefundType = 1;

            if (int.Parse(context.Request["OrderStatus"].ToString()) == 2)
            {
                num = 6;
                refundInfo.HandleStatus = RefundInfo.Handlestatus.NoRefund;
                refundInfo.RefundType = 2;
                refundInfo.AuditTime = DateTime.Now.ToString();
            }
            stringBuilder.Append("{");
            if (string.IsNullOrEmpty(refundInfo.Account.Trim()))
            {
                stringBuilder.Append("\"Status\":\"Mesg\"");
            }
            else if (ShoppingProcessor.GetReturnMes(refundInfo.UserId, refundInfo.OrderId, refundInfo.ProductId, (int)refundInfo.HandleStatus))
            {
                stringBuilder.Append("\"Status\":\"Repeat\"");
            }
            else if (!ShoppingProcessor.InsertOrderRefund(refundInfo))
            {
                stringBuilder.Append("\"Status\":\"Error\"");
            }
            else if (!ShoppingProcessor.UpdateOrderGoodStatu(refundInfo.OrderId, context.Request["skuid"], num))
            {
                stringBuilder.Append("\"Status\":\"Error\"");
            }
            else
            {
                stringBuilder.Append("\"Status\":\"OK\"");
            }
            stringBuilder.Append("}");
            context.Response.Write(stringBuilder.ToString());
        }

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="context"></param>
        public void EditPassword(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string item = context.Request["oldPwd"];
            string str = context.Request["password"];
            string item1 = context.Request["passagain"];
            MemberInfo memberInfo = new MemberInfo();
            HttpCookie httpCookie = HttpContext.Current.Request.Cookies["Vshop-Member"];
            if (httpCookie == null)
            {
                context.Response.Write("{\"Status\":\"-1\"}");
                return;
            }
            int num = int.Parse(httpCookie.Value);
            memberInfo = MemberProcessor.GetMember(num);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("{");
            if (memberInfo.Password != HiCryptographer.Md5Encrypt(item))
            {
                stringBuilder.Append("\"Status\":\"-4\"");
            }
            else if (str != item1)
            {
                stringBuilder.Append("\"Status\":\"-2\"");
            }
            else if (!MemberProcessor.SetPwd(num.ToString(), HiCryptographer.Md5Encrypt(str)))
            {
                stringBuilder.Append("\"Status\":\"-3\"");
            }
            else
            {
                stringBuilder.Append("\"Status\":\"OK\"");
            }
            stringBuilder.Append("}");
            context.Response.Write(stringBuilder.ToString());
        }

        public void GetOrderRedPager(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string item = context.Request["orderid"];
            HttpCookie httpCookie = HttpContext.Current.Request.Cookies["Vshop-Member"];
            if (httpCookie == null)
            {
                context.Response.Write("{\"status\":\"-1\",\"tips\":\"用户未登录！\"}");
                return;
            }
            int num = int.Parse(httpCookie.Value);
            OrderRedPagerInfo orderRedPagerInfo = OrderRedPagerBrower.GetOrderRedPagerInfo(item);
            if (orderRedPagerInfo == null)
            {
                context.Response.Write("{\"status\":\"-2\",\"tips\":\"订单红包不存在！\"}");
                return;
            }
            int maxGetTimes = orderRedPagerInfo.MaxGetTimes;
            if (orderRedPagerInfo.AlreadyGetTimes >= maxGetTimes)
            {
                context.Response.Write("{\"status\":\"-3\",\"tips\":\"订单红包已经领完了！\"}");
                return;
            }
            int num1 = 1;
            int num2 = (int)Math.Floor(orderRedPagerInfo.ItemAmountLimit);
            if (num2 < 2)
            {
                num2 = num1 + 1;
            }

            int num3 = (new Random()).Next(num1, num2);

            DateTime now = DateTime.Now;

            UserRedPagerInfo userRedPagerInfo = new UserRedPagerInfo();

            userRedPagerInfo.Amount = decimal.Parse(num3.ToString());
            userRedPagerInfo.UserID = num;
            userRedPagerInfo.OrderID = orderRedPagerInfo.OrderID;
            userRedPagerInfo.RedPagerActivityName = orderRedPagerInfo.RedPagerActivityName;
            userRedPagerInfo.OrderAmountCanUse = orderRedPagerInfo.OrderAmountCanUse;
            userRedPagerInfo.CreateTime = now;
            userRedPagerInfo.ExpiryTime = now.AddDays((double)orderRedPagerInfo.ExpiryDays);
            userRedPagerInfo.IsUsed = false;

            string str = UserRedPagerBrower.CreateUserRedPager(userRedPagerInfo);
            if (str == "-1")
            {
                context.Response.Write(string.Concat("{\"status\":\"-5\",\"tips\":\"", num.ToString(), "\"}"));
                return;
            }
            if (str != "1")
            {
                context.Response.Write("{\"status\":\"-4\",\"tips\":\"红包领取失败！\"}");
                return;
            }
            context.Response.Write(string.Concat("{\"status\":\"0\",\"tips\":\"", num.ToString(), "\"}"));
        }


        private bool CheckAdjustCommssions(HttpContext httpContext, ref string textRef1)
        {
            if (string.IsNullOrEmpty(httpContext.Request["orderId"]))
            {
                textRef1 = "{\"success\":false,\"msg\":\"订单号不允许为空！\"}";
                return false;
            }
            if (string.IsNullOrEmpty(httpContext.Request["skuId"]))
            {
                textRef1 = "{\"success\":false,\"msg\":\"商品规格不允许为空！\"}";
                return false;
            }
            if (string.IsNullOrEmpty(httpContext.Request["adjustprice"]))
            {
                textRef1 = "{\"success\":false,\"msg\":\"请输入要调整的价格！\"}";
                return false;
            }
            if (string.IsNullOrEmpty(httpContext.Request["commssionprice"]))
            {
                textRef1 = "{\"success\":false,\"msg\":\"佣金金额值不对！\"}";
                return false;
            }
            if ((Convert.ToDecimal(httpContext.Request["adjustprice"]) >= 0M) && (Convert.ToDecimal(httpContext.Request["ajustprice"]) <= Convert.ToDecimal(httpContext.Request["commssionprice"])))
            {
                return true;
            }
            textRef1 = "{\"success\":false,\"msg\":\"输入金额必须在0~" + httpContext.Request["commssionprice"].ToString() + "之间！\"}";
            return false;
        }

        private void AdjustCommssions(HttpContext httpContext)
        {
            httpContext.Response.ContentType = "text/json";
            string s = "";
            if (this.CheckAdjustCommssions(httpContext, ref s))
            {
                decimal result = 0M;
                decimal num2 = 0M;
                decimal.TryParse(httpContext.Request["adjustprice"], out result);
                decimal.TryParse(httpContext.Request["commssionprice"], out num2);
                if (ShoppingProcessor.UpdateAdjustCommssions(httpContext.Request["orderId"], httpContext.Request["skuId"], num2, result))
                {
                    s = "{\"success\":true,\"msg\":\"修改金额成功！\"}";
                }
                else
                {
                    s = "{\"success\":false,\"msg\":\"优惠金额修改失败！\"}";
                }
            }
            httpContext.Response.Write(s);
            httpContext.Response.End();
        }
    }
}
