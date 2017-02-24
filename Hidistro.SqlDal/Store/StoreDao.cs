namespace Hidistro.SqlDal.Store
{
    using Hidistro.Core;
    using Hidistro.Core.Entities;
    using Hidistro.Entities;
    using Hidistro.Entities.Commodities;
    using Hidistro.Entities.Store;
    using Microsoft.Practices.EnterpriseLibrary.Data;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.Common;
    using System.Data.SqlClient;
    using System.Runtime.InteropServices;
    using System.Text;

    public class StoreDao
    {
        private Database database = DatabaseFactory.CreateDatabase();

        public bool UpdateDeliveryUserState(int userId, int state)
        {
            DbCommand command = this.database.GetSqlStringCommand(string.Format("update Store_DeliveryMember set deliveryState = {0} where deliveryuserid = {1}", state, userId));
            return this.database.ExecuteNonQuery(command) > 0;
        }

        public bool arrivedDeliveryOrder(DeliveryOrderInfo info)
        {
            DbCommand command = this.database.GetSqlStringCommand(string.Format("update Store_DeliveryOrder set [state]=2 ,ArrivedTime='{1}'  where orderid='{0}'", info.OrderId,info.ArrivedTime));
            return this.database.ExecuteNonQuery(command) > 0;
        }

        public string getOrderDeliveryState(string orderid)
        {
            string result = "配送";
            string selectSql = string.Format(@"Select * From Store_DeliveryOrder Where orderid='{0}'", orderid);
            DbCommand command = this.database.GetSqlStringCommand(selectSql);
            DeliveryOrderInfo info = new DeliveryOrderInfo();
            using (IDataReader reader = this.database.ExecuteReader(command))
            {
                info = ReaderConvert.ReaderToModel<DeliveryOrderInfo>(reader);
            }
            if(info == null){
                return result;
            }
            if ( info.State == 1)
            {
                result = "送达";
            }
            else if (info.State == 2)
            {
                result = "结束";
            }
            return result;
        }

        public bool SetDeliveryUser(DeliveryOrderInfo info)
        {
            try
            {
                string execSql = "insert into Store_DeliveryOrder (OrderId,State,DeliveryUserId,AddTime,StoreId) values (@OrderId,@State,@DeliveryUserId,@AddTime,@StoreId)";
                SqlParameter[] para = new SqlParameter[]
				{
                    new SqlParameter("@OrderId",info.OrderId),
					new SqlParameter("@State",info.State),
					new SqlParameter("@DeliveryUserId",info.DeliveryUserId),
					new SqlParameter("@AddTime",info.AddTime),
                    new SqlParameter("@StoreId",info.StoreId),
				};
                DbCommand sqlCommand = this.database.GetSqlStringCommand(execSql);
                this.database.AddInParameter(sqlCommand, "OrderId", DbType.String, info.OrderId);
                this.database.AddInParameter(sqlCommand, "State", DbType.Int32, info.State);
                this.database.AddInParameter(sqlCommand, "DeliveryUserId", DbType.Int32, info.DeliveryUserId);
                this.database.AddInParameter(sqlCommand, "AddTime", DbType.Date, info.AddTime);
                this.database.AddInParameter(sqlCommand, "StoreId", DbType.Int32, info.StoreId);
                return this.database.ExecuteNonQuery(sqlCommand) > 0;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DeliveryMemberInfo GetDeliveryMemberInfo(int userid)
        {
            string selectSql = string.Format(@"Select * From store_deliveryMember Where DeliveryUserId={0}", userid);
            DbCommand command = this.database.GetSqlStringCommand(selectSql);
            using (IDataReader reader = this.database.ExecuteReader(command))
            {
                return ReaderConvert.ReaderToModel<DeliveryMemberInfo>(reader);
            }
        }

        public DeliveryOrderInfo GetDeliveryOrderInfoByOrderId(string orderid)
        {
            string selectSql = "select * from store_deliveryOrder where orderid = '" + orderid + "'";
            DbCommand command = this.database.GetSqlStringCommand(selectSql);
            using (IDataReader reader = this.database.ExecuteReader(command))
            {
                return ReaderConvert.ReaderToModel<DeliveryOrderInfo>(reader);
            }
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        public bool CreateDeliveryMember(DeliveryMemberInfo entity, bool isAdd)
        {
            try
            {
                string execSql = (isAdd) ?
                            "insert into store_deliveryMember (Addtime,UserName,Phone,DeliveryState,[State],StoreId,Sex) values (@Addtime,@UserName,@Phone,@DeliveryState,@State,@StoreId,@Sex)" :
                            "update store_deliveryMember set AddTime = @Addtime,UserName = @UserName,Phone=@Phone,DeliveryState=@DeliveryState,[State]=@State,StoreId=@StoreId,Sex=@Sex Where DeliveryUserId=@DeliveryUserId";
                SqlParameter[] para = new SqlParameter[]
				{
                    new SqlParameter("@DeliveryUserId",entity.DeliveryUserId),
					new SqlParameter("@Addtime",entity.AddTime),
					new SqlParameter("@UserName",entity.UserName),
					new SqlParameter("@Phone",entity.Phone),
					new SqlParameter("@DeliveryState",entity.DeliveryState),
					new SqlParameter("@State",entity.State),
					new SqlParameter("@StoreId",entity.StoreId),
					new SqlParameter("@Sex",entity.Sex),
				};
                DbCommand sqlCommand = this.database.GetSqlStringCommand(execSql);
                this.database.AddInParameter(sqlCommand, "DeliveryUserId", DbType.Int32, entity.DeliveryUserId);
                this.database.AddInParameter(sqlCommand, "Addtime", DbType.DateTime, entity.AddTime);
                this.database.AddInParameter(sqlCommand, "UserName", DbType.String, entity.UserName);
                this.database.AddInParameter(sqlCommand, "Phone", DbType.String, entity.Phone);
                this.database.AddInParameter(sqlCommand, "DeliveryState", DbType.Int32, entity.DeliveryState);
                this.database.AddInParameter(sqlCommand, "State", DbType.Int32, entity.State);
                this.database.AddInParameter(sqlCommand, "StoreId", DbType.Int32, entity.StoreId);
                this.database.AddInParameter(sqlCommand, "Sex", DbType.Int32, entity.Sex);


                return this.database.ExecuteNonQuery(sqlCommand) > 0;
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public DataTable GetDeliveryMemberList(string where = "")
        {
            string sql = "select * from Store_DeliveryMember ";
            if (!string.IsNullOrEmpty(where))
            {
                sql += " where " + where;
            }
            DbCommand command = this.database.GetSqlStringCommand(sql);

            using (IDataReader reader = this.database.ExecuteReader(command))
            {
                return  DataHelper.ConverDataReaderToDataTable(reader);
            }
        }

        /// <summary>
        /// 门店商品列表
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public DbQueryResult GetDeliveryMemberList(DeliveryMemberQuery query)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(" 1=1 ");
            
            if (query.StartDate.HasValue)
            {
                builder.AppendFormat(" AND AddTime >='{0}'", DataHelper.GetSafeDateTimeFormat(query.StartDate.Value));
            }
            if (query.EndDate.HasValue)
            {
                builder.AppendFormat(" AND AddTime <='{0}'", DataHelper.GetSafeDateTimeFormat(query.EndDate.Value));
            }
            if (!string.IsNullOrEmpty(query.UserName))
            {
                builder.AppendFormat(" AND  UserName = '{0}' ", query.UserName);
            }
            if (query.StoreId > 0)
            {
                builder.AppendFormat(" AND  StoreId = '{0}' ", query.StoreId);
            }
            string selectFields = "*";
            return DataHelper.PagingByRownumber(query.PageIndex, query.PageSize, query.SortBy, query.SortOrder, query.IsCount, "Store_DeliveryMember", "DeliveryUserId", builder.ToString(), selectFields);
        }

        public DbQueryResult GetDeliveryOrderList(DeliveryOrderQuery query)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(" 1=1 ");

            if (query.StartDate.HasValue)
            {
                builder.AppendFormat(" AND DO.AddTime >='{0}'", DataHelper.GetSafeDateTimeFormat(query.StartDate.Value));
            }
            if (query.EndDate.HasValue)
            {
                builder.AppendFormat(" AND DO.AddTime <='{0}'", DataHelper.GetSafeDateTimeFormat(query.EndDate.Value));
            }
            if (!string.IsNullOrEmpty(query.OrderId))
            {
                builder.AppendFormat(" AND  DO.OrderId = '{0}' ", query.OrderId);
            }
            if (query.DeliveryUserId > 0)
            {
                builder.AppendFormat(" AND  DO.DeliveryUserId = '{0}' ", query.DeliveryUserId);
            }
            if (query.State > -1)
            {
                builder.AppendFormat(" AND  DO.[State] = '{0}' ", query.State);
            }
            if (query.StoreId > 0)
            {
                builder.AppendFormat(" AND  DO.[StoreId] = {0} ", query.StoreId);
            }

            string selectFields = "DO.*,DM.UserName,DM.Phone";
            return DataHelper.PagingByRownumber(query.PageIndex, query.PageSize, query.SortBy, query.SortOrder, query.IsCount, "Store_DeliveryOrder DO left join Store_DeliveryMember DM on do.DeliveryUserId = DM.DeliveryUserId", "DeliveryOrderId", builder.ToString(), selectFields);
        }

    }
}

