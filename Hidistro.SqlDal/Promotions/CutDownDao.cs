﻿namespace Hidistro.SqlDal.Promotions
{
    using Hidistro.Core;
    using Hidistro.Core.Entities;
    using Hidistro.Core.Enums;
    using Hidistro.Entities;
    using Hidistro.Entities.Commodities;
    using Hidistro.Entities.Promotions;
    using Hidistro.SqlDal;
    using Hidistro.SqlDal.Commodities;
    using Microsoft.Practices.EnterpriseLibrary.Data;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.Common;
    using System.Linq;
    using System.Runtime.InteropServices;
    using System.Text;

    public class CutDownDao
    {
        private Database database = DatabaseFactory.CreateDatabase();
        /// <summary>
        /// 添加活动
        /// </summary>
        public int AddCutDown(CutDownInfo cutDown, DbTransaction dbTran = null)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("DECLARE @DisplaySequence AS INT SELECT @DisplaySequence = (CASE WHEN MAX(DisplaySequence) IS NULL THEN 1 ELSE MAX(DisplaySequence) + 1 END) FROM Hishop_CutDown;INSERT INTO Hishop_CutDown(ProductId,FirstPrice,StartDate,EndDate,MaxCount,Content,Status,DisplaySequence,CurrentPrice,PerCutPrice,Count,MinPrice) VALUES(@ProductId,@FirstPrice,@StartDate,@EndDate,@MaxCount,@Content,@Status,@DisplaySequence,@CurrentPrice,@PerCutPrice,@Count,@MinPrice); SELECT @@IDENTITY");
            this.database.AddInParameter(sqlStringCommand, "ProductId", DbType.Int32, cutDown.ProductId);
            this.database.AddInParameter(sqlStringCommand, "StartDate", DbType.DateTime, cutDown.StartDate);
            this.database.AddInParameter(sqlStringCommand, "EndDate", DbType.DateTime, cutDown.EndDate);
            this.database.AddInParameter(sqlStringCommand, "MaxCount", DbType.Int32, cutDown.MaxCount);
            this.database.AddInParameter(sqlStringCommand, "Content", DbType.String, cutDown.Content);
            this.database.AddInParameter(sqlStringCommand, "PerCutPrice", DbType.String, cutDown.PerCutPrice);
            this.database.AddInParameter(sqlStringCommand, "Count", DbType.String, cutDown.Count);
            this.database.AddInParameter(sqlStringCommand, "MinPrice", DbType.String, cutDown.MinPrice);
            this.database.AddInParameter(sqlStringCommand, "FirstPrice", DbType.String, cutDown.CurrentPrice);
            this.database.AddInParameter(sqlStringCommand, "CurrentPrice", DbType.String, cutDown.CurrentPrice);
            this.database.AddInParameter(sqlStringCommand, "Status", DbType.Int32, 1);
            object obj2 = null;
            if (dbTran != null)
            {
                obj2 = this.database.ExecuteScalar(sqlStringCommand, dbTran);
            }
            else
            {
                obj2 = this.database.ExecuteScalar(sqlStringCommand);
            }
            if (obj2 != null)
            {
                return Convert.ToInt32(obj2);
            }
            return 0;
        }

        public bool DeleteCutDown(int cutDownId)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("DELETE FROM Hishop_CutDown WHERE cutDownId=@cutDownId");
            this.database.AddInParameter(sqlStringCommand, "cutDownId", DbType.Int32, cutDownId);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool DeleteCutDownDetail(int cutDownId, DbTransaction dbTran)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("DELETE FROM Hishop_CutDownDetail WHERE CutDownId=@CutDownId");
            this.database.AddInParameter(sqlStringCommand, "CutDownId", DbType.Int32, cutDownId);
            if (dbTran != null)
            {
                return (this.database.ExecuteNonQuery(sqlStringCommand, dbTran) >= 0);
            }
            return (this.database.ExecuteNonQuery(sqlStringCommand) >= 0);
        }

        public GroupBuyInfo GetGroupBuy(int groupBuyId, DbTransaction trans = null)
        {
            GroupBuyInfo info = null;
            IDataReader reader;
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT * FROM vw_Hishop_GroupBuy WHERE GroupBuyId=@GroupBuyId;SELECT * FROM Hishop_GroupBuyCondition WHERE GroupBuyId=@GroupBuyId");
            this.database.AddInParameter(sqlStringCommand, "GroupBuyId", DbType.Int32, groupBuyId);
            if (trans != null)
            {
                using (reader = this.database.ExecuteReader(sqlStringCommand, trans))
                {
                    if (reader.Read())
                    {
                        info = DataMapper.PopulateGroupBuy(reader);
                    }
                }
                return info;
            }
            using (reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    info = DataMapper.PopulateGroupBuy(reader);
                }
            }
            return info;
        }

        public CutDownInfo GetCutDown(int cutDownId)
        {
            CutDownInfo info = null;
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT * FROM vw_Hishop_CutDown WHERE CutDownId=@CutDownId;SELECT * FROM Hishop_cutdowndetail WHERE CutDownId=@CutDownId");
            this.database.AddInParameter(sqlStringCommand, "CutDownId", DbType.Int32, cutDownId);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    info = DataMapper.PopulateCutDown(reader);
                }
                reader.NextResult();
                while (reader.Read())
                {
                    CutDownDetailInfo item = new CutDownDetailInfo
                    {
                        CutDownId = (int)reader["CutDownId"],
                        MemberId = (int)reader["MemberId"],
                        CutTime = (DateTime)reader["CutTime"],
                        CutDownPrice = (decimal)reader["CutDownPrice"]
                    };
                    info.CutDownDetails.Add(item);
                }
            }
            return info;
        }

        /// <summary>
        /// 砍价活动列表
        /// </summary>
        public DbQueryResult GetCutDownList(CutDownQuery query)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(" 1=1");
            if (query.State > 0)
            {
                builder.AppendFormat(" AND Status = {0} ", query.State);
            }
            if (!string.IsNullOrEmpty(query.ProductName))
            {
                builder.AppendFormat(" AND ProductName like '%{0}%' ", DataHelper.CleanSearchString(query.ProductName));
            }
            string selectFields = "cutdownid,firstPrice,productid,ProductName,startdate,enddate,maxcount,[status],percutprice,[COUNT],minprice,CurrentCutCount,ISNULL(ProdcutQuantity,0) AS ProdcutQuantity,DisplaySequence,OrderCount";
            return DataHelper.PagingByTopnotin(query.PageIndex, query.PageSize, query.SortBy, query.SortOrder, query.IsCount, "vw_hishop_cutdown", "CutDownId", builder.ToString(), selectFields);
        }
        /// <summary>
        /// 获取砍价商品列表
        /// </summary>
        public DataTable GetCutDownProducts(int? categoryId, string keyWord, int page, int size, out int total, bool onlyUnFinished = true)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("a.cutDownId,a.FirstPrice,a.ProductId,a.ProductName,b.ProductCode,b.ShortDescription,SoldCount,ProdcutQuantity,");
            builder.Append(" ThumbnailUrl60,ThumbnailUrl100,ThumbnailUrl160,ThumbnailUrl180,ThumbnailUrl220,ThumbnailUrl310,a.CurrentPrice,b.SalePrice");
            StringBuilder builder2 = new StringBuilder();
            builder2.Append(" vw_Hishop_CutDown a left join vw_Hishop_BrowseProductList b on a.ProductId = b.ProductId  ");
            StringBuilder builder3 = new StringBuilder(" SaleStatus=1");
            if (onlyUnFinished)
            {
                builder3.AppendFormat(" AND  a.Status = {0} And a.EndDate > GETDATE()", 1);
            }
            if (categoryId.HasValue)
            {
                CategoryInfo category = new CategoryDao().GetCategory(categoryId.Value);
                if (category != null)
                {
                    builder3.AppendFormat(" AND ( MainCategoryPath LIKE '{0}|%' OR ExtendCategoryPath LIKE '{0}|%' OR ExtendCategoryPath1 LIKE '{0}|%' OR ExtendCategoryPath2 LIKE '{0}|%' OR ExtendCategoryPath3 LIKE '{0}|%' OR ExtendCategoryPath4 LIKE '{0}|%') ", category.Path);
                }
            }
            if (!string.IsNullOrEmpty(keyWord))
            {
                builder3.AppendFormat(" AND (ProductName LIKE '%{0}%' OR ProductCode LIKE '%{0}%')", keyWord);
            }
            string sortBy = "a.DisplaySequence";
            DbQueryResult result = DataHelper.PagingByRownumber(page, size, sortBy, SortAction.Desc, true, builder2.ToString(), "CutDownId", builder3.ToString(), builder.ToString());
            DataTable data = (DataTable)result.Data;
            total = result.TotalRecords;
            return data;
        }
        /// <summary>
        /// 获取砍价活动的订单数量
        /// </summary>
        /// <param name="cutDownId"></param>
        /// <returns></returns>
        public int GetCutDownOrderCount(int cutDownId)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT SUM(Quantity) FROM Hishop_OrderItems WHERE OrderId IN (SELECT OrderId FROM Hishop_Orders WHERE cutDownBuyId = @CutDownId AND OrderStatus <> 1 AND OrderStatus <> 4)");
            this.database.AddInParameter(sqlStringCommand, "CutDownId", DbType.Int32, cutDownId);
            object obj2 = this.database.ExecuteScalar(sqlStringCommand);
            if ((obj2 != null) && (obj2 != DBNull.Value))
            {
                return (int)obj2;
            }
            return 0;
        }

        public string GetPriceByProductId(int productId)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT SalePrice FROM vw_Hishop_BrowseProductList WHERE ProductId=@ProductId");
            this.database.AddInParameter(sqlStringCommand, "ProductId", DbType.Int32, productId);
            return this.database.ExecuteScalar(sqlStringCommand).ToString();
        }

        public bool ProductCutDownExist(int productId)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT COUNT(*) FROM Hishop_CutDown WHERE ProductId=@ProductId AND Status=@Status");
            this.database.AddInParameter(sqlStringCommand, "ProductId", DbType.Int32, productId);
            this.database.AddInParameter(sqlStringCommand, "Status", DbType.Int32, 1);
            return (((int)this.database.ExecuteScalar(sqlStringCommand)) > 0);
        }

        public void RefreshGroupBuyFinishState(int groupbuyId, DbTransaction trans = null)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("UPDATE Hishop_GroupBuy SET Status = 2 WHERE GroupBuyId=@groupBuyId AND Status = 1 AND (EndDate <= @CurrentTime OR soldCount >= maxCount);");
            builder.Append("UPDATE Hishop_GroupBuy SET Status = 4 WHERE GroupBuyId=@groupBuyId AND Status = 5 AND (select Count(1) from Hishop_Orders where GroupBuyId = Hishop_GroupBuy.GroupBuyId and OrderStatus = 6) =0;");
            Database database = DatabaseFactory.CreateDatabase();
            DbCommand sqlStringCommand = database.GetSqlStringCommand(builder.ToString());
            database.AddInParameter(sqlStringCommand, "CurrentTime", DbType.DateTime, DateTime.Now);
            database.AddInParameter(sqlStringCommand, "groupBuyId", DbType.Int32, groupbuyId);
            if (trans != null)
            {
                database.ExecuteNonQuery(sqlStringCommand, trans);
            }
            else
            {
                database.ExecuteNonQuery(sqlStringCommand);
            }
        }

        public bool SetGroupBuyEndUntreated(int groupBuyId)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("UPDATE Hishop_GroupBuy SET Status=@Status,EndDate=@EndDate WHERE GroupBuyId=@GroupBuyId");
            this.database.AddInParameter(sqlStringCommand, "GroupBuyId", DbType.Int32, groupBuyId);
            this.database.AddInParameter(sqlStringCommand, "EndDate", DbType.DateTime, DateTime.Now);
            this.database.AddInParameter(sqlStringCommand, "Status", DbType.Int32, 2);
            return (this.database.ExecuteNonQuery(sqlStringCommand) == 1);
        }

        private bool SetGroupBuyFailed(int groupBuyId)
        {
            IDataReader reader;
            StringBuilder builder = new StringBuilder();
            builder.Append("update Hishop_Orders set OrderStatus = 6 where GroupBuyId = @GroupBuyId and OrderStatus = 2;");
            builder.AppendFormat("update Hishop_Orders set OrderStatus = 4,CloseReason='{0}' where GroupBuyId = @GroupBuyId and OrderStatus = 1;", "团购失败,自动关闭");
            builder.Append("UPDATE Hishop_GroupBuy SET Status = 5,SoldCount = 0 WHERE GroupBuyId = @GroupBuyId AND (select Count(1) from Hishop_Orders where GroupBuyId = @GroupBuyId and OrderStatus = 6) >0;");
            builder.Append("UPDATE Hishop_GroupBuy SET Status = 4,SoldCount = 0 WHERE GroupBuyId = @GroupBuyId AND (select Count(1) from Hishop_Orders where GroupBuyId = @GroupBuyId and OrderStatus = 6) =0;");
            builder.Append("  select OrderId,TelPhone,CellPhone,ShippingRegion+[Address] as [Address],ShipTo from Hishop_Orders where GroupBuyId = @GroupBuyId and OrderStatus = 6; ");
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            this.database.AddInParameter(sqlStringCommand, "GroupBuyId", DbType.Int32, groupBuyId);
            using (reader = this.database.ExecuteReader(sqlStringCommand))
            {
                RefundInfo refundInfo = new RefundInfo();
                RefundDao dao = new RefundDao();
                while (reader.Read())
                {
                    refundInfo.OrderId = reader["OrderId"].ToString();
                    refundInfo.RefundRemark = "团购失败，申请退款";
                    refundInfo.ApplyForTime = DateTime.Now;
                    refundInfo.HandleStatus = RefundInfo.Handlestatus.Applied;
                    dao.AddRefund(refundInfo);
                }
            }
            builder.Clear();
            builder.Append("select c.SkuId,c.Quantity from Hishop_GroupBuy a left join Hishop_Orders b on a.GroupBuyId = b.GroupBuyId left join Hishop_OrderItems c on b.OrderId = c.OrderId left join Hishop_SKUs d on c.SkuId = d.SkuId where a.GroupBuyId =@GroupBuyId and b.OrderStatus = 6");
            sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            this.database.AddInParameter(sqlStringCommand, "GroupBuyId", DbType.Int32, groupBuyId);
            Dictionary<string, int> source = new Dictionary<string, int>();
            using (reader = this.database.ExecuteReader(sqlStringCommand))
            {
                while (reader.Read())
                {
                    Dictionary<string, int> dictionary2;
                    string str2;
                    string key = reader.GetString(0);
                    if (!source.ContainsKey(key))
                    {
                        source[key] = 0;
                    }
                    (dictionary2 = source)[str2 = key] = dictionary2[str2] + reader.GetInt32(1);
                }
            }
            builder.Clear();
            for (int i = 0; i < source.Count; i++)
            {
                builder.AppendFormat("update Hishop_SKUs set Stock=Stock+{1} where SKUId = '{0}';", source.ElementAt<KeyValuePair<string, int>>(i).Key, source.ElementAt<KeyValuePair<string, int>>(i).Value);
            }
            this.database.ExecuteNonQuery(CommandType.Text, builder.ToString());
            return true;
        }

        public bool SetGroupBuyStatus(int groupBuyId, GroupBuyStatus status)
        {
            if (status != GroupBuyStatus.Failed)
            {
                DbCommand sqlStringCommand = this.database.GetSqlStringCommand("UPDATE Hishop_GroupBuy SET Status=@Status WHERE GroupBuyId=@GroupBuyId;UPDATE Hishop_Orders SET GroupBuyStatus=@Status WHERE GroupBuyId=@GroupBuyId");
                this.database.AddInParameter(sqlStringCommand, "GroupBuyId", DbType.Int32, groupBuyId);
                this.database.AddInParameter(sqlStringCommand, "Status", DbType.Int32, (int)status);
                return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
            }
            return this.SetGroupBuyFailed(groupBuyId);
        }

        public void SwapCutDownSequence(int cutDownId, int displaySequence)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("UPDATE Hishop_CutDown SET DisplaySequence = @DisplaySequence WHERE cutDownId=@cutDownId");
            this.database.AddInParameter(sqlStringCommand, "DisplaySequence", DbType.Int32, displaySequence);
            this.database.AddInParameter(sqlStringCommand, "cutDownId", DbType.Int32, cutDownId);
            this.database.ExecuteNonQuery(sqlStringCommand);
        }
        /// <summary>
        /// 更新砍价活动
        /// </summary>

        public bool UpdateCutDown(CutDownInfo cutDown, DbTransaction dbTran)
        {//(ProductId,StartDate,EndDate,MaxCount,Content,Status,DisplaySequence,PerCutPrice,Count,MinPrice) VALUES(@ProductId,,@StartDate,@EndDate,@MaxCount,@Content,@Status,@DisplaySequence,@PerCutPrice,@Count,@MinPrice)
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("UPDATE Hishop_CutDown SET ProductId=@ProductId,StartDate=@StartDate,EndDate=@EndDate,MaxCount=@MaxCount,Content=@Content,PerCutPrice=@PerCutPrice,Count=@Count,MinPrice=@MinPrice WHERE CutDownId=@CutDownId");
            this.database.AddInParameter(sqlStringCommand, "CutDownId", DbType.Int32, cutDown.CutDownId);
            this.database.AddInParameter(sqlStringCommand, "ProductId", DbType.Int32, cutDown.ProductId);
            this.database.AddInParameter(sqlStringCommand, "StartDate", DbType.DateTime, cutDown.StartDate);
            this.database.AddInParameter(sqlStringCommand, "EndDate", DbType.DateTime, cutDown.EndDate);
            this.database.AddInParameter(sqlStringCommand, "MaxCount", DbType.Int32, cutDown.MaxCount);
            this.database.AddInParameter(sqlStringCommand, "Content", DbType.String, cutDown.Content);
            this.database.AddInParameter(sqlStringCommand, "PerCutPrice", DbType.String, cutDown.PerCutPrice);
            this.database.AddInParameter(sqlStringCommand, "Count", DbType.String, cutDown.Count);
            this.database.AddInParameter(sqlStringCommand, "MinPrice", DbType.String, cutDown.MinPrice);
            if (dbTran != null)
            {
                return (this.database.ExecuteNonQuery(sqlStringCommand, dbTran) == 1);
            }
            return (this.database.ExecuteNonQuery(sqlStringCommand) == 1);
        }

        public bool AddGroupBuyCondition(int groupBuyId, IList<GropBuyConditionInfo> gropBuyConditions, DbTransaction dbTran)
        {
            if (gropBuyConditions.Count <= 0)
            {
                return false;
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("INSERT INTO Hishop_GroupBuyCondition(GroupBuyId,Count,Price) VALUES(@GroupBuyId,@Count,@Price)");
            this.database.AddInParameter(sqlStringCommand, "GroupBuyId", DbType.Int32, groupBuyId);
            this.database.AddInParameter(sqlStringCommand, "Count", DbType.Int32);
            this.database.AddInParameter(sqlStringCommand, "Price", DbType.Currency);
            try
            {
                foreach (GropBuyConditionInfo info in gropBuyConditions)
                {
                    this.database.SetParameterValue(sqlStringCommand, "Count", info.Count);
                    this.database.SetParameterValue(sqlStringCommand, "Price", info.Price);
                    if (dbTran != null)
                    {
                        this.database.ExecuteNonQuery(sqlStringCommand, dbTran);
                    }
                    else
                    {
                        this.database.ExecuteNonQuery(sqlStringCommand);
                    }
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        public decimal GetCurrentPrice(int groupBuyId, int prodcutQuantity)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("DECLARE @price money;SELECT @price = MIN(price) FROM Hishop_GroupBuyCondition WHERE GroupBuyId=@GroupBuyId AND Count<=@prodcutQuantity;if @price IS NULL SELECT @price = max(price) FROM Hishop_GroupBuyCondition WHERE GroupBuyId=@GroupBuyId ;select @price");
            this.database.AddInParameter(sqlStringCommand, "GroupBuyId", DbType.Int32, groupBuyId);
            this.database.AddInParameter(sqlStringCommand, "prodcutQuantity", DbType.Int32, prodcutQuantity);
            return this.database.ExecuteScalar(sqlStringCommand).ToDecimal();
        }

        public GroupBuyInfo GetProductGroupBuyInfo(int productId)
        {
            GroupBuyInfo info = null;
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT * FROM Hishop_GroupBuy WHERE ProductId=@ProductId AND Status = @Status; SELECT * FROM Hishop_GroupBuyCondition WHERE GroupBuyId=(SELECT GroupBuyId FROM Hishop_GroupBuy WHERE ProductId=@ProductId AND Status = @Status)");
            this.database.AddInParameter(sqlStringCommand, "ProductId", DbType.Int32, productId);
            this.database.AddInParameter(sqlStringCommand, "Status", DbType.Int32, 1);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    info = DataMapper.PopulateGroupBuy(reader);
                }
                reader.NextResult();
                while (reader.Read())
                {
                    GropBuyConditionInfo item = new GropBuyConditionInfo
                    {
                        Count = (int)reader["Count"],
                        Price = (decimal)reader["Price"]
                    };
                    if (info != null)
                    {
                        info.GroupBuyConditions.Add(item);
                    }
                }
            }
            return info;
        }


        /// <summary>
        /// 获取单个砍价信息
        /// </summary>
        public CutDownDetailInfo GetCutDownDetail(int cutDownId,int memberId)
        {
            CutDownDetailInfo info = null;
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("Select * from hishop_cutdowndetail where cutdownid=@cutdownid and memberId=@memberId");
            this.database.AddInParameter(sqlStringCommand, "cutdownid", DbType.Int32, cutDownId);
            this.database.AddInParameter(sqlStringCommand, "memberId", DbType.Int32, memberId);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    info = DataMapper.PopulateCutDownDetails(reader);
                }
            }
            return info;
        }
        
        /// <summary>
        /// 获取砍价详情列表
        /// </summary>
        public DbQueryResult GetCutDownDetailList(CutDownDetailsQuery query)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(" 1=1");
            if (query.CutDownId > 0)
            {
                builder.AppendFormat(" AND CutDownId = {0} ", query.CutDownId);
            }
            if (query.MemberId > 0)
            {
                builder.AppendFormat(" AND MemberId = {0} ", query.MemberId);
            }

            string selectFields = "*";
            return DataHelper.PagingByTopnotin(query.PageIndex, query.PageSize, query.SortBy, query.SortOrder, query.IsCount, "hishop_cutdowndetail", "DetailId", builder.ToString(), selectFields);
        }

        /// <summary>
        /// 获取当前被砍价总数
        /// </summary>
        public decimal GetCutDownTotalPrice(int cutDownId)
        {
            decimal CutDownTotalPrice = 0M;
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("Select SUM(cutdownprice)as CutDownTotalPrice from hishop_cutdowndetail where cutdownid=@cutdownid");
            this.database.AddInParameter(sqlStringCommand, "cutdownid", DbType.Int32, cutDownId);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    decimal.TryParse(reader["CutDownTotalPrice"].ToString(), out CutDownTotalPrice);
                }
            }
            return CutDownTotalPrice;
        }

        /// <summary>
        /// 获取当前被砍价总次数
        /// </summary>
        public int GetCutDownTotalCount(int cutDownId, int memberId = 0)
        {
            int num = 0;
            string sql = string.Format("Select COUNT(*)as cutDownTotalCount from hishop_cutdowndetail where cutdownid={0}", cutDownId);
            if (memberId != 0)
                sql += string.Format(" and memberId={0}", memberId);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(sql);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    int.TryParse(reader["cutDownTotalCount"].ToString(), out num);
                }
            }
            return num;
        }
        /// <summary>
        /// 砍价
        /// </summary>
        public bool goCutDown(CutDownDetailInfo info)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("insert into hishop_CutDownDetail (CutDownId,memberId,cutTime,cutDownPrice) values(@CutDownId,@memberId,@cutTime,@cutDownPrice)");
            this.database.AddInParameter(sqlStringCommand, "CutDownId", DbType.Int32, info.CutDownId);
            this.database.AddInParameter(sqlStringCommand, "memberId", DbType.Int32, info.MemberId);
            this.database.AddInParameter(sqlStringCommand, "cutTime", DbType.DateTime, DateTime.Now);
            this.database.AddInParameter(sqlStringCommand, "cutDownPrice", DbType.Decimal, info.CutDownPrice);
            return (this.database.ExecuteNonQuery(sqlStringCommand) == 1);
        }
        /// <summary>
        /// 更新当前商品抢购价
        /// </summary>
        public bool updateCurrentPrice(int cutdownId, decimal cutPrice)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("update hishop_CutDown set CurrentPrice = CurrentPrice - @cutPrice where CutDownId=@cutdownId");
            this.database.AddInParameter(sqlStringCommand, "CutDownId", DbType.Int32, cutdownId);
            this.database.AddInParameter(sqlStringCommand, "cutPrice", DbType.Decimal, cutPrice);
            return (this.database.ExecuteNonQuery(sqlStringCommand) == 1);
        }

        /// <summary>
        /// 更新砍价活动状态
        /// </summary>
        public bool updateCutDownStatus(int cutdownId,CutDownStatus status)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("update hishop_CutDown set Status = @Status where CutDownId=@cutdownId");
            this.database.AddInParameter(sqlStringCommand, "CutDownId", DbType.Int32, cutdownId);
            this.database.AddInParameter(sqlStringCommand, "Status", DbType.Int32, status);
            return (this.database.ExecuteNonQuery(sqlStringCommand) == 1);
        }
    }
}

