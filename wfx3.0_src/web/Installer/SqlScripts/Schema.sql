/****** Object:  ForeignKey [FK_Hishop_Attributes_ProductTypes]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_Attributes_ProductTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Attributes]'))
ALTER TABLE [dbo].[Hishop_Attributes] DROP CONSTRAINT [FK_Hishop_Attributes_ProductTypes]
GO
/****** Object:  ForeignKey [FK_Hishop_AttributeValues_Attributes]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_AttributeValues_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_AttributeValues]'))
ALTER TABLE [dbo].[Hishop_AttributeValues] DROP CONSTRAINT [FK_Hishop_AttributeValues_Attributes]
GO
/****** Object:  ForeignKey [FK_Hishop_CouponItems__Coupons]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_CouponItems__Coupons]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_CouponItems]'))
ALTER TABLE [dbo].[Hishop_CouponItems] DROP CONSTRAINT [FK_Hishop_CouponItems__Coupons]
GO
/****** Object:  ForeignKey [FK_Hishop_GroupBuy_Products]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_GroupBuy_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_GroupBuy]'))
ALTER TABLE [dbo].[Hishop_GroupBuy] DROP CONSTRAINT [FK_Hishop_GroupBuy_Products]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderDebitNote_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderDebitNote_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderDebitNote]'))
ALTER TABLE [dbo].[Hishop_OrderDebitNote] DROP CONSTRAINT [FK_Hishop_OrderDebitNote_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderItems_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderItems_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
ALTER TABLE [dbo].[Hishop_OrderItems] DROP CONSTRAINT [FK_Hishop_OrderItems_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderRefund_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderRefund_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderRefund]'))
ALTER TABLE [dbo].[Hishop_OrderRefund] DROP CONSTRAINT [FK_Hishop_OrderRefund_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderReplace_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderReplace_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReplace]'))
ALTER TABLE [dbo].[Hishop_OrderReplace] DROP CONSTRAINT [FK_Hishop_OrderReplace_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderReturns_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderReturns_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReturns]'))
ALTER TABLE [dbo].[Hishop_OrderReturns] DROP CONSTRAINT [FK_Hishop_OrderReturns_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderSendNote_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderSendNote_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderSendNote]'))
ALTER TABLE [dbo].[Hishop_OrderSendNote] DROP CONSTRAINT [FK_Hishop_OrderSendNote_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_PointDetails_aspnet_Memberss]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_PointDetails_aspnet_Memberss]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_PointDetails]'))
ALTER TABLE [dbo].[Hishop_PointDetails] DROP CONSTRAINT [FK_Hishop_PointDetails_aspnet_Memberss]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductAttributes_Attributes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductAttributes_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductAttributes]'))
ALTER TABLE [dbo].[Hishop_ProductAttributes] DROP CONSTRAINT [FK_Hishop_ProductAttributes_Attributes]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductAttributes_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductAttributes_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductAttributes]'))
ALTER TABLE [dbo].[Hishop_ProductAttributes] DROP CONSTRAINT [FK_Hishop_ProductAttributes_Products]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductTag_Hishop_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductTag_Hishop_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTag]'))
ALTER TABLE [dbo].[Hishop_ProductTag] DROP CONSTRAINT [FK_Hishop_ProductTag_Hishop_Products]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductTypeBrands_Hishop_BrandCategories]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductTypeBrands_Hishop_BrandCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypeBrands]'))
ALTER TABLE [dbo].[Hishop_ProductTypeBrands] DROP CONSTRAINT [FK_Hishop_ProductTypeBrands_Hishop_BrandCategories]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductTypeBrands_Hishop_ProductTypes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductTypeBrands_Hishop_ProductTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypeBrands]'))
ALTER TABLE [dbo].[Hishop_ProductTypeBrands] DROP CONSTRAINT [FK_Hishop_ProductTypeBrands_Hishop_ProductTypes]
GO
/****** Object:  ForeignKey [FK_Hishop_ShippingRegions_ShippingTypes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShippingRegions_ShippingTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingRegions]'))
ALTER TABLE [dbo].[Hishop_ShippingRegions] DROP CONSTRAINT [FK_Hishop_ShippingRegions_ShippingTypes]
GO
/****** Object:  ForeignKey [FK_Hishop_ShippingTypeGroups_ShippingTemplates]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShippingTypeGroups_ShippingTemplates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypeGroups]'))
ALTER TABLE [dbo].[Hishop_ShippingTypeGroups] DROP CONSTRAINT [FK_Hishop_ShippingTypeGroups_ShippingTemplates]
GO
/****** Object:  ForeignKey [FK_Hishop_ShippingTypes_ShippingTemplates]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShippingTypes_ShippingTemplates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypes]'))
ALTER TABLE [dbo].[Hishop_ShippingTypes] DROP CONSTRAINT [FK_Hishop_ShippingTypes_ShippingTemplates]
GO
/****** Object:  ForeignKey [FK_Hishop_ShoppingCarts_aspnet_Members]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShoppingCarts_aspnet_Members]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShoppingCarts]'))
ALTER TABLE [dbo].[Hishop_ShoppingCarts] DROP CONSTRAINT [FK_Hishop_ShoppingCarts_aspnet_Members]
GO
/****** Object:  ForeignKey [FK_Hishop_SKUItems_SKUs]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUItems_SKUs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUItems]'))
ALTER TABLE [dbo].[Hishop_SKUItems] DROP CONSTRAINT [FK_Hishop_SKUItems_SKUs]
GO
/****** Object:  ForeignKey [FK_Hishop_SKUMemberPrice_aspnet_MemberGrades]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUMemberPrice_aspnet_MemberGrades]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUMemberPrice]'))
ALTER TABLE [dbo].[Hishop_SKUMemberPrice] DROP CONSTRAINT [FK_Hishop_SKUMemberPrice_aspnet_MemberGrades]
GO
/****** Object:  ForeignKey [FK_Hishop_SKUMemberPrice_SKUs]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUMemberPrice_SKUs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUMemberPrice]'))
ALTER TABLE [dbo].[Hishop_SKUMemberPrice] DROP CONSTRAINT [FK_Hishop_SKUMemberPrice_SKUs]
GO
/****** Object:  ForeignKey [FK_Hishop_SKUs_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUs_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUs]'))
ALTER TABLE [dbo].[Hishop_SKUs] DROP CONSTRAINT [FK_Hishop_SKUs_Products]
GO
/****** Object:  ForeignKey [FK_Hishop_UserShippingAddresses_aspnet_Memberss]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_UserShippingAddresses_aspnet_Memberss]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_UserShippingAddresses]'))
ALTER TABLE [dbo].[Hishop_UserShippingAddresses] DROP CONSTRAINT [FK_Hishop_UserShippingAddresses_aspnet_Memberss]
GO
/****** Object:  ForeignKey [FK_Hishop_VoteItems_Votes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_VoteItems_Votes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_VoteItems]'))
ALTER TABLE [dbo].[Hishop_VoteItems] DROP CONSTRAINT [FK_Hishop_VoteItems_Votes]
GO
/****** Object:  ForeignKey [FK_Taobao_Products_Hishop_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Taobao_Products_Hishop_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Taobao_Products]'))
ALTER TABLE [dbo].[Taobao_Products] DROP CONSTRAINT [FK_Taobao_Products_Hishop_Products]
GO
/****** Object:  StoredProcedure [dbo].[cp_Product_GetExportList]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Product_GetExportList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_Product_GetExportList]
GO
/****** Object:  StoredProcedure [dbo].[ss_ShoppingCart_GetItemInfo]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ss_ShoppingCart_GetItemInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ss_ShoppingCart_GetItemInfo]
GO
/****** Object:  Table [dbo].[Hishop_AttributeValues]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_AttributeValues]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_AttributeValues]
GO
/****** Object:  StoredProcedure [dbo].[cp_ShippingMode_Create]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ShippingMode_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_ShippingMode_Create]
GO
/****** Object:  StoredProcedure [dbo].[cp_ShippingMode_Update]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ShippingMode_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_ShippingMode_Update]
GO
/****** Object:  StoredProcedure [dbo].[cp_ClaimCode_Create]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ClaimCode_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_ClaimCode_Create]
GO
/****** Object:  Table [dbo].[Hishop_ProductAttributes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductAttributes]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ProductAttributes]
GO
/****** Object:  Table [dbo].[Hishop_SKUItems]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_SKUItems]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_SKUItems]
GO
/****** Object:  Table [dbo].[Hishop_SKUMemberPrice]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_SKUMemberPrice]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_SKUMemberPrice]
GO
/****** Object:  StoredProcedure [dbo].[ss_ShoppingCart_AddLineItem]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ss_ShoppingCart_AddLineItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ss_ShoppingCart_AddLineItem]
GO
/****** Object:  View [dbo].[vw_Hishop_BrowseProductList]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_BrowseProductList]'))
DROP VIEW [dbo].[vw_Hishop_BrowseProductList]
GO
/****** Object:  View [dbo].[vw_Hishop_CouponInfo]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_CouponInfo]'))
DROP VIEW [dbo].[vw_Hishop_CouponInfo]
GO
/****** Object:  View [dbo].[vw_Hishop_OrderDebitNote]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderDebitNote]'))
DROP VIEW [dbo].[vw_Hishop_OrderDebitNote]
GO
/****** Object:  View [dbo].[vw_Hishop_OrderItem]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderItem]'))
DROP VIEW [dbo].[vw_Hishop_OrderItem]
GO
/****** Object:  View [dbo].[vw_Hishop_OrderRefund]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderRefund]'))
DROP VIEW [dbo].[vw_Hishop_OrderRefund]
GO
/****** Object:  View [dbo].[vw_Hishop_OrderReplace]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderReplace]'))
DROP VIEW [dbo].[vw_Hishop_OrderReplace]
GO
/****** Object:  View [dbo].[vw_Hishop_OrderReturns]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderReturns]'))
DROP VIEW [dbo].[vw_Hishop_OrderReturns]
GO
/****** Object:  View [dbo].[vw_Hishop_OrderSendNote]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderSendNote]'))
DROP VIEW [dbo].[vw_Hishop_OrderSendNote]
GO
/****** Object:  View [dbo].[vw_Hishop_GroupBuy]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_GroupBuy]'))
DROP VIEW [dbo].[vw_Hishop_GroupBuy]
GO
/****** Object:  View [dbo].[vw_Hishop_ProductSkuList]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_ProductSkuList]'))
DROP VIEW [dbo].[vw_Hishop_ProductSkuList]
GO
/****** Object:  View [dbo].[vw_Hishop_SaleDetails]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_SaleDetails]'))
DROP VIEW [dbo].[vw_Hishop_SaleDetails]
GO
/****** Object:  View [dbo].[vw_Hishop_Order]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_Order]'))
DROP VIEW [dbo].[vw_Hishop_Order]
GO
/****** Object:  View [dbo].[vw_Hishop_BalanceDrawRequesDistributors]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_BalanceDrawRequesDistributors]'))
DROP VIEW [dbo].[vw_Hishop_BalanceDrawRequesDistributors]
GO
/****** Object:  Table [dbo].[Taobao_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Taobao_Products]') AND type in (N'U'))
DROP TABLE [dbo].[Taobao_Products]
GO
/****** Object:  View [dbo].[vw_Hishop_ProductConsultations]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_ProductConsultations]'))
DROP VIEW [dbo].[vw_Hishop_ProductConsultations]
GO
/****** Object:  View [dbo].[vw_Hishop_ProductReviews]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_ProductReviews]'))
DROP VIEW [dbo].[vw_Hishop_ProductReviews]
GO
/****** Object:  View [dbo].[vw_Hishop_DistributorsMembers]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_DistributorsMembers]'))
DROP VIEW [dbo].[vw_Hishop_DistributorsMembers]
GO
/****** Object:  View [dbo].[vw_Hishop_CommissionDistributors]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_CommissionDistributors]'))
DROP VIEW [dbo].[vw_Hishop_CommissionDistributors]
GO
/****** Object:  StoredProcedure [dbo].[ss_CreateOrder]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ss_CreateOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ss_CreateOrder]
GO
/****** Object:  Table [dbo].[Hishop_PointDetails]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PointDetails]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_PointDetails]
GO
/****** Object:  Table [dbo].[Hishop_UserShippingAddresses]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_UserShippingAddresses]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_UserShippingAddresses]
GO
/****** Object:  Table [dbo].[Hishop_VoteItems]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_VoteItems]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_VoteItems]
GO
/****** Object:  Table [dbo].[Hishop_SKUs]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_SKUs]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_SKUs]
GO
/****** Object:  Table [dbo].[Hishop_OrderSendNote]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderSendNote]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_OrderSendNote]
GO
/****** Object:  Table [dbo].[Hishop_ProductTag]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTag]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ProductTag]
GO
/****** Object:  Table [dbo].[Hishop_ProductTypeBrands]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypeBrands]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ProductTypeBrands]
GO
/****** Object:  Table [dbo].[Hishop_ShippingRegions]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingRegions]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ShippingRegions]
GO
/****** Object:  Table [dbo].[Hishop_ShippingTypeGroups]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypeGroups]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ShippingTypeGroups]
GO
/****** Object:  Table [dbo].[Hishop_ShippingTypes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypes]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ShippingTypes]
GO
/****** Object:  Table [dbo].[Hishop_ShoppingCarts]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShoppingCarts]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ShoppingCarts]
GO
/****** Object:  Table [dbo].[Hishop_OrderDebitNote]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderDebitNote]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_OrderDebitNote]
GO
/****** Object:  Table [dbo].[Hishop_OrderItems]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_OrderItems]
GO
/****** Object:  Table [dbo].[Hishop_OrderRefund]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderRefund]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_OrderRefund]
GO
/****** Object:  Table [dbo].[Hishop_OrderReplace]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReplace]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_OrderReplace]
GO
/****** Object:  Table [dbo].[Hishop_OrderReturns]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReturns]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_OrderReturns]
GO
/****** Object:  StoredProcedure [dbo].[cp_Category_Create]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Category_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_Category_Create]
GO
/****** Object:  StoredProcedure [dbo].[cp_Category_Delete]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Category_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_Category_Delete]
GO
/****** Object:  StoredProcedure [dbo].[cp_Menu_SwapDisplaySequence]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Menu_SwapDisplaySequence]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_Menu_SwapDisplaySequence]
GO
/****** Object:  StoredProcedure [dbo].[cp_OrderStatistics_Get]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_OrderStatistics_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_OrderStatistics_Get]
GO
/****** Object:  StoredProcedure [dbo].[cp_OrderStatisticsNoPage_Get]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_OrderStatisticsNoPage_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_OrderStatisticsNoPage_Get]
GO
/****** Object:  StoredProcedure [dbo].[cp_PaymentType_CreateUpdateDelete]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_PaymentType_CreateUpdateDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_PaymentType_CreateUpdateDelete]
GO
/****** Object:  StoredProcedure [dbo].[cp_Product_Create]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Product_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_Product_Create]
GO
/****** Object:  StoredProcedure [dbo].[cp_Votes_Create]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Votes_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_Votes_Create]
GO
/****** Object:  StoredProcedure [dbo].[cp_Product_Update]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Product_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_Product_Update]
GO
/****** Object:  StoredProcedure [dbo].[cp_ProductSales_Get]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ProductSales_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_ProductSales_Get]
GO
/****** Object:  StoredProcedure [dbo].[cp_ProductSalesNoPage_Get]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ProductSalesNoPage_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_ProductSalesNoPage_Get]
GO
/****** Object:  StoredProcedure [dbo].[cp_ProductVisitAndBuyStatistics_Get]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ProductVisitAndBuyStatistics_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_ProductVisitAndBuyStatistics_Get]
GO
/****** Object:  Table [dbo].[Hishop_CouponItems]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_CouponItems]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_CouponItems]
GO
/****** Object:  Table [dbo].[Hishop_Attributes]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Attributes]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Attributes]
GO
/****** Object:  Table [dbo].[Hishop_GroupBuy]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_GroupBuy]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_GroupBuy]
GO
/****** Object:  Table [dbo].[Hishop_Logs]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Logs]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Logs]
GO
/****** Object:  Table [dbo].[Hishop_MemberClientSet]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_MemberClientSet]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_MemberClientSet]
GO
/****** Object:  Table [dbo].[Hishop_MessageTemplates]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_MessageTemplates]
GO
/****** Object:  Table [dbo].[Hishop_Coupons]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Coupons]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Coupons]
GO
/****** Object:  Table [dbo].[Hishop_DistributorProducts]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_DistributorProducts]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_DistributorProducts]
GO
/****** Object:  Table [dbo].[Hishop_ExpressTemplates]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ExpressTemplates]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ExpressTemplates]
GO
/****** Object:  Table [dbo].[Hishop_Favorite]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Favorite]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Favorite]
GO
/****** Object:  Table [dbo].[Hishop_FriendExtension]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_FriendExtension]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_FriendExtension]
GO
/****** Object:  Table [dbo].[Hishop_BalanceDrawRequest]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_BalanceDrawRequest]
GO
/****** Object:  Table [dbo].[Hishop_Banner]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Banner]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Banner]
GO
/****** Object:  Table [dbo].[Hishop_BrandCategories]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_BrandCategories]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_BrandCategories]
GO
/****** Object:  Table [dbo].[Hishop_Categories]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Categories]
GO
/****** Object:  Table [dbo].[Hishop_Commissions]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Commissions]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Commissions]
GO
/****** Object:  StoredProcedure [dbo].[cp_RegionsUsers_Get]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_RegionsUsers_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_RegionsUsers_Get]
GO
/****** Object:  UserDefinedFunction [dbo].[F_SplitToInt]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_SplitToInt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_SplitToInt]
GO
/****** Object:  UserDefinedFunction [dbo].[F_SplitToString]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_SplitToString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_SplitToString]
GO
/****** Object:  Table [dbo].[Hishop_Activities]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Activities]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Activities]
GO
/****** Object:  Table [dbo].[Hishop_Advertising]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Advertising]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Advertising]
GO
/****** Object:  StoredProcedure [dbo].[cp_MemberStatistics_Get]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_MemberStatistics_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[cp_MemberStatistics_Get]
GO
/****** Object:  Table [dbo].[aspnet_DistributorGrade]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_DistributorGrade]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_AgentGrade]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_AgentGrade]
GO
/****** Object:  Table [dbo].[aspnet_Distributors]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Distributors]
GO
/****** Object:  Table [dbo].[aspnet_Managers]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Managers]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Managers]
GO
/****** Object:  Table [dbo].[aspnet_MemberGrades]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_MemberGrades]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_MemberGrades]
GO
/****** Object:  Table [dbo].[aspnet_Members]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Members]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Members]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Roles]
GO
/****** Object:  Table [dbo].[Hishop_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Orders]
GO
/****** Object:  Table [dbo].[Hishop_ProductConsultations]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductConsultations]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ProductConsultations]
GO
/****** Object:  Table [dbo].[Hishop_ProductReviews]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductReviews]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ProductReviews]
GO
/****** Object:  Table [dbo].[Hishop_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Products]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Products]
GO
/****** Object:  Table [dbo].[Hishop_ShippingTemplates]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTemplates]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ShippingTemplates]
GO
/****** Object:  Table [dbo].[Hishop_ProductTypes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypes]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_ProductTypes]
GO
/****** Object:  Table [dbo].[Hishop_Shippers]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Shippers]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Shippers]
GO
/****** Object:  Table [dbo].[Hishop_PaymentTypes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PaymentTypes]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_PaymentTypes]
GO
/****** Object:  Table [dbo].[Hishop_PhotoCategories]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PhotoCategories]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_PhotoCategories]
GO
/****** Object:  Table [dbo].[Hishop_PhotoGallery]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PhotoGallery]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_PhotoGallery]
GO
/****** Object:  Table [dbo].[Hishop_Tags]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Tags]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Tags]
GO
/****** Object:  Table [dbo].[Hishop_TemplateRelatedShipping]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_TemplateRelatedShipping]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_TemplateRelatedShipping]
GO
/****** Object:  Table [dbo].[Hishop_VoteRecord]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_VoteRecord]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_VoteRecord]
GO
/****** Object:  Table [dbo].[Hishop_Votes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Votes]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_Votes]
GO
/****** Object:  Table [dbo].[Hishop_PrivilegeInRoles]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PrivilegeInRoles]') AND type in (N'U'))
DROP TABLE [dbo].[Hishop_PrivilegeInRoles]
GO
/****** Object:  Table [dbo].[vshop_Activity]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_Activity]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_Activity]
GO
/****** Object:  Table [dbo].[vshop_ActivitySignUp]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_ActivitySignUp]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_ActivitySignUp]
GO
/****** Object:  Table [dbo].[vshop_AlarmNotify]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_AlarmNotify]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_AlarmNotify]
GO
/****** Object:  Table [dbo].[vshop_FeedBackNotify]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_FeedBackNotify]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_FeedBackNotify]
GO
/****** Object:  Table [dbo].[Vshop_HomeProducts]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_HomeProducts]') AND type in (N'U'))
DROP TABLE [dbo].[Vshop_HomeProducts]
GO
/****** Object:  Table [dbo].[Vshop_HomeTopics]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_HomeTopics]') AND type in (N'U'))
DROP TABLE [dbo].[Vshop_HomeTopics]
GO
/****** Object:  Table [dbo].[Vshop_LotteryActivity]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_LotteryActivity]') AND type in (N'U'))
DROP TABLE [dbo].[Vshop_LotteryActivity]
GO
/****** Object:  Table [dbo].[vshop_Menu]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_Menu]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_Menu]
GO
/****** Object:  Table [dbo].[vshop_Message]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_Message]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_Message]
GO
/****** Object:  Table [dbo].[vshop_OrderRedPager]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_OrderRedPager]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_OrderRedPager]
GO
/****** Object:  Table [dbo].[Vshop_PrizeRecord]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_PrizeRecord]') AND type in (N'U'))
DROP TABLE [dbo].[Vshop_PrizeRecord]
GO
/****** Object:  Table [dbo].[vshop_RedPagerActivity]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_RedPagerActivity]
GO
/****** Object:  Table [dbo].[Vshop_RelatedTopicProducts]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_RelatedTopicProducts]') AND type in (N'U'))
DROP TABLE [dbo].[Vshop_RelatedTopicProducts]
GO
/****** Object:  Table [dbo].[vshop_Reply]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_Reply]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_Reply]
GO
/****** Object:  Table [dbo].[vshop_SendRedpackRecord]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_SendRedpackRecord]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_SendRedpackRecord]
GO
/****** Object:  Table [dbo].[Vshop_Topics]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_Topics]') AND type in (N'U'))
DROP TABLE [dbo].[Vshop_Topics]
GO
/****** Object:  Table [dbo].[vshop_UserRedPager]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_UserRedPager]') AND type in (N'U'))
DROP TABLE [dbo].[vshop_UserRedPager]
GO
/****** Object:  Default [DF_aspnet_DistributorGrade_FirstCommissionRise]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_DistributorGrade_FirstCommissionRise]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_DistributorGrade_FirstCommissionRise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_DistributorGrade] DROP CONSTRAINT [DF_aspnet_DistributorGrade_FirstCommissionRise]
END
End
GO
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_AgentGrade_FirstCommissionRise]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_AgentGrade]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_AgentGrade_FirstCommissionRise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_AgentGrade] DROP CONSTRAINT [DF_aspnet_AgentGrade_FirstCommissionRise]
END
End
GO
/****** Object:  Default [DF_aspnet_DistributorGrade_SecondCommissionRise]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_DistributorGrade_SecondCommissionRise]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_DistributorGrade_SecondCommissionRise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_DistributorGrade] DROP CONSTRAINT [DF_aspnet_DistributorGrade_SecondCommissionRise]
END


End
GO
/****** Object:  Default [DF_aspnet_DistributorGrade_ThirdCommissionRise]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_DistributorGrade_ThirdCommissionRise]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_DistributorGrade_ThirdCommissionRise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_DistributorGrade] DROP CONSTRAINT [DF_aspnet_DistributorGrade_ThirdCommissionRise]
END


End
GO
/****** Object:  Default [DF_aspnet_DistributorGrade_Ico]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_DistributorGrade_Ico]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_DistributorGrade_Ico]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_DistributorGrade] DROP CONSTRAINT [DF_aspnet_DistributorGrade_Ico]
END
End
GO
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_AgentGrade_Ico]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_AgentGrade]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_AgentGrade_Ico]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_AgentGrade] DROP CONSTRAINT [DF_aspnet_AgentGrade_Ico]
END
End
GO
/****** Object:  Default [DF_aspnet_Distributors_OrdersTotal]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_OrdersTotal]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_OrdersTotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] DROP CONSTRAINT [DF_aspnet_Distributors_OrdersTotal]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_ReferralOrders]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_ReferralOrders]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_ReferralOrders]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] DROP CONSTRAINT [DF_aspnet_Distributors_ReferralOrders]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_ReferralBlance]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_ReferralBlance]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_ReferralBlance]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] DROP CONSTRAINT [DF_aspnet_Distributors_ReferralBlance]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_ReferralRequestBalance]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_ReferralRequestBalance]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_ReferralRequestBalance]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] DROP CONSTRAINT [DF_aspnet_Distributors_ReferralRequestBalance]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_CreateTime]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_CreateTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_CreateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] DROP CONSTRAINT [DF_aspnet_Distributors_CreateTime]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_ReferralStatus]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_ReferralStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_ReferralStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] DROP CONSTRAINT [DF_aspnet_Distributors_ReferralStatus]
END
End
GO
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_IsAgent]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_IsAgent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] DROP CONSTRAINT [DF_aspnet_Distributors_IsAgent]
END
End
GO
/****** Object:  Default [DF_aspnet_Members_OrderNumber]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Members_OrderNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Members]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Members_OrderNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Members] DROP CONSTRAINT [DF_aspnet_Members_OrderNumber]
END


End
GO
/****** Object:  Default [DF_aspnet_Members_Expenditure]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Members_Expenditure]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Members]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Members_Expenditure]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Members] DROP CONSTRAINT [DF_aspnet_Members_Expenditure]
END


End
GO
/****** Object:  Default [DF_aspnet_Members_Points]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Members_Points]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Members]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Members_Points]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Members] DROP CONSTRAINT [DF_aspnet_Members_Points]
END


End
GO
/****** Object:  Default [DF_Hishop_Activities_TakeEffect]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Activities_TakeEffect]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Activities]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Activities_TakeEffect]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Activities] DROP CONSTRAINT [DF_Hishop_Activities_TakeEffect]
END


End
GO
/****** Object:  Default [DF_Hishop_Advertising_AddedDate]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Advertising_AddedDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Advertising]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Advertising_AddedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Advertising] DROP CONSTRAINT [DF_Hishop_Advertising_AddedDate]
END


End
GO
/****** Object:  Default [DF_Hishop_BalanceDrawRequest_RequestType]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_BalanceDrawRequest_RequestType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_BalanceDrawRequest_RequestType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest] DROP CONSTRAINT [DF_Hishop_BalanceDrawRequest_RequestType]
END


End
GO
/****** Object:  Default [DF_RequestTime]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_RequestTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RequestTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest] DROP CONSTRAINT [DF_RequestTime]
END


End
GO
/****** Object:  Default [DF_Hishop_BalanceDrawRequest_RedpackRecordNum]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_BalanceDrawRequest_RedpackRecordNum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_BalanceDrawRequest_RedpackRecordNum]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest] DROP CONSTRAINT [DF_Hishop_BalanceDrawRequest_RedpackRecordNum]
END


End
GO
/****** Object:  Default [DF_Hishop_BalanceDrawRequest_IsCheck]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_BalanceDrawRequest_IsCheck]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_BalanceDrawRequest_IsCheck]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest] DROP CONSTRAINT [DF_Hishop_BalanceDrawRequest_IsCheck]
END


End
GO
/****** Object:  Default [DF_Hishop_Categories_HasChildren]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Categories_HasChildren]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Categories]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Categories_HasChildren]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Categories] DROP CONSTRAINT [DF_Hishop_Categories_HasChildren]
END


End
GO
/****** Object:  Default [DF_Hishop_Commissions_TradeTime]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Commissions_TradeTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Commissions]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Commissions_TradeTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Commissions] DROP CONSTRAINT [DF_Hishop_Commissions_TradeTime]
END


End
GO
/****** Object:  Default [DF_Hishop_CouponItems_CouponStatus]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_CouponItems_CouponStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_CouponItems]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_CouponItems_CouponStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_CouponItems] DROP CONSTRAINT [DF_Hishop_CouponItems_CouponStatus]
END


End
GO
/****** Object:  Default [DF_Hishop_Coupons_SentCount]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Coupons_SentCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Coupons]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Coupons_SentCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Coupons] DROP CONSTRAINT [DF_Hishop_Coupons_SentCount]
END


End
GO
/****** Object:  Default [DF_Hishop_Coupons_UsedCount]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Coupons_UsedCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Coupons]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Coupons_UsedCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Coupons] DROP CONSTRAINT [DF_Hishop_Coupons_UsedCount]
END


End
GO
/****** Object:  Default [DF_Hishop_Coupons_NeedPoint]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Coupons_NeedPoint]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Coupons]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Coupons_NeedPoint]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Coupons] DROP CONSTRAINT [DF_Hishop_Coupons_NeedPoint]
END


End
GO
/****** Object:  Default [DF_Hishop_FriendExtension_CreateTime]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_FriendExtension_CreateTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_FriendExtension]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_FriendExtension_CreateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_FriendExtension] DROP CONSTRAINT [DF_Hishop_FriendExtension_CreateTime]
END


End
GO
/****** Object:  Default [DF_Hishop_GroupBuy_DisplaySequence]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_GroupBuy_DisplaySequence]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_GroupBuy]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_GroupBuy_DisplaySequence]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_GroupBuy] DROP CONSTRAINT [DF_Hishop_GroupBuy_DisplaySequence]
END


End
GO
/****** Object:  Default [DF__Hishop_Gr__SoldC__0BE6BFCF]    Script Date: 07/07/2015 09:27:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Hishop_Gr__SoldC__0BE6BFCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_GroupBuy]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Hishop_Gr__SoldC__0BE6BFCF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_GroupBuy] DROP CONSTRAINT [DF__Hishop_Gr__SoldC__0BE6BFCF]
END


End
GO
/****** Object:  Default [DF_Hishop_MessageTemplates_SendEmail]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_MessageTemplates_SendEmail]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_MessageTemplates_SendEmail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_MessageTemplates] DROP CONSTRAINT [DF_Hishop_MessageTemplates_SendEmail]
END


End
GO
/****** Object:  Default [DF_Hishop_MessageTemplates_SendSMS]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_MessageTemplates_SendSMS]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_MessageTemplates_SendSMS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_MessageTemplates] DROP CONSTRAINT [DF_Hishop_MessageTemplates_SendSMS]
END


End
GO
/****** Object:  Default [DF_Hishop_MessageTemplates_SendInnerMessage]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_MessageTemplates_SendInnerMessage]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_MessageTemplates_SendInnerMessage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_MessageTemplates] DROP CONSTRAINT [DF_Hishop_MessageTemplates_SendInnerMessage]
END


End
GO
/****** Object:  Default [DF_Hishop_MessageTemplates_SendWeixinMessage]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_MessageTemplates_SendWeixinMessage]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_MessageTemplates_SendWeixinMessage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_MessageTemplates] DROP CONSTRAINT [DF_Hishop_MessageTemplates_SendWeixinMessage]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_ItemAdjustedCommssion]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_ItemAdjustedCommssion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_ItemAdjustedCommssion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_OrderItems] DROP CONSTRAINT [DF_Hishop_Orders_ItemAdjustedCommssion]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_ItemsCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_ItemsCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_ItemsCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_OrderItems] DROP CONSTRAINT [DF_Hishop_Orders_ItemsCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_SecondItemsCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_SecondItemsCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_SecondItemsCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_OrderItems] DROP CONSTRAINT [DF_Hishop_Orders_SecondItemsCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_ThirdItemsCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_ThirdItemsCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_ThirdItemsCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_OrderItems] DROP CONSTRAINT [DF_Hishop_Orders_ThirdItemsCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_DiscountAmount]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_DiscountAmount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_DiscountAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] DROP CONSTRAINT [DF_Hishop_Orders_DiscountAmount]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_FirstCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_FirstCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_FirstCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] DROP CONSTRAINT [DF_Hishop_Orders_FirstCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_SecondCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_SecondCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_SecondCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] DROP CONSTRAINT [DF_Hishop_Orders_SecondCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_ThirdCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_ThirdCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_ThirdCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] DROP CONSTRAINT [DF_Hishop_Orders_ThirdCommission]
END


End
GO
/****** Object:  Default [DF_RedPagerOrderAmountCanUse]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_RedPagerOrderAmountCanUse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RedPagerOrderAmountCanUse]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] DROP CONSTRAINT [DF_RedPagerOrderAmountCanUse]
END


End
GO
/****** Object:  Default [DF_RedPagerAmount]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_RedPagerAmount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RedPagerAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] DROP CONSTRAINT [DF_RedPagerAmount]
END


End
GO
/****** Object:  Default [DF_Hishop_PaymentTypes_IsUseInpour]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_PaymentTypes_IsUseInpour]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_PaymentTypes]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_PaymentTypes_IsUseInpour]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_PaymentTypes] DROP CONSTRAINT [DF_Hishop_PaymentTypes_IsUseInpour]
END


End
GO
/****** Object:  Default [DF_Hishop_PaymentTypes_IsUseInDistributor]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_PaymentTypes_IsUseInDistributor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_PaymentTypes]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_PaymentTypes_IsUseInDistributor]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_PaymentTypes] DROP CONSTRAINT [DF_Hishop_PaymentTypes_IsUseInDistributor]
END


End
GO
/****** Object:  Default [DF_Hishop_Products_VistiCounts]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Products_VistiCounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Products]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Products_VistiCounts]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Products] DROP CONSTRAINT [DF_Hishop_Products_VistiCounts]
END


End
GO
/****** Object:  Default [DF_Hishop_Products_SaleCounts]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Products_SaleCounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Products]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Products_SaleCounts]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Products] DROP CONSTRAINT [DF_Hishop_Products_SaleCounts]
END


End
GO
/****** Object:  Default [DF_Hishop_Products_ShowSaleCounts]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Products_ShowSaleCounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Products]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Products_ShowSaleCounts]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Products] DROP CONSTRAINT [DF_Hishop_Products_ShowSaleCounts]
END


End
GO
/****** Object:  Default [DF_Hishop_Products_DisplaySequence]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Products_DisplaySequence]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Products]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Products_DisplaySequence]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Products] DROP CONSTRAINT [DF_Hishop_Products_DisplaySequence]
END


End
GO
/****** Object:  Default [DF_Hishop_Shippers_DistributorUserId]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Shippers_DistributorUserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Shippers]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Shippers_DistributorUserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Shippers] DROP CONSTRAINT [DF_Hishop_Shippers_DistributorUserId]
END


End
GO
/****** Object:  Default [DF_Hishop_ShoppingCarts_AddTime]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_ShoppingCarts_AddTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShoppingCarts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_ShoppingCarts_AddTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_ShoppingCarts] DROP CONSTRAINT [DF_Hishop_ShoppingCarts_AddTime]
END


End
GO
/****** Object:  Default [DF_Hishop_ShoppingCarts_CategoryId]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_ShoppingCarts_CategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShoppingCarts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_ShoppingCarts_CategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_ShoppingCarts] DROP CONSTRAINT [DF_Hishop_ShoppingCarts_CategoryId]
END


End
GO
/****** Object:  Default [DF__Hishop_Us__IsDef__0CDAE408]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Hishop_Us__IsDef__0CDAE408]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_UserShippingAddresses]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Hishop_Us__IsDef__0CDAE408]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_UserShippingAddresses] DROP CONSTRAINT [DF__Hishop_Us__IsDef__0CDAE408]
END


End
GO
/****** Object:  Default [DF_vshop_Red_CategoryId]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_Red_CategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_Red_CategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] DROP CONSTRAINT [DF_vshop_Red_CategoryId]
END


End
GO
/****** Object:  Default [DF_vshop_MinOrderAmount]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_MinOrderAmount]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_MinOrderAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] DROP CONSTRAINT [DF_vshop_MinOrderAmount]
END


End
GO
/****** Object:  Default [DF_vshop_MaxGetTimes]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_MaxGetTimes]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_MaxGetTimes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] DROP CONSTRAINT [DF_vshop_MaxGetTimes]
END


End
GO
/****** Object:  Default [DF_vshop_ItemAmountLimit]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_ItemAmountLimit]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_ItemAmountLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] DROP CONSTRAINT [DF_vshop_ItemAmountLimit]
END


End
GO
/****** Object:  Default [DF_vshop_ExpiryDays]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_ExpiryDays]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_ExpiryDays]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] DROP CONSTRAINT [DF_vshop_ExpiryDays]
END


End
GO
/****** Object:  Default [DF_vshop_OrderAmountCanUse]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_OrderAmountCanUse]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_OrderAmountCanUse]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] DROP CONSTRAINT [DF_vshop_OrderAmountCanUse]
END


End
GO
/****** Object:  Default [DF_vshop_IsOpen]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_IsOpen]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_IsOpen]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] DROP CONSTRAINT [DF_vshop_IsOpen]
END


End
GO
/****** Object:  Default [DF__vshop_Sen__IsSen__30242045]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__vshop_Sen__IsSen__30242045]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_SendRedpackRecord]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__vshop_Sen__IsSen__30242045]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_SendRedpackRecord] DROP CONSTRAINT [DF__vshop_Sen__IsSen__30242045]
END


End
GO
/****** Object:  Default [DF__vshop_Use__IsUse__2C538F61]    Script Date: 07/07/2015 09:27:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__vshop_Use__IsUse__2C538F61]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_UserRedPager]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__vshop_Use__IsUse__2C538F61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_UserRedPager] DROP CONSTRAINT [DF__vshop_Use__IsUse__2C538F61]
END


End
GO
/****** Object:  Role [hishopdev_user]    Script Date: 07/07/2015 09:27:25 ******/
DECLARE @RoleName sysname
set @RoleName = N'hishopdev_user'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'hishopdev_user' AND type = 'R')
DROP ROLE [hishopdev_user]
GO
/****** Object:  Role [hishopdev_user]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'hishopdev_user')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'hishopdev_user' AND type = 'R')
CREATE ROLE [hishopdev_user] AUTHORIZATION [dbo]

END
GO
/****** Object:  Table [dbo].[vshop_UserRedPager]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_UserRedPager]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_UserRedPager](
	[RedPagerID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [money] NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderID] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[RedPagerActivityName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[OrderAmountCanUse] [money] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ExpiryTime] [datetime] NOT NULL,
	[IsUsed] [bit] NOT NULL,
	[UseOrderID] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UsedTime] [datetime] NULL,
 CONSTRAINT [PK_vshop_UserRedPager] PRIMARY KEY CLUSTERED 
(
	[RedPagerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Vshop_Topics]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_Topics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vshop_Topics](
	[TopicId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[IconUrl] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [nvarchar](max) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[IsRelease] [bit] NOT NULL,
	[DisplaySequence] [int] NULL,
 CONSTRAINT [PK__Vshop_To__022E0F5D09FE775D] PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[vshop_SendRedpackRecord]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_SendRedpackRecord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_SendRedpackRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BalanceDrawRequestID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[OpenId] [nvarchar](128) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Amount] [int] NOT NULL,
	[ActName] [nvarchar](32) COLLATE Chinese_PRC_CI_AS NULL,
	[Wishing] [nvarchar](128) COLLATE Chinese_PRC_CI_AS NULL,
	[ClientIP] [varchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[IsSend] [bit] NOT NULL,
	[SendTime] [datetime] NULL
)
END
GO
/****** Object:  Table [dbo].[vshop_Reply]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_Reply]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_Reply](
	[ReplyId] [int] IDENTITY(1,1) NOT NULL,
	[Keys] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[MatchType] [int] NULL,
	[ReplyType] [int] NULL,
	[MessageType] [int] NULL,
	[IsDisable] [bit] NULL,
	[LastEditDate] [datetime] NOT NULL,
	[LastEditor] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Type] [int] NULL,
	[ActivityId] [int] NULL,
 CONSTRAINT [PK_vshop_Reply] PRIMARY KEY CLUSTERED 
(
	[ReplyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Vshop_RelatedTopicProducts]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_RelatedTopicProducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vshop_RelatedTopicProducts](
	[TopicId] [int] NOT NULL,
	[RelatedProductId] [int] NOT NULL,
	[DisplaySequence] [int] NULL
)
END
GO
/****** Object:  Table [dbo].[vshop_RedPagerActivity]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_RedPagerActivity](
	[RedPagerActivityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[CategoryId] [int] NOT NULL,
	[MinOrderAmount] [money] NOT NULL,
	[MaxGetTimes] [int] NOT NULL,
	[ItemAmountLimit] [money] NOT NULL,
	[ExpiryDays] [int] NOT NULL,
	[OrderAmountCanUse] [money] NOT NULL,
	[IsOpen] [bit] NOT NULL,
 CONSTRAINT [PK_vshop_RedPaperActivity] PRIMARY KEY CLUSTERED 
(
	[RedPagerActivityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Vshop_PrizeRecord]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_PrizeRecord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vshop_PrizeRecord](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NULL,
	[PrizeTime] [datetime] NULL,
	[UserID] [int] NULL,
	[RealName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[CellPhone] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[PrizeName] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Prizelevel] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[IsPrize] [bit] NULL,
 CONSTRAINT [PK__Vshop_Pr__FBDF78E907220AB2] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[vshop_OrderRedPager]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_OrderRedPager]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_OrderRedPager](
	[OrderID] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[RedPagerActivityId] [int] NOT NULL,
	[RedPagerActivityName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[MaxGetTimes] [int] NOT NULL,
	[AlreadyGetTimes] [int] NOT NULL,
	[ItemAmountLimit] [money] NOT NULL,
	[OrderAmountCanUse] [money] NOT NULL,
	[ExpiryDays] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_vshop_OrderRedPager] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[vshop_Message]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_Message]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_Message](
	[ReplyId] [int] NULL,
	[MsgID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[ImageUrl] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[Url] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[Description] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_Message] PRIMARY KEY NONCLUSTERED 
(
	[MsgID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[vshop_Menu]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_Menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[ParentMenuId] [int] NULL,
	[Name] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Type] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ReplyId] [int] NULL,
	[DisplaySequence] [int] NULL,
	[Bind] [int] NULL,
	[Content] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_vshop_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Vshop_LotteryActivity]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_LotteryActivity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vshop_LotteryActivity](
	[ActivityId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [nvarchar](150) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ActivityType] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[ActivityDesc] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
	[ActivityKey] [nvarchar](150) COLLATE Chinese_PRC_CI_AS NULL,
	[ActivityPic] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
	[PrizeSetting] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
	[MaxNum] [int] NULL,
	[GradeIds] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[MinValue] [int] NULL,
	[InvitationCode] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[OpenTime] [datetime] NULL,
	[IsOpened] [bit] NULL,
 CONSTRAINT [PK__Vshop_Lo__45F4A79104459E07] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Vshop_HomeTopics]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_HomeTopics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vshop_HomeTopics](
	[TopicId] [int] NOT NULL,
	[DisplaySequence] [int] NULL
)
END
GO
/****** Object:  Table [dbo].[Vshop_HomeProducts]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vshop_HomeProducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vshop_HomeProducts](
	[ProductId] [int] NOT NULL,
	[DisplaySequence] [int] NULL
)
END
GO
/****** Object:  Table [dbo].[vshop_FeedBackNotify]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_FeedBackNotify]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_FeedBackNotify](
	[FeedBackNotifyID] [int] IDENTITY(1,1) NOT NULL,
	[AppId] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[TimeStamp] [datetime] NULL,
	[OpenId] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[MsgType] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[FeedBackId] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[TransId] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[Reason] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
	[Solution] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
	[ExtInfo] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_FeedBackNotify] PRIMARY KEY NONCLUSTERED 
(
	[FeedBackNotifyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[vshop_AlarmNotify]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_AlarmNotify]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_AlarmNotify](
	[AlarmNotifyId] [int] IDENTITY(1,1) NOT NULL,
	[AppId] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[ErrorType] [int] NULL,
	[Description] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[AlarmContent] [nvarchar](2000) COLLATE Chinese_PRC_CI_AS NULL,
	[TimeStamp] [datetime] NULL,
 CONSTRAINT [PK_Hishop_AlarmNotify] PRIMARY KEY NONCLUSTERED 
(
	[AlarmNotifyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[vshop_ActivitySignUp]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_ActivitySignUp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_ActivitySignUp](
	[ActivitySignUpId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NULL,
	[UserId] [int] NULL,
	[UserName] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NULL,
	[RealName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[SignUpDate] [datetime] NULL,
	[Item1] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Item2] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Item3] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Item4] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Item5] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_vshop_ActivitySignUp] PRIMARY KEY CLUSTERED 
(
	[ActivitySignUpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[vshop_Activity]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vshop_Activity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vshop_Activity](
	[ActivityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CloseRemark] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
	[Keys] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[MaxValue] [nchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[PicUrl] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
	[Item1] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Item2] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Item3] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Item4] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Item5] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_vshop_Activity] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_PrivilegeInRoles]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PrivilegeInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_PrivilegeInRoles](
	[RoleId] [int] NOT NULL,
	[Privilege] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_PrivilegeInRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[Privilege] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Votes]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Votes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Votes](
	[VoteId] [bigint] IDENTITY(1,1) NOT NULL,
	[VoteName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[IsBackup] [bit] NOT NULL,
	[MaxCheck] [int] NOT NULL,
	[ImageUrl] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Hishop_Votes] PRIMARY KEY NONCLUSTERED 
(
	[VoteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_VoteRecord]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_VoteRecord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_VoteRecord](
	[UserId] [int] NOT NULL,
	[VoteId] [bigint] NOT NULL,
 CONSTRAINT [PK_Hishop_VoteRecord] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC,
	[VoteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_TemplateRelatedShipping]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_TemplateRelatedShipping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_TemplateRelatedShipping](
	[ModeId] [int] NOT NULL,
	[ExpressCompanyName] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[Hishop_Tags]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Tags]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Tags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_Tags] PRIMARY KEY NONCLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_PhotoGallery]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PhotoGallery]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_PhotoGallery](
	[PhotoId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PhotoName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[PhotoPath] [varchar](300) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[FileSize] [int] NOT NULL,
	[UploadTime] [datetime] NOT NULL,
	[LastUpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_distro_PhotoGallery] PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_PhotoCategories]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PhotoCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_PhotoCategories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[DisplaySequence] [int] NOT NULL,
 CONSTRAINT [PK_distro_PhotoCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_PaymentTypes]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PaymentTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_PaymentTypes](
	[ModeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Description] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Gateway] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[DisplaySequence] [int] NOT NULL,
	[IsUseInpour] [bit] NOT NULL,
	[IsUseInDistributor] [bit] NOT NULL,
	[Charge] [money] NOT NULL,
	[IsPercent] [bit] NOT NULL,
	[Settings] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[ModeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Shippers]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Shippers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Shippers](
	[ShipperId] [int] IDENTITY(1,1) NOT NULL,
	[DistributorUserId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[ShipperTag] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ShipperName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[RegionId] [int] NOT NULL,
	[Address] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[CellPhone] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[TelPhone] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[Zipcode] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Remark] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ProductTypes]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ProductTypes](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Remark] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ShippingTemplates]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTemplates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ShippingTemplates](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Weight] [money] NOT NULL,
	[AddWeight] [money] NULL,
	[Price] [money] NOT NULL,
	[AddPrice] [money] NULL,
 CONSTRAINT [PK_Hishop_ShippingTemplates] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Products]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Products](
	[CategoryId] [int] NOT NULL,
	[TypeId] [int] NULL,
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ProductCode] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ShortDescription] [nvarchar](2000) COLLATE Chinese_PRC_CI_AS NULL,
	[Unit] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Description] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[SaleStatus] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[VistiCounts] [int] NOT NULL,
	[SaleCounts] [int] NOT NULL,
	[ShowSaleCounts] [int] NOT NULL,
	[DisplaySequence] [int] NOT NULL,
	[ImageUrl1] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ImageUrl2] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ImageUrl3] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ImageUrl4] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ImageUrl5] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ThumbnailUrl40] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ThumbnailUrl60] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ThumbnailUrl100] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ThumbnailUrl160] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ThumbnailUrl180] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ThumbnailUrl220] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ThumbnailUrl310] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ThumbnailUrl410] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[MarketPrice] [money] NULL,
	[BrandId] [int] NULL,
	[MainCategoryPath] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NULL,
	[ExtendCategoryPath] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NULL,
	[HasSKU] [bit] NOT NULL,
	[IsfreeShipping] [bit] NULL,
	[TaobaoProductId] [bigint] NULL,
 CONSTRAINT [PK_Hishop_Products] PRIMARY KEY NONCLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Products]') AND name = N'Hishop_Products_Index')
CREATE CLUSTERED INDEX [Hishop_Products_Index] ON [dbo].[Hishop_Products] 
(
	[DisplaySequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Products]') AND name = N'Hishop_Products_Index2')
CREATE NONCLUSTERED INDEX [Hishop_Products_Index2] ON [dbo].[Hishop_Products] 
(
	[MainCategoryPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Products]') AND name = N'Hishop_Products_Index3')
CREATE NONCLUSTERED INDEX [Hishop_Products_Index3] ON [dbo].[Hishop_Products] 
(
	[ExtendCategoryPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[Hishop_ProductReviews]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductReviews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ProductReviews](
	[ReviewId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[UserEmail] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[ReviewText] [nvarchar](3000) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ReviewDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Hishop_ProductReviews] PRIMARY KEY NONCLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ProductConsultations]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductConsultations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ProductConsultations](
	[ConsultationId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[UserEmail] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[ConsultationText] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ConsultationDate] [datetime] NOT NULL,
	[ReplyText] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[ReplyDate] [datetime] NULL,
	[ReplyUserId] [int] NULL,
	[ViewDate] [datetime] NULL,
 CONSTRAINT [PK_Hishop_ProductConsultations] PRIMARY KEY NONCLUSTERED 
(
	[ConsultationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Orders]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Orders](
	[OrderId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Remark] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL,
	[ManagerMark] [int] NULL,
	[ManagerRemark] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL,
	[AdjustedDiscount] [money] NULL,
	[OrderStatus] [int] NOT NULL,
	[CloseReason] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL,
	[OrderDate] [datetime] NOT NULL,
	[PayDate] [datetime] NULL,
	[ShippingDate] [datetime] NULL,
	[FinishDate] [datetime] NULL,
	[UserId] [int] NOT NULL,
	[Username] [nvarchar](64) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[EmailAddress] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[RealName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[QQ] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[Wangwang] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[MSN] [nvarchar](128) COLLATE Chinese_PRC_CI_AS NULL,
	[ShippingRegion] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
	[Address] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
	[ZipCode] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[ShipTo] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[TelPhone] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[CellPhone] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ShipToDate] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ShippingModeId] [int] NULL,
	[ModeName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[RealShippingModeId] [int] NULL,
	[RealModeName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[RegionId] [int] NULL,
	[Freight] [money] NULL,
	[AdjustedFreight] [money] NULL,
	[ShipOrderNumber] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Weight] [money] NULL,
	[ExpressCompanyName] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[ExpressCompanyAbb] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[PaymentTypeId] [int] NULL,
	[PaymentType] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[PayCharge] [money] NULL,
	[RefundStatus] [int] NULL,
	[RefundAmount] [money] NULL,
	[RefundRemark] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL,
	[Gateway] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[OrderTotal] [money] NULL,
	[OrderPoint] [int] NULL,
	[OrderCostPrice] [money] NULL,
	[OrderProfit] [money] NULL,
	[ActualFreight] [money] NULL,
	[OtherCost] [money] NULL,
	[OptionPrice] [money] NULL,
	[Amount] [money] NULL,
	[DiscountAmount] [money] NULL,
	[ActivitiesId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ActivitiesName] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[ReducedPromotionId] [int] NULL,
	[ReducedPromotionName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[ReducedPromotionAmount] [money] NULL,
	[IsReduced] [bit] NULL,
	[SentTimesPointPromotionId] [int] NULL,
	[SentTimesPointPromotionName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[TimesPoint] [money] NULL,
	[IsSendTimesPoint] [bit] NULL,
	[FreightFreePromotionId] [int] NULL,
	[FreightFreePromotionName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[IsFreightFree] [bit] NULL,
	[CouponName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[CouponCode] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[CouponAmount] [money] NULL,
	[CouponValue] [money] NULL,
	[GroupBuyId] [int] NULL,
	[NeedPrice] [money] NULL,
	[GroupBuyStatus] [int] NULL,
	[CountDownBuyId] [int] NULL,
	[BundlingId] [int] NULL,
	[BundlingNum] [int] NULL,
	[BundlingPrice] [money] NULL,
	[GatewayOrderId] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[IsPrinted] [bit] NULL,
	[Tax] [money] NULL,
	[InvoiceTitle] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Sender] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ReferralUserId] [int] NULL,
	[FirstCommission] [money] NULL,
	[SecondCommission] [money] NULL,
	[ThirdCommission] [money] NULL,
	[RedPagerActivityName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[RedPagerID] [int] NULL,
	[RedPagerOrderAmountCanUse] [money] NULL,
	[RedPagerAmount] [money] NULL,
 CONSTRAINT [PK_Hishop_Orders] PRIMARY KEY NONCLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]') AND name = N'Hishop_Orders_Index')
CREATE CLUSTERED INDEX [Hishop_Orders_Index] ON [dbo].[Hishop_Orders] 
(
	[OrderDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]') AND name = N'Hishop_Orders_Index2')
CREATE NONCLUSTERED INDEX [Hishop_Orders_Index2] ON [dbo].[Hishop_Orders] 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]') AND name = N'Hishop_Orders_Index3')
CREATE NONCLUSTERED INDEX [Hishop_Orders_Index3] ON [dbo].[Hishop_Orders] 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]') AND name = N'Hishop_Orders_Index4')
CREATE NONCLUSTERED INDEX [Hishop_Orders_Index4] ON [dbo].[Hishop_Orders] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Description] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_aspnet_Roles] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[aspnet_Members]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Members]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Members](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[GradeId] [int] NOT NULL,
	[ReferralUserId] [int] NULL,
	[UserName] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[Expenditure] [money] NOT NULL,
	[Points] [int] NOT NULL,
	[TopRegionId] [int] NULL,
	[RegionId] [int] NULL,
	[RealName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Email] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NULL,
	[CellPhone] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[QQ] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[Address] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NULL,
	[VipCardNumber] [nvarchar](150) COLLATE Chinese_PRC_CI_AS NULL,
	[VipCardDate] [datetime] NULL,
	[OpenId] [nvarchar](128) COLLATE Chinese_PRC_CI_AS NULL,
	[SessionId] [nvarchar](128) COLLATE Chinese_PRC_CI_AS NULL,
	[SessionEndTime] [datetime] NULL,
	[Password] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NULL,
	[MicroSignal] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserHead] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_aspnet_Members] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[aspnet_MemberGrades]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_MemberGrades]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_MemberGrades](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Description] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[Points] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_aspnet_MemberGrades] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [UQ_aspnet_MemberGrades_Points] UNIQUE NONCLUSTERED 
(
	[Points] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[aspnet_Managers]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Managers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Managers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserName] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Password] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Email] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_aspnet_Managers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[aspnet_Distributors]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Distributors](
	[UserId] [int] NOT NULL,
	[StoreName] [varchar](255) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Logo] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[BackImage] [varchar](500) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[RequestAccount] [varchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[AccountTime] [datetime] NULL,
	[GradeId] [int] NOT NULL,
	[ReferralUserId] [int] NOT NULL,
	[ReferralPath] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[OrdersTotal] [money] NOT NULL,
	[ReferralOrders] [int] NOT NULL,
	[ReferralBlance] [money] NOT NULL,
	[ReferralRequestBalance] [money] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[ReferralStatus] [int] NOT NULL,
	[StoreDescription] [ntext] COLLATE Chinese_PRC_CI_AS NOT NULL,
	[DistributorGradeId] [int] NULL,
	[IsAgent] [int] NOT NULL,
	[AgentGradeId] [int]  NULL,
	[AgentPath] [varchar](500)  NULL,
 CONSTRAINT [PK_aspnet_Distributors] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[aspnet_DistributorGrade]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_DistributorGrade](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[CommissionsLimit] [money] NOT NULL,
	[FirstCommissionRise] [decimal](18, 2) NOT NULL,
	[SecondCommissionRise] [decimal](18, 2) NOT NULL,
	[ThirdCommissionRise] [decimal](18, 2) NOT NULL,
	[IsDefault] [bit] NULL,
	[Ico] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_aspnet_DistributorGrade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[aspnet_AgentGrade]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_AgentGrade]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_AgentGrade](
	AgentGradeId [int] IDENTITY(1,1) NOT NULL,
	AgentGradeName [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[FirstCommissionRise] [decimal](18, 2) NOT NULL,
	[Ico] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_aspnet_AgentGrade] PRIMARY KEY CLUSTERED 
(
	[AgentGradeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[cp_MemberStatistics_Get]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_MemberStatistics_Get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_MemberStatistics_Get]
(
	@PageIndex int,
	@PageSize int,
	@IsCount bit,
	@sqlPopulate ntext,
	@TotalProductSales int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForProductSales
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		UserName nvarchar(256) NOT NULL,
		UserId int,
		SaleTotals money default(0),
		OrderCount int default(0)
	)	

	INSERT INTO #PageIndexForProductSales(UserId, UserName, SaleTotals, OrderCount)
	Exec sp_executesql @sqlPopulate

	SET @TotalProductSales = @@rowcount
	
	SELECT S.IndexId,
		S.Username, ISNULL(S.SaleTotals, 0) as SaleTotals , ISNULL(S.OrderCount, 0) as OrderCount
	FROM   #PageIndexForProductSales S
	WHERE 
			S.IndexId > @PageLowerBound AND
			S.IndexId < @PageUpperBound 
	ORDER BY S.IndexId
	
	drop table #PageIndexForProductSales
END' 
END
GO
/****** Object:  Table [dbo].[Hishop_Advertising]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Advertising]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Advertising](
	[AdvertisingId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[IsShowFooter] [bit] NOT NULL,
 CONSTRAINT [PK_Hishop_Advertising] PRIMARY KEY NONCLUSTERED 
(
	[AdvertisingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Activities]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Activities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Activities](
	[ActivitiesId] [int] IDENTITY(1,1) NOT NULL,
	[ActivitiesName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ActivitiesType] [int] NOT NULL,
	[MeetMoney] [money] NOT NULL,
	[ReductionMoney] [money] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTIme] [datetime] NOT NULL,
	[ActivitiesDescription] [text] COLLATE Chinese_PRC_CI_AS NULL,
	[TakeEffect] [int] NOT NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[ActivitiesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_SplitToString]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_SplitToString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[F_SplitToString]
(
	@str nvarchar(4000), 
	@spliter nvarchar(2)
)
RETURNS @returntable TABLE (UnitString nvarchar(50))
AS
BEGIN
	WHILE(CHARINDEX(@spliter,@str)<>0)  
	BEGIN  
		INSERT INTO @returntable(UnitString) VALUES (SUBSTRING(@str,1,CHARINDEX(@spliter,@str)-1))  
		SET @str = STUFF(@str,1,CHARINDEX(@spliter,@str),'''')  
	END
	
	INSERT INTO @returntable(UnitString) VALUES (@str) 
      
	RETURN 
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_SplitToInt]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_SplitToInt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[F_SplitToInt]
(
	@str nvarchar(4000), 
	@spliter nvarchar(2)
)
RETURNS @returntable TABLE (UnitInt INT)
AS
BEGIN
	WHILE(CHARINDEX(@spliter,@str)<>0)  
	BEGIN  
		INSERT INTO @returntable(UnitInt) SELECT CAST (SUBSTRING(@str,1,CHARINDEX(@spliter,@str)-1) AS INT)
		SET @str = STUFF(@str,1,CHARINDEX(@spliter,@str),'''')  
	END
	
	INSERT INTO @returntable(UnitInt) SELECT CAST (@str AS INT) 
      
	RETURN 
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_RegionsUsers_Get]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_RegionsUsers_Get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[cp_RegionsUsers_Get]
(
	@PageIndex int,
	@PageSize int,
	@IsCount bit,
	@sqlPopulate ntext,
	@TotalRegionsUsers int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForRegionsUsers
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		RegionId int,
		RegionName char(100),
		UserCounts int,
		AllUserCounts int
	)	

	INSERT INTO #PageIndexForRegionsUsers(RegionId, RegionName, UserCounts, AllUserCounts)
	Exec sp_executesql @sqlPopulate

	SET @TotalRegionsUsers = @@rowcount
	
	SELECT RU.RegionId, RU.RegionName, RU.UserCounts, RU.AllUserCounts
	FROM   #PageIndexForRegionsUsers RU
	WHERE 
			RU.IndexId > @PageLowerBound AND
			RU.IndexId < @PageUpperBound
	ORDER BY RU.IndexId
	
	drop table #PageIndexForRegionsUsers
END' 
END
GO
/****** Object:  Table [dbo].[Hishop_Commissions]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Commissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Commissions](
	[CommId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ReferralUserId] [int] NOT NULL,
	[OrderId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[TradeTime] [datetime] NOT NULL,
	[OrderTotal] [money] NOT NULL,
	[CommTotal] [money] NOT NULL,
	[CommType] [int] NOT NULL,
	[State] [bit] NULL,
	[CommRemark] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_Commissions] PRIMARY KEY CLUSTERED 
(
	[CommId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Categories]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Categories](
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[DisplaySequence] [int] NOT NULL,
	[IconUrl] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[Meta_Title] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
	[Meta_Description] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
	[Meta_Keywords] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NULL,
	[ParentCategoryId] [int] NULL,
	[Depth] [int] NOT NULL,
	[Path] [varchar](4000) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[RewriteName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[SKUPrefix] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[AssociatedProductType] [int] NULL,
	[Notes1] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Notes2] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Notes3] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Notes4] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Notes5] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Theme] [varchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[HasChildren] [bit] NOT NULL,
	[FirstCommission] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[SecondCommission] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ThirdCommission] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_BrandCategories]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_BrandCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_BrandCategories](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Logo] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[CompanyUrl] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[RewriteName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[MetaKeywords] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[MetaDescription] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[Description] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[DisplaySequence] [int] NOT NULL,
	[Theme] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_BrandCategories] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Banner]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Banner]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Banner](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[ShortDesc] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
	[ImageUrl] [nvarchar](350) COLLATE Chinese_PRC_CI_AS NULL,
	[DisplaySequence] [int] NULL,
	[LocationType] [int] NULL,
	[Url] [nvarchar](350) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Type] [int] NULL,
	[IsDisable] [bit] NOT NULL,
 CONSTRAINT [PK_Hishop_Banner] PRIMARY KEY NONCLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_BalanceDrawRequest]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_BalanceDrawRequest](
	[SerialID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RequestType] [int] NOT NULL,
	[UserName] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[RequestTime] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[AccountName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[CellPhone] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[MerchantCode] [nvarchar](300) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Remark] [nvarchar](2000) COLLATE Chinese_PRC_CI_AS NULL,
	[RedpackRecordNum] [int] NOT NULL,
	[IsCheck] [bit] NOT NULL,
	[CheckTime] [datetime] NULL,
 CONSTRAINT [PK_Hishop_BalanceDrawRequest] PRIMARY KEY CLUSTERED 
(
	[SerialID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_FriendExtension]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_FriendExtension]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_FriendExtension](
	[ExtensionId] [int] IDENTITY(1,1) NOT NULL,
	[ExensiontRemark] [nvarchar](2000) COLLATE Chinese_PRC_CI_AS NULL,
	[ExensionImg] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Hishop_FriendExtension] PRIMARY KEY CLUSTERED 
(
	[ExtensionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Favorite]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Favorite]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Favorite](
	[FavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Tags] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Remark] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_Favorite] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ExpressTemplates]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ExpressTemplates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ExpressTemplates](
	[ExpressId] [int] IDENTITY(1,1) NOT NULL,
	[ExpressName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[XmlFile] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[IsUse] [bit] NOT NULL,
 CONSTRAINT [PK_Hishop_ExpressTemplates] PRIMARY KEY CLUSTERED 
(
	[ExpressId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_DistributorProducts]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_DistributorProducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_DistributorProducts](
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL
)
END
GO
/****** Object:  Table [dbo].[Hishop_Coupons]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Coupons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Coupons](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[ClosingTime] [datetime] NOT NULL,
	[Description] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Amount] [money] NULL,
	[DiscountValue] [money] NOT NULL,
	[SentCount] [int] NOT NULL,
	[UsedCount] [int] NOT NULL,
	[NeedPoint] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_Coupons] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_MessageTemplates]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_MessageTemplates](
	[MessageType] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Name] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[SendEmail] [bit] NULL,
	[SendSMS] [bit] NULL,
	[SendInnerMessage] [bit] NULL,
	[SendWeixin] [bit] NULL,
	[WeixinTemplateId] [varchar](150) COLLATE Chinese_PRC_CI_AS NULL,
	[TagDescription] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[EmailSubject] [nvarchar](1024) COLLATE Chinese_PRC_CI_AS NULL,
	[EmailBody] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[InnerMessageSubject] [nvarchar](1024) COLLATE Chinese_PRC_CI_AS NULL,
	[InnerMessageBody] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[SMSBody] [nvarchar](1024) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_MessageTemplates] PRIMARY KEY CLUSTERED 
(
	[MessageType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_MemberClientSet]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_MemberClientSet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_MemberClientSet](
	[ClientTypeId] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[LastDay] [int] NULL,
	[ClientChar] [nvarchar](2) COLLATE Chinese_PRC_CI_AS NULL,
	[ClientValue] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Hishop_MemberClientSet] PRIMARY KEY NONCLUSTERED 
(
	[ClientTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Logs]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Logs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Logs](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[PageUrl] [nvarchar](1000) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UserName] [nvarchar](64) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[IPAddress] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Privilege] [int] NOT NULL,
	[Description] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_Logs] PRIMARY KEY NONCLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_GroupBuy]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_GroupBuy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_GroupBuy](
	[GroupBuyId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[NeedPrice] [money] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[MaxCount] [int] NOT NULL,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Status] [int] NOT NULL,
	[DisplaySequence] [int] NOT NULL,
	[SoldCount] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_GroupBuy] PRIMARY KEY NONCLUSTERED 
(
	[GroupBuyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_Attributes]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_Attributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_Attributes](
	[AttributeId] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[DisplaySequence] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[UsageMode] [int] NOT NULL,
	[UseAttributeImage] [bit] NOT NULL,
 CONSTRAINT [PK_Hishop_Attributes] PRIMARY KEY CLUSTERED 
(
	[AttributeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_CouponItems]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_CouponItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_CouponItems](
	[CouponId] [int] NOT NULL,
	[LotNumber] [uniqueidentifier] NOT NULL,
	[ClaimCode] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[UserId] [int] NULL,
	[UserName] [nvarchar](256) COLLATE Chinese_PRC_CI_AS NULL,
	[EmailAddress] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[GenerateTime] [datetime] NOT NULL,
	[CouponStatus] [int] NOT NULL,
	[UsedTime] [datetime] NULL,
	[OrderId] [nvarchar](60) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_CouponItems] PRIMARY KEY CLUSTERED 
(
	[ClaimCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[cp_ProductVisitAndBuyStatistics_Get]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ProductVisitAndBuyStatistics_Get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[cp_ProductVisitAndBuyStatistics_Get]
(
	@PageIndex int,
	@PageSize int,
	@sqlPopulate ntext,
	@TotalProductSales int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForProductSales
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		ProductId int,
		BuyPercentage decimal(18, 0)		
	)	

	INSERT INTO #PageIndexForProductSales(ProductId,BuyPercentage)
	Exec sp_executesql @sqlPopulate

	SET @TotalProductSales = @@rowcount
	
	SELECT S.IndexId,P.ProductName,P.VistiCounts,P.SaleCounts as BuyCount ,S.BuyPercentage    
	FROM   Hishop_Products P, #PageIndexForProductSales S
	WHERE 
			P.ProductId = S.ProductId AND
			S.IndexId > @PageLowerBound AND
			S.IndexId < @PageUpperBound 
	ORDER BY S.IndexId
	
	drop table #PageIndexForProductSales
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_ProductSalesNoPage_Get]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ProductSalesNoPage_Get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_ProductSalesNoPage_Get]
(
	@sqlPopulate ntext,
	@TotalProductSales int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	CREATE TABLE #PageIndexForProductSales
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		ProductId int,
		ProductSaleCounts int,
		ProductSaleTotals money,
		ProductProfitsTotals money
	)	

	INSERT INTO #PageIndexForProductSales(ProductId, ProductSaleCounts, ProductSaleTotals, ProductProfitsTotals)
	Exec sp_executesql @sqlPopulate

	SET @TotalProductSales = @@rowcount
	
	SELECT IDOfSaleTotals=(select count(1)+1 from #PageIndexForProductSales where ProductSaleCounts>s.ProductSaleCounts),
		P.ProductName,P.ProductCode as SKU,
		case when S.ProductSaleCounts is null then 0 else S.ProductSaleCounts end as ProductSaleCounts , 
		case when S.ProductSaleTotals is null then 0 else S.ProductSaleTotals end as ProductSaleTotals , 
		case when S.ProductProfitsTotals is null then 0 else S.ProductProfitsTotals end as ProductProfitsTotals
	FROM   Hishop_Products P, #PageIndexForProductSales S
	WHERE 
			P.ProductId = S.ProductId
	ORDER BY S.IndexId
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_ProductSales_Get]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ProductSales_Get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[cp_ProductSales_Get]
(
	@PageIndex int,
	@PageSize int,
	@IsCount bit,
	@sqlPopulate ntext,
	@TotalProductSales int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForProductSales
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		ProductId int,
		ProductSaleCounts int,
		ProductSaleTotals money,
		ProductProfitsTotals money
	)	

	INSERT INTO #PageIndexForProductSales(ProductId, ProductSaleCounts, ProductSaleTotals, ProductProfitsTotals)
	Exec sp_executesql @sqlPopulate

	SET @TotalProductSales = @@rowcount
	
	SELECT IDOfSaleTotals=(select count(1)+1 from #PageIndexForProductSales where ProductSaleCounts>s.ProductSaleCounts),
		P.ProductName,P.ProductCode as SKU,
		case when S.ProductSaleCounts is null then 0 else S.ProductSaleCounts end as ProductSaleCounts , 
		case when S.ProductSaleTotals is null then 0 else S.ProductSaleTotals end as ProductSaleTotals , 
		case when S.ProductProfitsTotals is null then 0 else S.ProductProfitsTotals end as ProductProfitsTotals
	FROM   Hishop_Products P, #PageIndexForProductSales S
	WHERE 
			P.ProductId = S.ProductId AND
			S.IndexId > @PageLowerBound AND
			S.IndexId < @PageUpperBound 
	ORDER BY S.IndexId
	
	drop table #PageIndexForProductSales
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_Product_Update]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Product_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_Product_Update]
(
@CategoryId INT,
@MainCategoryPath NVARCHAR(256),
@TypeId INT = NULL,
@ProductName NVARCHAR(200),
@ProductCode [nvarchar] (50),
@ShortDescription NVARCHAR(2000) = NULL,
@Unit NVARCHAR(10) = NULL,
@Description NTEXT = NULL,
@SaleStatus INT,
@DisplaySequence INT,
@ImageUrl1 [nvarchar] (255) = NULL,
@ImageUrl2 [nvarchar] (255) = NULL,
@ImageUrl3 [nvarchar] (255) = NULL,
@ImageUrl4 [nvarchar] (255) = NULL,
@ImageUrl5 [nvarchar] (255) = NULL,
@ThumbnailUrl40 [nvarchar] (255) = NULL,
@ThumbnailUrl60 [nvarchar] (255) = NULL,
@ThumbnailUrl100 [nvarchar] (255) = NULL,
@ThumbnailUrl160 [nvarchar] (255) = NULL,
@ThumbnailUrl180 [nvarchar] (255) = NULL,
@ThumbnailUrl220 [nvarchar] (255) = NULL,
@ThumbnailUrl310 [nvarchar] (255) = NULL,
@ThumbnailUrl410 [nvarchar] (255) = NULL,
@MarketPrice MONEY = NULL,
@BrandId INT,
@HasSKU BIT,
@IsfreeShipping [bit],
@SaleCounts INT,
@ShowSaleCounts INT,
@ProductId INT
)
AS

--如果商品显示顺序存在，则所有这个商品后台的顺序加一
IF (SELECT DisplaySequence FROM Hishop_Products WHERE ProductId = @ProductId) != @DisplaySequence AND EXISTS(SELECT ProductId FROM Hishop_Products WHERE DisplaySequence = @DisplaySequence)
UPDATE Hishop_Products SET DisplaySequence = DisplaySequence + 1 WHERE DisplaySequence >= @DisplaySequence

UPDATE Hishop_Products SET
CategoryId = @CategoryId, MainCategoryPath = @MainCategoryPath, TypeId = @TypeId, ProductName = @ProductName, ProductCode = @ProductCode,
ShortDescription = @ShortDescription, Unit = @Unit, [Description] = @Description, MarketPrice = @MarketPrice, SaleStatus = @SaleStatus, DisplaySequence = @DisplaySequence,
ImageUrl1 = @ImageUrl1, ImageUrl2 = @ImageUrl2, ImageUrl3 = @ImageUrl3, ImageUrl4 = @ImageUrl4, ImageUrl5 = @ImageUrl5,
ThumbnailUrl40 = @ThumbnailUrl40, ThumbnailUrl60 = @ThumbnailUrl60, ThumbnailUrl100 = @ThumbnailUrl100, ThumbnailUrl160 = @ThumbnailUrl160, ThumbnailUrl180 = @ThumbnailUrl180,
ThumbnailUrl220 = @ThumbnailUrl220, ThumbnailUrl310 = @ThumbnailUrl310, ThumbnailUrl410 = @ThumbnailUrl410, 
BrandId = @BrandId, HasSKU = @HasSKU,IsfreeShipping=@IsfreeShipping,SaleCounts = @SaleCounts, ShowSaleCounts = @ShowSaleCounts
WHERE ProductId = @ProductId' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_Votes_Create]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Votes_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_Votes_Create]
	(
		@VoteName NVARCHAR(100),
		@IsBackup BIT,
		@MaxCheck INT,
		@ImageUrl NVARCHAR(255),
		@StartDate DateTime,
		@EndDate DateTime,
		@Keys NVARCHAR(200),
		@VoteId int OUTPUT
	)
AS

IF @IsBackup = 1
	BEGIN
		UPDATE Hishop_Votes SET IsBackup = 0
	END

INSERT INTO Hishop_Votes (VoteName, IsBackup, MaxCheck, ImageUrl, StartDate, EndDate)
 VALUES (@VoteName, @IsBackup, @MaxCheck, @ImageUrl, @StartDate, @EndDate)
SET @VoteId = @@IDENTITY ;' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_Product_Create]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Product_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_Product_Create]
(
@CategoryId INT,
@MainCategoryPath NVARCHAR(256),
@TypeId INT = NULL,
@ProductName NVARCHAR(200),
@ProductCode [nvarchar] (50),
@ShortDescription NVARCHAR(2000) = NULL,
@Unit NVARCHAR(10) = NULL,
@Description NTEXT = NULL,
@Title NVARCHAR(100) = NULL,
@Meta_Description NVARCHAR(1000) = NULL,
@Meta_Keywords NVARCHAR(1000) = NULL,
@SaleStatus INT,
@AddedDate DATETIME,
@ImageUrl1 [nvarchar] (255) = NULL,
@ImageUrl2 [nvarchar] (255) = NULL,
@ImageUrl3 [nvarchar] (255) = NULL,
@ImageUrl4 [nvarchar] (255) = NULL,
@ImageUrl5 [nvarchar] (255) = NULL,
@ThumbnailUrl40 [nvarchar] (255) = NULL,
@ThumbnailUrl60 [nvarchar] (255) = NULL,
@ThumbnailUrl100 [nvarchar] (255) = NULL,
@ThumbnailUrl160 [nvarchar] (255) = NULL,
@ThumbnailUrl180 [nvarchar] (255) = NULL,
@ThumbnailUrl220 [nvarchar] (255) = NULL,
@ThumbnailUrl310 [nvarchar] (255) = NULL,
@ThumbnailUrl410 [nvarchar] (255) = NULL,
@MarketPrice MONEY = NULL,
@BrandId [int],
@HasSKU [BIT],
@IsfreeShipping [bit],
@TaobaoProductId [bigint],
@ProductId INT OUTPUT
)
AS

SET @ProductId = 0

--商品的顺序号取当前的最大值加1
DECLARE @DisplaySequence INT
SELECT @DisplaySequence = MAX(DisplaySequence) + 1 FROM  Hishop_Products
if @DisplaySequence is null
 	set @DisplaySequence = 1

INSERT INTO Hishop_Products
(CategoryId, MainCategoryPath, TypeId, ProductName, ProductCode, ShortDescription, Unit, [Description], SaleStatus, AddedDate, DisplaySequence,
ImageUrl1, ImageUrl2, ImageUrl3, ImageUrl4, ImageUrl5, ThumbnailUrl40, ThumbnailUrl60, ThumbnailUrl100, ThumbnailUrl160, ThumbnailUrl180,
ThumbnailUrl220, ThumbnailUrl310, ThumbnailUrl410,
MarketPrice, BrandId, HasSKU,IsfreeShipping,TaobaoProductId)
Values
(@CategoryId, @MainCategoryPath, @TypeId, @ProductName, @ProductCode, @ShortDescription, @Unit,  @Description,@SaleStatus, @AddedDate, @DisplaySequence,
@ImageUrl1, @ImageUrl2, @ImageUrl3, @ImageUrl4, @ImageUrl5, @ThumbnailUrl40, @ThumbnailUrl60, @ThumbnailUrl100, @ThumbnailUrl160, @ThumbnailUrl180,
@ThumbnailUrl220, @ThumbnailUrl310, @ThumbnailUrl410,
@MarketPrice, @BrandId, @HasSKU,@IsfreeShipping,@TaobaoProductId)
SET @ProductId = @@IDENTITY;' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_PaymentType_CreateUpdateDelete]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_PaymentType_CreateUpdateDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[cp_PaymentType_CreateUpdateDelete]
(
@ModeId INT = NULL OUTPUT,
@Name NVARCHAR(100) = null,
@Description NVARCHAR(4000) = NULL,
@Gateway NVARCHAR(200) = NULL,
@IsUseInpour BIT = NULL,
@IsUseInDistributor BIT = NULL,
@Charge MONEY = NULL,
@IsPercent BIT = NULL,
@Settings NTEXT = NULL,
@Action INT,
@Status INT OUTPUT
)
AS

DECLARE @DisplaySequence INT

SET @Status = 99

IF @Action = 2 -- 删除
BEGIN
DELETE FROM Hishop_PaymentTypes WHERE ModeId = @ModeId
IF @@ROWCOUNT = 1
BEGIN
SET @Status = 0
END

RETURN
END

IF @Action = 0 -- 创建
BEGIN

--如果取最大序号为空 则直接将序号设置为1
IF (Select Max(DisplaySequence) From Hishop_PaymentTypes) IS NULL
SET @DisplaySequence=1
-- 如果不为空则将 将序号设置为表中现有的最大值加1
ELSE
SELECT @DisplaySequence = MAX(DisplaySequence)+1 FROM Hishop_PaymentTypes

INSERT INTO
Hishop_PaymentTypes([Name], Description, Gateway, DisplaySequence, IsUseInpour,IsUseInDistributor, Charge, IsPercent, Settings)
VALUES
(@Name, @Description, @Gateway, @DisplaySequence, @IsUseInpour, @IsUseInDistributor,@Charge, @IsPercent, @Settings)

SELECT @ModeId = @@IDENTITY
IF @@ROWCOUNT = 1
SET @Status = 0

RETURN
END

IF @Action = 1 -- 修改
BEGIN

UPDATE
Hishop_PaymentTypes
SET
[Name] = @Name,
Description = @Description,
IsUseInpour = @IsUseInpour,
IsUseInDistributor = @IsUseInDistributor,
Charge = @Charge,
IsPercent = @IsPercent,
Settings = @Settings
WHERE ModeId = @ModeId
IF @@ROWCOUNT = 1
SET @Status = 0

RETURN
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_OrderStatisticsNoPage_Get]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_OrderStatisticsNoPage_Get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_OrderStatisticsNoPage_Get]
(
	@sqlPopulate ntext,
	@TotalUserOrders int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN

	CREATE TABLE #PageIndexForUserOrders
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		OrderId nvarchar(50)
	)	

	INSERT INTO #PageIndexForUserOrders(OrderId)
	Exec sp_executesql @sqlPopulate

	SET @TotalUserOrders = @@rowcount
	
	SELECT O.OrderId, OrderDate, Isnull(OrderTotal,0) as Total, Username, ShipTo, Isnull(OrderProfit,0) As Profits
	FROM Hishop_Orders O, #PageIndexForUserOrders UO 
	WHERE 
			O.OrderId = UO.OrderId
	ORDER BY UO.IndexId 
    ------------------------------------------------------------
    -- 当次搜索结果,总金额,利润
    SELECT 
		Isnull(SUM(OrderTotal),0) AS OrderTotal, -- 总金额
        Isnull(SUM(OrderProfit),0) AS Profits --利润
	FROM Hishop_Orders o,#PageIndexForUserOrders
    where
       o.OrderId = #PageIndexForUserOrders.OrderId
   drop table #PageIndexForUserOrders
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_OrderStatistics_Get]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_OrderStatistics_Get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[cp_OrderStatistics_Get]
(
	@PageIndex int,
	@PageSize int,
	@IsCount bit,
	@sqlPopulate ntext,
	@TotalUserOrders int = 0 output
)
AS
	SET Transaction Isolation Level Read UNCOMMITTED

BEGIN
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	-- Set the page bounds
	SET @PageLowerBound = @PageSize * (@PageIndex-1)
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	CREATE TABLE #PageIndexForUserOrders
	(
		IndexId int IDENTITY (1, 1) NOT NULL,
		OrderId nvarchar(50)
	)	

	INSERT INTO #PageIndexForUserOrders(OrderId)
	Exec sp_executesql @sqlPopulate

	SET @TotalUserOrders = @@rowcount
	
	SELECT O.OrderId, OrderDate, Isnull(OrderTotal,0) as Total, Username, ShipTo,Isnull(OrderProfit,0) As Profits
	FROM Hishop_Orders O, #PageIndexForUserOrders UO 
	WHERE 
			O.OrderId = UO.OrderId AND
			UO.IndexId > @PageLowerBound AND
			UO.IndexId < @PageUpperBound
	ORDER BY UO.IndexId 
    ------------------------------------------------------------
    -- ��ҳ�������,�ܽ��,����
    SELECT 
		Isnull(SUM(OrderTotal),0) AS OrderTotal, -- �ܽ��
        Isnull(SUM(OrderProfit),0) AS Profits --����
	FROM Hishop_Orders o,#PageIndexForUserOrders
    where
       o.OrderId = #PageIndexForUserOrders.OrderId and
       #PageIndexForUserOrders.IndexId > @PageLowerBound and  
	   #PageIndexForUserOrders.IndexId < @PageUpperBound
   
    -- �����������,�ܽ��,����
    SELECT 
		Isnull(SUM(OrderTotal),0) AS OrderTotal, -- �ܽ��
        Isnull(SUM(OrderProfit),0) AS Profits --����
	FROM Hishop_Orders o,#PageIndexForUserOrders
    where
       o.OrderId = #PageIndexForUserOrders.OrderId  
      
    drop table #PageIndexForUserOrders
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_Menu_SwapDisplaySequence]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Menu_SwapDisplaySequence]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_Menu_SwapDisplaySequence]
	(
		@MenuId INT,
		@ZIndex INT
	)
AS
	
	DECLARE @ParentMenuId INT, @DisplaySequence INT
	DECLARE @swap_MenuId INT, @swap_DisplaySequence INT
	
	SELECT @ParentMenuId = ParentMenuId, @DisplaySequence = DisplaySequence FROM vshop_Menu WHERE MenuId = @MenuId

	IF @ZIndex = 0
		SELECT TOP 1 @swap_MenuId = MenuId, @swap_DisplaySequence = DisplaySequence FROM vshop_Menu WHERE ParentMenuId = @ParentMenuId AND DisplaySequence < @DisplaySequence ORDER BY DisplaySequence DESC
	ELSE
		SELECT TOP 1 @swap_MenuId = MenuId, @swap_DisplaySequence = DisplaySequence FROM vshop_Menu WHERE ParentMenuId = @ParentMenuId AND DisplaySequence > @DisplaySequence ORDER BY DisplaySequence ASC
	
	IF @swap_MenuId IS NULL
		RETURN;

	SET XACT_ABORT ON
	BEGIN TRAN
	
	UPDATE vshop_Menu SET DisplaySequence = @swap_DisplaySequence WHERE MenuId = @MenuId
	UPDATE vshop_Menu SET DisplaySequence = @DisplaySequence WHERE MenuId = @swap_MenuId
	
	COMMIT TRAN' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_Category_Delete]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Category_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_Category_Delete]
(
	@CategoryId INT
)
AS
Declare @Err As int, @Count INT, @DisplaySequence INT
DECLARE @Path nvarchar(4000)

SET XACT_ABORT ON
Begin Tran

CREATE TABLE #tempTable (CategoryId INT)

SELECT @Err = 0, @Path = Path, @DisplaySequence = DisplaySequence FROM Hishop_Categories WHERE CategoryId = @CategoryId
INSERT INTO #tempTable SELECT CategoryId FROM Hishop_Categories WHERE CategoryId = @CategoryId OR Path LIKE '''' + @Path + ''|%''

SET @Count = @@ROWCOUNT

-- 删除自身和所有子分类
DELETE From Hishop_Categories Where CategoryId IN (SELECT CategoryId FROM #tempTable)

-- 修改商品分类的编号为0，表示未分类
UPDATE Hishop_Products SET CategoryId = 0, MainCategoryPath = null WHERE CategoryId IN (SELECT CategoryId FROM #tempTable)


DROP TABLE #tempTable

  Commit Tran' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_Category_Create]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Category_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_Category_Create]
	(
		@IconUrl NVARCHAR(255) = NULL,
		@Name NVARCHAR(100) = NULL,
		@DisplaySequence INT = NULL,
		@Meta_Title NVARCHAR(1000)=NULL,
		@Meta_Description NVARCHAR(1000) = NULL,
		@Meta_Keywords NVARCHAR(1000) = NULL,
		@ParentCategoryId INT = NULL,
		@RewriteName NVARCHAR(50) = NULL,
		@SKUPrefix NVARCHAR(10) = NULL,
		@AssociatedProductType INT = NULL,
		@Notes1 NTEXT = NULL,
		@Notes2 NTEXT = NULL,
		@Notes3 NTEXT = NULL,
		@Notes4 NTEXT = NULL,
		@Notes5 NTEXT = NULL,
		@FirstCommission NVARCHAR(50),
		@SecondCommission NVARCHAR(50),
		@ThirdCommission NVARCHAR(50),
		@CategoryId INT OUTPUT
	)
AS
Declare @Err As int
SELECT @Err=0

SET XACT_ABORT ON
Begin Tran
	
IF @ParentCategoryId IS NULL OR @ParentCategoryId < 0
	SET @ParentCategoryId = 0
	
--通过现有记录获取栏目ID


Select @CategoryId = ISNULL(Max(CategoryId),0) From Hishop_Categories
IF @CategoryId Is Not Null
	Set @CategoryId = @CategoryId+1
Else
	Set @CategoryId = 1

--判断是否是顶级栏目，设置其Path和Depth
Declare @Depth As int
Declare @Path As nvarchar(4000)

IF @ParentCategoryId = 0
Begin
	Select @DisplaySequence = ISNULL(MAX(DisplaySequence),0) + 1 from Hishop_Categories where ParentCategoryId = 0
	Set @Path =Ltrim(RTRIM(Str(@CategoryId)))
	Set @Depth = 1
End
Else
Begin
	--获取父节点的路径和深度
	Select @Path = [Path] ,@Depth = Depth From Hishop_Categories Where CategoryId=@ParentCategoryId
	Select @DisplaySequence = ISNULL(MAX(DisplaySequence),0) + 1 from Hishop_Categories where ParentCategoryId = @ParentCategoryId
	IF @Path Is Null
	Begin
		Set @Err = 1
		Goto theEnd
	End
	
	Set @Path = @Path + ''|'' + Ltrim(RTRIM(Str(@CategoryId)))
	Set @Depth = @Depth+1
End

Insert Into Hishop_Categories(
	CategoryId, [Name], DisplaySequence,IconUrl,Meta_Title, Meta_Description, Meta_Keywords, SKUPrefix,AssociatedProductType,
	ParentCategoryId, Depth, Path, RewriteName, Notes1, Notes2, Notes3, Notes4, Notes5,FirstCommission,SecondCommission,ThirdCommission
) 
Values(
	@CategoryId, @Name, @DisplaySequence,@IconUrl,@Meta_Title, @Meta_Description, @Meta_Keywords, @SKUPrefix,@AssociatedProductType,
	@ParentCategoryId, @Depth, @Path, @RewriteName, @Notes1, @Notes2, @Notes3, @Notes4, @Notes5,@FirstCommission,@SecondCommission,@ThirdCommission
)

IF @@Error<>0 
Begin
	Set @Err=1
	Goto theEnd
End

theEnd:
IF @Err=0
Begin
	Commit Tran
	Return @CategoryId
End
Else
Begin
    Rollback Tran
	Return 0
End' 
END
GO
/****** Object:  Table [dbo].[Hishop_OrderReturns]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReturns]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_OrderReturns](
	[ReturnsId] [int] IDENTITY(10000,1) NOT NULL,
	[OrderId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ApplyForTime] [datetime] NOT NULL,
	[RefundType] [int] NOT NULL,
	[RefundMoney] [money] NOT NULL,
	[Comments] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[HandleStatus] [int] NOT NULL,
	[HandleTime] [datetime] NULL,
	[AdminRemark] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[Operator] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Account] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[AuditTime] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[RefundTime] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_Returns] PRIMARY KEY NONCLUSTERED 
(
	[ReturnsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_OrderReplace]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReplace]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_OrderReplace](
	[ReplaceId] [int] IDENTITY(10000,1) NOT NULL,
	[OrderId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ApplyForTime] [datetime] NOT NULL,
	[Comments] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[HandleStatus] [int] NOT NULL,
	[HandleTime] [datetime] NULL,
	[AdminRemark] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_OrderReplace] PRIMARY KEY NONCLUSTERED 
(
	[ReplaceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_OrderRefund]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderRefund]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_OrderRefund](
	[RefundId] [int] IDENTITY(10000,1) NOT NULL,
	[OrderId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ApplyForTime] [datetime] NOT NULL,
	[RefundType] [int] NULL,
	[RefundRemark] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[AdminRemark] [ntext] COLLATE Chinese_PRC_CI_AS NULL,
	[HandleStatus] [int] NOT NULL,
	[HandleTime] [datetime] NULL,
	[Operator] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_Refund] PRIMARY KEY NONCLUSTERED 
(
	[RefundId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_OrderItems]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_OrderItems](
	[OrderId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[SkuId] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ProductId] [int] NOT NULL,
	[SKU] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Quantity] [int] NOT NULL,
	[ShipmentQuantity] [int] NOT NULL,
	[CostPrice] [money] NOT NULL,
	[ItemListPrice] [money] NOT NULL,
	[ItemAdjustedPrice] [money] NOT NULL,
	[ItemAdjustedCommssion] [money] NOT NULL,
	[ItemDescription] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ThumbnailsUrl] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[Weight] [money] NULL,
	[SKUContent] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL,
	[PromotionId] [int] NULL,
	[PromotionName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[OrderItemsStatus] [int] NOT NULL,
	[ItemsCommission] [money] NULL,
	[SecondItemsCommission] [money] NULL,
	[ThirdItemsCommission] [money] NULL,
 CONSTRAINT [PK_Hishop_OrderItems] PRIMARY KEY NONCLUSTERED 
(
	[OrderId] ASC,
	[SkuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_OrderDebitNote]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderDebitNote]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_OrderDebitNote](
	[NoteId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[OrderId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Operator] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Remark] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
 CONSTRAINT [PK_Hishop_OrderDebitNote] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ShoppingCarts]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShoppingCarts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ShoppingCarts](
	[UserId] [int] NOT NULL,
	[SkuId] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Quantity] [int] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Hishop_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[SkuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ShippingTypes]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ShippingTypes](
	[ModeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[TemplateId] [int] NOT NULL,
	[Description] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL,
	[DisplaySequence] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_ShippingTypes] PRIMARY KEY CLUSTERED 
(
	[ModeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ShippingTypeGroups]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypeGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ShippingTypeGroups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[AddPrice] [money] NULL,
 CONSTRAINT [PK_Hishop_ShippingTypeGroups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ShippingRegions]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingRegions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ShippingRegions](
	[TemplateId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_ShippingRegions] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC,
	[RegionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ProductTypeBrands]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypeBrands]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ProductTypeBrands](
	[ProductTypeId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_ProductTypeBrands] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC,
	[BrandId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ProductTag]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTag]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ProductTag](
	[TagId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_ProductTag] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_OrderSendNote]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_OrderSendNote]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_OrderSendNote](
	[NoteId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[OrderId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Operator] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Remark] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
 CONSTRAINT [PK_Hishop_OrderSendNote] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_SKUs]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_SKUs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_SKUs](
	[SkuId] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ProductId] [int] NOT NULL,
	[SKU] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[Weight] [money] NULL,
	[Stock] [int] NOT NULL,
	[CostPrice] [money] NULL,
	[SalePrice] [money] NOT NULL,
 CONSTRAINT [PK_Hishop_SKUs] PRIMARY KEY CLUSTERED 
(
	[SkuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_SKUs]') AND name = N'Hishop_SKUs_Index2')
CREATE NONCLUSTERED INDEX [Hishop_SKUs_Index2] ON [dbo].[Hishop_SKUs] 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[Hishop_VoteItems]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_VoteItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_VoteItems](
	[VoteId] [bigint] NOT NULL,
	[VoteItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[VoteItemName] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ItemCount] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_VoteItems] PRIMARY KEY NONCLUSTERED 
(
	[VoteItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_UserShippingAddresses]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_UserShippingAddresses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_UserShippingAddresses](
	[RegionId] [int] NOT NULL,
	[ShippingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ShipTo] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Address] [nvarchar](500) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Zipcode] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[TelPhone] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[CellPhone] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Hishop_UserShippingAddresses] PRIMARY KEY CLUSTERED 
(
	[ShippingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_PointDetails]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PointDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_PointDetails](
	[JournalNumber] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [nvarchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[UserId] [int] NOT NULL,
	[TradeDate] [datetime] NOT NULL,
	[TradeType] [int] NOT NULL,
	[Increased] [int] NULL,
	[Reduced] [int] NULL,
	[Points] [int] NULL,
	[Remark] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK__Hishop_P__B69723340169315C] PRIMARY KEY CLUSTERED 
(
	[JournalNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_PointDetails]') AND name = N'Hishop_PointDetails_Index2')
CREATE NONCLUSTERED INDEX [Hishop_PointDetails_Index2] ON [dbo].[Hishop_PointDetails] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  StoredProcedure [dbo].[ss_CreateOrder]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ss_CreateOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE  PROCEDURE [dbo].[ss_CreateOrder]
(
	-- 基本信息
    @OrderId nvarchar(50),
	@OrderDate	datetime,	
	@UserId	int,
    @UserName nvarchar(50),
    @Wangwang nvarchar(20),
    @RealName nvarchar(50),
    @EmailAddress	nvarchar(255) = null,
    @Remark Nvarchar(4000) =null,
	@AdjustedDiscount money,
	@OrderStatus int,
	-- 配送信息
	@ShippingRegion Nvarchar(300) = null,
	@Address Nvarchar(300) = null,
	@ZipCode Nvarchar(20) = null,
	@ShipTo Nvarchar(50) = null,
	@TelPhone Nvarchar(50) = null,
	@CellPhone Nvarchar(50) = null,
	@ShipToDate Nvarchar(50) = null,
	@ShippingModeId int = null,
	@ModeName Nvarchar(50) = null,
	@RegionId int = null,
	@Freight money = null,
	@AdjustedFreight money = null,
	@ShipOrderNumber Nvarchar(50) = null,	
    @Weight int = null,
	@ExpressCompanyName nvarchar(500),
    @ExpressCompanyAbb nvarchar(500),
    -- 支付信息
    @PaymentTypeId INT = null,
    @PaymentType Nvarchar(100) = null,	
    @PayCharge money = null,
    @RefundStatus int,
	@Gateway nvarchar(200)=null,
    -- 统计字段
    @OrderTotal money = null,
    @OrderPoint int = null,
    @OrderCostPrice money = null,
    @OrderProfit money = null,
    @OptionPrice money = null,
    @Amount money = null,    
    @DiscountAmount money=null,
	-- 促销信息
	@ReducedPromotionId int = null,
	@ReducedPromotionName nvarchar(100) = null,
	@ReducedPromotionAmount money = null,
	@IsReduced bit = null,

	@SentTimesPointPromotionId int = null,
	@SentTimesPointPromotionName nvarchar(100) = null,
	@TimesPoint money = null,
	@IsSendTimesPoint bit = null,

	@FreightFreePromotionId int = null,
	@FreightFreePromotionName nvarchar(100) = null,
	@IsFreightFree bit = null,
    -- 优惠券信息
    @CouponName nvarchar(100) = null,
	@CouponCode nvarchar(50) = null,
	@CouponAmount money = null,    
	@CouponValue money = null,
    -- 红包信息
    @RedPagerActivityName nvarchar(100) = null,
	@RedPagerID int = null,
	@RedPagerOrderAmountCanUse money = null,    
	@RedPagerAmount money = null,
	--团购活动信息
	@GroupBuyId int = null,
	@NeedPrice money = null,
	@GroupBuyStatus int = null,
		--限时抢购信息
	@CountDownBuyId int = null,

	--捆绑商品
	@Bundlingid int=null,
	--捆绑价格
    @BundlingPrice money = null,
	--税金相关
	@Tax money=null,
	@InvoiceTitle nvarchar(50),
	@ReferralUserId int,
	 
	@ActivitiesId nvarchar(50)=null,
	@ActivitiesName nvarchar(200)=null,
	@FirstCommission money =null,
	@SecondCommission money=null,
	@ThirdCommission money=null
)
as 
  IF EXISTS (SELECT OrderId  FROM Hishop_Orders WHERE OrderId = @OrderId)
    Return
  ELSE
  INSERT INTO Hishop_Orders
   (OrderId, OrderDate, UserId, Username,RealName, EmailAddress, Remark, AdjustedDiscount, OrderStatus,
   ShippingRegion, Address, ZipCode, ShipTo, TelPhone, CellPhone, ShipToDate, ShippingModeId, ModeName, RegionId, Freight, AdjustedFreight, ShipOrderNumber, [Weight], 
   PaymentTypeId,PaymentType, PayCharge, RefundStatus, OrderTotal, OrderPoint, OrderCostPrice, OrderProfit, OptionPrice, Amount, 
   ReducedPromotionId,ReducedPromotionName,ReducedPromotionAmount,IsReduced,SentTimesPointPromotionId,SentTimesPointPromotionName,TimesPoint,IsSendTimesPoint,
   FreightFreePromotionId,FreightFreePromotionName,IsFreightFree,CouponName, CouponCode, CouponAmount, CouponValue,RedPagerActivityName,RedPagerID,RedPagerOrderAmountCanUse,RedPagerAmount,GroupBuyId,NeedPrice,GroupBuyStatus,CountDownBuyId,BundlingId,
   DiscountAmount,ExpressCompanyName,ExpressCompanyAbb,BundlingPrice,Tax,InvoiceTitle,Gateway,ReferralUserId,ActivitiesId,ActivitiesName,FirstCommission,SecondCommission,ThirdCommission
  )
  VALUES 
  (@OrderId, @OrderDate, @UserId, @Username,@RealName, @EmailAddress, @Remark, @AdjustedDiscount, @OrderStatus,
   @ShippingRegion, @Address, @ZipCode, @ShipTo, @TelPhone, @CellPhone, @ShipToDate, @ShippingModeId, @ModeName, @RegionId, @Freight, @AdjustedFreight, @ShipOrderNumber, @Weight, 
   @PaymentTypeId,@PaymentType, @PayCharge, @RefundStatus, @OrderTotal, @OrderPoint, @OrderCostPrice, @OrderProfit, @OptionPrice, @Amount, 
   @ReducedPromotionId,@ReducedPromotionName,@ReducedPromotionAmount,@IsReduced,@SentTimesPointPromotionId,@SentTimesPointPromotionName,@TimesPoint,@IsSendTimesPoint,
   @FreightFreePromotionId,@FreightFreePromotionName,@IsFreightFree,@CouponName, @CouponCode, @CouponAmount, @CouponValue,@RedPagerActivityName,@RedPagerID,@RedPagerOrderAmountCanUse,@RedPagerAmount,@GroupBuyId,@NeedPrice,@GroupBuyStatus,@CountDownBuyId,@Bundlingid,
   @DiscountAmount,@ExpressCompanyName,@ExpressCompanyAbb,@BundlingPrice,@Tax,@InvoiceTitle,@Gateway,@ReferralUserId,@ActivitiesId,@ActivitiesName,@FirstCommission,@SecondCommission,@ThirdCommission
   )' 
END
GO
/****** Object:  Trigger [T_Hishop_Categories_Insert]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[T_Hishop_Categories_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE   Trigger   [dbo].[T_Hishop_Categories_Insert] ON [dbo].[Hishop_Categories] FOR Insert AS
BEGIN
	DECLARE @ParentCategoryId INT
	SELECT @ParentCategoryId= ParentCategoryId FROM inserted;

	IF @ParentCategoryId = 0 OR @ParentCategoryId IS NULL
		RETURN

	IF EXISTS(SELECT CategoryId FROM Hishop_Categories WHERE CategoryId = @ParentCategoryId AND HasChildren = 0)
	BEGIN
		-- 如果上级分类存在，且上级分类当前无子分类，则更新上级分类的HasChildren字段为1
		UPDATE Hishop_Categories SET HasChildren = 1 WHERE CategoryId = @ParentCategoryId
	END
END'
GO
/****** Object:  Trigger [T_Hishop_Categories_Delete]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[T_Hishop_Categories_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE   Trigger   [dbo].[T_Hishop_Categories_Delete] ON [dbo].[Hishop_Categories] FOR Delete AS
BEGIN
	DECLARE @ParentCategoryId INT
	SELECT @ParentCategoryId= ParentCategoryId FROM deleted;

	IF @ParentCategoryId = 0 OR @ParentCategoryId IS NULL
		RETURN
		
	IF EXISTS(SELECT CategoryId FROM Hishop_Categories WHERE CategoryId = @ParentCategoryId)
	BEGIN
		-- 如果上级分类存在，且上级分类已没有任何子分类，则更新上级分类的HasChildren字段为0
		IF (SELECT COUNT(CategoryId) FROM Hishop_Categories WHERE ParentCategoryId = @ParentCategoryId) = 0
			UPDATE Hishop_Categories SET HasChildren = 0 WHERE CategoryId = @ParentCategoryId
	END
END'
GO
/****** Object:  View [dbo].[vw_Hishop_CommissionDistributors]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_CommissionDistributors]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_CommissionDistributors]
AS
SELECT     dbo.Hishop_Commissions.CommId, dbo.Hishop_Commissions.UserId, dbo.Hishop_Commissions.ReferralUserId, dbo.Hishop_Commissions.OrderId, 
                      dbo.Hishop_Commissions.TradeTime, dbo.Hishop_Commissions.OrderTotal, dbo.Hishop_Commissions.CommTotal, dbo.Hishop_Commissions.CommType, 
                      dbo.Hishop_Commissions.CommRemark, dbo.aspnet_Distributors.StoreName, dbo.aspnet_Distributors.ReferralBlance, 
                      dbo.aspnet_Distributors.ReferralRequestBalance, dbo.aspnet_Distributors.GradeId, dbo.Hishop_Commissions.State
FROM         dbo.Hishop_Commissions INNER JOIN
                      dbo.aspnet_Distributors ON dbo.Hishop_Commissions.UserId = dbo.aspnet_Distributors.UserId
'
GO
/****** Object:  View [dbo].[vw_Hishop_DistributorsMembers]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_DistributorsMembers]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_DistributorsMembers]
AS
SELECT     dbo.aspnet_Distributors.UserId, dbo.aspnet_Distributors.StoreName, dbo.aspnet_Distributors.Logo, dbo.aspnet_Distributors.BackImage, 
                      dbo.aspnet_Distributors.RequestAccount, dbo.aspnet_Distributors.AccountTime, dbo.aspnet_Distributors.GradeId, dbo.aspnet_Distributors.ReferralUserId, 
                      dbo.aspnet_Distributors.ReferralPath, dbo.aspnet_Distributors.OrdersTotal, dbo.aspnet_Distributors.ReferralOrders, dbo.aspnet_Distributors.ReferralBlance, 
                      dbo.aspnet_Distributors.ReferralRequestBalance, dbo.aspnet_Distributors.CreateTime, dbo.aspnet_Distributors.ReferralStatus, 
                      dbo.aspnet_Distributors.StoreDescription, dbo.aspnet_Distributors.DistributorGradeId, dbo.aspnet_Distributors.IsAgent, 
					  dbo.aspnet_Distributors.AgentGradeId, dbo.aspnet_Distributors.AgentPath, dbo.aspnet_Members.QQ, dbo.aspnet_Members.CellPhone, 
                      dbo.aspnet_Members.MicroSignal, dbo.aspnet_Members.RealName, dbo.aspnet_Members.UserHead, dbo.aspnet_Members.UserName, 
                      dbo.aspnet_DistributorGrade.Name
FROM         dbo.aspnet_Distributors INNER JOIN
                      dbo.aspnet_Members ON dbo.aspnet_Distributors.UserId = dbo.aspnet_Members.UserId LEFT OUTER JOIN
                      dbo.aspnet_DistributorGrade ON dbo.aspnet_Distributors.DistributorGradeId = dbo.aspnet_DistributorGrade.GradeId
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vw_Hishop_DistributorsMembers', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "aspnet_Distributors"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "aspnet_Members"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 125
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "aspnet_DistributorGrade"
            Begin Extent = 
               Top = 143
               Left = 279
               Bottom = 262
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Hishop_DistributorsMembers'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vw_Hishop_DistributorsMembers', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Hishop_DistributorsMembers'
GO
/****** Object:  View [dbo].[vw_Hishop_ProductReviews]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_ProductReviews]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_ProductReviews]
AS
SELECT
	p.[ProductId]
	,p.ProductCode
	,p.[ProductName]
	,p.[CategoryId]
    ,r.ReviewId
    ,r.ReviewText
    ,r.ReviewDate
    ,r.UserId
    ,r.UserName
FROM 
	Hishop_Products p (nolock)inner join Hishop_ProductReviews r on (r.productId=p.ProductId)'
GO
/****** Object:  View [dbo].[vw_Hishop_ProductConsultations]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_ProductConsultations]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_ProductConsultations]
AS
SELECT
	  p.[ProductId]
      ,p.[ProductName]     
	  ,p.[ProductCode]
      ,p.[ThumbnailUrl40] 
	  ,p.[CategoryId]
      ,c.[ConsultationId]
	  ,c.[ConsultationText]
      ,c.[ConsultationDate]
      ,c.[ReplyText]
      ,c.[UserName]
      ,c.[ReplyUserId]
      ,c.[Userid]
	  ,c.[ReplyDate]
FROM Hishop_Products p inner join Hishop_ProductConsultations c ON p.productId=c.ProductId'
GO
/****** Object:  Table [dbo].[Taobao_Products]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Taobao_Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Taobao_Products](
	[Cid] [bigint] NOT NULL,
	[StuffStatus] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NULL,
	[ProductId] [int] NOT NULL,
	[ProTitle] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[Num] [bigint] NOT NULL,
	[LocationState] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[LocationCity] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[FreightPayer] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[PostFee] [money] NULL,
	[ExpressFee] [money] NULL,
	[EMSFee] [money] NULL,
	[HasInvoice] [bit] NOT NULL,
	[HasWarranty] [bit] NOT NULL,
	[HasDiscount] [bit] NOT NULL,
	[ValidThru] [bigint] NOT NULL,
	[ListTime] [datetime] NULL,
	[PropertyAlias] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL,
	[InputPids] [nvarchar](2000) COLLATE Chinese_PRC_CI_AS NULL,
	[InputStr] [nvarchar](2000) COLLATE Chinese_PRC_CI_AS NULL,
	[SkuProperties] [nvarchar](4000) COLLATE Chinese_PRC_CI_AS NULL,
	[SkuQuantities] [nvarchar](2000) COLLATE Chinese_PRC_CI_AS NULL,
	[SkuPrices] [nvarchar](2000) COLLATE Chinese_PRC_CI_AS NULL,
	[SkuOuterIds] [nvarchar](2000) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Taobao_Products] PRIMARY KEY NONCLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  View [dbo].[vw_Hishop_BalanceDrawRequesDistributors]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_BalanceDrawRequesDistributors]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_BalanceDrawRequesDistributors]
AS
SELECT     dbo.Hishop_BalanceDrawRequest.*, dbo.aspnet_Distributors.StoreName,dbo.aspnet_Distributors.ReferralBlance 
FROM         dbo.aspnet_Distributors INNER JOIN
                      dbo.Hishop_BalanceDrawRequest ON dbo.aspnet_Distributors.UserId = dbo.Hishop_BalanceDrawRequest.UserId'
GO
/****** Object:  View [dbo].[vw_Hishop_Order]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_Order]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_Order]
AS
SELECT     o.OrderId, o.Remark, o.ManagerMark, o.ManagerRemark, o.AdjustedDiscount, o.OrderStatus, o.CloseReason, o.OrderDate, o.PayDate, o.ShippingDate, o.FinishDate, 
                      o.UserId, o.Username, o.EmailAddress, o.RealName, o.QQ, o.Wangwang, o.MSN, o.ShippingRegion, o.Address, o.ZipCode, o.ShipTo, o.TelPhone, o.CellPhone, 
                      o.ShipToDate, o.ShippingModeId, o.ModeName, o.RealShippingModeId, o.RealModeName, o.RegionId, o.Freight, o.AdjustedFreight, o.ShipOrderNumber, o.Weight, 
                      o.ExpressCompanyName, o.ExpressCompanyAbb, o.PaymentTypeId, o.PaymentType, o.PayCharge, o.RefundStatus, o.RefundAmount, o.RefundRemark, o.Gateway, 
                      o.OrderTotal, o.OrderPoint, o.OrderCostPrice, o.OrderProfit, o.ActualFreight, o.OtherCost, o.OptionPrice, o.Amount, o.DiscountAmount, o.ReducedPromotionId, 
                      o.ReducedPromotionName, o.ReducedPromotionAmount, o.IsReduced, o.SentTimesPointPromotionId, o.SentTimesPointPromotionName, o.TimesPoint, 
                      o.IsSendTimesPoint, o.FreightFreePromotionId, o.FreightFreePromotionName, o.IsFreightFree, o.CouponName, o.CouponCode, o.CouponAmount, o.CouponValue, 
                      o.GroupBuyId, o.NeedPrice, o.GroupBuyStatus, o.CountDownBuyId, o.BundlingId, o.BundlingNum, o.BundlingPrice, o.GatewayOrderId, o.IsPrinted, o.Tax, 
                      o.InvoiceTitle, o.Sender, o.ReferralUserId, d.StoreName
FROM         dbo.aspnet_Distributors AS d RIGHT OUTER JOIN
                      dbo.Hishop_Orders AS o ON d.UserId = o.ReferralUserId
'
GO
/****** Object:  View [dbo].[vw_Hishop_SaleDetails]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_SaleDetails]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_SaleDetails]
AS
SELECT oi.OrderId, oi.ItemDescription AS ProductName, oi.Quantity, oi.ItemAdjustedPrice, o.orderDate, o.OrderStatus 
FROM Hishop_OrderItems oi join Hishop_orders o on oi.OrderId = o.OrderId'
GO
/****** Object:  View [dbo].[vw_Hishop_ProductSkuList]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_ProductSkuList]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_ProductSkuList]
AS
SELECT CategoryId, BrandId,ProductName,ProductCode,MarketPrice,ThumbnailUrl40, ThumbnailUrl60,
 SaleStatus, DisplaySequence, MainCategoryPath, ExtendCategoryPath, AddedDate, VistiCounts, s.*
FROM Hishop_Products p JOIN Hishop_SKUs s ON p.ProductId = s.ProductId'
GO
/****** Object:  View [dbo].[vw_Hishop_GroupBuy]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_GroupBuy]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_GroupBuy]
AS
SELECT g.GroupBuyId, g.ProductId, p.ProductName, g.Status,g.StartDate,g.EndDate, g.NeedPrice,g.MaxCount,g.DisplaySequence,g.SoldCount,
(SELECT COUNT(OrderId) FROM Hishop_Orders WHERE GroupBuyId = g.GroupBuyId) AS OrderCount,
(SELECT SUM(Quantity) FROM Hishop_OrderItems WHERE OrderId IN (SELECT OrderId FROM Hishop_Orders WHERE GroupBuyId = g.GroupBuyId AND OrderStatus <> 1 AND OrderStatus <> 4)) AS ProdcutQuantity
FROM Hishop_GroupBuy g JOIN Hishop_Products p ON g.ProductId = p.ProductId'
GO
/****** Object:  Trigger [T_Hishop_PointDetails_Insert]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[T_Hishop_PointDetails_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE   Trigger   [dbo].[T_Hishop_PointDetails_Insert] ON [dbo].[Hishop_PointDetails] FOR Insert AS
BEGIN
Declare @UserId INT
Declare @Points MONEY
SELECT @UserId= UserId, @Points = Points FROM inserted;
UPDATE aspnet_Members SET Points = @Points WHERE UserId = @UserId
END'
GO
/****** Object:  Trigger [T_Hishop_CouponItems_Update]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[T_Hishop_CouponItems_Update]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[T_Hishop_CouponItems_Update]
ON [dbo].[Hishop_CouponItems]
FOR update
AS 
BEGIN
	DECLARE @CouponId INT
	declare @CouponStatus int
	SELECT @CouponId= CouponId,@CouponStatus=CouponStatus FROM inserted;
	if @CouponStatus=1
	begin
		UPDATE hishop_Coupons SET UsedCount =(select COUNT(CouponId) from dbo.Hishop_CouponItems  WHERE CouponStatus = 1 and CouponId = @CouponId )where CouponId = @CouponId
	end
END'
GO
/****** Object:  Trigger [T_Hishop_CouponItems_Insert]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[T_Hishop_CouponItems_Insert]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[T_Hishop_CouponItems_Insert]
ON [dbo].[Hishop_CouponItems]
FOR INSERT
AS 
BEGIN
	DECLARE @CouponId INT
	declare @CouponStatus int
	SELECT @CouponId= CouponId,@CouponStatus=CouponStatus FROM inserted;
	if @CouponStatus=0
	begin
	UPDATE Hishop_Coupons SET SentCount = (select COUNT(*) from dbo.Hishop_CouponItems where CouponId = @CouponId) WHERE CouponId = @CouponId
end
END'
GO
/****** Object:  View [dbo].[vw_Hishop_OrderSendNote]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderSendNote]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_OrderSendNote]
as
select a.NoteId,b.OrderTotal,a.OrderId,b.PaymentType,b.ShippingDate,b.ExpressCompanyName,b.ZipCode,b.TelPhone,b.CellPhone,
b.ShipOrderNumber,b.ShipTo,b.ShippingRegion,a.Operator,b.Username,a.Remark
from Hishop_OrderSendNote a inner join Hishop_Orders b on a.OrderId=b.OrderId'
GO
/****** Object:  View [dbo].[vw_Hishop_OrderReturns]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderReturns]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_OrderReturns]
AS
SELECT a.ReturnsId,a.OrderId,a.Operator,b.Username,a.RefundMoney,a.ApplyForTime,a.AdminRemark,a.Comments,a.HandleStatus, OrderStatus,b.UserId,
CASE a.RefundType WHEN 1 THEN ''预存款'' ELSE ''银行转帐'' END AS RefundType, a.HandleTime
FROM Hishop_OrderReturns a INNER JOIN Hishop_Orders b on a.OrderId=b.OrderId;'
GO
/****** Object:  View [dbo].[vw_Hishop_OrderReplace]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderReplace]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_OrderReplace]
AS
SELECT a.ReplaceId,a.OrderId,b.Username,b.OrderTotal,a.ApplyForTime,a.Comments,a.HandleStatus,b.OrderStatus,b.UserId,a.HandleTime, a.AdminRemark
FROM Hishop_OrderReplace a INNER JOIN Hishop_Orders b on a.OrderId=b.OrderId;'
GO
/****** Object:  View [dbo].[vw_Hishop_OrderRefund]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderRefund]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_OrderRefund]
AS
SELECT a.RefundId,a.OrderId,a.Operator,a.RefundRemark,b.Username,b.OrderTotal,a.ApplyForTime,a.HandleTime,
a.AdminRemark,a.HandleStatus,b.OrderStatus,b.UserId,CASE a.RefundType WHEN 1 THEN ''预存款'' ELSE ''银行转帐'' END AS RefundType
FROM Hishop_OrderRefund a INNER JOIN Hishop_Orders b on a.OrderId=b.OrderId;'
GO
/****** Object:  View [dbo].[vw_Hishop_OrderItem]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderItem]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_OrderItem]
AS
select top 100 percent items.*,orders.PayDate,orders.Username,orders.ShipTo from dbo.Hishop_OrderItems as items
left join Hishop_Orders orders on items.OrderId=orders.OrderId where orders.OrderStatus!=1 and orders.OrderStatus!=4
order by orders.PayDate desc'
GO
/****** Object:  View [dbo].[vw_Hishop_OrderDebitNote]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_OrderDebitNote]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_OrderDebitNote]
as
select a.NoteId,a.OrderId,b.Username,b.OrderTotal,b.PayCharge,b.PaymentType,a.Operator,b.PayDate,a.Remark
from Hishop_OrderDebitNote a inner join Hishop_Orders b on a.OrderId=b.OrderId'
GO
/****** Object:  View [dbo].[vw_Hishop_CouponInfo]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_CouponInfo]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_CouponInfo]
	AS 
	SELECT     dbo.Hishop_CouponItems.LotNumber, dbo.Hishop_CouponItems.ClaimCode, dbo.Hishop_CouponItems.UserId, dbo.Hishop_CouponItems.UserName, 
                      dbo.Hishop_CouponItems.EmailAddress, dbo.Hishop_CouponItems.GenerateTime, dbo.Hishop_CouponItems.CouponStatus, dbo.Hishop_CouponItems.UsedTime, 
                      dbo.Hishop_CouponItems.OrderId, dbo.Hishop_CouponItems.CouponId, dbo.Hishop_Coupons.Name,dbo.Hishop_Coupons.ClosingTime
FROM         dbo.Hishop_CouponItems INNER JOIN
                      dbo.Hishop_Coupons ON dbo.Hishop_CouponItems.CouponId = dbo.Hishop_Coupons.CouponId'
GO
/****** Object:  View [dbo].[vw_Hishop_BrowseProductList]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Hishop_BrowseProductList]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Hishop_BrowseProductList]
AS
SELECT CategoryId, TypeId,BrandId,ProductId,ProductName,ProductCode,ShortDescription,MarketPrice,
ThumbnailUrl40,ThumbnailUrl60,ThumbnailUrl100,ThumbnailUrl160, ThumbnailUrl180, ThumbnailUrl220,ThumbnailUrl310,
 SaleStatus, DisplaySequence, MainCategoryPath, ExtendCategoryPath, SaleCounts, ShowSaleCounts, AddedDate, VistiCounts,
(SELECT MIN(SalePrice) FROM Hishop_SKUs WHERE ProductId = p.ProductId) AS SalePrice,
(SELECT TOP 1 SkuId FROM Hishop_SKUs WHERE ProductId = p.ProductId ORDER BY SalePrice) AS SkuId,
(SELECT SUM(Stock) FROM Hishop_SKUs WHERE ProductId = p.ProductId) AS Stock,
(SELECT TOP 1 [Weight] FROM Hishop_SKUs WHERE ProductId = p.ProductId ORDER BY SalePrice) AS [Weight],
(SELECT COUNT(*) FROM Taobao_Products WHERE ProductId = p.ProductId) AS IsMakeTaobao
FROM Hishop_Products p'
GO
/****** Object:  StoredProcedure [dbo].[ss_ShoppingCart_AddLineItem]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ss_ShoppingCart_AddLineItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ss_ShoppingCart_AddLineItem]
	(
		@UserId INT,
		@SkuId NVARCHAR(100),
		@Quantity INT,
		@CategoryId INT
	)
AS
	IF EXISTS (SELECT [SkuId] FROM Hishop_ShoppingCarts WHERE UserId = @UserId AND SkuId = @SkuId)
	BEGIN
		UPDATE 
				Hishop_ShoppingCarts 
		SET 
				Quantity = Quantity + @Quantity
		WHERE 
				UserId = @UserId AND SkuId = @SkuId
	END
	ELSE
	BEGIN
		INSERT INTO Hishop_ShoppingCarts 
			(UserId, SkuId, Quantity,CategoryId) 
		VALUES 
			(@UserId, @SkuId, @Quantity,@CategoryId)
	END' 
END
GO
/****** Object:  Table [dbo].[Hishop_SKUMemberPrice]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_SKUMemberPrice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_SKUMemberPrice](
	[SkuId] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[GradeId] [int] NOT NULL,
	[MemberSalePrice] [money] NOT NULL,
 CONSTRAINT [PK_Hishop_SKUMemberPrice] PRIMARY KEY CLUSTERED 
(
	[SkuId] ASC,
	[GradeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_SKUItems]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_SKUItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_SKUItems](
	[SkuId] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[AttributeId] [int] NOT NULL,
	[ValueId] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_SKUItems] PRIMARY KEY CLUSTERED 
(
	[SkuId] ASC,
	[AttributeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Hishop_ProductAttributes]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_ProductAttributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_ProductAttributes](
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[ValueId] [int] NOT NULL,
 CONSTRAINT [PK_Hishop_ProductAttributes] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[AttributeId] ASC,
	[ValueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[cp_ClaimCode_Create]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ClaimCode_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_ClaimCode_Create]
	(
		@row int,
        @CouponId int,
        @UserId int,
        @EmailAddress nvarchar(255),
		@UserName nvarchar(256),
        @ReturnLotNumber nvarchar(300) OUTPUT
	)
AS
declare @LotNumber uniqueidentifier
set  @LotNumber=newid()
 WHILE(@row>0)
BEGIN
SET ROWCOUNT @row
    INSERT Hishop_CouponItems SELECT
         CouponId=@CouponId,
         LotNumber=@LotNumber,
        ClaimCode =SUBSTRING(REPLACE(newid(),''-'',''''),1,15),
        UserId=@UserId,UserName=@UserName,EmailAddress=@EmailAddress,GenerateTime=getdate(),CouponStatus=0,UsedTime=null,OrderId=null
    FROM syscolumns c1, syscolumns c2   
 SET @row = @row - @@ROWCOUNT
END
SET @ReturnLotNumber=CONVERT(NVARCHAR(300),@LotNumber)' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_ShippingMode_Update]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ShippingMode_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create Procedure [dbo].[cp_ShippingMode_Update]
(
 @ModeId INT =null,
 @Name nvarchar(100),
 @TemplateId INT,
 @Description nvarchar(4000)=null,
 @Status INT Output
)
as 
DECLARE @DisplaySequence INT
DECLARE @intErrorCode INT
	SELECT @Status = 99, @intErrorCode = 0
BEGIN TRAN
  --直接取出原来的序号   
   SET @DisplaySequence = (Select DisplaySequence  From Hishop_ShippingTypes where ModeId=@ModeId)
     
   Update Hishop_ShippingTypes 
   SET [Name]=@Name,TemplateId=@TemplateId , Description =@Description
   Where ModeId=@ModeId
   SET @intErrorCode = @intErrorCode + @@ERROR
      
   IF @intErrorCode = 0
    BEGIN
       DELETE FROM Hishop_TemplateRelatedShipping Where ModeId=@ModeId
   END
  IF @intErrorCode = 0
	BEGIN
		COMMIT TRAN
		SET @Status = 0
	END
	ELSE
		ROLLBACK TRAN' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_ShippingMode_Create]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_ShippingMode_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create Procedure [dbo].[cp_ShippingMode_Create]
(
 @ModeId int output,
 @Name nvarchar(100),
 @TemplateId int,	
 @Description nvarchar(4000)=null,
 @Status int Output
)
as 
DECLARE @DisplaySequence INT
SET @Status = 99
BEGIN TRAN
--如果取最大序号为空 则直接将序号设置为1
   IF  (Select Max(DisplaySequence) From Hishop_ShippingTypes) IS NUll
      SET @DisplaySequence = 1
   -- 如果不为空则将 将序号设置为表中现有的最大值加1
   ELSE
      SET @DisplaySequence = (Select Max(DisplaySequence) From Hishop_ShippingTypes) + 1
 INSERT INTO Hishop_ShippingTypes ([Name],TemplateId,[Description],DisplaySequence)
 VALUES (@Name,@TemplateId,@Description,@DisplaySequence)
  SET @ModeId = @@IDENTITY
     IF @@ROWCOUNT = 1
	   SET @Status = 0
	 
COMMIT' 
END
GO
/****** Object:  Table [dbo].[Hishop_AttributeValues]    Script Date: 07/07/2015 09:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hishop_AttributeValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hishop_AttributeValues](
	[ValueId] [int] IDENTITY(1,1) NOT NULL,
	[AttributeId] [int] NOT NULL,
	[DisplaySequence] [int] NOT NULL,
	[ValueStr] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[ImageUrl] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_Hishop_AttributeValues] PRIMARY KEY CLUSTERED 
(
	[ValueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Trigger [T_Hishop_AttributeValues_Delete]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[T_Hishop_AttributeValues_Delete]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[T_Hishop_AttributeValues_Delete]
    ON [dbo].[Hishop_AttributeValues] FOR DELETE                          
    AS       
        DELETE Hishop_ProductAttributes 
		FROM Hishop_ProductAttributes at, Deleted d  
        WHERE at.ValueID=d.ValueID'
GO
/****** Object:  StoredProcedure [dbo].[ss_ShoppingCart_GetItemInfo]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ss_ShoppingCart_GetItemInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ss_ShoppingCart_GetItemInfo]
	(
		@Quantity INT,
		@UserId INT,
		@SkuId NVARCHAR(100),
		@GradeId INT
	)
AS

DECLARE @ProductId INT, @Weight INT, @Stock INT, @SalePrice MONEY, @MemberPrice MONEY, @Discount INT, @SKU NVARCHAR(50) 

 SELECT @ProductId = ProductId, @SKU = SKU, @Weight = [Weight], @Stock = Stock, @SalePrice = SalePrice FROM Hishop_SKUs WHERE SkuId = @SkuId
-- 会员查询
IF @UserId>0 
BEGIN
	SELECT @MemberPrice = MemberSalePrice FROM Hishop_SKUMemberPrice WHERE SkuId = @SkuId AND GradeId = @GradeId
	SELECT @Discount = Discount FROM aspnet_MemberGrades WHERE GradeId = @GradeId		
	SELECT @Quantity=Quantity FROM Hishop_ShoppingCarts WHERE UserId = @UserId AND SkuId = @SkuId

	IF @MemberPrice IS NOT NULL
		SET @SalePrice = @MemberPrice
	ELSE
		SET @SalePrice = (@SalePrice * @Discount)/100
 END
	
 -- 返回商品基本信息
SELECT ProductId, SaleStatus, @SKU as SKU, @Stock as Stock, @Quantity as TotalQuantity, ProductName, CategoryId, @Weight AS [Weight], @SalePrice AS SalePrice, 
	ThumbnailUrl40,ThumbnailUrl60,ThumbnailUrl100,ThumbnailUrl160, ThumbnailUrl180, ThumbnailUrl220,IsfreeShipping,MainCategoryPath FROM Hishop_Products WHERE ProductId = @ProductId AND SaleStatus=1
-- 返回当前规格信息
SELECT s.SkuId, s.SKU, s.ProductId, s.Stock, AttributeName, ValueStr FROM Hishop_SKUs s left join Hishop_SKUItems si on s.SkuId = si.SkuId
left join Hishop_Attributes a on si.AttributeId = a.AttributeId left join Hishop_AttributeValues av on si.ValueId = av.ValueId WHERE s.SkuId = @SkuId
AND s.ProductId IN (SELECT ProductId FROM Hishop_Products WHERE SaleStatus=1)' 
END
GO
/****** Object:  StoredProcedure [dbo].[cp_Product_GetExportList]    Script Date: 07/07/2015 09:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cp_Product_GetExportList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[cp_Product_GetExportList]
	@sqlPopulate ntext
AS
	CREATE TABLE #Products
	(
		[ProductId] int,
		[TypeId] int,
		[ProductName] [nvarchar] (200),
		[ProductCode] [nvarchar] (50),
		[ShortDescription] [nvarchar] (2000),
		[Unit] [nvarchar] (50),
		[Description] [ntext],		
		[SaleStatus] [int],
		[ImageUrl1] [nvarchar] (255),
		[ImageUrl2] [nvarchar] (255),
		[ImageUrl3] [nvarchar] (255),
		[ImageUrl4] [nvarchar] (255),
		[ImageUrl5] [nvarchar] (255),
		[MarketPrice] [money],
		[HasSKU] [BIT]
	)

	-- 商品
	INSERT INTO #Products ([ProductId], [TypeId], [ProductName], [ProductCode], [ShortDescription], [Unit], [Description],
		[SaleStatus], [ImageUrl1], [ImageUrl2], [ImageUrl3], [ImageUrl4], [ImageUrl5], [MarketPrice], [HasSKU]) 
    Exec sp_executesql @sqlPopulate
	-- 类型
	SELECT TypeId, TypeName, Remark INTO  #Types FROM Hishop_ProductTypes WHERE TypeId IN (SELECT DISTINCT([TypeId]) FROM #Products WHERE #Products.TypeId IS NOT NULL)
	-- 规格
	SELECT [SkuId], [ProductId], [SKU], [Weight], [Stock], [CostPrice], [SalePrice] INTO #Skus
		FROM Hishop_SKUs WHERE ProductId IN (SELECT ProductId FROM #Products)
	-- 规格项
	SELECT [SkuId], [AttributeId], [ValueId] INTO #SKUItems FROM Hishop_SKUItems WHERE SkuId IN (SELECT SkuId FROM #Skus)
	-- 商品属性
	SELECT [ProductId], [AttributeId], [ValueId] INTO #ProductAttributes FROM Hishop_ProductAttributes WHERE ProductId IN (SELECT ProductId FROM #Products)
	-- 属性
	SELECT [AttributeId], [AttributeName], [DisplaySequence], [TypeId], [UsageMode], [UseAttributeImage] INTO #Attributes 
		FROM Hishop_Attributes WHERE [AttributeId] IN (SELECT DISTINCT([AttributeId]) FROM #SKUItems UNION SELECT DISTINCT([AttributeId]) FROM #ProductAttributes)
	-- 属性值
	SELECT [ValueId], [AttributeId], [DisplaySequence], [ValueStr], [ImageUrl] INTO #Values 
		FROM Hishop_AttributeValues WHERE [ValueId] IN (SELECT DISTINCT([ValueId]) FROM #SKUItems UNION SELECT DISTINCT([ValueId]) FROM #ProductAttributes)
		
	---淘宝属性值
	SELECT  *
		INTO #TaoBaoSKU FROM dbo.Taobao_Products WHERE [ProductId] IN (SELECT ProductId FROM #Products) 


	-- 输出商品类型
	SELECT * FROM #Types
	-- 输出类型的属性
	SELECT * FROM #Attributes
	--输出属性值
	SELECT * FROM #Values
	--输出商品信息
	SELECT * FROM #Products
	-- 输出商品规格信息
	SELECT * FROM #Skus
	-- 输出商品规格的字段值
	SELECT * FROM #SKUItems
	-- 输出商品属性
	SELECT * FROM #ProductAttributes
	-- 输出淘宝属性值
	SELECT * FROM #TaoBaoSKU

	DROP TABLE #Types
	DROP TABLE #Attributes
	DROP TABLE #Values
	DROP TABLE #Products
	DROP TABLE #Skus
	DROP TABLE #SKUItems
	DROP TABLE #ProductAttributes
	DROP TABLE #TaoBaoSKU' 
END
GO
/****** Object:  Default [DF_aspnet_DistributorGrade_FirstCommissionRise]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_DistributorGrade_FirstCommissionRise]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_DistributorGrade_FirstCommissionRise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_DistributorGrade] ADD  CONSTRAINT [DF_aspnet_DistributorGrade_FirstCommissionRise]  DEFAULT ((0)) FOR [FirstCommissionRise]
END


End
GO
/****** Object:  Default [DF_aspnet_DistributorGrade_SecondCommissionRise]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_DistributorGrade_SecondCommissionRise]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_DistributorGrade_SecondCommissionRise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_DistributorGrade] ADD  CONSTRAINT [DF_aspnet_DistributorGrade_SecondCommissionRise]  DEFAULT ((0)) FOR [SecondCommissionRise]
END


End
GO
/****** Object:  Default [DF_aspnet_DistributorGrade_ThirdCommissionRise]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_DistributorGrade_ThirdCommissionRise]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_DistributorGrade_ThirdCommissionRise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_DistributorGrade] ADD  CONSTRAINT [DF_aspnet_DistributorGrade_ThirdCommissionRise]  DEFAULT ((0)) FOR [ThirdCommissionRise]
END


End
GO
/****** Object:  Default [DF_aspnet_DistributorGrade_Ico]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_DistributorGrade_Ico]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_DistributorGrade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_DistributorGrade_Ico]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_DistributorGrade] ADD  CONSTRAINT [DF_aspnet_DistributorGrade_Ico]  DEFAULT ('/utility/pics/grade.png') FOR [Ico]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_OrdersTotal]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_OrdersTotal]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_OrdersTotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] ADD  CONSTRAINT [DF_aspnet_Distributors_OrdersTotal]  DEFAULT ((0)) FOR [OrdersTotal]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_ReferralOrders]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_ReferralOrders]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_ReferralOrders]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] ADD  CONSTRAINT [DF_aspnet_Distributors_ReferralOrders]  DEFAULT ((0)) FOR [ReferralOrders]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_ReferralBlance]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_ReferralBlance]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_ReferralBlance]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] ADD  CONSTRAINT [DF_aspnet_Distributors_ReferralBlance]  DEFAULT ((0)) FOR [ReferralBlance]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_ReferralRequestBalance]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_ReferralRequestBalance]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_ReferralRequestBalance]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] ADD  CONSTRAINT [DF_aspnet_Distributors_ReferralRequestBalance]  DEFAULT ((0)) FOR [ReferralRequestBalance]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_CreateTime]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_CreateTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_CreateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] ADD  CONSTRAINT [DF_aspnet_Distributors_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
END


End
GO
/****** Object:  Default [DF_aspnet_Distributors_ReferralStatus]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_ReferralStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_ReferralStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] ADD  CONSTRAINT [DF_aspnet_Distributors_ReferralStatus]  DEFAULT ((1)) FOR [ReferralStatus]
END
End
GO
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Distributors_IsAgent]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Distributors]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Distributors_IsAgent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Distributors] ADD  CONSTRAINT [DF_aspnet_Distributors_IsAgent]  DEFAULT ((0)) FOR [IsAgent]
END
End
GO
/****** Object:  Default [DF_aspnet_Members_OrderNumber]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Members_OrderNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Members]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Members_OrderNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Members] ADD  CONSTRAINT [DF_aspnet_Members_OrderNumber]  DEFAULT ((0)) FOR [OrderNumber]
END


End
GO
/****** Object:  Default [DF_aspnet_Members_Expenditure]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Members_Expenditure]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Members]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Members_Expenditure]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Members] ADD  CONSTRAINT [DF_aspnet_Members_Expenditure]  DEFAULT ((0)) FOR [Expenditure]
END


End
GO
/****** Object:  Default [DF_aspnet_Members_Points]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_aspnet_Members_Points]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Members]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_aspnet_Members_Points]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Members] ADD  CONSTRAINT [DF_aspnet_Members_Points]  DEFAULT ((0)) FOR [Points]
END


End
GO
/****** Object:  Default [DF_Hishop_Activities_TakeEffect]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Activities_TakeEffect]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Activities]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Activities_TakeEffect]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Activities] ADD  CONSTRAINT [DF_Hishop_Activities_TakeEffect]  DEFAULT ((0)) FOR [TakeEffect]
END


End
GO
/****** Object:  Default [DF_Hishop_Advertising_AddedDate]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Advertising_AddedDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Advertising]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Advertising_AddedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Advertising] ADD  CONSTRAINT [DF_Hishop_Advertising_AddedDate]  DEFAULT (getdate()) FOR [AddedDate]
END


End
GO
/****** Object:  Default [DF_Hishop_BalanceDrawRequest_RequestType]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_BalanceDrawRequest_RequestType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_BalanceDrawRequest_RequestType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest] ADD  CONSTRAINT [DF_Hishop_BalanceDrawRequest_RequestType]  DEFAULT ((1)) FOR [RequestType]
END


End
GO
/****** Object:  Default [DF_RequestTime]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_RequestTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RequestTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest] ADD  CONSTRAINT [DF_RequestTime]  DEFAULT (getdate()) FOR [RequestTime]
END


End
GO
/****** Object:  Default [DF_Hishop_BalanceDrawRequest_RedpackRecordNum]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_BalanceDrawRequest_RedpackRecordNum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_BalanceDrawRequest_RedpackRecordNum]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest] ADD  CONSTRAINT [DF_Hishop_BalanceDrawRequest_RedpackRecordNum]  DEFAULT ((0)) FOR [RedpackRecordNum]
END


End
GO
/****** Object:  Default [DF_Hishop_BalanceDrawRequest_IsCheck]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_BalanceDrawRequest_IsCheck]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_BalanceDrawRequest]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_BalanceDrawRequest_IsCheck]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_BalanceDrawRequest] ADD  CONSTRAINT [DF_Hishop_BalanceDrawRequest_IsCheck]  DEFAULT ((0)) FOR [IsCheck]
END


End
GO
/****** Object:  Default [DF_Hishop_Categories_HasChildren]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Categories_HasChildren]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Categories_HasChildren]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Categories] ADD  CONSTRAINT [DF_Hishop_Categories_HasChildren]  DEFAULT ((0)) FOR [HasChildren]
END


End
GO
/****** Object:  Default [DF_Hishop_Commissions_TradeTime]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Commissions_TradeTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Commissions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Commissions_TradeTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Commissions] ADD  CONSTRAINT [DF_Hishop_Commissions_TradeTime]  DEFAULT (getdate()) FOR [TradeTime]
END


End
GO
/****** Object:  Default [DF_Hishop_CouponItems_CouponStatus]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_CouponItems_CouponStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_CouponItems]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_CouponItems_CouponStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_CouponItems] ADD  CONSTRAINT [DF_Hishop_CouponItems_CouponStatus]  DEFAULT ((0)) FOR [CouponStatus]
END


End
GO
/****** Object:  Default [DF_Hishop_Coupons_SentCount]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Coupons_SentCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Coupons]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Coupons_SentCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Coupons] ADD  CONSTRAINT [DF_Hishop_Coupons_SentCount]  DEFAULT ((0)) FOR [SentCount]
END


End
GO
/****** Object:  Default [DF_Hishop_Coupons_UsedCount]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Coupons_UsedCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Coupons]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Coupons_UsedCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Coupons] ADD  CONSTRAINT [DF_Hishop_Coupons_UsedCount]  DEFAULT ((0)) FOR [UsedCount]
END


End
GO
/****** Object:  Default [DF_Hishop_Coupons_NeedPoint]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Coupons_NeedPoint]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Coupons]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Coupons_NeedPoint]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Coupons] ADD  CONSTRAINT [DF_Hishop_Coupons_NeedPoint]  DEFAULT ((0)) FOR [NeedPoint]
END


End
GO
/****** Object:  Default [DF_Hishop_FriendExtension_CreateTime]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_FriendExtension_CreateTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_FriendExtension]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_FriendExtension_CreateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_FriendExtension] ADD  CONSTRAINT [DF_Hishop_FriendExtension_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
END


End
GO
/****** Object:  Default [DF_Hishop_GroupBuy_DisplaySequence]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_GroupBuy_DisplaySequence]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_GroupBuy]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_GroupBuy_DisplaySequence]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_GroupBuy] ADD  CONSTRAINT [DF_Hishop_GroupBuy_DisplaySequence]  DEFAULT ((0)) FOR [DisplaySequence]
END


End
GO
/****** Object:  Default [DF__Hishop_Gr__SoldC__0BE6BFCF]    Script Date: 07/07/2015 09:27:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Hishop_Gr__SoldC__0BE6BFCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_GroupBuy]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Hishop_Gr__SoldC__0BE6BFCF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_GroupBuy] ADD  CONSTRAINT [DF__Hishop_Gr__SoldC__0BE6BFCF]  DEFAULT ((0)) FOR [SoldCount]
END


End
GO
/****** Object:  Default [DF_Hishop_MessageTemplates_SendEmail]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_MessageTemplates_SendEmail]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_MessageTemplates_SendEmail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_MessageTemplates] ADD  CONSTRAINT [DF_Hishop_MessageTemplates_SendEmail]  DEFAULT ((0)) FOR [SendEmail]
END


End
GO
/****** Object:  Default [DF_Hishop_MessageTemplates_SendSMS]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_MessageTemplates_SendSMS]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_MessageTemplates_SendSMS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_MessageTemplates] ADD  CONSTRAINT [DF_Hishop_MessageTemplates_SendSMS]  DEFAULT ((0)) FOR [SendSMS]
END


End
GO
/****** Object:  Default [DF_Hishop_MessageTemplates_SendInnerMessage]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_MessageTemplates_SendInnerMessage]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_MessageTemplates_SendInnerMessage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_MessageTemplates] ADD  CONSTRAINT [DF_Hishop_MessageTemplates_SendInnerMessage]  DEFAULT ((0)) FOR [SendInnerMessage]
END


End
GO
/****** Object:  Default [DF_Hishop_MessageTemplates_SendWeixinMessage]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_MessageTemplates_SendWeixinMessage]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_MessageTemplates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_MessageTemplates_SendWeixinMessage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_MessageTemplates] ADD  CONSTRAINT [DF_Hishop_MessageTemplates_SendWeixinMessage]  DEFAULT ((0)) FOR [SendWeixin]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_ItemAdjustedCommssion]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_ItemAdjustedCommssion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_ItemAdjustedCommssion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_OrderItems] ADD  CONSTRAINT [DF_Hishop_Orders_ItemAdjustedCommssion]  DEFAULT ((0)) FOR [ItemAdjustedCommssion]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_ItemsCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_ItemsCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_ItemsCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_OrderItems] ADD  CONSTRAINT [DF_Hishop_Orders_ItemsCommission]  DEFAULT ((0)) FOR [ItemsCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_SecondItemsCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_SecondItemsCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_SecondItemsCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_OrderItems] ADD  CONSTRAINT [DF_Hishop_Orders_SecondItemsCommission]  DEFAULT ((0)) FOR [SecondItemsCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_ThirdItemsCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_ThirdItemsCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_ThirdItemsCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_OrderItems] ADD  CONSTRAINT [DF_Hishop_Orders_ThirdItemsCommission]  DEFAULT ((0)) FOR [ThirdItemsCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_DiscountAmount]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_DiscountAmount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_DiscountAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] ADD  CONSTRAINT [DF_Hishop_Orders_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_FirstCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_FirstCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_FirstCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] ADD  CONSTRAINT [DF_Hishop_Orders_FirstCommission]  DEFAULT ((0)) FOR [FirstCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_SecondCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_SecondCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_SecondCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] ADD  CONSTRAINT [DF_Hishop_Orders_SecondCommission]  DEFAULT ((0)) FOR [SecondCommission]
END


End
GO
/****** Object:  Default [DF_Hishop_Orders_ThirdCommission]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Orders_ThirdCommission]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Orders_ThirdCommission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] ADD  CONSTRAINT [DF_Hishop_Orders_ThirdCommission]  DEFAULT ((0)) FOR [ThirdCommission]
END


End
GO
/****** Object:  Default [DF_RedPagerOrderAmountCanUse]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_RedPagerOrderAmountCanUse]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RedPagerOrderAmountCanUse]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] ADD  CONSTRAINT [DF_RedPagerOrderAmountCanUse]  DEFAULT ((0)) FOR [RedPagerOrderAmountCanUse]
END


End
GO
/****** Object:  Default [DF_RedPagerAmount]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_RedPagerAmount]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Orders]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RedPagerAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Orders] ADD  CONSTRAINT [DF_RedPagerAmount]  DEFAULT ((0)) FOR [RedPagerAmount]
END


End
GO
/****** Object:  Default [DF_Hishop_PaymentTypes_IsUseInpour]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_PaymentTypes_IsUseInpour]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_PaymentTypes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_PaymentTypes_IsUseInpour]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_PaymentTypes] ADD  CONSTRAINT [DF_Hishop_PaymentTypes_IsUseInpour]  DEFAULT ('true') FOR [IsUseInpour]
END


End
GO
/****** Object:  Default [DF_Hishop_PaymentTypes_IsUseInDistributor]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_PaymentTypes_IsUseInDistributor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_PaymentTypes]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_PaymentTypes_IsUseInDistributor]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_PaymentTypes] ADD  CONSTRAINT [DF_Hishop_PaymentTypes_IsUseInDistributor]  DEFAULT ('true') FOR [IsUseInDistributor]
END


End
GO
/****** Object:  Default [DF_Hishop_Products_VistiCounts]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Products_VistiCounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Products]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Products_VistiCounts]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Products] ADD  CONSTRAINT [DF_Hishop_Products_VistiCounts]  DEFAULT ((0)) FOR [VistiCounts]
END


End
GO
/****** Object:  Default [DF_Hishop_Products_SaleCounts]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Products_SaleCounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Products]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Products_SaleCounts]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Products] ADD  CONSTRAINT [DF_Hishop_Products_SaleCounts]  DEFAULT ((0)) FOR [SaleCounts]
END


End
GO
/****** Object:  Default [DF_Hishop_Products_ShowSaleCounts]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Products_ShowSaleCounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Products]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Products_ShowSaleCounts]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Products] ADD  CONSTRAINT [DF_Hishop_Products_ShowSaleCounts]  DEFAULT ((0)) FOR [ShowSaleCounts]
END


End
GO
/****** Object:  Default [DF_Hishop_Products_DisplaySequence]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Products_DisplaySequence]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Products]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Products_DisplaySequence]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Products] ADD  CONSTRAINT [DF_Hishop_Products_DisplaySequence]  DEFAULT ((0)) FOR [DisplaySequence]
END


End
GO
/****** Object:  Default [DF_Hishop_Shippers_DistributorUserId]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_Shippers_DistributorUserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Shippers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_Shippers_DistributorUserId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_Shippers] ADD  CONSTRAINT [DF_Hishop_Shippers_DistributorUserId]  DEFAULT ((0)) FOR [DistributorUserId]
END


End
GO
/****** Object:  Default [DF_Hishop_ShoppingCarts_AddTime]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_ShoppingCarts_AddTime]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShoppingCarts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_ShoppingCarts_AddTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_ShoppingCarts] ADD  CONSTRAINT [DF_Hishop_ShoppingCarts_AddTime]  DEFAULT (getdate()) FOR [AddTime]
END


End
GO
/****** Object:  Default [DF_Hishop_ShoppingCarts_CategoryId]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Hishop_ShoppingCarts_CategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShoppingCarts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Hishop_ShoppingCarts_CategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_ShoppingCarts] ADD  CONSTRAINT [DF_Hishop_ShoppingCarts_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
END


End
GO
/****** Object:  Default [DF__Hishop_Us__IsDef__0CDAE408]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Hishop_Us__IsDef__0CDAE408]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_UserShippingAddresses]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Hishop_Us__IsDef__0CDAE408]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Hishop_UserShippingAddresses] ADD  CONSTRAINT [DF__Hishop_Us__IsDef__0CDAE408]  DEFAULT ((0)) FOR [IsDefault]
END


End
GO
/****** Object:  Default [DF_vshop_Red_CategoryId]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_Red_CategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_Red_CategoryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] ADD  CONSTRAINT [DF_vshop_Red_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
END


End
GO
/****** Object:  Default [DF_vshop_MinOrderAmount]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_MinOrderAmount]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_MinOrderAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] ADD  CONSTRAINT [DF_vshop_MinOrderAmount]  DEFAULT ((0)) FOR [MinOrderAmount]
END


End
GO
/****** Object:  Default [DF_vshop_MaxGetTimes]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_MaxGetTimes]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_MaxGetTimes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] ADD  CONSTRAINT [DF_vshop_MaxGetTimes]  DEFAULT ((0)) FOR [MaxGetTimes]
END


End
GO
/****** Object:  Default [DF_vshop_ItemAmountLimit]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_ItemAmountLimit]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_ItemAmountLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] ADD  CONSTRAINT [DF_vshop_ItemAmountLimit]  DEFAULT ((0)) FOR [ItemAmountLimit]
END


End
GO
/****** Object:  Default [DF_vshop_ExpiryDays]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_ExpiryDays]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_ExpiryDays]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] ADD  CONSTRAINT [DF_vshop_ExpiryDays]  DEFAULT ((0)) FOR [ExpiryDays]
END


End
GO
/****** Object:  Default [DF_vshop_OrderAmountCanUse]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_OrderAmountCanUse]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_OrderAmountCanUse]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] ADD  CONSTRAINT [DF_vshop_OrderAmountCanUse]  DEFAULT ((0)) FOR [OrderAmountCanUse]
END


End
GO
/****** Object:  Default [DF_vshop_IsOpen]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_vshop_IsOpen]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_RedPagerActivity]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_vshop_IsOpen]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_RedPagerActivity] ADD  CONSTRAINT [DF_vshop_IsOpen]  DEFAULT ((1)) FOR [IsOpen]
END


End
GO
/****** Object:  Default [DF__vshop_Sen__IsSen__30242045]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__vshop_Sen__IsSen__30242045]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_SendRedpackRecord]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__vshop_Sen__IsSen__30242045]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_SendRedpackRecord] ADD  CONSTRAINT [DF__vshop_Sen__IsSen__30242045]  DEFAULT ((0)) FOR [IsSend]
END


End
GO
/****** Object:  Default [DF__vshop_Use__IsUse__2C538F61]    Script Date: 07/07/2015 09:27:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__vshop_Use__IsUse__2C538F61]') AND parent_object_id = OBJECT_ID(N'[dbo].[vshop_UserRedPager]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__vshop_Use__IsUse__2C538F61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[vshop_UserRedPager] ADD  CONSTRAINT [DF__vshop_Use__IsUse__2C538F61]  DEFAULT ((0)) FOR [IsUsed]
END


End
GO
/****** Object:  ForeignKey [FK_Hishop_Attributes_ProductTypes]    Script Date: 07/07/2015 09:27:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_Attributes_ProductTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Attributes]'))
ALTER TABLE [dbo].[Hishop_Attributes]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_Attributes_ProductTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Hishop_ProductTypes] ([TypeId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_Attributes_ProductTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_Attributes]'))
ALTER TABLE [dbo].[Hishop_Attributes] CHECK CONSTRAINT [FK_Hishop_Attributes_ProductTypes]
GO
/****** Object:  ForeignKey [FK_Hishop_AttributeValues_Attributes]    Script Date: 07/07/2015 09:27:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_AttributeValues_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_AttributeValues]'))
ALTER TABLE [dbo].[Hishop_AttributeValues]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_AttributeValues_Attributes] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Hishop_Attributes] ([AttributeId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_AttributeValues_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_AttributeValues]'))
ALTER TABLE [dbo].[Hishop_AttributeValues] CHECK CONSTRAINT [FK_Hishop_AttributeValues_Attributes]
GO
/****** Object:  ForeignKey [FK_Hishop_CouponItems__Coupons]    Script Date: 07/07/2015 09:27:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_CouponItems__Coupons]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_CouponItems]'))
ALTER TABLE [dbo].[Hishop_CouponItems]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_CouponItems__Coupons] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Hishop_Coupons] ([CouponId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_CouponItems__Coupons]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_CouponItems]'))
ALTER TABLE [dbo].[Hishop_CouponItems] CHECK CONSTRAINT [FK_Hishop_CouponItems__Coupons]
GO
/****** Object:  ForeignKey [FK_Hishop_GroupBuy_Products]    Script Date: 07/07/2015 09:27:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_GroupBuy_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_GroupBuy]'))
ALTER TABLE [dbo].[Hishop_GroupBuy]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_GroupBuy_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Hishop_Products] ([ProductId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_GroupBuy_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_GroupBuy]'))
ALTER TABLE [dbo].[Hishop_GroupBuy] CHECK CONSTRAINT [FK_Hishop_GroupBuy_Products]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderDebitNote_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderDebitNote_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderDebitNote]'))
ALTER TABLE [dbo].[Hishop_OrderDebitNote]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_OrderDebitNote_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Hishop_Orders] ([OrderId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderDebitNote_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderDebitNote]'))
ALTER TABLE [dbo].[Hishop_OrderDebitNote] CHECK CONSTRAINT [FK_Hishop_OrderDebitNote_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderItems_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderItems_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
ALTER TABLE [dbo].[Hishop_OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_OrderItems_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Hishop_Orders] ([OrderId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderItems_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderItems]'))
ALTER TABLE [dbo].[Hishop_OrderItems] CHECK CONSTRAINT [FK_Hishop_OrderItems_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderRefund_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderRefund_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderRefund]'))
ALTER TABLE [dbo].[Hishop_OrderRefund]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_OrderRefund_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Hishop_Orders] ([OrderId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderRefund_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderRefund]'))
ALTER TABLE [dbo].[Hishop_OrderRefund] CHECK CONSTRAINT [FK_Hishop_OrderRefund_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderReplace_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderReplace_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReplace]'))
ALTER TABLE [dbo].[Hishop_OrderReplace]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_OrderReplace_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Hishop_Orders] ([OrderId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderReplace_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReplace]'))
ALTER TABLE [dbo].[Hishop_OrderReplace] CHECK CONSTRAINT [FK_Hishop_OrderReplace_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderReturns_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderReturns_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReturns]'))
ALTER TABLE [dbo].[Hishop_OrderReturns]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_OrderReturns_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Hishop_Orders] ([OrderId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderReturns_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderReturns]'))
ALTER TABLE [dbo].[Hishop_OrderReturns] CHECK CONSTRAINT [FK_Hishop_OrderReturns_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_OrderSendNote_Orders]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderSendNote_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderSendNote]'))
ALTER TABLE [dbo].[Hishop_OrderSendNote]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_OrderSendNote_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Hishop_Orders] ([OrderId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_OrderSendNote_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_OrderSendNote]'))
ALTER TABLE [dbo].[Hishop_OrderSendNote] CHECK CONSTRAINT [FK_Hishop_OrderSendNote_Orders]
GO
/****** Object:  ForeignKey [FK_Hishop_PointDetails_aspnet_Memberss]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_PointDetails_aspnet_Memberss]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_PointDetails]'))
ALTER TABLE [dbo].[Hishop_PointDetails]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_PointDetails_aspnet_Memberss] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Members] ([UserId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_PointDetails_aspnet_Memberss]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_PointDetails]'))
ALTER TABLE [dbo].[Hishop_PointDetails] CHECK CONSTRAINT [FK_Hishop_PointDetails_aspnet_Memberss]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductAttributes_Attributes]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductAttributes_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductAttributes]'))
ALTER TABLE [dbo].[Hishop_ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_ProductAttributes_Attributes] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Hishop_Attributes] ([AttributeId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductAttributes_Attributes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductAttributes]'))
ALTER TABLE [dbo].[Hishop_ProductAttributes] CHECK CONSTRAINT [FK_Hishop_ProductAttributes_Attributes]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductAttributes_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductAttributes_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductAttributes]'))
ALTER TABLE [dbo].[Hishop_ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_ProductAttributes_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Hishop_Products] ([ProductId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductAttributes_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductAttributes]'))
ALTER TABLE [dbo].[Hishop_ProductAttributes] CHECK CONSTRAINT [FK_Hishop_ProductAttributes_Products]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductTag_Hishop_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductTag_Hishop_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTag]'))
ALTER TABLE [dbo].[Hishop_ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_ProductTag_Hishop_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Hishop_Products] ([ProductId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductTag_Hishop_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTag]'))
ALTER TABLE [dbo].[Hishop_ProductTag] CHECK CONSTRAINT [FK_Hishop_ProductTag_Hishop_Products]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductTypeBrands_Hishop_BrandCategories]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductTypeBrands_Hishop_BrandCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypeBrands]'))
ALTER TABLE [dbo].[Hishop_ProductTypeBrands]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_ProductTypeBrands_Hishop_BrandCategories] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Hishop_BrandCategories] ([BrandId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductTypeBrands_Hishop_BrandCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypeBrands]'))
ALTER TABLE [dbo].[Hishop_ProductTypeBrands] CHECK CONSTRAINT [FK_Hishop_ProductTypeBrands_Hishop_BrandCategories]
GO
/****** Object:  ForeignKey [FK_Hishop_ProductTypeBrands_Hishop_ProductTypes]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductTypeBrands_Hishop_ProductTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypeBrands]'))
ALTER TABLE [dbo].[Hishop_ProductTypeBrands]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_ProductTypeBrands_Hishop_ProductTypes] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[Hishop_ProductTypes] ([TypeId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ProductTypeBrands_Hishop_ProductTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ProductTypeBrands]'))
ALTER TABLE [dbo].[Hishop_ProductTypeBrands] CHECK CONSTRAINT [FK_Hishop_ProductTypeBrands_Hishop_ProductTypes]
GO
/****** Object:  ForeignKey [FK_Hishop_ShippingRegions_ShippingTypes]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShippingRegions_ShippingTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingRegions]'))
ALTER TABLE [dbo].[Hishop_ShippingRegions]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_ShippingRegions_ShippingTypes] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Hishop_ShippingTemplates] ([TemplateId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShippingRegions_ShippingTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingRegions]'))
ALTER TABLE [dbo].[Hishop_ShippingRegions] CHECK CONSTRAINT [FK_Hishop_ShippingRegions_ShippingTypes]
GO
/****** Object:  ForeignKey [FK_Hishop_ShippingTypeGroups_ShippingTemplates]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShippingTypeGroups_ShippingTemplates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypeGroups]'))
ALTER TABLE [dbo].[Hishop_ShippingTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_ShippingTypeGroups_ShippingTemplates] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Hishop_ShippingTemplates] ([TemplateId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShippingTypeGroups_ShippingTemplates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypeGroups]'))
ALTER TABLE [dbo].[Hishop_ShippingTypeGroups] CHECK CONSTRAINT [FK_Hishop_ShippingTypeGroups_ShippingTemplates]
GO
/****** Object:  ForeignKey [FK_Hishop_ShippingTypes_ShippingTemplates]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShippingTypes_ShippingTemplates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypes]'))
ALTER TABLE [dbo].[Hishop_ShippingTypes]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_ShippingTypes_ShippingTemplates] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Hishop_ShippingTemplates] ([TemplateId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShippingTypes_ShippingTemplates]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShippingTypes]'))
ALTER TABLE [dbo].[Hishop_ShippingTypes] CHECK CONSTRAINT [FK_Hishop_ShippingTypes_ShippingTemplates]
GO
/****** Object:  ForeignKey [FK_Hishop_ShoppingCarts_aspnet_Members]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShoppingCarts_aspnet_Members]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShoppingCarts]'))
ALTER TABLE [dbo].[Hishop_ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_ShoppingCarts_aspnet_Members] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Members] ([UserId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_ShoppingCarts_aspnet_Members]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_ShoppingCarts]'))
ALTER TABLE [dbo].[Hishop_ShoppingCarts] CHECK CONSTRAINT [FK_Hishop_ShoppingCarts_aspnet_Members]
GO
/****** Object:  ForeignKey [FK_Hishop_SKUItems_SKUs]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUItems_SKUs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUItems]'))
ALTER TABLE [dbo].[Hishop_SKUItems]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_SKUItems_SKUs] FOREIGN KEY([SkuId])
REFERENCES [dbo].[Hishop_SKUs] ([SkuId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUItems_SKUs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUItems]'))
ALTER TABLE [dbo].[Hishop_SKUItems] CHECK CONSTRAINT [FK_Hishop_SKUItems_SKUs]
GO
/****** Object:  ForeignKey [FK_Hishop_SKUMemberPrice_aspnet_MemberGrades]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUMemberPrice_aspnet_MemberGrades]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUMemberPrice]'))
ALTER TABLE [dbo].[Hishop_SKUMemberPrice]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_SKUMemberPrice_aspnet_MemberGrades] FOREIGN KEY([GradeId])
REFERENCES [dbo].[aspnet_MemberGrades] ([GradeId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUMemberPrice_aspnet_MemberGrades]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUMemberPrice]'))
ALTER TABLE [dbo].[Hishop_SKUMemberPrice] CHECK CONSTRAINT [FK_Hishop_SKUMemberPrice_aspnet_MemberGrades]
GO
/****** Object:  ForeignKey [FK_Hishop_SKUMemberPrice_SKUs]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUMemberPrice_SKUs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUMemberPrice]'))
ALTER TABLE [dbo].[Hishop_SKUMemberPrice]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_SKUMemberPrice_SKUs] FOREIGN KEY([SkuId])
REFERENCES [dbo].[Hishop_SKUs] ([SkuId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUMemberPrice_SKUs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUMemberPrice]'))
ALTER TABLE [dbo].[Hishop_SKUMemberPrice] CHECK CONSTRAINT [FK_Hishop_SKUMemberPrice_SKUs]
GO
/****** Object:  ForeignKey [FK_Hishop_SKUs_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUs_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUs]'))
ALTER TABLE [dbo].[Hishop_SKUs]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_SKUs_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Hishop_Products] ([ProductId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_SKUs_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_SKUs]'))
ALTER TABLE [dbo].[Hishop_SKUs] CHECK CONSTRAINT [FK_Hishop_SKUs_Products]
GO
/****** Object:  ForeignKey [FK_Hishop_UserShippingAddresses_aspnet_Memberss]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_UserShippingAddresses_aspnet_Memberss]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_UserShippingAddresses]'))
ALTER TABLE [dbo].[Hishop_UserShippingAddresses]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_UserShippingAddresses_aspnet_Memberss] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Members] ([UserId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_UserShippingAddresses_aspnet_Memberss]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_UserShippingAddresses]'))
ALTER TABLE [dbo].[Hishop_UserShippingAddresses] CHECK CONSTRAINT [FK_Hishop_UserShippingAddresses_aspnet_Memberss]
GO
/****** Object:  ForeignKey [FK_Hishop_VoteItems_Votes]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_VoteItems_Votes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_VoteItems]'))
ALTER TABLE [dbo].[Hishop_VoteItems]  WITH CHECK ADD  CONSTRAINT [FK_Hishop_VoteItems_Votes] FOREIGN KEY([VoteId])
REFERENCES [dbo].[Hishop_Votes] ([VoteId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Hishop_VoteItems_Votes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Hishop_VoteItems]'))
ALTER TABLE [dbo].[Hishop_VoteItems] CHECK CONSTRAINT [FK_Hishop_VoteItems_Votes]
GO
/****** Object:  ForeignKey [FK_Taobao_Products_Hishop_Products]    Script Date: 07/07/2015 09:27:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Taobao_Products_Hishop_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Taobao_Products]'))
ALTER TABLE [dbo].[Taobao_Products]  WITH CHECK ADD  CONSTRAINT [FK_Taobao_Products_Hishop_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Hishop_Products] ([ProductId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Taobao_Products_Hishop_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Taobao_Products]'))
ALTER TABLE [dbo].[Taobao_Products] CHECK CONSTRAINT [FK_Taobao_Products_Hishop_Products]
GO
