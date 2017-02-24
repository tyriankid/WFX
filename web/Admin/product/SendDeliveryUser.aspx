<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SendDeliveryUser.aspx.cs" Inherits="Hidistro.UI.Web.Admin.product.SendDeliveryUser"  %>
<%@ Import Namespace="Hidistro.Core"%>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="validateHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHolder" runat="server">
<div class="dataarea mainwidth databody">
	 <div class="title"> <em><img src="../images/01.gif" width="32" height="32" /></em>
	    <h1 class="title_line">选择配送员</h1>
	    <span class="font">选择订单的配送员进行配送</span>
     </div>


    <div class="Pg_15 Pg_010" style="text-align:center;">
        <asp:Button ID="btnSaveInfo" runat="server" OnClientClick="return PageIsValid();" Text="保存"  CssClass="submit_DAqueding"/>

    </div>

    
     <div class="datalist">
         <asp:Repeater ID="SelectedDeliveryUsers" runat="server">
             <HeaderTemplate>
                <table border="1" width="100%">
                    <tr>
                    <th style="display:none">id</th>
                    <th>选择</th>
                    <th>配送员</th>
                    <th>联系方式</th>
                    </tr>
            </HeaderTemplate>
             <ItemTemplate>
                <tr>
                <td style="display:none"><%#Eval("DeliveryUserId")%></td>
                <td><input type="checkbox" role="chk"  runat="server" id="chkboxDeliveryUserId" value='<%#Eval("DeliveryUserId")%>'/></td>
                <td><%#Eval("UserName")%></td>
                <td><%#Eval("Phone")%></td>
                </tr>
            </ItemTemplate>


             <FooterTemplate>
            </table>
            </FooterTemplate>
         </asp:Repeater>
    </div>     

     
</div>
    
<script>
    function CloseWindow() {
        var win = art.dialog.open.origin; //来源页面
        // 如果父页面重载或者关闭其子对话框全部会关闭
        win.location.reload();
    }

    //return false;
</script>
</asp:Content>
