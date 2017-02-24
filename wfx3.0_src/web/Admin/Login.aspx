<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Hidistro.UI.Web.Admin.Login" %>

<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Import Namespace="Hidistro.Core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <Hi:HeadContainer ID="HeadContainer1" runat="server" />
    <Hi:PageTitle ID="PageTitle1" runat="server" />
    <style type="text/css">
body,ol,ul,h1,h2,h3,h4,h5,h6,p,th,td,dl,dd,form,fieldset,legend,input,textarea,select{margin:0;padding:0}
body{font:12px "宋体","Arial Narrow",HELVETICA;background:#fff;-webkit-text-size-adjust:100%;}
body{ background:#F1F9FF url(images/loginbg.png) no-repeat center 0; }
.login{width:420px; height:227px; padding-top:194px; padding-left:224px; margin:0 auto; margin-top:80px;background:url(images/login_b.png) no-repeat;}
.login .input_txt{
	width:235px;
	height:28px;
	padding:2px 3px 2px 15px;
	line-height:28px;
	margin-bottom:12px;
	border:0;
	background:none !important;
	color: #FFFFFF;
}
.login .yzm{width:88px; padding:2px 3px 2px 15px !important; height:28px; padding:2px; border:0 none; background:none;line-height:28px; color:white}
.login .login_btn{width:56px; height:50px; margin-top:16px; border:0 none; background:none}
#form1 #Panel1 .login #divOK {
	position: relative;
	left: 260px;
	bottom: 120px;
	height: 50px;
	width: 60px;
}
#form1 #Panel1 .login #divTS {
	position: relative;
	left: 230px;
	bottom: 75px;
	color:white
}
#form1 #Panel1 .login #divYZM {
	position: relative;
	left: 0;
	bottom: 2px;
}
#form1 #Panel1 .login #divYZMTP {
	position: relative;
	left: 10px;
	bottom: 0;
}
img{vertical-align:middle;border:0px;}
#imgVerifyCode{ padding-left:10px;}

    </style>
    <script type="text/javascript" src="../Utility/jquery-1.6.4.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAdminLogin">
             <div class="login">
	        <p><asp:TextBox ID="txtAdminName" CssClass="input_txt" runat="server"></asp:TextBox></p>
	        <p><asp:TextBox ID="txtAdminPassWord" CssClass="input_txt" runat="server" TextMode="Password" /></p>
	        <p><span id="divYZM"><asp:TextBox ID="txtCode" runat="server" CssClass="yzm" Size="9" MaxLength="4"></asp:TextBox></span>
            <span id="divYZMTP"><img id="img_txtCode" src="" alt="" /><img id="imgVerifyCode" src='<%= Globals.ApplicationPath + "/VerifyCodeImage.aspx" %>'
                                        style="border-style: none" onclick="javascript:refreshCode();" /></span>
            </p>
	        <p><div id="divOK" ><asp:Button ID="btnAdminLogin" runat="server" Text="" CssClass="login_btn" /></div> 		<div id="divTS"><Hi:SmallStatusMessage ID="lblStatus" runat="server" Visible="False" Width="260px" /></div>
                <p>
                </p>
                 </p>
        </div>
    </asp:Panel>
    </form>

    <script language="javascript" type="text/javascript">
        function refreshCode() {
            var img = document.getElementById("imgVerifyCode");
            if (img != null) {
                var currentDate = new Date();
                img.src = '<%= Globals.ApplicationPath + "/VerifyCodeImage.aspx?t=" %>' + currentDate.getTime();
            }
        }
        $(document).ready(function () {
            $("#img_txtCode").hide();
            $("#txtCode").keyup(function () {
                var value = $(this).val();
                var temp;
                if (value.length < 4) {
                    $("#img_txtCode").hide();
                    temp = "";
                }
                else if (value.length == 4) {
                    if (temp != value) {
                        $("#img_txtCode").show();
                        $.ajax({
                            url: "Login.aspx",
                            type: 'post', dataType: 'json', timeout: 10000,
                            data: {
                                isCallback: "true",
                                code: $("#txtCode").val()
                            },
                            async: false,
                            success: function (resultData) {
                                var flag = resultData.flag;
                                if (flag == "1") {
                                    $("#img_txtCode").attr("src", "images/true.png");
                                }
                                else if (flag == "0") {
                                    $("#img_txtCode").attr("src", "images/false.png");
                                }
                            }
                        });
                    }
                    temp = value;
                }
            });
        });
    </script>

</body>
</html>
