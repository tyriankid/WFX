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

    <script src="/Utility/jquery-1.6.4.min.js"></script>
    <script>

        function addSub() {
            var sbjCount = $("[role='sub']").length + 1;

            var inputHtml = "<tr role='sub'>" +
                                                 "<td>商家：" + "<input  type='text'  role='name_" + sbjCount + "'  style='width:100px;height:25px'/> </td>" +
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
            //根据当前题目和答案的隐藏域凑行html
            var sbjList = $("#hidSubInfo").val().split(';');//题目列
            console.log(sbjList);
            var inputHtml = "";
            for (var i = 1; i <= sbjList.length; i++) {
                var valueList = sbjList[i - 1].split(',');
                inputHtml += "<tr role='sub'>" +
                        "<td>商家：" + "<input  type='text'  role='name_" + i + "' value='" + valueList[0] + "'  style='width:100px;height:25px'/> </td>";
                for (var o = 1; o < valueList.length; o++) {
                    if (o % 2 == 1) {
                        inputHtml += "<td style='padding-left:30px'> 满<input type='text' onkeyup=\"value=value.replace(/\\D/g,'')\" role='reach' id='reach_" + o + "' value='" + valueList[o] + "' style='width:100px;height:25px'/></td>";
                    }
                    else {
                        inputHtml += "<td> 减<input type='text' onkeyup=\"value=value.replace(/\\D/g,'')\" role='dis' id='dis_" + o + "' value='" + valueList[o] + "' style='width:100px;height:25px'/></td>";
                    }
                }
                inputHtml += "<td><input type='button' id='addDiscount_" + i + "' value='增加满减活动' onclick='addDis(this)'/></td>";
                inputHtml += "</tr>";
            }
            $("#subTable").append(inputHtml);
        }

        function saveSubs() {
            var subInfo = "";
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

        $(document).ready(function () {
            initSbjInfo();
        });
</script>
</asp:Content>

