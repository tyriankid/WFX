﻿namespace Hidistro.SqlDal.Commodities
{
    using Hidistro.Core;
    using Hidistro.Entities;
    using Hidistro.Entities.Comments;
    using Hidistro.Entities.Commodities;
    using Microsoft.Practices.EnterpriseLibrary.Data;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.Common;
    using System.Text;

    public class ProductBatchDao
    {
        private Database database = DatabaseFactory.CreateDatabase();

        public bool AddSkuStock(string productIds, int addStock)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("UPDATE Hishop_SKUs SET Stock = CASE WHEN Stock + ({0}) < 0 THEN 0 ELSE Stock + ({0}) END WHERE ProductId IN ({1})", addStock, DataHelper.CleanSearchString(productIds)));
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }
      
        public bool CheckPrice(string productIds, int baseGradeId, decimal checkPrice, bool isMember)
        {
            StringBuilder builder = new StringBuilder(" ");
            if (baseGradeId == -2)
            {
                builder.AppendFormat("SELECT COUNT(*) FROM Hishop_SKUs WHERE ProductId IN ({0}) AND CostPrice - {1} < 0", productIds, checkPrice);
            }
            else if (baseGradeId == -3)
            {
                builder.AppendFormat("SELECT COUNT(*) FROM Hishop_SKUs WHERE ProductId IN ({0}) AND SalePrice - {1} < 0", productIds, checkPrice);
            }
            else if (isMember)
            {
                builder.AppendFormat("SELECT COUNT(*) FROM Hishop_SKUMemberPrice WHERE MemberSalePrice - {0} < 0 AND GradeId = {1}", checkPrice, baseGradeId);
                builder.AppendFormat(" AND SkuId IN (SELECT SkuId FROM Hishop_SKUs WHERE ProductId IN ({0})) ", productIds);
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            return (((int) this.database.ExecuteScalar(sqlStringCommand)) > 0);
        }

        public IList<ProductInfo> GetProductBaseInfo(IEnumerable<int> productIds)
        {
            string query = this.getProductBaseInfoSelectSQL(productIds);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(query);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                return ReaderConvert.ReaderToList<ProductInfo>(reader);
            }
        }

        public ProductInfo GetProductBaseInfo(int productId)
        {
            ProductInfo info = null;
            IList<ProductInfo> productBaseInfo = this.GetProductBaseInfo(new int[] { productId });
            if (productBaseInfo.Count > 0)
            {
                info = productBaseInfo[0];
            }
            return info;
        }

        public DataTable GetProductBaseInfo(string productIds)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("SELECT ProductId, ProductName, ProductCode, MarketPrice, ThumbnailUrl40, SaleCounts, ShowSaleCounts FROM Hishop_Products WHERE ProductId IN ({0})", DataHelper.CleanSearchString(productIds)));
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                return DataHelper.ConverDataReaderToDataTable(reader);
            }
        }

        /// <summary>
        /// 获取总店的所有商品基本信息,门店上架自己商品时使用.
        /// </summary>
        /// <returns></returns>
        public DataTable GetTopStoreProductBaseInfo(int storeId)
        {
            string sql = string.Format("SELECT ProductId, ProductName, ProductCode, MarketPrice, ThumbnailUrl40, SaleCounts, ShowSaleCounts FROM Hishop_Products  where (storeid is null or storeid = 0) and salestatus != 0 ");
            if (storeId > 0)
            {
                sql += string.Format(" and productcode not in (select distinct( ProductCode) from hishop_products where storeid ={0})", storeId);
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(sql);
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                return DataHelper.ConverDataReaderToDataTable(reader);
            }
        }
        /// <summary>
        /// 子门店批量提交商品值总店审核
        /// </summary>
        /// <param name="productids"></param>
        /// <returns></returns>
        public bool MutiProductSubmmitReview(string productids)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("update hishop_products set reviewstate = 2 where productid in ({0})",productids));
            return this.database.ExecuteNonQuery(sqlStringCommand) > 0;
        }

        public bool GoReview(string productids, string refuseReason, string reviewType)
        {
            string sql = "";
            string[] arrayProductids = productids.Split(',');
            string[] arrayRefuseReason = refuseReason.Split(',');
            for (int i = 0; i < arrayProductids.Length; i++)
            {
                sql += string.Format("update hishop_products set reviewstate = {0},ReviewRefuseReason = '{1}' where productid = (select distinct( productid ) from hishop_skus where skuid ='{2}');", reviewType == "pass" ? "0" : "1", reviewType == "pass" ?"审核通过":arrayRefuseReason[i], arrayProductids[i]);
            }

            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(sql);
            return this.database.ExecuteNonQuery(sqlStringCommand) > 0;
        }

        /// <summary>
        /// 获取所有待审核的商品id
        /// </summary>
        /// <param name="storeid"></param>
        /// <returns></returns>
        public string GetReviewProductIds(string storeid = "")
        {
            string sql = string.Format("select productid from Hishop_Products where ReviewState = 2 ");
            if (!string.IsNullOrEmpty(storeid) && storeid != "全部")
            {
                sql += "and storeid="+storeid;
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(sql);
            DataTable dtProductids = new DataTable();
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                dtProductids = DataHelper.ConverDataReaderToDataTable(reader);
            }

            string productids = "";
            foreach (DataRow row in dtProductids.Rows)
            {
                productids += row["productid"].ToString() + ",";
            }
            productids = productids.TrimEnd(',');
            return productids;
        }

        private string getProductBaseInfoSelectSQL(IEnumerable<int> productIds)
        {
            return string.Format("SELECT ProductId, ProductName, ProductCode, MarketPrice, ThumbnailUrl40, SaleCounts, ShowSaleCounts FROM Hishop_Products WHERE ProductId IN ({0})", string.Join<int>(",", productIds));
        }

        public DataTable GetSkuMemberPrices(string productIds)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendFormat("SELECT SkuId, ProductName, SKU, CostPrice, MarketPrice, SalePrice FROM Hishop_Products p JOIN Hishop_SKUs s ON p.ProductId = s.ProductId WHERE p.ProductId IN ({0})", DataHelper.CleanSearchString(productIds));
            builder.Append(" SELECT SkuId, AttributeName, ValueStr FROM Hishop_SKUItems si JOIN Hishop_Attributes a ON si.AttributeId = a.AttributeId JOIN Hishop_AttributeValues av ON si.ValueId = av.ValueId");
            builder.AppendFormat(" WHERE si.SkuId IN(SELECT SkuId FROM Hishop_SKUs WHERE ProductId IN ({0}))", DataHelper.CleanSearchString(productIds));
            builder.AppendLine(" SELECT CAST(GradeId AS NVARCHAR) + '_' + [Name] AS MemberGradeName,Discount FROM aspnet_MemberGrades");
            builder.AppendLine(" SELECT SkuId, (SELECT CAST(GradeId AS NVARCHAR) + '_' + [Name] FROM aspnet_MemberGrades WHERE GradeId = sm.GradeId) AS MemberGradeName,MemberSalePrice");
            builder.AppendFormat(" FROM Hishop_SKUMemberPrice sm WHERE SkuId IN (SELECT SkuId FROM Hishop_SKUs WHERE ProductId IN ({0}))", DataHelper.CleanSearchString(productIds));
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            DataTable table = null;
            DataTable table2 = null;
            DataTable table3 = null;
            DataTable table4 = null;
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                table = DataHelper.ConverDataReaderToDataTable(reader);
                if ((table != null) && (table.Rows.Count > 0))
                {
                    table.Columns.Add("SKUContent");
                    reader.NextResult();
                    table2 = DataHelper.ConverDataReaderToDataTable(reader);
                    reader.NextResult();
                    table4 = DataHelper.ConverDataReaderToDataTable(reader);
                    if ((table4 != null) && (table4.Rows.Count > 0))
                    {
                        foreach (DataRow row in table4.Rows)
                        {
                            table.Columns.Add((string) row["MemberGradeName"]);
                        }
                    }
                    reader.NextResult();
                    table3 = DataHelper.ConverDataReaderToDataTable(reader);
                }
            }
            if ((table2 != null) && (table2.Rows.Count > 0))
            {
                foreach (DataRow row2 in table.Rows)
                {
                    string str = string.Empty;
                    foreach (DataRow row3 in table2.Rows)
                    {
                        if (((string) row2["SkuId"]) == ((string) row3["SkuId"]))
                        {
                            object obj2 = str;
                            str = string.Concat(new object[] { obj2, row3["AttributeName"], "：", row3["ValueStr"], "; " });
                        }
                    }
                    row2["SKUContent"] = str;
                }
            }
            if ((table3 != null) && (table3.Rows.Count > 0))
            {
                foreach (DataRow row2 in table.Rows)
                {
                    foreach (DataRow row4 in table3.Rows)
                    {
                        if (((string) row2["SkuId"]) == ((string) row4["SkuId"]))
                        {
                            row2[(string) row4["MemberGradeName"]] = row4["MemberSalePrice"];
                        }
                    }
                }
            }
            if ((table4 != null) && (table4.Rows.Count > 0))
            {
                foreach (DataRow row2 in table.Rows)
                {
                    decimal num = decimal.Parse(row2["SalePrice"].ToString());
                    foreach (DataRow row5 in table4.Rows)
                    {
                        decimal num2 = decimal.Parse(row5["Discount"].ToString());
                        string str2 = (num * (num2 / 100M)).ToString("F2");
                        row2[(string) row5["MemberGradeName"]] = row2[(string) row5["MemberGradeName"]] + "|" + str2;
                    }
                }
            }
            return table;
        }


        public DataTable GetSkuStocks(string productIds)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendFormat("SELECT p.ProductId,ProductName, SkuId, SKU, Stock, ThumbnailUrl40 FROM Hishop_Products p JOIN Hishop_SKUs s ON p.ProductId = s.ProductId WHERE p.ProductId IN ({0})", DataHelper.CleanSearchString(productIds));
            builder.Append(" SELECT SkuId, AttributeName, ValueStr FROM Hishop_SKUItems si JOIN Hishop_Attributes a ON si.AttributeId = a.AttributeId JOIN Hishop_AttributeValues av ON si.ValueId = av.ValueId");
            builder.AppendFormat(" WHERE si.SkuId IN(SELECT SkuId FROM Hishop_SKUs WHERE ProductId IN ({0}))", DataHelper.CleanSearchString(productIds));
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            DataTable table = null;
            DataTable table2 = null;
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                table = DataHelper.ConverDataReaderToDataTable(reader);
                reader.NextResult();
                table2 = DataHelper.ConverDataReaderToDataTable(reader);
            }
            table.Columns.Add("SKUContent");
            if ((((table != null) && (table.Rows.Count > 0)) && (table2 != null)) && (table2.Rows.Count > 0))
            {
                foreach (DataRow row in table.Rows)
                {
                    string str = string.Empty;
                    foreach (DataRow row2 in table2.Rows)
                    {
                        if (((string) row["SkuId"]) == ((string) row2["SkuId"]))
                        {
                            object obj2 = str;
                            str = string.Concat(new object[] { obj2, row2["AttributeName"], "：", row2["ValueStr"], "; " });
                        }
                    }
                    row["SKUContent"] = str;
                }
            }
            return table;
        }

        public bool ReplaceProductNames(string productIds, string oldWord, string newWord)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("UPDATE Hishop_Products SET ProductName = REPLACE(ProductName, '{0}', '{1}') WHERE ProductId IN ({2})", DataHelper.CleanSearchString(oldWord), DataHelper.CleanSearchString(newWord), productIds));
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateProductBaseInfo(DataTable dt)
        {
            StringBuilder builder = new StringBuilder();
            int num = 0;
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(" ");
            foreach (DataRow row in dt.Rows)
            {
                num++;
                string str = num.ToString();
                builder.AppendFormat(" UPDATE Hishop_Products SET ProductName = @ProductName{0}, ProductCode = @ProductCode{0}, MarketPrice = @MarketPrice{0}", str);
                builder.AppendFormat(" WHERE ProductId = {0}", row["ProductId"]);
                this.database.AddInParameter(sqlStringCommand, "ProductName" + str, DbType.String, row["ProductName"]);
                this.database.AddInParameter(sqlStringCommand, "ProductCode" + str, DbType.String, row["ProductCode"]);
                this.database.AddInParameter(sqlStringCommand, "MarketPrice" + str, DbType.String, row["MarketPrice"]);
            }
            sqlStringCommand.CommandText = builder.ToString();
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateProductNames(string productIds, string prefix, string suffix)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("UPDATE Hishop_Products SET ProductName = '{0}'+ProductName+'{1}' WHERE ProductId IN ({2})", DataHelper.CleanSearchString(prefix), DataHelper.CleanSearchString(suffix), productIds));
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateShowSaleCounts(DataTable dt)
        {
            StringBuilder builder = new StringBuilder();
            foreach (DataRow row in dt.Rows)
            {
                builder.AppendFormat(" UPDATE Hishop_Products SET ShowSaleCounts = {0} WHERE ProductId = {1}", row["ShowSaleCounts"], row["ProductId"]);
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateShowSaleCounts(string productIds, int showSaleCounts)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("UPDATE Hishop_Products SET ShowSaleCounts = {0} WHERE ProductId IN ({1})", showSaleCounts, productIds));
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public List<ProductReviewAndReplyQuery> SelectProduct()
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand("select * from Hishop_Products");
            List<ProductReviewAndReplyQuery> list = new List<ProductReviewAndReplyQuery>();
            using (IDataReader reader = this.database.ExecuteReader(sqlStringCommand))
            {
                list =(List < ProductReviewAndReplyQuery >)ReaderConvert.ReaderToList<ProductReviewAndReplyQuery>(reader);
            }
            return list;
        }

        public bool UpdateShowSaleCounts(string productIds, int showSaleCounts, string operation)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("UPDATE Hishop_Products SET ShowSaleCounts = SaleCounts {0} {1} WHERE ProductId IN ({2})", operation, showSaleCounts, productIds));
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateSkuMemberPrices(DataSet ds)
        {
            StringBuilder builder = new StringBuilder();
            DataTable table = ds.Tables["skuPriceTable"];
            DataTable table2 = ds.Tables["skuMemberPriceTable"];
            string str = string.Empty;
            if ((table != null) && (table.Rows.Count > 0))
            {
                foreach (DataRow row in table.Rows)
                {
                    object obj2 = str;
                    str = string.Concat(new object[] { obj2, "'", row["skuId"], "'," });
                    builder.AppendFormat(" UPDATE Hishop_SKUs SET CostPrice = {0}, SalePrice = {1} WHERE SkuId = '{2}'", row["costPrice"], row["salePrice"], row["skuId"]);
                }
            }
            if (str.Length > 1)
            {
                builder.AppendFormat(" DELETE FROM Hishop_SKUMemberPrice WHERE SkuId IN ({0}) ", str.Remove(str.Length - 1));
            }
            if ((table2 != null) && (table2.Rows.Count > 0))
            {
                foreach (DataRow row in table2.Rows)
                {
                    builder.AppendFormat(" INSERT INTO Hishop_SKUMemberPrice (SkuId, GradeId, MemberSalePrice) VALUES ('{0}', {1}, {2})", row["skuId"], row["gradeId"], row["memberPrice"]);
                }
            }
            if (builder.Length <= 0)
            {
                return false;
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateProductReviewState(int state, string productIds)
        {
            string sql = string.Format("Update Hishop_Products set ReviewState ={0} where productid in ({1})", state,productIds);
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(sql);
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateSkuMemberPrices(string productIds, int gradeId, decimal price)
        {
            StringBuilder builder = new StringBuilder();
            if (gradeId == -2)
            {
                builder.AppendFormat("UPDATE Hishop_SKUs SET CostPrice = {0} WHERE ProductId IN ({1})", price, DataHelper.CleanSearchString(productIds));
            }
            else if (gradeId == -3)
            {
                builder.AppendFormat("UPDATE Hishop_SKUs SET SalePrice = {0} WHERE ProductId IN ({1})", price, DataHelper.CleanSearchString(productIds));
            }
            else
            {
                builder.AppendFormat("DELETE FROM Hishop_SKUMemberPrice WHERE GradeId = {0} AND SkuId IN (SELECT SkuId FROM Hishop_SKUs WHERE ProductId IN ({1}))", gradeId, DataHelper.CleanSearchString(productIds));
                builder.AppendFormat(" INSERT INTO Hishop_SKUMemberPrice (SkuId,GradeId,MemberSalePrice) SELECT SkuId, {0} AS GradeId, {1} AS MemberSalePrice FROM Hishop_SKUs WHERE ProductId IN ({2})", gradeId, price, DataHelper.CleanSearchString(productIds));
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateSkuMemberPrices(string productIds, int gradeId, int baseGradeId, string operation, decimal price)
        {
            StringBuilder builder = new StringBuilder(" ");
            if (gradeId == -2)
            {
                if (baseGradeId == -2)
                {
                    builder.AppendFormat("UPDATE Hishop_SKUs SET CostPrice = CostPrice {0} ({1}) WHERE ProductId IN ({2})", operation, price, DataHelper.CleanSearchString(productIds));
                }
                else if (baseGradeId == -3)
                {
                    builder.AppendFormat("UPDATE Hishop_SKUs SET CostPrice = SalePrice {0} ({1}) WHERE ProductId IN ({2})", operation, price, DataHelper.CleanSearchString(productIds));
                }
            }
            else if (gradeId == -3)
            {
                if (baseGradeId == -2)
                {
                    builder.AppendFormat("UPDATE Hishop_SKUs SET SalePrice = CostPrice {0} ({1}) WHERE ProductId IN ({2})", operation, price, DataHelper.CleanSearchString(productIds));
                }
                else if (baseGradeId == -3)
                {
                    builder.AppendFormat("UPDATE Hishop_SKUs SET SalePrice = SalePrice {0} ({1}) WHERE ProductId IN ({2})", operation, price, DataHelper.CleanSearchString(productIds));
                }
            }
            else
            {
                builder.AppendFormat("DELETE FROM Hishop_SKUMemberPrice WHERE GradeId = {0} AND SkuId IN (SELECT SkuId FROM Hishop_SKUs WHERE ProductId IN ({1}))", gradeId, DataHelper.CleanSearchString(productIds));
                if (baseGradeId == -2)
                {
                    builder.AppendFormat(" INSERT INTO Hishop_SKUMemberPrice (SkuId,GradeId,MemberSalePrice) SELECT SkuId, {0} AS GradeId, CostPrice {1} ({2}) AS MemberSalePrice FROM Hishop_SKUs WHERE ProductId IN ({3})", new object[] { gradeId, operation, price, DataHelper.CleanSearchString(productIds) });
                }
                else if (baseGradeId == -3)
                {
                    builder.AppendFormat(" INSERT INTO Hishop_SKUMemberPrice (SkuId,GradeId,MemberSalePrice) SELECT SkuId, {0} AS GradeId, SalePrice {1} ({2}) AS MemberSalePrice FROM Hishop_SKUs WHERE ProductId IN ({3})", new object[] { gradeId, operation, price, DataHelper.CleanSearchString(productIds) });
                }
                else
                {
                    builder.AppendFormat(" INSERT INTO Hishop_SKUMemberPrice (SkuId,GradeId,MemberSalePrice) SELECT SkuId, {0} AS GradeId, MemberSalePrice {1} ({2}) AS MemberSalePrice", gradeId, operation, price);
                    builder.AppendFormat(" FROM Hishop_SKUMemberPrice WHERE GradeId = {0} AND SkuId IN (SELECT SkuId FROM Hishop_SKUs WHERE ProductId IN ({1}))", baseGradeId, DataHelper.CleanSearchString(productIds));
                }
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateSkuStock(Dictionary<string, int> skuStocks)
        {
            StringBuilder builder = new StringBuilder();
            foreach (string str in skuStocks.Keys)
            {
                builder.AppendFormat(" UPDATE Hishop_SKUs SET Stock = {0} WHERE SkuId = '{1}'", skuStocks[str], DataHelper.CleanSearchString(str));
            }
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(builder.ToString());
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateSkuStock(string productIds, int stock)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("UPDATE Hishop_SKUs SET Stock = {0} WHERE ProductId IN ({1})", stock, DataHelper.CleanSearchString(productIds)));
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }

        public bool UpdateVisitCounts(int productId)
        {
            DbCommand sqlStringCommand = this.database.GetSqlStringCommand(string.Format("UPDATE Hishop_Products SET VistiCounts = VistiCounts + 1 WHERE ProductId = {0}", productId));
            return (this.database.ExecuteNonQuery(sqlStringCommand) > 0);
        }
    }
}

