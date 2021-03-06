﻿namespace Hidistro.Entities.Orders
{
    using System;
    using System.Runtime.CompilerServices;

    public class LineItemInfo
    {
        public decimal GetSubTotal()
        {
            return (this.ItemAdjustedPrice * this.Quantity);
        }

        /// <summary>
        /// Add: JHB,20150817，计算利润
        /// </summary>
        /// <returns></returns>
        public decimal GetSubTotalProfit()
        {
            return ((this.ItemAdjustedPrice - this.ItemCostPrice) * this.Quantity);
        }

        public decimal ItemAdjustedCommssion { get; set; }

        public decimal ItemAdjustedPrice { get; set; }

        public decimal ItemCostPrice { get; set; }

        public string ItemDescription { get; set; }

        public decimal ItemListPrice { get; set; }

        public decimal ItemsCommission { get; set; }

        public decimal ItemWeight { get; set; }

        public string MainCategoryPath { get; set; }

        public OrderStatus OrderItemsStatus { get; set; }

        public int ProductId { get; set; }

        public int PromotionId { get; set; }

        public string PromotionName { get; set; }

        public int Quantity { get; set; }

        public decimal SecondItemsCommission { get; set; }

        public int ShipmentQuantity { get; set; }

        public string SKU { get; set; }

        public string SKUContent { get; set; }

        public string SkuId { get; set; }

        public decimal ThirdItemsCommission { get; set; }

        public string ThumbnailsUrl { get; set; }
    }
}

