namespace Hidistro.SaleSystem.Vshop
{
    using Hidistro.Core;
    using Hidistro.Entities.Members;
    using Hidistro.Entities.Promotions;
    using Hidistro.Entities.Sales;
    using Hidistro.SqlDal.Commodities;
    using Hidistro.SqlDal.Sales;
    using System;
    using System.Collections.Generic;

    public static class ShoppingCartProcessor
    {
        public static void AddLineItem(string skuId, int quantity, int categoryid)
        {
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (quantity <= 0)
            {
                quantity = 1;
            }
            new ShoppingCartDao().AddLineItem(currentMember, skuId, quantity, categoryid);
        }

        public static void ClearShoppingCart()
        {
            new ShoppingCartDao().ClearShoppingCart(Globals.GetCurrentMemberUserId());
        }

        public static ShoppingCartInfo GetGroupBuyShoppingCart(int groupbuyId, string productSkuId, int buyAmount)
        {
            ShoppingCartItemInfo shoppingCartItemInfo;
            ShoppingCartInfo info = new ShoppingCartInfo();
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            ShoppingCartItemInfo info3 = new ShoppingCartDao().GetCartItemInfo(currentMember, productSkuId, buyAmount);
            if (info3 == null)
            {
                return null;
            }
            GroupBuyInfo groupBuy = GroupBuyBrowser.GetGroupBuy(groupbuyId);
            if (((groupBuy == null) || (groupBuy.StartDate > DateTime.Now)) || (groupBuy.Status != GroupBuyStatus.UnderWay))
            {
                return null;
            }
            int count = groupBuy.Count;
            decimal price = groupBuy.Price;
            shoppingCartItemInfo = new ShoppingCartItemInfo();
            shoppingCartItemInfo.SkuId = info3.SkuId;
            shoppingCartItemInfo.ProductId = info3.ProductId;
            shoppingCartItemInfo.SKU = info3.SKU;
            shoppingCartItemInfo.Name = info3.Name;
            shoppingCartItemInfo.MemberPrice = shoppingCartItemInfo.AdjustedPrice = price;
            shoppingCartItemInfo.SkuContent = info3.SkuContent;
            shoppingCartItemInfo.Quantity = shoppingCartItemInfo.ShippQuantity = buyAmount;
            shoppingCartItemInfo.Weight = info3.Weight;
            shoppingCartItemInfo.ThumbnailUrl40 = info3.ThumbnailUrl40;
            shoppingCartItemInfo.ThumbnailUrl60 = info3.ThumbnailUrl60;
            shoppingCartItemInfo.ThumbnailUrl100 = info3.ThumbnailUrl100;

            info.LineItems.Add(shoppingCartItemInfo);
            return info;
        }

        public static ShoppingCartInfo GetShoppingCart()
        {
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                return null;
            }
            ShoppingCartInfo shoppingCart = new ShoppingCartDao().GetShoppingCart(currentMember);
            if (shoppingCart.LineItems.Count == 0)
            {
                return null;
            }
            return shoppingCart;
        }

        public static ShoppingCartInfo GetShoppingCart(string productSkuId, int buyAmount)
        {
            ShoppingCartInfo info = new ShoppingCartInfo();
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            ShoppingCartItemInfo item = new ShoppingCartDao().GetCartItemInfo(currentMember, productSkuId, buyAmount);
            if (item == null)
            {
                return null;
            }
            info.LineItems.Add(item);
            return info;
        }

        public static List<ShoppingCartInfo> GetShoppingCartAviti()
        {
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (currentMember == null)
            {
                return null;
            }
            List<ShoppingCartInfo> shoppingCartAviti = new ShoppingCartDao().GetShoppingCartAviti(currentMember);
            if (shoppingCartAviti.Count == 0)
            {
                return null;
            }
            return shoppingCartAviti;
        }

        public static int GetSkuStock(string skuId)
        {
            return new SkuDao().GetSkuItem(skuId).Stock;
        }

        public static void RemoveLineItem(string skuId)
        {
            new ShoppingCartDao().RemoveLineItem(Globals.GetCurrentMemberUserId(), skuId);
        }

        public static void UpdateLineItemQuantity(string skuId, int quantity)
        {
            MemberInfo currentMember = MemberProcessor.GetCurrentMember();
            if (quantity <= 0)
            {
                RemoveLineItem(skuId);
            }
            new ShoppingCartDao().UpdateLineItemQuantity(currentMember, skuId, quantity);
        }
    }
}

