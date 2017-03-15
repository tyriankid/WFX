<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ThirdWayManage.aspx.cs" Inherits="Hidistro.UI.Web.Admin.ThirdWayManage" %>
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
        <h1>第三方满减活动管理</h1>
        <span>新建与修改第三方支付方式，以及对应的满减活动</span>
      </div>
      <div class="datafrom">
          <div class="formitem validator1">
           <ul>

            <li><span class="formitemtitle Pw_198"><em >*</em>第三方支付方式：</span>
                <input type="button" id="addSubject" value="增加" onclick="addSub()"/>
                
            </li>
            <li id="subArea"  style="padding-left:200px">
                <table id="subTable">

                </table>
            </li>

              <ul class="btntf Pa_198">
                    <asp:Button ID="btnOK" runat="server" Text="提 交" CssClass="submit_DAqueding inbnt" OnClientClick ="return saveSubs()"  />
	          </ul>
          </div>
      </div>
</div>  

    <input type="hidden" runat="server" id="hidSubInfo" clientidmode="Static" />
    <input type="hidden" runat="server" id="hidStoreId" clientidmode="Static" />

    <script src="/Utility/jquery-1.6.4.min.js"></script>
    <script>

        function addSub() {
            var sbjCount = $("[role='sub']").length + 1;

            var inputHtml = "<tr role='sub'>" +
                "<td><input type='text' value='" + $("#hidStoreId").val() + "' style='display:none'/><input type='button' value='删除' onclick='delTr(this)'/>商家：" + "<input  type='text'  role='name_" + sbjCount + "'  style='width:100px;height:25px'/> </td>" +
                                                 "<td><input type='button' id='addDiscount_" + sbjCount + "' value='增加满减活动' onclick='addDis(this)'/></td>" +
                                        "</tr>";
            $("#subTable").append(inputHtml);
        }

        function addDis(e) {
            var sbjCount = $("[role='reach']").length + 1;
            var inputHtml = "<td style='padding-left:30px'> 满<input type='text' onkeyup=\"value=value.replace(/\\D/g,'')\" role='reach' id='reach_" + sbjCount + "' style='width:100px;height:25px'/></td>" +
                                      "<td> 减<input type='text' onkeyup=\"value=value.replace(/\\D/g,'')\" role='dis' id='dis_" + sbjCount + "' style='width:100px;height:25px'/></td>" +
                "";
            $(e).parent().before(inputHtml);
        }

        function initSbjInfo() {
            $("#subArea").show();
            var sbjList = $("#hidSubInfo").val().split(';');
            var inputHtml = "";
            for (var i = 1; i <= sbjList.length; i++) {
                var valueList = sbjList[i - 1].split(',');
                
                //如果当前门店与当前列不匹配,countinue
                if ($("#hidStoreId").val() != valueList[0]) continue; 

                inputHtml += "<tr role='sub'>" +
                    "<td><input type='text' value='" + $("#hidStoreId").val() + "' style='display:none'/><input type='button' value='删除' onclick='delTr(this)'/>商家：" + "<input  type='text'  role='name_" + i + "' value='" + valueList[0+1] + "'  style='width:100px;height:25px'/> </td>";
                for (var o = 1; o < valueList.length-1; o++) {
                    if (o % 2 == 1) {
                        inputHtml += "<td style='padding-left:30px'> 满<input type='text' onkeyup=\"value=value.replace(/\\D/g,'')\" role='reach' id='reach_" + o + "' value='" + valueList[o + 1] + "' style='width:100px;height:25px'/></td>";
                    }
                    else {
                        inputHtml += "<td> 减<input type='text' onkeyup=\"value=value.replace(/\\D/g,'')\" role='dis' id='dis_" + o + "' value='" + valueList[o + 1] + "' style='width:100px;height:25px'/></td>";
                    }
                }
                inputHtml += "<td><input type='button' id='addDiscount_" + i + "' value='增加满减活动' onclick='addDis(this)'/></td>";
                inputHtml += "</tr>";
            }
            $("#subTable").append(inputHtml);

            //点击保存按钮之前,并在加载完当前店铺之后,去掉当前店铺的信息,以保证每次保存当前店铺的满减活动时都会清除掉之前保存的.以避免叠加出错
            var sbjListTemp = $("#hidSubInfo").val().split(';');
            
            //去掉当前门店列
            var c = sbjListTemp.length;

            for (var k = 0; k < c; k++) {
                if ($("#hidStoreId").val() == sbjListTemp[k].split(',')[0]) {
                    sbjListTemp[k] = "remove";
                }
            }
            for (var p = 0; p < c; p++) {
                sbjListTemp.remove("remove");
            }
            
            var infoTemp = "";
            for (var u = 0; u < sbjListTemp.length; u++)
            {
                infoTemp += sbjListTemp[u] + ";";
            }
            infoTemp = infoTemp.substr(0, infoTemp.length - 1);
            $("#hidSubInfo").val(infoTemp);
        }

        function delTr(e) {
            $(e).parents().find("tr").eq(0).remove();
        }

        function saveSubs() {
            var subInfo = $("#hidSubInfo").val() ? $("#hidSubInfo").val()+";":"";
            var flag = true;
            if ($("tr[role='sub']").length <= 0) {
                alert("您还未增加至少一个第三方商家!"); flag = false; return false;
            }
            $("tr[role='sub']").each(function () {
                $(this).find("input[type=text]").each(function () {
                    if ($(this).val() == "") {
                        alert("请将内容填写完整!"); flag = false; return false;
                    }
                    subInfo += $(this).val() + ",";
                });
                subInfo = subInfo.substr(0, subInfo.length - 1);
                subInfo += ";";
            });
            subInfo = subInfo.substr(0, subInfo.length - 1);
            $("#hidSubInfo").val(subInfo);
            return flag;
        }

        /** 
        *删除数组指定下标或指定对象 
        */
        Array.prototype.remove = function (obj) {
            for (var i = 0; i < this.length; i++) {
                var temp = this[i];
                if (!isNaN(obj)) {
                    temp = i;
                }
                if (temp == obj) {
                    for (var j = i; j < this.length; j++) {
                        this[j] = this[j + 1];
                    }
                    this.length = this.length - 1;
                }
            }
        } 

        $(document).ready(function () {
            initSbjInfo();
        });
</script>
</asp:Content>

