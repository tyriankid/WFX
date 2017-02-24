<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="ManageMenu.aspx.cs" Inherits="Admin_ManageMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="/admin/css/css.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="zTree/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="zTree/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="zTree/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="zTree/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="../Utility/windows.js"></script>
    <link rel="stylesheet" href="/admin/css/windows.css" type="text/css" media="screen" />
       <SCRIPT type="text/javascript">
		<!--
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };

    var zNodes = [
        { id: 1, pId: 0, name: "微配置", open: true, iconOpen: "zTree/img/diy/1_open.png", iconClose: "zTree/img/diy/1_close.png",Link:"vshop/VServerConfig.aspx" },
        { id: 11, pId: 1, name: "微信配置", open: true, Link: "" },
        { id: 111, pId: 11, name: "商城配置", Link: "vshop/VServerConfig.aspx" },
        { id: 112, pId: 11, name: "自定义回复", Link: "vshop/ReplyOnKey.aspx" },
        { id: 113, pId: 11, name: "自定义菜单配置", Link: "vshop/ManageMenu.aspx" },
        { id: 114, pId: 11, name: "消息提醒设置", Link: "tools/sendmessagetemplets.aspx" },
        { id: 12, pId: 1, name: "微信模板", open: true, Link: "" },
        { id: 121, pId: 12, name: "模板选择" ,Link:"vshop/ManageVThemes.aspx"},
        { id: 13, pId: 1, name: "支付设置", open: true, Link: "vshop/PayConfig.aspx" },
        { id: 131, pId: 13, name: "微信支付设置", Link: "vshop/PayConfig.aspx" },
        { id: 132, pId: 13, name: "支付宝支付设置", Link: "vshop/BasicConfig.aspx" },
        { id: 133, pId: 13, name: "盛付通支付设置", Link: "vshop/ShengPaySet.aspx" },
        { id: 134, pId: 13, name: "线下支付设置", Link: "vshop/OffLinePay.aspx" },
        { id: 135, pId: 13, name: "添加新支付方式", Link: "sales/addpaymenttype.aspx" },
        { id: 136, pId: 13, name: "支付方式列表", Link: "sales/PaymentTypes.aspx" },
        { id: 14, pId: 1, name: "配送设置", open: true, Link: "" },
        { id: 141, pId: 14, name: "配送方式列表", Link: "sales/shippingtypes.aspx" },
        { id: 142, pId: 14, name: "运费模板", Link: "sales/manageshippingtemplates.aspx" },
        { id: 143, pId: 14, name: "物流公司", Link: "sales/expresscomputerpes.aspx" },

        { id: 2, pId: 0, name: "微会员", open: true, iconOpen: "zTree/img/diy/1_open.png", iconClose: "zTree/img/diy/1_close.png", Link: "member/managemembers.aspx" },
        { id: 21, pId: 2, name: "会员管理", open: true, Link: "member/managemembers.aspx" },
        { id: 211, pId: 21, name: "会员列表", Link: "member/managemembers.aspx" },
        { id: 212, pId: 21, name: "会员等级", Link: "member/membergrades.aspx" },
        { id: 213, pId: 21, name: "添加会员等级", Link: "member/addmembergrade.aspx" },
        { id: 22, pId: 2, name: "会员深度营销", open: true, Link: "" },
        { id: 221, pId: 22, name: "客户分组", Link: "member/clientset.aspx" },
        { id: 222, pId: 22, name: "新客户", Link: "member/membermarket.aspx?type=new" },
        { id: 223, pId: 22, name: "活跃客户", Link: "member/membermarket.aspx?type=activy" },
        { id: 224, pId: 22, name: "休眠客户", Link: "member/membermarket.aspx?type=sleep" },
        { id: 23, pId: 2, name: "邮件短信营销", open: true, Link: "" },
        { id: 231, pId: 23, name: "手机短信配置", Link: "tools/smssettings.aspx" },
        { id: 232, pId: 23, name: "邮件服务配置", Link: "tools/emailsettings.aspx" },

        { id: 3, pId: 0, name: "微营销", open: true, iconOpen: "zTree/img/diy/1_open.png", iconClose: "zTree/img/diy/1_close.png", Link: "vshop/ActivitiesList.aspx" },
        { id: 31, pId: 3, name: "分享推广设置", open: true, Link: "" },
        { id: 311, pId: 31, name: "分享推广", Link: "promotion/setSharePromotion.aspx" },
        { id: 32, pId: 3, name: "积分商城", open: true, Link: "" },
        { id: 321, pId: 32, name: "购物积分设置", Link: "promotion/setShoppingScore.aspx" },
        { id: 33, pId: 3, name: "微信活动", open: true, Link: "" },
        { id: 331, pId: 33, name: "我是土豪", Link: "vshop/redpageractivitylist.aspx" },
        { id: 332, pId: 33, name: "微投票", Link: "store/Votes.aspx" },
        { id: 333, pId: 33, name: "微报名", Link: "vshop/ManageActivity.aspx" },
        { id: 334, pId: 33, name: "满减活动", Link: "vshop/ActivitiesList.aspx" },

        { id: 4, pId: 0, name: "微商品", open: true, iconOpen: "zTree/img/diy/1_open.png", iconClose: "zTree/img/diy/1_close.png", Link: "product/productonsales.aspx" },
        { id: 41, pId: 4, name: "商品管理", open: true, Link: "" },
        { id: 411, pId: 41, name: "上架新商品", Link: "product/selectcategory.aspx" },
        { id: 412, pId: 41, name: "商品列表", Link: "product/productonsales.aspx" },
        { id: 413, pId: 41, name: "商品回收站", Link: "product/ProductOnDeleted.aspx" },
        { id: 414, pId: 41, name: "批量上传商品", Link: "product/importfromtb.aspx" },
        { id: 415, pId: 41, name: "批量导出商品", Link: "product/exporttotb.aspx" },
        { id: 42, pId: 4, name: "商品配置", open: true, Link: "" },
        { id: 421, pId: 42, name: "类型配置", Link: "product/producttypes.aspx" },
        { id: 422, pId: 42, name: "分类配置", Link: "product/managecategories.aspx" },
        { id: 423, pId: 42, name: "品牌配置", Link: "product/brandcategories.aspx" },
        { id: 43, pId: 4, name: "客户反馈", open: true, Link: "" },
        { id: 431, pId: 43, name: "商品咨询", Link: "comment/productconsultations.aspx" },
        { id: 432, pId: 43, name: "商品评论", Link: "comment/productreviews.aspx" },

        { id: 5, pId: 0, name: "微分销", open: true, iconOpen: "zTree/img/diy/1_open.png", iconClose: "zTree/img/diy/1_close.png", Link: "distributor/distributorapplyset.aspx" },
        { id: 51, pId: 5, name: "代理商管理", open: true, Link: "" },
        { id: 511, pId: 51, name: "代理商列表", Link: "distributor/distributorlist.aspx?isagent=1" },
        { id: 512, pId: 51, name: "添加新的代理商", Link: "agent/AddAgentInfo.aspx" },
        { id: 513, pId: 51, name: "代理商等级管理", Link: "agent/AgentGradeList.aspx" },
        { id: 52, pId: 5, name: "分销商管理", open: true, Link: "" },
        { id: 521, pId: 52, name: "分销商申请设置", Link: "distributor/distributorapplyset.aspx" },
        { id: 522, pId: 52, name: "主站轮播图配置", Link: "vshop/ManageBanner.aspx" },
        { id: 523, pId: 52, name: "主站Logo图上传", Link: "distributor/distributorLogo.aspx" },
        { id: 524, pId: 52, name: "分销商列表", Link: "distributor/distributorlist.aspx" },
        { id: 525, pId: 52, name: "批量生成分销商", Link: "distributor/branchadddistributors.aspx" },
        { id: 526, pId: 52, name: "佣金产生记录", Link: "distributor/CommissionsAllList.aspx" },
        { id: 527, pId: 52, name: "提现结算记录", Link: "distributor/BalanceDrawRequestList.aspx" },
        { id: 528, pId: 52, name: "提现结算申请", Link: "distributor/BalanceDrawApplyList.aspx" },
        { id: 529, pId: 52, name: "分销商统计", Link: "distributor/DistributorStatistics.aspx" },
        { id: 520, pId: 52, name: "分销商等级管理", Link: "distributor/distributorgradelist.aspx" },
        { id: 53, pId: 5, name: "商品朋友圈分享", open: true, Link: "" },
        { id: 531, pId: 53, name: "朋友圈分享", Link: "distributor/friendextension.aspx" },
        { id: 54, pId: 5, name: "售后服务", open: true, Link: "" },
        { id: 541, pId: 54, name: "售后服务", Link: "distributor/saleservice.aspx" },

        { id: 6, pId: 0, name: "微订单", open: true, iconOpen: "zTree/img/diy/1_open.png", iconClose: "zTree/img/diy/1_close.png", Link: "sales/manageorder.aspx" },
        { id: 61, pId: 6, name: "订单管理", open: true, Link: "" },
        { id: 611, pId: 61, name: "订单列表", Link: "sales/manageorder.aspx" },
        { id: 612, pId: 61, name: "订单设置", Link: "sales/setorderoption.aspx" },
        { id: 62, pId: 6, name: "退换货(款)", open: true, Link: "" },
        { id: 621, pId: 62, name: "退货申请单", Link: "sales/returnsapply.aspx" },
        { id: 622, pId: 62, name: "退款处理", Link: "sales/refund.aspx" },
        { id: 63, pId: 6, name: "单据管理", open: true, Link: "" },
        { id: 631, pId: 63, name: "收款单", Link: "sales/managedebitnote.aspx" },
        { id: 632, pId: 63, name: "发货单", Link: "sales/managesendnote.aspx" },
        { id: 64, pId: 6, name: "快递单管理", open: true, Link: "" },
        { id: 641, pId: 64, name: "快递单模板", Link: "sales/expresstemplates.aspx" },
        { id: 642, pId: 64, name: "新增快递单模板", Link: "sales/addexpresstemplate.aspx" },
        { id: 643, pId: 64, name: "发货人信息管理", Link: "sales/shippers.aspx" },
        { id: 644, pId: 64, name: "添加发货人信息", Link: "sales/addshipper.aspx" },
        { id: 65, pId: 6, name: "微信通知管理", open: true, Link: "" },
        { id: 651, pId: 65, name: "反馈通知", Link: "vshop/FeedBackNotify.aspx" },
        { id: 652, pId: 65, name: "告警通知", Link: "vshop/AlarmNotify.aspx" },

        { id: 7, pId: 0, name: "微统计", open: true, iconOpen: "zTree/img/diy/1_open.png", iconClose: "zTree/img/diy/1_close.png", Link: "sales/salereport.aspx" },
        { id: 71, pId: 7, name: "业务统计", open: true, Link: "" },
        { id: 711, pId: 71, name: "生意报告", Link: "sales/salereport.aspx" },
        { id: 712, pId: 71, name: "订单统计", Link: "sales/orderstatistics.aspx" },
        { id: 713, pId: 71, name: "商品销售明细", Link: "sales/saledetails.aspx" },
        { id: 714, pId: 71, name: "销售指标分析", Link: "sales/saletargets.aspx" },
        { id: 715, pId: 71, name: "商品销售排行", Link: "product/productsaleranking.aspx" },
        { id: 716, pId: 71, name: "商品访问与购买比", Link: "product/productsalestatistics.aspx" },
        { id: 717, pId: 71, name: "会员消费排行", Link: "member/memberranking.aspx" },
        { id: 718, pId: 71, name: "会员地区分布", Link: "member/userarealdistributionstatistics.aspx" },
        { id: 719, pId: 71, name: "会员增长统计", Link: "member/userincreasestatistics.aspx" },

        { id: 8, pId: 0, name: "系统工具", open: true, iconOpen: "zTree/img/diy/1_open.png", iconClose: "zTree/img/diy/1_close.png", Link: "store/managelogs.aspx" },
        { id: 81, pId: 8, name: "安全中心", open: true, Link: "store/managers.aspx" },
        { id: 811, pId: 81, name: "部门管理", Link: "store/roles.aspx" },
        { id: 812, pId: 81, name: "管理员管理", Link: "store/managers.aspx" },
        { id: 813, pId: 81, name: "操作日志", Link: "store/managelogs.aspx" },
        { id: 82, pId: 8, name: "数据库管理", open: true, Link: "" },
        { id: 821, pId: 82, name: "数据库备份", Link: "tools/backup.aspx" },
        { id: 822, pId: 82, name: "数据库恢复", Link: "tools/restoredatabase.aspx" },
        { id: 83, pId: 8, name: "图库管理", open: true, Link: "" },
        { id: 831, pId: 83, name: "图片库", Link: "store/imagedata.aspx" },
        { id: 832, pId: 83, name: "上传图片", Link: "store/imageftp.aspx" },
        { id: 833, pId: 83, name: "图片分类管理", Link: "store/imagetype.aspx" }

    ];

    $(document).ready(function () {
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

    function checkSelect()
    {
        var selectIDS = "";
        var selectNameS = "";
        var selectLinkS = "";
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = zTree.getCheckedNodes(true);
        for (var i = 0; i < nodes.length; i++) {
            selectIDS += nodes[i].id + ",";
            selectNameS += nodes[i].name + ",";
            selectLinkS += nodes[i].Link + ",";
        }
        $("#hiSelectIDS").val(selectIDS);
        $("#hiSelectNameS").val(selectNameS);
        $("#hiSelectLinkS").val(selectLinkS);
        //alert($("#hiSelectIDS").val());
        //alert($("#hiSelectNameS").val());
        return true;
    }
    function loadSelect()
    {
        if ($("#hiSelectIDS").val() == "") return;
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        var ids = $("#hiSelectIDS").val().split(",");
        for (var i = 0;i<ids.length;i++)
        {
            var node = zTree.getNodeByParam("id", ids[i]);
            if (node != null) zTree.checkNode(node, true, false);
        }
    }
    //-->
	</SCRIPT>
</head>
    <body onload="loadSelect()">
       <form id="form1" runat="server">
<div class="areacolumn clearfix">
      <div class="columnright">
          <div class="title">
            <em><img src="images/04.gif" width="32" height="32" /></em>
            <h1>功能菜单配置</h1>
            <span>后台权限菜单，配置管理员登录后台后可见的菜单</span>
          </div>
      <div>
        <ul id="treeDemo" class="ztree" style="width:260px; overflow:auto;"></ul>
      <ul class="btn Pa_110">
            <asp:Button ID="btnSave" runat="server" Text="保 存" OnClientClick="return checkSelect()" CssClass="submit_DAqueding" OnClick="btnSave_Click" />
            <asp:HiddenField ID="hiSelectIDS" runat="server"  Value=""/>
            <asp:HiddenField ID="hiSelectNameS" runat="server"  Value=""/>
            <asp:HiddenField ID="hiSelectLinkS" runat="server"  Value=""/>
        </ul>
      </div>

      </div>
  </div>
        </form>
</body>
  </html>