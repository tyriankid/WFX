﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SetOrderCoupon.aspx.cs" Inherits="Hidistro.UI.Web.Admin.SetOrderCoupon" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>

<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<%@ Import Namespace="Hidistro.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="validateHolder" runat="server"> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHolder" runat="server">
<div class="dataarea mainwidth databody">
      <div class="title"> <em><img src="../images/01.gif" width="32" height="32" /></em>
        <h1>购买送券</h1>
        <span>购买商品时赠送优惠券比例设置</span>
      </div>
      <div class="datafrom">
          <div class="formitem validator1">
           <ul>
            <li><span class="formitemtitle Pw_198"><em >*</em>活动是否开启：</span>
                <asp:CheckBox ID="chkOnOff" runat="server" />
            </li>
            <li><span class="formitemtitle Pw_198"><em >*</em>优惠券面值比例：</span>
              <asp:TextBox onkeyup="value=value.replace(/\D/g,'')"  ID="txtPriceRent" runat="server" CssClass="forminput" />%
              <p id="txtPriceRentTip" runat="server">优惠券面值比例,假设输入8%,用户购买1000元商品后就会得到面值为80元的优惠券一张</p>
            </li>
              <ul class="btntf Pa_198">
                    <asp:Button ID="btnOK" runat="server" Text="提 交" CssClass="submit_DAqueding inbnt"   />
	          </ul>
          </div>
      </div>
</div>  


    <script src="/Utility/jquery-1.6.4.min.js"></script>
    <script>
        $(document).ready(function () {

        });
</script>
</asp:Content>

