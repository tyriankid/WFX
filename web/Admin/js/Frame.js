// JavaScript Document

//选择点击一级菜单显示
//selecttype
function ShowMenuLeft(firstnode, secondnode,threenode) {
    $.ajax({
        url:"index.aspx/GetLeftMenuInfo",
        contentType: "application/json",
        dataType: "json",
        type: "POST",
        data: "{firstNode:'" + firstnode + "'}",
        async: true,
        timeout: 10000,
        error: function (xm, msg) {
            alert("error");
        },
        success: function (json) {
            //根据当前点击的导航栏菜单(一级菜单)的layoutID传递值后台获取当前一级菜单下的所有二级和三级菜单的平层字符串信息.
            var allMenuInfo= json.d.substring(0, json.d.length - 1);//去掉最后一个分号
            $("#menu_left").html('');
            var curenturl = null;
            var curentmenuaspan = null;
            

            //根据获取的字符串拼接每行菜单信息
            var itemList = allMenuInfo.split(";");
            for (var i = 0; i < itemList.length; i++) {
                var attrs = itemList[i].split(",");
                var dataid = attrs[0].substring(attrs[0].indexOf("\"")).replace(/\"/g, "");
                var title = attrs[1].substring(attrs[1].indexOf("\"")).replace(/\"/g, "");
                var link = attrs[2].substring(attrs[2].indexOf("\"")).replace(/\"/g, "");
                var layout = attrs[3].substring(attrs[3].indexOf("\"")).replace(/\"/g, "");
                var iconlink = attrs[4].substring(attrs[4].indexOf("\"")).replace(/\"/g, "");
                if (layout.length == 2) {//如果是一级菜单,绑定currenturl
                    curenturl = link;
                }

                if (layout.length === 4) {//如果是二级菜单
                    $menutitle = $('<div class="hishop_menutitle"></div>');
                    $menuaspan = $("<em id='"+layout+"' style='background-image:url("+iconlink+");'></em><span onclick='ShowSecond(this)'>" + title + "</span>"); 
                    $menutitle.append($menuaspan);
                }
                if (layout.length === 6) {//如果是三级菜单
                    $menuitem = $("<i id='" + layout + "'></i><a href='" + link + "' target='frammain' style='display:none'>" + title + "</a><div class=\"clean\"></div> ");
                    if (link == secondnode) { //如果当前链接等于第二个参数(当前menu项的link属性) 给他套上current的样式
                        $menuitem.addClass("curent");
                        curentmenuaspan = $menuaspan;
                    }
                    $menutitle.append($menuitem);
                }
                if (layout.length !== 2)
                    $("#menu_left").append($menutitle);
            }
            /*
            curenturl = $(xml).find("Module[Title='" + firstnode.replace(/\s/g, "") + "']").attr("Link");
            if (secondnode != null) {
                curenturl = secondnode;
            }
            var currRootMenuID = GetRootMenuID(firstnode);
            $(xml).find("Module[Title='" + firstnode.replace(/\s/g, "") + "'] Item").each(function (i) {
                $menutitle = $('<div class="hishop_menutitle"></div>');
                $menuaspan = $("<em id='menu" + currRootMenuID + "_" + i + "' style='background-image:url(images/menu" + currRootMenuID + "_" + i + ".png);'></em><span onclick='ShowSecond(this)'>" + $(this).attr("Title") + "</span>"); //获取二级分类名称
                $menutitle.append($menuaspan);
                $(this).find("PageLink").each(function (k) {
                    var link_href = $(this).attr("Link");
                    var link_title = $(this).attr("Title");
                    $alink = $("<i id='menu" + currRootMenuID + "_" + i + "_" + k + "'></i><a href='" + link_href + "' target='frammain' style='display:none'>" + link_title + "</a>");
                   
                    if (link_href == curenturl) {
                        $alink.addClass("curent");
                        curentmenuaspan = $menuaspan;
                    }
                    $menutitle.append($alink);
                    $menutitle.append('<div class="clean"></div>');
                });
                if ($.cookie("Vshop-Manager2") != null && $.cookie("Vshop-Manager2") != "undefined" && $.cookie("Vshop-Manager2") == "1" && currRootMenuID == 7 && $(this).attr("Title") == "安全中心") {
                    $alink = $("<i id='menu" + currRootMenuID + "_" + i + "_99'></i><a href='ManageMenu.aspx' target='frammain'>后台模块配置</a>");
                    $menutitle.append($alink);
                    $menutitle.append('<div class="clean"></div>');
                }
                $("#menu_left").append($menutitle);
            });
            */
            
            $("#menu_arrow").attr("class", "open_arrow");
            $("#menu_arrow").css("display", "block");
            $(".hishop_menu_scroll").css("display", "block");
            $(".hishop_content_r").css("left", 200);
            if (threenode != null) {
                curenturl = threenode;
            }
            $("#frammain").attr("src", curenturl);
            $("#frammain").width($(window).width() - 200);
            ShowSecond(curentmenuaspan);
            
        }
    });
    
    $(".hishop_menu a:contains('" + firstnode + "')").addClass("hishop_curent").siblings().removeClass("hishop_curent");
}

function GetRootMenuID(menuName)
{
    var currID=0;
    switch(menuName)
    {
        case "微配置":
            currID=0;
            break;
        case "微会员":
            currID=1;
            break;
        case "微营销":
            currID=2;
            break;
        case "微商品":
            currID=3;
            break;
        case "微分销":
            currID=4;
            break;
        case "微订单":
            currID=5;
            break;
        case "微统计":
            currID=6;
            break;
        case "系统工具":
            currID=7;
            break;
    }
    return currID;
}

//点击左右关闭树
function ExpendMenuLeft() {
	var clientwidth = $(window).width()-7;
	if ($(".hishop_menu_scroll").is(":hidden")) {//点击展开
		$("#menu_arrow").attr("class", "open_arrow");
		$(".hishop_menu_scroll").css("display", "block");
		$(".hishop_content_r").css("left", 200);
		$("#frammain").width(clientwidth -200);
	} else {//点击隐藏
		$("#menu_arrow").attr("class", "close_arrow");
		$(".hishop_menu_scroll").css("display", "none");
		$(".hishop_content_r").css("left", 7);
		$("#frammain").width(clientwidth)
	}
	
}

//点击二级菜单
function ShowSecond(sencond) {
	if ($(sencond).siblings("a:hidden") != null && $(sencond).siblings("a:hidden").length > 0) {
	    $(sencond).siblings("a").css("display", "block");
	    $(sencond).parent().attr("class", "hishop_menutitleEx");
	} else {
	    $(sencond).siblings("a").css("display", "none");
	    $(sencond).parent().attr("class", "hishop_menutitle");
	}
}

//自适应高度
function AutoHeight() {
	var clientheight = $(this).height() - 40;
	var clientwidth = $(this).width()-15;
	$(".hishop_menu_scroll").height(clientheight);
	$(".hishop_content_r").height(clientheight);
	if (!$(".hishop_menu_scroll").is(":hidden")) {
		clientwidth = clientwidth-200;
	}
	$("#frammain").width(clientwidth);
}


//窗口变化
$(window).resize(function() {
	AutoHeight();
});

//窗口加载
$(function () {
    AutoHeight();
    $("#menu_left a").live("click", function () {
        $("#menu_left a").removeClass("curent");
        $(this).addClass("curent");
    });
    LoadTopLink();
    
    /*if ($.cookie("guide") == null || $.cookie("guide") == "undefined" || $.cookie("guide") != 1) {
        DialogFrame('help/vshopindex.html', '新手向导', 750, 450);
    }*/
});


function LoadTopLink() {
	$.ajax({
	    url: 'LoginUser.ashx?action=login&timestamp=' + new Date().getTime(),
		dataType: 'json',
		type: 'GET',
		timeout: 5000,
//		error: function(xm, msg) {
//			alert(msg);
//		},
success: function (siteinfo) {
                document.title = siteinfo.sitename;  
				//$(".hishop_banneritem a:eq(0)").text(siteinfo.sitename);
				//$(".hishop_banneritem a:eq(1)").text(siteinfo.username);

		}
	});
}
