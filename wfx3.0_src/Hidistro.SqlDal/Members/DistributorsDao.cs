namespace Hidistro.SqlDal.Members
{
    using Hidistro.Core;
    using Hidistro.Core.Entities;
    using Hidistro.Core.Enums;
    using Hidistro.Entities;
    using Hidistro.Entities.Members;
    using Hidistro.Entities.Orders;
    using Hidistro.Entities.VShop;
    using Hidistro.SqlDal.VShop;
    using Microsoft.Practices.EnterpriseLibrary.Data;
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.Common;
    using System.Text;
    using System.Text.RegularExpressions;

    public class DistributorsDao
    {
        private Database database = DatabaseFactory.CreateDatabase();

        public bool AddBalanceDrawRequest(BalanceDrawRequestInfo bdrinfo)
        {
            string query = "INSERT INTO Hishop_BalanceDrawRequest(UserId,RequestType,UserName,Amount,AccountName,CellPhone,MerchantCode,Remark,RequestTime,IsCheck) VALUES(@UserId,@RequestType,@UserName,@Amount,@AccountName,@CellPhone,@MerchantCode,@Remark,getdate(),0)";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, bdrinfo.UserId);
            this.database.AddInParameter(sqlStringCommand, "RequestType", DbType.Int32, bdrinfo.RequesType);
            this.database.AddInParameter(sqlStringCommand, "UserName", DbType.String, bdrinfo.UserName);
            this.database.AddInParameter(sqlStringCommand, "Amount", DbType.Decimal, bdrinfo.Amount);
            this.database.AddInParameter(sqlStringCommand, "AccountName", DbType.String, bdrinfo.AccountName);
            this.database.AddInParameter(sqlStringCommand, "CellPhone", DbType.String, bdrinfo.CellPhone);
            this.database.AddInParameter(sqlStringCommand, "MerchantCode", DbType.String, bdrinfo.MerchanCade);
            this.database.AddInParameter(sqlStringCommand, "Remark", DbType.String, bdrinfo.Remark);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public void AddDistributorProducts(int productId, int distributorId)
        {
            string query = "INSERT INTO Hishop_DistributorProducts VALUES(@ProductId,@UserId)";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, distributorId);
            this.database.AddInParameter(sqlStringCommand, "ProductId", DbType.Int32, productId);
            this.database.ExecuteNonQuery(sqlStringCommand);
        }

        public bool CreateDistributor(DistributorsInfo distributor)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("INSERT INTO aspnet_Distributors(UserId,StoreName,Logo,BackImage,RequestAccount,GradeId,ReferralUserId,ReferralPath, ReferralOrders,ReferralBlance, ReferralRequestBalance,ReferralStatus,StoreDescription,DistributorGradeId) VALUES(@UserId,@StoreName,@Logo,@BackImage,@RequestAccount,@GradeId,@ReferralUserId,@ReferralPath,@ReferralOrders,@ReferralBlance, @ReferralRequestBalance, @ReferralStatus,@StoreDescription,@DistributorGradeId)");
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, distributor.UserId);
            this.database.AddInParameter(sqlStringCommand, "StoreName", DbType.String, distributor.StoreName);
            this.database.AddInParameter(sqlStringCommand, "Logo", DbType.String, distributor.Logo);
            this.database.AddInParameter(sqlStringCommand, "BackImage", DbType.String, distributor.BackImage);
            this.database.AddInParameter(sqlStringCommand, "RequestAccount", DbType.String, distributor.RequestAccount);
            this.database.AddInParameter(sqlStringCommand, "GradeId", DbType.Int64, (int)distributor.DistributorGradeId);
            this.database.AddInParameter(sqlStringCommand, "ReferralUserId", DbType.Int64, distributor.ParentUserId.Value);
            this.database.AddInParameter(sqlStringCommand, "ReferralPath", DbType.String, distributor.ReferralPath);
            this.database.AddInParameter(sqlStringCommand, "ReferralOrders", DbType.Int64, distributor.ReferralOrders);
            this.database.AddInParameter(sqlStringCommand, "ReferralBlance", DbType.Decimal, distributor.ReferralBlance);
            this.database.AddInParameter(sqlStringCommand, "ReferralRequestBalance", DbType.Decimal, distributor.ReferralRequestBalance);
            this.database.AddInParameter(sqlStringCommand, "ReferralStatus", DbType.Int64, distributor.ReferralStatus);
            this.database.AddInParameter(sqlStringCommand, "StoreDescription", DbType.String, distributor.StoreDescription);
            this.database.AddInParameter(sqlStringCommand, "DistributorGradeId", DbType.Int64, distributor.DistriGradeId);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }
        public bool CreateAgent(DistributorsInfo distributor)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("INSERT INTO aspnet_Distributors(UserId,StoreName,Logo,BackImage,RequestAccount,GradeId,ReferralUserId,ReferralPath, ReferralOrders,ReferralBlance, ReferralRequestBalance,ReferralStatus,StoreDescription,DistributorGradeId,IsAgent,AgentGradeId,AgentPath) VALUES(@UserId,@StoreName,@Logo,@BackImage,@RequestAccount,@GradeId,@ReferralUserId,@ReferralPath,@ReferralOrders,@ReferralBlance, @ReferralRequestBalance, @ReferralStatus,@StoreDescription,@DistributorGradeId,@IsAgent,@AgentGradeId,@AgentPath)");
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, distributor.UserId);
            this.database.AddInParameter(sqlStringCommand, "StoreName", DbType.String, distributor.StoreName);
            this.database.AddInParameter(sqlStringCommand, "Logo", DbType.String, distributor.Logo);
            this.database.AddInParameter(sqlStringCommand, "BackImage", DbType.String, distributor.BackImage);
            this.database.AddInParameter(sqlStringCommand, "RequestAccount", DbType.String, distributor.RequestAccount);
            this.database.AddInParameter(sqlStringCommand, "GradeId", DbType.Int64, (int)distributor.DistributorGradeId);
            this.database.AddInParameter(sqlStringCommand, "ReferralUserId", DbType.Int64, distributor.ParentUserId.Value);
            this.database.AddInParameter(sqlStringCommand, "ReferralPath", DbType.String, distributor.ReferralPath);
            this.database.AddInParameter(sqlStringCommand, "ReferralOrders", DbType.Int64, distributor.ReferralOrders);
            this.database.AddInParameter(sqlStringCommand, "ReferralBlance", DbType.Decimal, distributor.ReferralBlance);
            this.database.AddInParameter(sqlStringCommand, "ReferralRequestBalance", DbType.Decimal, distributor.ReferralRequestBalance);
            this.database.AddInParameter(sqlStringCommand, "ReferralStatus", DbType.Int64, distributor.ReferralStatus);
            this.database.AddInParameter(sqlStringCommand, "StoreDescription", DbType.String, distributor.StoreDescription);
            this.database.AddInParameter(sqlStringCommand, "DistributorGradeId", DbType.Int64, distributor.DistriGradeId);
            this.database.AddInParameter(sqlStringCommand, "IsAgent", DbType.Int32, distributor.IsAgent);
            this.database.AddInParameter(sqlStringCommand, "AgentGradeId", DbType.Int32, distributor.AgentGradeId);
            this.database.AddInParameter(sqlStringCommand, "AgentPath", DbType.String, distributor.AgentPath);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool CreateSendRedpackRecord(int serialid, int userid, string openid, int amount, string act_name, string wishing)
        {
            bool flag = true;
            int num = 0x4e20;
            int num2 = amount;
            SendRedpackRecordInfo sendredpackinfo = new SendRedpackRecordInfo {
                BalanceDrawRequestID = serialid,
                UserID = userid,
                OpenID = openid,
                ActName = act_name,
                Wishing = wishing,
                ClientIP = Globals.IPAddress
            };
            using (DbConnection connection = this.database.CreateConnection())
            {
                connection.Open();
                DbTransaction dbTran = connection.BeginTransaction();
                SendRedpackRecordDao dao = new SendRedpackRecordDao();

                try
                {
                    if (num2 <= num)
                    {
                        sendredpackinfo.Amount = amount;
                        flag = dao.AddSendRedpackRecord(sendredpackinfo, dbTran);
                        return this.UpdateSendRedpackRecord(serialid, 1, dbTran);
                    }
                    int num3 = amount % num;
                    int num4 = amount / num;
                    if (num3 > 0)
                    {
                        sendredpackinfo.Amount = num3;
                        flag = dao.AddSendRedpackRecord(sendredpackinfo, dbTran);
                    }
                    if (flag)
                    {
                        for (int i = 0; i < num4; i++)
                        {
                            sendredpackinfo.Amount = num;
                            flag = dao.AddSendRedpackRecord(sendredpackinfo, dbTran);
                            if (!flag)
                            {
                                dbTran.Rollback();
                            }
                        }
                        int num6 = num4 + ((num3 > 0) ? 1 : 0);
                        flag = this.UpdateSendRedpackRecord(serialid, num6, dbTran);
                        if (!flag)
                        {
                            dbTran.Rollback();
                        }
                        return flag;
                    }
                    dbTran.Rollback();
                    return flag;
                }
                catch
                {
                    if (dbTran.Connection != null)
                    {
                        dbTran.Rollback();
                    }
                    flag = false;
                }
                finally
                {
                    if (flag)
                    {
                        dbTran.Commit();
                    }
                    connection.Close();
                }
            }
            
            return flag;
        }

        public bool FrozenCommision(int userid, string ReferralStatus)
        {
            string query = "UPDATE aspnet_Distributors set ReferralStatus=@ReferralStatus WHERE UserId=@UserId ";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            this.database.AddInParameter(sqlStringCommand, "ReferralStatus", DbType.String, ReferralStatus);
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, userid);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public DataTable GetAllDistributorsName(string keywords)
        {
            DataTable table = new DataTable();
            string[] strArray = Regex.Split(DataHelper.CleanSearchString(keywords), @"\s+");
            StringBuilder builder = new StringBuilder();
            builder.AppendFormat(" StoreName LIKE '%{0}%' OR UserName LIKE '%{0}%'", DataHelper.CleanSearchString(DataHelper.CleanSearchString(strArray[0])));
            for (int i = 1; (i < strArray.Length) && (i <= 5); i++)
            {
                builder.AppendFormat(" OR StoreName LIKE '%{0}%' OR UserName LIKE '%{0}%'", DataHelper.CleanSearchString(strArray[i]));
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT TOP 10 StoreName,UserName from vw_Hishop_DistributorsMembers WHERE " + builder.ToString());
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                return DataHelper.ConverDataReaderToDataTable(reader);
            }
        }
        public DataTable GetAgentDistributorsName(string keywords)
        {
            DataTable table = new DataTable();
            string[] strArray = Regex.Split(DataHelper.CleanSearchString(keywords), @"\s+");
            StringBuilder builder = new StringBuilder();
            builder.AppendFormat(" StoreName LIKE '%{0}%' OR UserName LIKE '%{0}%'", DataHelper.CleanSearchString(DataHelper.CleanSearchString(strArray[0])));
            for (int i = 1; (i < strArray.Length) && (i <= 5); i++)
            {
                builder.AppendFormat(" OR StoreName LIKE '%{0}%' OR UserName LIKE '%{0}%'", DataHelper.CleanSearchString(strArray[i]));
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT TOP 10 StoreName,UserName from vw_Hishop_DistributorsMembers WHERE IsAgent=1 and(" + builder.ToString() + ")");
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                return DataHelper.ConverDataReaderToDataTable(reader);
            }
        }

        public DbQueryResult GetBalanceDrawRequest(BalanceDrawRequestQuery query)
        {
            StringBuilder builder = new StringBuilder();
            if (!string.IsNullOrEmpty(query.StoreName))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat(" StoreName LIKE '%{0}%'", DataHelper.CleanSearchString(query.StoreName));
            }
            if (!string.IsNullOrEmpty(query.UserId))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat(" UserId = {0}", DataHelper.CleanSearchString(query.UserId));
            }
            if (!string.IsNullOrEmpty(query.RequestTime.ToString()))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat(" convert(varchar(10),RequestTime,120)='{0}'", query.RequestTime);
            }
            if (!string.IsNullOrEmpty(query.IsCheck.ToString()))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat(" IsCheck={0}", query.IsCheck);
            }
            if (!string.IsNullOrEmpty(query.CheckTime.ToString()))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat(" convert(varchar(10),CheckTime,120)='{0}'", query.CheckTime);
            }
            if (!string.IsNullOrEmpty(query.RequestStartTime.ToString()))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat(" datediff(dd,'{0}',RequestTime)>=0", query.RequestStartTime);
            }
            if (!string.IsNullOrEmpty(query.RequestEndTime.ToString()))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("  datediff(dd,'{0}',RequestTime)<=0", query.RequestEndTime);
            }
            return DataHelper.PagingByRownumber(query.PageIndex, query.PageSize, query.SortBy, query.SortOrder, query.IsCount, "vw_Hishop_BalanceDrawRequesDistributors ", "SerialID", (builder.Length > 0) ? builder.ToString() : null, "*");
        }

        public bool GetBalanceDrawRequestIsCheck(int serialid)
        {
            string query = "select IsCheck from Hishop_BalanceDrawRequest where SerialID=" + serialid;
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            return bool.Parse(this.database.ExecuteScalar(sqlStringCommand).ToString());
        }

        public DbQueryResult GetCommissions(CommissionsQuery query)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(" State=1 ");
            if (query.UserId > 0)
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("UserId = {0}", query.UserId);
            }
            if (!string.IsNullOrEmpty(query.StoreName))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("StoreName LIKE '%{0}%'", DataHelper.CleanSearchString(query.StoreName));
            }
            if (!string.IsNullOrEmpty(query.OrderNum))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat(" OrderId = '{0}'", query.OrderNum);
            }
            if (!string.IsNullOrEmpty(query.StartTime.ToString()))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat(" datediff(dd,'{0}',TradeTime)>=0", query.StartTime);
            }
            if (!string.IsNullOrEmpty(query.EndTime.ToString()))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("  datediff(dd,'{0}',TradeTime)<=0", query.EndTime);
            }
            return DataHelper.PagingByRownumber(query.PageIndex, query.PageSize, query.SortBy, query.SortOrder, query.IsCount, "vw_Hishop_CommissionDistributors", "CommId", (builder.Length > 0) ? builder.ToString() : null, "*");
        }

        public DataTable GetCurrentDistributorsCommosion(int userId)
        {
            string query = string.Format("SELECT sum(OrderTotal) AS OrderTotal,sum(CommTotal) AS CommTotal from dbo.Hishop_Commissions where UserId={0} AND OrderId in (select OrderId from dbo.Hishop_Orders where ReferralUserId={0})", userId);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            DataSet set = this.database.ExecuteDataSet(sqlStringCommand);
            if ((set == null) || (set.Tables.Count <= 0))
            {
                return null;
            }
            return set.Tables[0];
        }

        public IList<DistributorGradeInfo> GetDistributorGrades()
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("SELECT * FROM aspnet_DistributorGrade");
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                return ReaderConvert.ReaderToList<DistributorGradeInfo>(reader);
            }
        }

        public DistributorsInfo GetDistributorInfo(int distributorId)
        {
            if (distributorId <= 0)
            {
                return null;
            }
            DistributorsInfo info = null;
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("SELECT * FROM aspnet_Distributors where UserId={0}", distributorId));
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    info = DataMapper.PopulateDistributorInfo(reader);
                }
            }
            return info;
        }

        public int GetDistributorNum(DistributorGrade grade)
        {
            int num = 0;
            string query = string.Format("SELECT COUNT(*) FROM aspnet_Distributors where ReferralPath LIKE '{0}|%' OR ReferralPath LIKE '%|{0}|%' OR ReferralPath LIKE '%|{0}' OR ReferralPath='{0}'", Globals.GetCurrentMemberUserId());
            if (grade != DistributorGrade.All)
            {
                query = query + " AND GradeId=" + ((int)grade);
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    num = (int)reader[0];
                    reader.Close();
                }
            }
            return num;
        }

        public DbQueryResult GetDistributors(DistributorsQuery query)
        {
            StringBuilder builder = new StringBuilder();
            if (query.GradeId > 0)
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("DistributorGradeId = {0}", query.GradeId);
            }
            if (query.UserId > 0)
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("UserId = {0}", query.UserId);
            }
            if (query.UserId > 0)
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("UserId = {0}", query.UserId);
            }
            if (query.IsAgent > -1)
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("IsAgent = {0}", query.IsAgent);
            }

            if (query.ReferralStatus > 0)
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("ReferralStatus = '{0}'", query.ReferralStatus);
            }
            if (!string.IsNullOrEmpty(query.StoreName))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("StoreName LIKE '%{0}%'", DataHelper.CleanSearchString(query.StoreName));
            }
            if (!string.IsNullOrEmpty(query.CellPhone))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("CellPhone='{0}'", DataHelper.CleanSearchString(query.CellPhone));
            }
            if (!string.IsNullOrEmpty(query.MicroSignal))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("MicroSignal = '{0}'", DataHelper.CleanSearchString(query.MicroSignal));
            }
            if (!string.IsNullOrEmpty(query.RealName))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("RealName LIKE '%{0}%'", DataHelper.CleanSearchString(query.RealName));
            }
            if (!string.IsNullOrEmpty(query.ReferralPath))
            {
                if (builder.Length > 0)
                {
                    builder.Append(" AND ");
                }
                builder.AppendFormat("(ReferralPath LIKE '{0}|%' OR ReferralPath LIKE '%|{0}|%' OR ReferralPath LIKE '%|{0}' OR ReferralPath='{0}')", DataHelper.CleanSearchString(query.ReferralPath));
            }
            return DataHelper.PagingByRownumber(query.PageIndex, query.PageSize, query.SortBy, query.SortOrder, query.IsCount, "vw_Hishop_DistributorsMembers", "UserId", (builder.Length > 0) ? builder.ToString() : null, "*");
        }

        public DataTable GetDistributorsCommission(DistributorsQuery query)
        {
            StringBuilder builder = new StringBuilder("1=1");
            string str = "";
            if (query.GradeId > 0)
            {
                builder.AppendFormat("AND GradeId = {0}", query.GradeId);
            }
            if (!string.IsNullOrEmpty(query.ReferralPath))
            {
                builder.AppendFormat(" AND (ReferralPath LIKE '{0}|%' OR ReferralPath LIKE '%|{0}|%' OR ReferralPath LIKE '%|{0}' OR ReferralPath='{0}')", DataHelper.CleanSearchString(query.ReferralPath));
            }
            if (query.UserId > 0)
            {
                str = " UserId=" + query.UserId + " AND ";
            }
            string str2 = string.Concat(new object[] { "select TOP ", query.PageSize, " UserId,StoreName,GradeId,CreateTime,isnull((select SUM(OrderTotal) from Hishop_Commissions where ", str, " ReferralUserId=aspnet_Distributors.UserId),0) as OrderTotal,isnull((select SUM(CommTotal) from Hishop_Commissions where ", str, " ReferralUserId=aspnet_Distributors.UserId),0) as  CommTotal from aspnet_Distributors WHERE ", builder.ToString(), " order by CreateTime  desc" });
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(str2);
            return this.database.ExecuteDataSet(sqlStringCommand).Tables[0];
        }

        public DataTable GetDistributorsCommosion(int userId)
        {
            string query = string.Format("SELECT  GradeId,COUNT(*),SUM(OrdersTotal) AS OrdersTotal,SUM(ReferralOrders) AS ReferralOrders,SUM(ReferralBlance) AS ReferralBlance,SUM(ReferralRequestBalance) AS ReferralRequestBalance FROM aspnet_Distributors WHERE ReferralPath LIKE '{0}|%' OR ReferralPath LIKE '%|{0}|%' OR ReferralPath LIKE '%|{0}' OR ReferralPath='{0}' GROUP BY GradeId", userId);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            DataSet set = this.database.ExecuteDataSet(sqlStringCommand);
            if ((set == null) || (set.Tables.Count <= 0))
            {
                return null;
            }
            return set.Tables[0];
        }

        public DataTable GetDistributorsCommosion(int userId, DistributorGrade grade)
        {
            string query = string.Format("SELECT sum(OrderTotal) AS OrderTotal,sum(CommTotal) AS CommTotal from dbo.Hishop_Commissions where UserId={0} AND ReferralUserId in (select UserId from aspnet_Distributors  WHERE (ReferralPath LIKE '{0}|%' OR ReferralPath LIKE '%|{0}|%' OR ReferralPath LIKE '%|{0}' OR ReferralPath='{0}') and GradeId={1})", userId, (int)grade);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            DataSet set = this.database.ExecuteDataSet(sqlStringCommand);
            if ((set == null) || (set.Tables.Count <= 0))
            {
                return null;
            }
            return set.Tables[0];
        }

        public int GetDownDistributorNum(string userid)
        {
            int num = 0;
            string query = string.Format("SELECT COUNT(*) FROM aspnet_Distributors where ReferralPath LIKE '{0}|%' OR ReferralPath LIKE '%|{0}|%' OR ReferralPath LIKE '%|{0}' OR ReferralPath='{0}'", userid);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    num = (int)reader[0];
                    reader.Close();
                }
            }
            return num;
        }

        public int GetDownDistributorNumReferralOrders(string userid)
        {
            int num = 0;
            string query = string.Format("SELECT isnull(sum(ReferralOrders),0) FROM aspnet_Distributors where ReferralPath LIKE '{0}|%' OR ReferralPath LIKE '%|{0}|%' OR ReferralPath LIKE '%|{0}' OR ReferralPath='{0}'", userid);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            DataSet set = this.database.ExecuteDataSet(sqlStringCommand);
            if (set.Tables[0].Rows.Count > 0)
            {
                num = int.Parse(set.Tables[0].Rows[0][0].ToString());
            }
            return num;
        }

        public DataTable GetDownDistributors(DistributorsQuery query)
        {
            StringBuilder builder = new StringBuilder("1=1");
            string str = "";
            if (query.GradeId > 0)
            {
                if (query.GradeId == 2)
                {
                    builder.AppendFormat(" AND ( ReferralPath LIKE '%|{0}' OR ReferralPath='{0}')", DataHelper.CleanSearchString(query.ReferralPath));
                }
                if (query.GradeId == 3)
                {
                    builder.AppendFormat(" AND ReferralPath LIKE '{0}|%' ", DataHelper.CleanSearchString(query.ReferralPath));
                }
            }
            if (query.UserId > 0)
            {
                str = " UserId=" + query.UserId + " AND ";
            }
            string str2 = string.Concat(new object[] { "select TOP ", query.PageSize, " UserId,StoreName,GradeId,CreateTime,isnull((select SUM(OrderTotal) from Hishop_Commissions where ", str, " ReferralUserId=aspnet_Distributors.UserId),0) as OrderTotal,isnull((select SUM(CommTotal) from Hishop_Commissions where ", str, " ReferralUserId=aspnet_Distributors.UserId),0) as  CommTotal from aspnet_Distributors WHERE ", builder.ToString(), " order by CreateTime  desc" });
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(str2);
            return this.database.ExecuteDataSet(sqlStringCommand).Tables[0];
        }

        public DistributorGradeInfo GetIsDefaultDistributorGradeInfo()
        {
            DistributorGradeInfo info = null;
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("SELECT * FROM aspnet_DistributorGrade where IsDefault=1 order by CommissionsLimit asc", new object[0]));
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    info = DataMapper.PopulateDistributorGradeInfo(reader);
                }
            }
            return info;
        }

        public decimal GetUserCommissions(int userid, DateTime fromdatetime)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(" State=1 ");
            if (userid > 0)
            {
                builder.Append(" and UserID=" + userid);
            }
            builder.Append(" and TradeTime>='" + fromdatetime.ToString("yyyy-MM-dd") + " 00:00:00'");
            string query = " select isnull(sum(CommTotal),0) from Hishop_Commissions where " + builder.ToString();
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            return decimal.Parse(this.database.ExecuteScalar(sqlStringCommand).ToString());
        }

        public DataSet GetUserRanking(int userid)
        {
            string query = string.Format("select d.UserId,d.Logo,d.ReferralBlance+d.ReferralRequestBalance as Blance,d.StoreName,(select count(0) from aspnet_Distributors a where (a.ReferralBlance+a.ReferralRequestBalance>(d.ReferralBlance+d.ReferralRequestBalance) or (a.ReferralBlance+a.ReferralRequestBalance=(d.ReferralBlance+d.ReferralRequestBalance) and a.UserID<d.UserID)))+1 as ccount  from aspnet_Distributors d where UserID={0};select top 10 UserId,Logo,ReferralBlance+ReferralRequestBalance as Blance,StoreName  from aspnet_Distributors order by Blance desc,userid asc;select top 10 UserId,Logo,ReferralBlance+ReferralRequestBalance as Blance,StoreName  from aspnet_Distributors where (ReferralPath like '{0}|%' or ReferralPath like '%|{0}' or ReferralPath = '{0}') order by Blance desc", userid);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            return this.database.ExecuteDataSet(sqlStringCommand);
        }

        public int IsExiteDistributorsByStoreName(string storname)
        {
            string query = "SELECT UserId FROM aspnet_Distributors WHERE StoreName=@StoreName";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            this.database.AddInParameter(sqlStringCommand, "StoreName", DbType.String, DataHelper.CleanSearchString(storname));
            object obj2 = this.database.ExecuteScalar(sqlStringCommand);
            return ((obj2 != null) ? ((int)obj2) : 0);
        }

        public bool IsExitsCommionsRequest(int userId)
        {
            bool flag = false;
            string query = "SELECT * FROM dbo.Hishop_BalanceDrawRequest WHERE IsCheck=0 AND UserId=@UserId";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, userId);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                if (reader.Read())
                {
                    flag = true;
                }
            }
            return flag;
        }

        public DataTable OrderIDGetCommosion(string orderid)
        {
            string query = string.Format("SELECT CommId,Userid,OrderTotal,CommTotal from Hishop_Commissions where OrderId='" + orderid + "' ", new object[0]);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            DataSet set = this.database.ExecuteDataSet(sqlStringCommand);
            if ((set == null) || (set.Tables.Count <= 0))
            {
                return null;
            }
            return set.Tables[0];
        }

        public void RemoveDistributorProducts(List<int> productIds, int distributorId)
        {
            string str = string.Join<int>(",", productIds);
            string query = "DELETE FROM Hishop_DistributorProducts WHERE UserId=@UserId AND ProductId IN (" + str + ");";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, distributorId);
            this.database.ExecuteNonQuery(sqlStringCommand);
        }

        public string SendRedPackToBalanceDrawRequest(int serialid)
        {
            if (!SettingsManager.GetMasterSettings(false).EnableWeiXinRequest)
            {
                return "管理员后台未开启微信付款！";
            }
            string query = "select a.SerialID,a.userid,a.Amount,b.OpenID,isnull(b.OpenId,'') as OpenId from Hishop_BalanceDrawRequest a inner join aspnet_Members b on a.userid=b.userid where SerialID=@SerialID and IsCheck=0";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            this.database.AddInParameter(sqlStringCommand, "SerialID", DbType.Int32, serialid);
            DataTable table = this.database.ExecuteDataSet(sqlStringCommand).Tables[0];
            string str4 = string.Empty;
            int userid = 0;
            if (table.Rows.Count > 0)
            {
                str4 = table.Rows[0]["OpenId"].ToString();
                userid = int.Parse(table.Rows[0]["UserID"].ToString());
                decimal num2 = decimal.Parse(table.Rows[0]["Amount"].ToString()) * 100M;
                int amount = Convert.ToInt32(num2);
                if (string.IsNullOrEmpty(str4))
                {
                    return "用户未绑定微信号";
                }
                query = "select top 1 ID from vshop_SendRedpackRecord where BalanceDrawRequestID=" + table.Rows[0]["SerialID"].ToString();
                sqlStringCommand = this.database.GetSqlStringCommand(query);
                if (this.database.ExecuteDataSet(sqlStringCommand).Tables[0].Rows.Count > 0)
                {
                    return "-1";
                }
                return (this.CreateSendRedpackRecord(serialid, userid, str4, amount, "您的提现申请已成功", "恭喜您提现成功!") ? "1" : "提现操作失败");
            }
            return "该用户没有提现申请";
        }

        public bool UpdateBalanceDistributors(int UserId, decimal ReferralRequestBalance)
        {
            string query = "UPDATE aspnet_Distributors set ReferralBlance=ReferralBlance-@ReferralBlance,ReferralRequestBalance=ReferralRequestBalance+@ReferralRequestBalance  WHERE UserId=@UserId ";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            this.database.AddInParameter(sqlStringCommand, "ReferralBlance", DbType.Decimal, ReferralRequestBalance);
            this.database.AddInParameter(sqlStringCommand, "ReferralRequestBalance", DbType.Decimal, ReferralRequestBalance);
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, UserId);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateBalanceDrawRequest(int Id, string Remark)
        {
            string query = "UPDATE Hishop_BalanceDrawRequest set Remark=@Remark,IsCheck=1,CheckTime=getdate() WHERE SerialID=@SerialID ";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            this.database.AddInParameter(sqlStringCommand, "Remark", DbType.String, Remark);
            this.database.AddInParameter(sqlStringCommand, "SerialID", DbType.Int32, Id);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateCalculationCommission(string UserId, string ReferralUserId, string OrderId, decimal OrderTotal, decimal resultCommTatal)
        {
            string query = "";
            object obj2 = query + "begin try  " + "  begin tran TranUpdate";
            obj2 = string.Concat(new object[] { obj2, " INSERT INTO   [Hishop_Commissions](UserId,ReferralUserId,OrderId,TradeTime,OrderTotal,CommTotal,CommType,CommRemark,State)values(", UserId, ",", ReferralUserId, ",'", OrderId, "','", DateTime.Now.ToString(), "',", OrderTotal, ",", resultCommTatal, ",1,'',1) ;" });
            obj2 = string.Concat(new object[] { obj2, "  UPDATE aspnet_Distributors set ReferralBlance=ReferralBlance+", resultCommTatal, "  WHERE UserId=", UserId, "; " });
            query = string.Concat(new object[] { obj2, "  UPDATE aspnet_Distributors set  OrdersTotal=OrdersTotal+", OrderTotal, ",ReferralOrders=ReferralOrders+1  WHERE UserId=", ReferralUserId, "; " }) + " COMMIT TRAN TranUpdate" + "  end try \r\n                    begin catch \r\n                        ROLLBACK TRAN TranUpdate\r\n                    end catch ";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateDistributor(DistributorsInfo distributor)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("UPDATE aspnet_Distributors SET StoreName=@StoreName,Logo=@Logo,BackImage=@BackImage,RequestAccount=@RequestAccount,ReferralOrders=@ReferralOrders,ReferralBlance=@ReferralBlance, ReferralRequestBalance=@ReferralRequestBalance,StoreDescription=@StoreDescription,ReferralStatus=@ReferralStatus,AgentGradeId=@AgentGradeId WHERE UserId=@UserId");
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, distributor.UserId);
            this.database.AddInParameter(sqlStringCommand, "StoreName", DbType.String, distributor.StoreName);
            this.database.AddInParameter(sqlStringCommand, "Logo", DbType.String, distributor.Logo);
            this.database.AddInParameter(sqlStringCommand, "BackImage", DbType.String, distributor.BackImage);
            this.database.AddInParameter(sqlStringCommand, "RequestAccount", DbType.String, distributor.RequestAccount);
            this.database.AddInParameter(sqlStringCommand, "ReferralOrders", DbType.Int64, distributor.ReferralOrders);
            this.database.AddInParameter(sqlStringCommand, "ReferralStatus", DbType.Int64, distributor.ReferralStatus);
            this.database.AddInParameter(sqlStringCommand, "ReferralBlance", DbType.Decimal, distributor.ReferralBlance);
            this.database.AddInParameter(sqlStringCommand, "ReferralRequestBalance", DbType.Decimal, distributor.ReferralRequestBalance);
            this.database.AddInParameter(sqlStringCommand, "StoreDescription", DbType.String, distributor.StoreDescription);
            this.database.AddInParameter(sqlStringCommand, "AgentGradeId", DbType.Int32, distributor.AgentGradeId);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateDistributorById(string requestAccount, int distributorId)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("UPDATE aspnet_Distributors SET RequestAccount=@RequestAccount WHERE UserId=@UserId");
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, distributorId);
            this.database.AddInParameter(sqlStringCommand, "RequestAccount", DbType.String, requestAccount);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateDistributorMessage(DistributorsInfo distributor)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("UPDATE aspnet_Distributors SET StoreName=@StoreName,Logo=@Logo,BackImage=@BackImage,StoreDescription=@StoreDescription,RequestAccount=@RequestAccount WHERE UserId=@UserId");
            this.database.AddInParameter(sqlStringCommand, "UserId", DbType.Int32, distributor.UserId);
            this.database.AddInParameter(sqlStringCommand, "StoreName", DbType.String, distributor.StoreName);
            this.database.AddInParameter(sqlStringCommand, "Logo", DbType.String, distributor.Logo);
            this.database.AddInParameter(sqlStringCommand, "BackImage", DbType.String, distributor.BackImage);
            this.database.AddInParameter(sqlStringCommand, "StoreDescription", DbType.String, distributor.StoreDescription);
            this.database.AddInParameter(sqlStringCommand, "RequestAccount", DbType.String, distributor.RequestAccount);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateGradeId(ArrayList GradeIdList, ArrayList ReferralUserIdList)
        {
            string query = "";
            query = query + "begin try  " + "  begin tran TranUpdate";
            for (int i = 0; i < ReferralUserIdList.Count; i++)
            {
                if (!GradeIdList[i].Equals(0))
                {
                    object obj2 = query;
                    query = string.Concat(new object[] { obj2, "  UPDATE aspnet_Distributors SET DistributorGradeId=", GradeIdList[i], " where UserId=", ReferralUserIdList[i], "; " });
                }
            }
            query = query + " COMMIT TRAN TranUpdate" + "  end try \r\n                    begin catch \r\n                        ROLLBACK TRAN TranUpdate\r\n                    end catch ";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateNotSetCalculationCommission(ArrayList UserIdList, ArrayList OrdersTotal)
        {
            string query = "";
            query = query + "begin try  " + "  begin tran TranUpdate";
            for (int i = 0; i < UserIdList.Count; i++)
            {
                object obj2 = query;
                query = string.Concat(new object[] { obj2, "  UPDATE aspnet_Distributors set OrdersTotal=OrdersTotal+", OrdersTotal[i], " WHERE UserId=", UserIdList[i], "; " });
            }
            query = query + " COMMIT TRAN TranUpdate" + "  end try \r\n                    begin catch \r\n                        ROLLBACK TRAN TranUpdate\r\n                    end catch ";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateSendRedpackRecord(int serialid, int num, DbTransaction dbTran)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("update Hishop_BalanceDrawRequest set RedpackRecordNum=@RedpackRecordNum where SerialID=@SerialID");
            this.database.AddInParameter(sqlStringCommand, "RedpackRecordNum", DbType.Int32, num);
            this.database.AddInParameter(sqlStringCommand, "SerialID", DbType.Int32, serialid);
            if (dbTran != null)
            {
                return (this.database.ExecuteNonQuery(sqlStringCommand, dbTran) > 0);
            }
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateTwoCalculationCommission(ArrayList UserIdList, string ReferralUserId, string OrderId, ArrayList OrderTotalList, ArrayList CommTatalList)
        {
            string query = "";
            query = query + "begin try  " + "  begin tran TranUpdate";
            for (int i = 0; i < UserIdList.Count; i++)
            {
                object obj2 = query;
                obj2 = string.Concat(new object[] { obj2, " INSERT INTO   [Hishop_Commissions](UserId,ReferralUserId,OrderId,TradeTime,OrderTotal,CommTotal,CommType,CommRemark,State)values(", UserIdList[i], ",", ReferralUserId, ",'", OrderId, "','", DateTime.Now.ToString(), "',", OrderTotalList[i], ",", CommTatalList[i], ",1,'',1) ;" });
                obj2 = string.Concat(new object[] { obj2, "  UPDATE aspnet_Distributors set ReferralBlance=ReferralBlance+", CommTatalList[i], "  WHERE UserId=", UserIdList[i], "; " });
                query = string.Concat(new object[] { obj2, "  UPDATE aspnet_Distributors set  OrdersTotal=OrdersTotal+", OrderTotalList[i], ",ReferralOrders=ReferralOrders+1  WHERE UserId=", UserIdList[i], "; " });
            }
            query = query + " COMMIT TRAN TranUpdate" + "  end try \r\n                    begin catch \r\n                        ROLLBACK TRAN TranUpdate\r\n                    end catch ";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateTwoDistributorsOrderNum(ArrayList useridList, ArrayList OrdersTotalList)
        {
            string query = "";
            query = query + "begin try  " + "  begin tran TranUpdate";
            for (int i = 0; i < useridList.Count; i++)
            {
                object obj2 = query;
                query = string.Concat(new object[] { obj2, "  UPDATE aspnet_Distributors set  OrdersTotal=OrdersTotal+", useridList[i], ",ReferralOrders=ReferralOrders+1  WHERE UserId=", OrdersTotalList[i], "; " });
            }
            query = query + " COMMIT TRAN TranUpdate" + "  end try \r\n                    begin catch \r\n                        ROLLBACK TRAN TranUpdate\r\n                    end catch ";
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }
    }
}

