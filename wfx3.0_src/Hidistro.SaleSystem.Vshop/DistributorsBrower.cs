namespace Hidistro.SaleSystem.Vshop
{
    using System.Linq;
    using Hidistro.Core;
    using Hidistro.Core.Entities;
    using Hidistro.Core.Enums;
    using Hidistro.Entities.Members;
    using Hidistro.Entities.Orders;
    using Hidistro.Entities.VShop;
    using Hidistro.SqlDal.Members;
    using Hidistro.SqlDal.Orders;
    using Hidistro.SqlDal.VShop;
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Data;
    using System.Web.Caching;

    public class DistributorsBrower
    {
        public static bool AddBalanceDrawRequest(BalanceDrawRequestInfo balancerequestinfo)
        {
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            DistributorsInfo currentDistributors = GetCurrentDistributors();
            if ((((currentMember != null) && !string.IsNullOrEmpty(currentMember.RealName)) && ((currentDistributors != null) && (currentDistributors.UserId > 0))) && !string.IsNullOrEmpty(currentMember.CellPhone))
            {
                if (!(string.IsNullOrEmpty(balancerequestinfo.MerchanCade) || !(currentDistributors.RequestAccount != balancerequestinfo.MerchanCade)))
                {
                    new DistributorsDao().UpdateDistributorById(balancerequestinfo.MerchanCade, currentMember.UserId);
                }
                balancerequestinfo.AccountName = currentMember.RealName;
                balancerequestinfo.UserId = currentMember.UserId;
                balancerequestinfo.UserName = currentMember.UserName;
                if (!string.IsNullOrEmpty(currentDistributors.RequestAccount))
                {
                    balancerequestinfo.MerchanCade = currentDistributors.RequestAccount;
                }
                balancerequestinfo.CellPhone = currentMember.CellPhone;
                return new DistributorsDao().AddBalanceDrawRequest(balancerequestinfo);
            }
            return false;
        }

        public static void AddDistributorProductId(List<int> productList)
        {
            int userId = GetCurrentDistributors().UserId;
            if ((userId > 0) && (productList.Count > 0))
            {
                new DistributorsDao().RemoveDistributorProducts(productList, userId);
                foreach (int num2 in productList)
                {
                    new DistributorsDao().AddDistributorProducts(num2, userId);
                }
            }
        }

        public static bool AddDistributors(DistributorsInfo distributors)
        {
            if (IsExiteDistributorsByStoreName(distributors.StoreName) > 0)
            {
                return false;
            }
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            distributors.DistributorGradeId = DistributorGrade.OneDistributor;//分销商级别ID
            distributors.ParentUserId = new int?(currentMember.UserId);//所属上一级分销商ID,默认为自己
            distributors.UserId = currentMember.UserId;//会员ID
            DistributorsInfo currentDistributors = GetCurrentDistributors();
            if (currentDistributors != null)//如果当前访问的分销商存在
            {
                //所属上级分销商ID,多级用|分隔
                if (!(string.IsNullOrEmpty(currentDistributors.ReferralPath) || currentDistributors.ReferralPath.Contains("|")))
                {
                    distributors.ReferralPath = currentDistributors.ReferralPath + "|" + currentDistributors.UserId.ToString();
                }
                else if (!(string.IsNullOrEmpty(currentDistributors.ReferralPath) || !currentDistributors.ReferralPath.Contains("|")))
                {
                    distributors.ReferralPath = currentDistributors.ReferralPath.Split(new char[] { '|' })[1] + "|" + currentDistributors.UserId.ToString();
                }
                else
                {
                    distributors.ReferralPath = currentDistributors.UserId.ToString();
                }
                distributors.ParentUserId = new int?(currentDistributors.UserId);//所属上一级分销商ID
                if (currentDistributors.DistributorGradeId == DistributorGrade.OneDistributor)          //顶级(分销商相对于厂家的级别)
                {
                    distributors.DistributorGradeId = DistributorGrade.TowDistributor;
                }
                else if (currentDistributors.DistributorGradeId == DistributorGrade.TowDistributor)     //二级(分销商相对于厂家的级别)
                {
                    distributors.DistributorGradeId = DistributorGrade.ThreeDistributor;
                }
                else
                {
                    distributors.DistributorGradeId = DistributorGrade.ThreeDistributor;                //子级(分销商相对于厂家的级别)
                }
            }
            //设置所属代理商(By jinhb 20150820)
            distributors.IsAgent=0;
            if (!string.IsNullOrEmpty(distributors.ReferralPath))
            {
                //得到所属分销商，从最近的往上找，找到就COPY对应的代理商累加字符串联
                DistributorsInfo parentDistributors = null;
                string[] arrayReferralPath = distributors.ReferralPath.Split('|');
                parentDistributors = GetCurrentDistributors(int.Parse(arrayReferralPath[arrayReferralPath.Length-1]));
                if (parentDistributors.IsAgent == 1)
                {
                    distributors.AgentPath = (string.IsNullOrEmpty(parentDistributors.AgentPath))
                        ? parentDistributors.UserId.ToString() : parentDistributors.AgentPath + "|" + parentDistributors.UserId.ToString();
                }
                else
                {
                    distributors.AgentPath = parentDistributors.AgentPath;
                }
            }
            if (string.IsNullOrEmpty(distributors.AgentPath))
                return new DistributorsDao().CreateDistributor(distributors);   //分销商没有所属代理商
            else
                return new DistributorsDao().CreateAgent(distributors);   //分销商有所属代理商
        }

        public static void DeleteDistributorProductIds(List<int> productList)
        {
            int userId = GetCurrentDistributors().UserId;
            if ((userId > 0) && (productList.Count > 0))
            {
                new DistributorsDao().RemoveDistributorProducts(productList, userId);
            }
        }

        public static bool FrozenCommision(int userid, string ReferralStatus)
        {
            return new DistributorsDao().FrozenCommision(userid, ReferralStatus);
        }

        public static DbQueryResult GetBalanceDrawRequest(BalanceDrawRequestQuery query)
        {
            return new DistributorsDao().GetBalanceDrawRequest(query);
        }

        public static bool GetBalanceDrawRequestIsCheck(int serialid)
        {
            return new DistributorsDao().GetBalanceDrawRequestIsCheck(serialid);
        }

        public static DbQueryResult GetCommissions(CommissionsQuery query)
        {
            return new DistributorsDao().GetCommissions(query);
        }

        public static DistributorsInfo GetCurrentDistributors()
        {
            return GetCurrentDistributors(Globals.GetCurrentDistributorId());
        }

        public static DistributorsInfo GetCurrentDistributors(int userId)
        {
            DistributorsInfo distributorInfo = HiCache.Get(string.Format("DataCache-Distributor-{0}", userId)) as DistributorsInfo;
            if ((distributorInfo == null) || (distributorInfo.UserId == 0))
            {
                distributorInfo = new DistributorsDao().GetDistributorInfo(userId);
                HiCache.Insert(string.Format("DataCache-Distributor-{0}", userId), distributorInfo, 360, CacheItemPriority.Normal);
            }
            return distributorInfo;
        }

        public static DataTable GetCurrentDistributorsCommosion()
        {
            return new DistributorsDao().GetDistributorsCommosion(Globals.GetCurrentDistributorId());
        }

        public static DataTable GetCurrentDistributorsCommosion(int userId)
        {
            return new DistributorsDao().GetCurrentDistributorsCommosion(userId);
        }

        public static int GetDistributorGrades(string ReferralUserId)
        {
            DistributorsInfo userIdDistributors = GetUserIdDistributors(int.Parse(ReferralUserId));
            List<DistributorGradeInfo> distributorGrades = new DistributorsDao().GetDistributorGrades() as List<DistributorGradeInfo>;
            foreach (DistributorGradeInfo info2 in from item in distributorGrades
                orderby item.CommissionsLimit descending
                select item)
            {
                if (userIdDistributors.DistriGradeId == info2.GradeId)
                {
                    return 0;
                }
                if (info2.CommissionsLimit <= (userIdDistributors.ReferralBlance + userIdDistributors.ReferralRequestBalance))
                {
                    userIdDistributors.DistriGradeId = info2.GradeId;
                    return info2.GradeId;
                }
            }
            return 0;
        }

        public static DistributorsInfo GetDistributorInfo(int distributorid)
        {
            return new DistributorsDao().GetDistributorInfo(distributorid);
        }

        public static int GetDistributorNum(DistributorGrade grade)
        {
            return new DistributorsDao().GetDistributorNum(grade);
        }

        public static DataSet GetDistributorOrder(OrderQuery query)
        {
            return new OrderDao().GetDistributorOrder(query);
        }

        public static int GetDistributorOrderCount(OrderQuery query)
        {
            return new OrderDao().GetDistributorOrderCount(query);
        }

        public static DbQueryResult GetDistributors(DistributorsQuery query)
        {
            return new DistributorsDao().GetDistributors(query);
        }

        public static DataTable GetDistributorsCommission(DistributorsQuery query)
        {
            return new DistributorsDao().GetDistributorsCommission(query);
        }

        public static DataTable GetDistributorsCommosion(int userId, DistributorGrade distributorgrade)
        {
            return new DistributorsDao().GetDistributorsCommosion(userId, distributorgrade);
        }

        public static int GetDownDistributorNum(string userid)
        {
            return new DistributorsDao().GetDownDistributorNum(userid);
        }

        public static DataTable GetDownDistributors(DistributorsQuery query)
        {
            return new DistributorsDao().GetDownDistributors(query);
        }

        public static int GetNotDescDistributorGrades(string ReferralUserId)
        {
            DistributorsInfo userIdDistributors = GetUserIdDistributors(int.Parse(ReferralUserId));
            decimal num2 = userIdDistributors.ReferralBlance + userIdDistributors.ReferralRequestBalance;
            DistributorGradeInfo distributorGradeInfo = DistributorGradeBrower.GetDistributorGradeInfo(userIdDistributors.DistriGradeId);
            if ((distributorGradeInfo != null) && (num2 < distributorGradeInfo.CommissionsLimit))
            {
                return userIdDistributors.DistriGradeId;
            }
            List<DistributorGradeInfo> distributorGrades = new DistributorsDao().GetDistributorGrades() as List<DistributorGradeInfo>;
            foreach (DistributorGradeInfo info3 in from item in distributorGrades
                orderby item.CommissionsLimit descending
                select item)
            {
                if (userIdDistributors.DistriGradeId == info3.GradeId)
                {
                    return 0;
                }
                if (info3.CommissionsLimit <= (userIdDistributors.ReferralBlance + userIdDistributors.ReferralRequestBalance))
                {
                    return info3.GradeId;
                }
            }
            return 0;
        }

        public static DataTable GetNotSendRedpackRecord(int balancedrawrequestid)
        {
            return new SendRedpackRecordDao().GetNotSendRedpackRecord(balancedrawrequestid);
        }

        public static int GetRedPackTotalAmount(int balancedrawrequestid, int userid)
        {
            return new SendRedpackRecordDao().GetRedPackTotalAmount(balancedrawrequestid, userid);
        }

        public static SendRedpackRecordInfo GetSendRedpackRecordByID(int id)
        {
            return new SendRedpackRecordDao().GetSendRedpackRecordByID(id);
        }

        public static DbQueryResult GetSendRedpackRecordRequest(SendRedpackRecordQuery query)
        {
            return new SendRedpackRecordDao().GetSendRedpackRecordRequest(query);
        }

        public static decimal GetUserCommissions(int userid, DateTime fromdatetime)
        {
            return new DistributorsDao().GetUserCommissions(userid, fromdatetime);
        }

        public static DistributorsInfo GetUserIdDistributors(int userid)
        {
            return new DistributorsDao().GetDistributorInfo(userid);
        }

        public static DataSet GetUserRanking(int userid)
        {
            return new DistributorsDao().GetUserRanking(userid);
        }

        public static bool HasDrawRequest(int serialid)
        {
            return new SendRedpackRecordDao().HasDrawRequest(serialid);
        }

        private static int IsExiteDistributorsByStoreName(string stroname)
        {
            return new DistributorsDao().IsExiteDistributorsByStoreName(stroname);
        }

        public static bool IsExitsCommionsRequest()
        {
            return new DistributorsDao().IsExitsCommionsRequest(Globals.GetCurrentDistributorId());
        }

        public static DataTable OrderIDGetCommosion(string orderid)
        {
            return new DistributorsDao().OrderIDGetCommosion(orderid);
        }

        public static void RemoveDistributorCache(int userId)
        {
            HiCache.Remove(string.Format("DataCache-Distributor-{0}", userId));
        }

        public static string SendRedPackToBalanceDrawRequest(int serialid)
        {
            return new DistributorsDao().SendRedPackToBalanceDrawRequest(serialid);
        }

        public static bool setCommission(OrderInfo order, DistributorsInfo DisInfo)
        {
            bool flag = false;
            decimal num = 0M; 
            decimal num2 = 0M;
            decimal resultCommTatal = 0M;
            string userId = order.ReferralUserId.ToString();
            string orderId = order.OrderId;
            decimal orderTotal = 0M;
            ArrayList gradeIdList = new ArrayList();
            ArrayList referralUserIdList = new ArrayList();
            foreach (LineItemInfo info in order.LineItems.Values)
            {
                if (info.OrderItemsStatus.ToString() == OrderStatus.SellerAlreadySent.ToString())
                {
                    num2 += info.ItemsCommission;
                    if (!(string.IsNullOrEmpty(info.ItemAdjustedCommssion.ToString()) || (info.ItemAdjustedCommssion <= 0M)))
                    {
                        num += info.ItemAdjustedCommssion;
                    }
                    orderTotal += info.GetSubTotal();
                }
            }
            resultCommTatal = num2 - num;
            flag = new DistributorsDao().UpdateCalculationCommission(userId, userId, orderId, orderTotal, resultCommTatal);
            int notDescDistributorGrades = GetNotDescDistributorGrades(userId);
            if (notDescDistributorGrades > 0)
            {
                gradeIdList.Add(notDescDistributorGrades);
                referralUserIdList.Add(userId);
                flag = new DistributorsDao().UpdateGradeId(gradeIdList, referralUserIdList);
            }
            return flag;
        }

        public static bool SetRedpackRecordIsUsed(int id, bool issend)
        {
            return new SendRedpackRecordDao().SetRedpackRecordIsUsed(id, issend);
        }

        /// <summary>
        /// jinhb,20150820，更新三级返佣金额，加入了无限代理佣金算法
        /// </summary>
        public static bool UpdateCalculationCommission(OrderInfo order)
        {
            DistributorsInfo userIdDistributors = GetUserIdDistributors(order.ReferralUserId);
            SiteSettings masterSettings = SettingsManager.GetMasterSettings(false);
            bool flag = false;
            if (userIdDistributors != null)
            {
                if (!masterSettings.EnableCommission)//未启用三级返佣
                {
                    if (userIdDistributors.ReferralStatus == 0)//状态正常
                    {
                        flag = setCommission(order, userIdDistributors);//设置分销商佣金(仅更新直接销售的分销商返佣)
                    }
                }
                else//启用了三级返佣
                {
                    if (userIdDistributors.ReferralStatus == 0)
                    {
                        flag = setCommission(order, userIdDistributors);//更新直接销售的分销商返佣
                    }
                    if (!string.IsNullOrEmpty(userIdDistributors.ReferralPath))
                    {
                        ArrayList commTatalList = new ArrayList();
                        decimal num = 0M;
                        ArrayList userIdList = new ArrayList();
                        string referralUserId = order.ReferralUserId.ToString();
                        string orderId = order.OrderId;
                        ArrayList orderTotalList = new ArrayList();
                        decimal num2 = 0M;
                        ArrayList gradeIdList = new ArrayList();
                        string[] strArray = userIdDistributors.ReferralPath.Split(new char[] { '|' });
                        if (strArray.Length == 1)
                        {
                            #region 上一级返佣
                            DistributorsInfo info2 = GetUserIdDistributors(int.Parse(strArray[0]));
                            if (info2.ReferralStatus == 0)
                            {
                                foreach (LineItemInfo info3 in order.LineItems.Values)
                                {
                                    if (info3.OrderItemsStatus.ToString() == OrderStatus.SellerAlreadySent.ToString())
                                    {
                                        num += info3.SecondItemsCommission;
                                        num2 += info3.GetSubTotal();
                                    }
                                }
                                commTatalList.Add(num);
                                orderTotalList.Add(num2);
                                userIdList.Add(info2.UserId);
                            }
                            #endregion 上一级返佣
                        }
                        if (strArray.Length == 2)
                        {
                            #region 上一级、上二级返佣
                            DistributorsInfo info4 = GetUserIdDistributors(int.Parse(strArray[0]));
                            if (info4.ReferralStatus == 0)
                            {
                                foreach (LineItemInfo info3 in order.LineItems.Values)
                                {
                                    if (info3.OrderItemsStatus.ToString() == OrderStatus.SellerAlreadySent.ToString())
                                    {
                                        num += info3.ThirdItemsCommission;
                                        num2 += info3.GetSubTotal();
                                    }
                                }
                                commTatalList.Add(num);
                                orderTotalList.Add(num2);
                                userIdList.Add(info4.UserId);
                            }
                            DistributorsInfo info5 = GetUserIdDistributors(int.Parse(strArray[1]));
                            num = 0M;
                            num2 = 0M;
                            if (info5.ReferralStatus == 0)
                            {
                                foreach (LineItemInfo info3 in order.LineItems.Values)
                                {
                                    if (info3.OrderItemsStatus.ToString() == OrderStatus.SellerAlreadySent.ToString())
                                    {
                                        num += info3.SecondItemsCommission;
                                        num2 += info3.GetSubTotal();
                                    }
                                }
                                commTatalList.Add(num);
                                orderTotalList.Add(num2);
                                userIdList.Add(info5.UserId);
                            }
                            #endregion 上一级、上二级返佣

                            //三级向上存在代理时进行设置
                            if (!string.IsNullOrEmpty(info4.AgentPath))
                            {
                                System.Data.DataView defaultViewAgent = DistributorGradeBrower.GetAllAgentGrade().DefaultView;  //当前系统中所有代理商等级
                                #region 设置无限代理返佣

                                string[] arrayAgentPath = info4.AgentPath.Split(new char[] { '|' });
                                foreach (string strAgentPat in arrayAgentPath)
                                {
                                    DistributorsInfo infoAgent = GetUserIdDistributors(int.Parse(strAgentPat));
                                    if (infoAgent.IsAgent != 1 || infoAgent.ReferralStatus == 1) continue;
                                    defaultViewAgent.RowFilter = " AgentGradeId=" + infoAgent.AgentGradeId;
                                    if (defaultViewAgent.Count == 0) continue;
                                    num = 0M;
                                    num2 = 0M;
                                    foreach (LineItemInfo info in order.LineItems.Values)
                                    {
                                        if (info.OrderItemsStatus.ToString() == OrderStatus.SellerAlreadySent.ToString())
                                        {
                                            if (!SettingsManager.GetMasterSettings(false).EnableProfit)
                                                num += decimal.Parse(defaultViewAgent[0]["FirstCommissionRise"].ToString()) / 100m * info.GetSubTotal();
                                            else
                                                num += decimal.Parse(defaultViewAgent[0]["FirstCommissionRise"].ToString()) / 100m * info.GetSubTotalProfit();
                                            num2 += info.GetSubTotal();
                                        }
                                    }
                                    commTatalList.Add(num);
                                    orderTotalList.Add(num2);
                                    userIdList.Add(infoAgent.UserId);
                                }

                                #endregion 设置无限代理返佣
                            }
                        }

                        flag = new DistributorsDao().UpdateTwoCalculationCommission(userIdList, referralUserId, orderId, orderTotalList, commTatalList);
                        for (int i = 0; i < userIdList.Count; i++)
                        {
                            int notDescDistributorGrades = GetNotDescDistributorGrades(userIdList[i].ToString());
                            gradeIdList.Add(notDescDistributorGrades);
                        }
                        flag = new DistributorsDao().UpdateGradeId(gradeIdList, userIdList);
                    }
                }
                RemoveDistributorCache(userIdDistributors.UserId);
            }
            OrderRedPagerBrower.CreateOrderRedPager(order.OrderId, order.GetTotal(), order.UserId);
            return flag;
        }

        public static bool UpdateDistributor(DistributorsInfo query)
        {
            int num = IsExiteDistributorsByStoreName(query.StoreName);
            if ((num != 0) && (num != query.UserId))
            {
                return false;
            }
            return new DistributorsDao().UpdateDistributor(query);
        }

        public static bool UpdateDistributorMessage(DistributorsInfo query)
        {
            int num = IsExiteDistributorsByStoreName(query.StoreName);
            if ((num != 0) && (num != query.UserId))
            {
                return false;
            }
            return new DistributorsDao().UpdateDistributorMessage(query);
        }
    }
}

