<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页-次元猫周边商城</title>
	<link rel="stylesheet" href="css/details.css" />
	<link rel="stylesheet" type="text/css" href="css/zoomio.css"/>
	<style type="text/css">
		body{
			overflow-x: hidden;
		}
		ul {
			list-style-image: none;
			list-style-position: outside;
			list-style-type: none;
		}
		.midAD>a{
			line-height:62px;
			font-size: 16px;
		}
		.guanggao,.list-banimg{
			margin: 0 auto;
			min-width: 1280px;
			width: 100%;
			min-height: 129px;
			height: auto;
			display: block;
		}
		.list-shop{
			margin: 36px auto 90px;
			min-width: 1280px;
			width: 100%;
			min-height: 700px;
			height: auto;
		}
		.fl{
			float: left;
			display: inline;
		}
		.list-shop .sidebar {
			width: 195px;
			height: 700px;
		}
		.sidebar .navlist {
			margin: 7px 0 40px 51px;
			height: auto;
			color: #202020;
		}
		.sidebar .navlist dt {
			margin-bottom: 15px;
			width: 145px;
			height: 24px;
			line-height: 22px;
			text-indent: 12px;
			font-size: 22px;
			position: relative;
			font-weight: bold;
		}
		.ico-menu {
			background: url(img/ico-menu.png) no-repeat;
		}
		.sidebar .navlist dt .navl-line {
			position: absolute;
			top: 2px;
			left: 0;

			display: block;
			width: 3px;
			height: 18px;
			background-position: -2px -125px;
		}
		.sidebar .navlist dd a {
			width: 100%;
			height: 30px;
			line-height: 30px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
		a:link{
			cursor: pointer;
		}
		.sidebar .navlist dd {
			width: 100%;
			height: 30px;
			line-height: 30px;
			text-indent: 12px;
			font-size: 14px;
		}
		.fr{
			float: right;
			display: inline;
		}
		.shopcont{
			margin-right: 17px;
			width: 82%;
			height: auto;
		}
		.cr_head{
			width: 100%;
			height: 38px;
		}
		.sorting-filter {
			width: 130px;
			height: auto;
			position: relative;

		}
		.sfbox .sfarr {
			position: absolute;
			top: 16px;
			right: 26px;
			display: block;
			width: 14px;
			height: 7px;
			background-position: -2px -2px;
		}
		.sfbox {
			width: 128px;
			height: 36px;
			line-height: 36px;
			border: 1px solid #bcbfc1;
			font-size: 15px;
			color: #919799;
			text-align: center;
			text-indent: -20px;
			cursor: pointer;
		}
		.sortinglist {
			position: absolute;
			top: 37px;
			left: 0px;
			width: 128px;
			text-align: center;
			border: 1px solid #bcbfc1;
			border-bottom: none;
			font-size: 15px;
			background: #fff;
			display: none;
		}
		.sortinglist li{
			width: 128px;
			height: 36px;
			font-size: 15px;
			line-height: 36px;
			color: #919799;
			border-bottom: 1px solid silver;
			cursor: pointer;
		}
		.sorting-stock {
			margin-left: 22px;
			width: auto;
			height: 38px;
			line-height: 38px;
			font-size: 14px;
			color: #919799;
		}
		.sorting-check {
			margin-top: -2px;
			display: inline-block;
			width: 16px;
			height: 16px;
			vertical-align: middle;
			background: url(img/bg-checkbox.png) no-repeat;
			background-position: -10px -10px;
			cursor: pointer;
		}
		.sorting-checked {
			background-position: -46px -10px;
		}
		.page {
			margin: 0 16px 0 0;
			width: auto;
			height: 38px;
			float: right;
			line-height: 36px;
			font-size: 14px;
		}
		.page span {
			float: left;
			color: #919799;
		}
		.page a {
			display: block;
			color: #919799;
			height: 36px;
			float: left;
			border: 1px solid #aeb2b3;
			text-align: center;
			margin-left: 5px;
			display: inline;
			background: #fff;
			padding: 0px 8px;
		}
		.clearfix:after {
			content: ".";
			display: block;
			height: 0;
			clear: both;
			visibility: hidden;
		}
		.good-list {
			margin-top: 32px;
			width: 100%;
			height: auto;
			overflow: hidden;
		}
		.good-list li {
			float: left;
			margin-bottom: 56px;
			width: 33.3%;
			height: auto;
			position: relative;
			overflow: hidden;
		}
		.good-list li a {
			padding-right: 16px;
			height: 100%;
			display: block;
			position: relative;
			color: #303030;
			overflow: hidden;
		}
		.good-list li .ico-mark {
			position: absolute;
			top: 0;
			left: 20px;
			/* z-index: 20;*/
			width: 20%;
			overflow: hidden;
		}

		.good-list li .i-pending{
			top: 70%;
			left: 65%;
			width: 25%;
		}
		li .ico-mark img {
			display: block;
			width: 100%;
			height: auto;
			vertical-align: bottom;
		}
		.gl-img img {
			display: block;
			width: 100%;
			height: auto;
			vertical-align: bottom;
		}

		.gl-name {
			margin: 10px auto 0;
			width: 100%;
			height: 32px;
			line-height: 32px;
			text-align: center;
			font-size: 16px;
		}
		.gl-price {
			width: 100%;
			text-align: center;
			height: 30px;
			line-height: 30px;
			font-size: 30px;
		}
		.bottomshop {
			width: 100%;
			height: 102px;

		}
		.fuwubar {
			padding-top: 28px;
			background: #fff;
			height: 70px;
		}
		.acolor{
			background-color: #AEB2B3;
			color: white;
		}
		.fuwu{
			width: 70%;
			margin: 0px auto;
		}
		.w980 {
			width: 1190px;
			margin: 0px auto;
			height: auto;
		}
		.fuwu li span.fw1 {
			background: url(img/base.png) no-repeat -10px -234px;
		}
		.fuwu li span.fw2 {
			background: url(img/base.png) no-repeat -73px -234px;
		}
		.fuwu li span.fw4 {
			background: url(img/base.png) no-repeat -179px -234px;
		}
		.fuwu li span {
			display: block;
			width: 42px;
			height: 52px;
			float: left;
		}
		.fuwu li a {
			display: block;
			line-height: 52px;
			height: 52px;
			float: left;
			color: #222;
			font-size: 14px;
			cursor: default;
		}
		.fu1 {
			width: 240px;
		}
		.fu2 {
			width: 228px;
		}
		.fu4 {
			width: 160px;
		}
		#ni,#nicheng{
			cursor: pointer;
			position: relative;
		}
		#nicheng>a:hover{
			text-decoration: underline;
		}
		#nicheng li a:hover{
			color: white;
		}

		.info ul{

			padding-top: 5px;
			list-style: none;
			width: 100px;
			text-align: center;
			z-index: 15;
		}
		.info ul li{
			width: 99px;
			height: 32px;
			line-height: 32px;
			text-align: center;
			border-top: 1PX solid saddlebrown;
			background-color: #5A5A5A;
			opacity: 0.9;
			z-index: 15;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
	<script type="text/javascript">
        var  ctid="0";
        var price="0";
        var job="0";
        var ishave="0";
        $(function(){
            var a=0;
            $(".listTitle").children("ul").hide();
            $(".listTitle").mouseover(function(){
                $(this).children("ul").show();
                $(".listTitle ul").mouseleave(function(){
                    $(this).hide();
                })
            }).mouseleave(function(){
                $(this).children("ul").hide();
            })
            $("nav ul li").mouseover(function(){
                $(this).animate({opacity:"-=0.1"});
            }).mouseleave(function(){
                $(this).animate({opacity:"+=0.1"});
            })
            $(".sorting-filter").bind({
                mouseover:function(){
                    $(".sortinglist").css({"display":"block","z-index":"1"});
                    $(".sortinglist li").mouseover(function(){
                        $(this).addClass("acolor");
                    })
                },
                mouseout:function(){$(".sortinglist").css("display","none");
                    $(".sortinglist li").mouseout(function(){
                        $(this).removeClass("acolor");
                    })
                }
            })
            $("#nicheng").mouseover(function(){
                $(".info").show();
            }).mouseout(function () {
                $(".info").hide();
            })
            $(".children").on('click',function(){
                var childrenid =$(this).attr("childid");
                window.location.href="reachBychildrenid?childrenid="+childrenid;
            })

            $(".sortinglist li").click(function(){
                var lval=$(this).text();
                var type=$(this).attr("sort");
                $(".sfbox span").text(lval);
                var ul=$(".aprodunt");
                ul.empty();
                $.ajax({
                    type:"POST",
                    url:"reachADsc",
                    data:"type="+type,
                    async:false,
                    dataType:"json",
                    success:function(mes) {
                        if(mes!=''){
                            $("[name='pagenum']").val(1);
                            $.each(mes, function (i, n) {
                                var newpro='';
                                var nohuo='';
                                if(n.proNewpro==1){
                                    newpro= '<div class="ico-mark i-new">\n' +
                                        '<img src="img/new.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                if(n.proNum==0){
                                    nohuo= '<div class="ico-mark i-pending">\n' +
                                        ' <img src="img/quehuo.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                var node = '<li>\n' +newpro+nohuo+
                                    '\t\t\t\t\t\t<a href="ProductInfo?proid=' + n.proId + '" class="alink">\n' +
                                    '\t\t\t\t\t\t\t<div class="gl-img showp" >\n' +
                                    '\t\t\t\t\t\t\t\t<img src="' + n.xpitlist[i].phAdress + '" width="527" height="506" />\n' +
                                    '\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t<div class="gl-img gl-hovering" hidden="hidden">\n' +
                                    '\t\t\t\t\t\t\t\t<img src="' + n.xpitlist[i + 1].phAdress + '" width="527" height="506" />\n' +
                                    '\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t</a>\n' +
                                    '\t\t\t\t\t\t<p class="gl-name">' + n.proName + '</p>\n' +
                                    '\t\t\t\t\t\t<p class="gl-price">¥' + n.proPrice + '.00</p>\n' +
                                    '\t\t\t\t\t</li>'
                                ul.append(node);
                            })
                        }
                    }
                });
            })
            $(".searchBut").click(function(){
                var names=$(".searchText").val().trim();
                var ul=$(".aprodunt");
                if(names!=''){
                    $.ajax({
                        type:"POST",
                        url:"reachName",
                        data:"name="+names,
                        async:false,
                        dataType:"json",
                        success:function(mes) {
                            if (mes != '') {
                            ul.empty();
                            $("[name='pagenum']").val(1);
                            $.each(mes, function (i, n) {
                                var newpro = '';
                                var nohuo = '';
                                if (n.proNewpro == 1) {
                                    newpro = '<div class="ico-mark i-new">\n' +
                                        '<img src="img/new.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                if (n.proNum == 0) {
                                    nohuo = '<div class="ico-mark i-pending">\n' +
                                        ' <img src="img/quehuo.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                var node = '<li>\n' + newpro + nohuo +
                                    '\t\t\t\t\t\t<a href="ProductInfo?proid=' + n.proId + '" class="alink">\n' +
                                    '\t\t\t\t\t\t\t<div class="gl-img showp" >\n' +
                                    '\t\t\t\t\t\t\t\t<img src="' + n.xpitlist[i].phAdress + '" width="527" height="506" />\n' +
                                    '\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t<div class="gl-img gl-hovering" hidden="hidden">\n' +
                                    '\t\t\t\t\t\t\t\t<img src="' + n.xpitlist[i + 1].phAdress + '" width="527" height="506" />\n' +
                                    '\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t</a>\n' +
                                    '\t\t\t\t\t\t<p class="gl-name">' + n.proName + '</p>\n' +
                                    '\t\t\t\t\t\t<p class="gl-price">¥' + n.proPrice + '.00</p>\n' +
                                    '\t\t\t\t\t</li>'
                                ul.append(node);
                            })
                        }
                        }
                    })
                }else{
                    alert("您输入的内容不能为空！")
                }
            })

            /*  $(".sorting-check").click(function(){
                  if(a%2==0){
                      $(this).addClass("sorting-checked");
                      ishave="1";
                  }else{
                      $(this).removeClass("sorting-checked");
                      ishave="0";
                  }
                  a++;
                  alert(a)
              })*/
            $(".aprodunt").on({
                mouseover:function(){
                    $(this).find(".gl-hovering").show();
                    $(this).find(".showp").hide();
                },mouseout:function () {
                    $(this).find(".gl-hovering").hide();
                    $(this).find(".showp").show();
                }
            },".alink");

            $(".navlist dd").click(function(){
                $(this).parent().find("a").css("font-weight","normal");
                $(this).children("a").css("font-weight","bold");
            })
            $(".type dd").click(function(){
                var tid= $(this).children("a").attr("tid");
                ctid=tid;
                fenpage();

            })
            $(".price dd").click(function(){
                var tid= $(this).children("a").attr("value");
                price=tid;
                fenpage();
            })
            $(".career dd").click(function(){
                var tid= $(this).children("a").attr("job");
                job=tid;
                fenpage();
            })

            function fenpage(){
                var ul=$(".aprodunt");
                var pagenum=$("[name='pagenum']");
                var num=pagenum.val();
                ul.empty();
                $.ajax({
                    type:"POST",
                    url:"ajaxMoFucha",
                    data:"ctid="+ctid+"&price="+price+"&job="+job,
                    async:false,
                    dataType:"json",
                    success:function(mes) {
                        $("[name='pagenum']").val(1);
                        $.each(mes, function (i, n) {
                            var newpro='';
                            var nohuo=''
                            if(n.proNewpro==1){
                                newpro= '<div class="ico-mark i-new" style="z-index: 1">\n' +
                                    '<img src="img/new.png" width="117" height="108"/>\n' +
                                    '</div>';
                            }
                            if(n.proNewpro==2){
                                newpro= '<div class="ico-mark i-new" style="z-index: 1">\n' +
                                    '<img src="img/xianding.png" width="117" height="108"/>\n' +
                                    '</div>';
                            }
                            if(n.proNewpro==3){
                                newpro= '<div class="ico-mark i-new" style="z-index: 1">\n' +
                                    '<img src="img/xiannew.png" width="117" height="108"/>\n' +
                                    '</div>';
                            }
                            if(n.proNum==0){
                                nohuo= '<div class="ico-mark i-pending" style="z-index: 1">\n' +
                                    ' <img src="img/quehuo.png" width="117" height="108"/>\n' +
                                    '</div>';
                            }
                            var node = '<li>\n' +newpro+nohuo+
                                '\t\t\t\t\t\t<a href="ProductInfo?proid=' + n.proId + '" class="alink">\n' +
                                '\t\t\t\t\t\t\t<div class="gl-img showp" >\n' +
                                '\t\t\t\t\t\t\t\t<img src="' + n.xpitlist[i].phAdress + '" width="527" height="506" />\n' +
                                '\t\t\t\t\t\t\t</div>\n' +
                                '\t\t\t\t\t\t\t<div class="gl-img gl-hovering" hidden="hidden">\n' +
                                '\t\t\t\t\t\t\t\t<img src="' + n.xpitlist[i + 1].phAdress + '" width="527" height="506" />\n' +
                                '\t\t\t\t\t\t\t</div>\n' +
                                '\t\t\t\t\t\t</a>\n' +
                                '\t\t\t\t\t\t<p class="gl-name">' + n.proName + '</p>\n' +
                                '\t\t\t\t\t\t<p class="gl-price">¥' + n.proPrice + '.00</p>\n' +
                                '\t\t\t\t\t</li>'
                            ul.append(node);
                        })
                    }
                });
            }
            reachcnum();
            $(".nextpage").click(function () {
                var ul=$(".aprodunt");
                var pagenum=$("[name='pagenum']");
                var num=pagenum.val();
                $.ajax({
                    type:"POST",
                    url:"ajaxPageNxet",
                    data:"num="+num+"&size=3",
                    async:false,
                    dataType:"json",
                    success:function(mes){
                        if(mes!=''){
                            var num=mes.num;
                            pagenum.val(num);
                            ul.empty();
                            $.each(mes.productList,function(i,n){
                                var newpro='';
                                var nohuo=''
                                if(n.proNewpro==1){
                                    newpro= '<div class="ico-mark i-new" style="z-index: 1">\n' +
                                        '<img src="img/new.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                if(n.proNewpro==2){
                                    newpro= '<div class="ico-mark i-new" style="z-index: 1">\n' +
                                        '<img src="img/xianding.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                if(n.proNewpro==3){
                                    newpro= '<div class="ico-mark i-new" style="z-index: 1">\n' +
                                        '<img src="img/xiannew.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                if(n.proNum==0){
                                    nohuo= '<div class="ico-mark i-pending" style="z-index: 1">\n' +
                                        ' <img src="img/quehuo.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                var node='<li>\n' +newpro+nohuo+
                                    '\t\t\t\t\t\t<a href="ProductInfo?proid='+n.proId+'" class="alink">\n' +
                                    '\t\t\t\t\t\t\t<div class="gl-img showp" >\n' +
                                    '\t\t\t\t\t\t\t\t<img src="'+n.xpitlist[i].phAdress+'" width="527" height="506" />\n' +
                                    '\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t<div class="gl-img gl-hovering" hidden="hidden">\n' +
                                    '\t\t\t\t\t\t\t\t<img src="'+n.xpitlist[i+1].phAdress+'" width="527" height="506" />\n' +
                                    '\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t</a>\n' +
                                    '\t\t\t\t\t\t<p class="gl-name">'+n.proName+'</p>\n' +
                                    '\t\t\t\t\t\t<p class="gl-price">¥'+n.proPrice+'.00</p>\n' +
                                    '\t\t\t\t\t</li>'
                                ul.append(node);
                            })
                        }
                    }
                })
            })
            $(".prevpage").click(function () {
                var ul=$(".aprodunt");
                var pagenum=$("[name='pagenum']");
                var num=pagenum.val();
                $.ajax({
                    type:"POST",
                    url:"ajaxPagePrevious",
                    data:"num="+num+"&size=3",
                    async:false,
                    dataType:"json",
                    success:function(mes) {
                        if(mes!=''){
                            var num = mes.num;
                            pagenum.val(num);
                            ul.empty();
                            $.each(mes.productList, function (i, n) {
                                var newpro='';
                                var nohuo='';
                                if(n.proNewpro==1){
                                    newpro= '<div class="ico-mark i-new" style="z-index: 1">\n' +
                                        '<img src="img/new.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                if(n.proNewpro==2){
                                    newpro= '<div class="ico-mark i-new" style="z-index: 1">\n' +
                                        '<img src="img/xianding.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                if(n.proNewpro==3){
                                    newpro= '<div class="ico-mark i-new" style="z-index: 1">\n' +
                                        '<img src="img/xiannew.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                if(n.proNum==0){
                                    nohuo= '<div class="ico-mark i-pending" style="z-index: 1">\n' +
                                        ' <img src="img/quehuo.png" width="117" height="108"/>\n' +
                                        '</div>';
                                }
                                var node = '<li>\n' +newpro+nohuo+
                                    '\t\t\t\t\t\t<a href="ProductInfo?proid=' + n.proId + '" class="alink">\n' +
                                    '\t\t\t\t\t\t\t<div class="gl-img showp" >\n' +
                                    '\t\t\t\t\t\t\t\t<img src="' + n.xpitlist[i].phAdress + '" width="527" height="506" />\n' +
                                    '\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t<div class="gl-img gl-hovering" hidden="hidden">\n' +
                                    '\t\t\t\t\t\t\t\t<img src="' + n.xpitlist[i + 1].phAdress + '" width="527" height="506" />\n' +
                                    '\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t</a>\n' +
                                    '\t\t\t\t\t\t<p class="gl-name">' + n.proName + '</p>\n' +
                                    '\t\t\t\t\t\t<p class="gl-price">¥' + n.proPrice + '.00</p>\n' +
                                    '\t\t\t\t\t</li>'
                                ul.append(node);
                            })
                        }
                    }
                })
            })

        })

        function reachcnum(){
            var num=$(".listNum");
            $.ajax({
                type:"POST",
                url:"reachCarnum",
                data:"num=num",
                async:false,
                dataType:"json",
                success:function(mes){
                    if(mes!=''){
                        num.text(mes);
                    }
                }
            })
        }
	</script>
</head>
<body>
<header>
	<img src="img/logo.png" class="logo"/>
	<img src="img/relatedlogo.png"/>
	<div id="headerAD" class="headerAD">
		<p>活动期间发货量巨大，新增订单将于七个工作日内发货，感谢理解！</p>
	</div>
	<div class="headerInfo">
		<c:if test="${empty u}">
			<a href="http://148.70.168.210/infoweb/login.jsp"><span id="ni" style="cursor: pointer;">你好，请登录</span></a>
		</c:if>
		<c:if test="${u!=null}">
			<span id="nicheng">欢迎，<a href="148.70.168.210/infoweb/showorder">${u.userNickname}</a>
			  	<div class="info" style="position: absolute; z-index: 15; padding-left:30px;display: none;">
			  	 	<ul>
			  	 		<li><a href="148.70.168.210/infoweb/showorder">我的订单</a></li>
			  	 		<li><a href="148.70.168.210/infoweb/collect.jsp">我的收藏</a></li>
			  	 		<li><a href="148.70.168.210/infoweb/user.jsp">个人信息</a></li>
			  	 		<%--<li><a href="">退出</a></li>--%>
			  	 	</ul>
			  	 </div>
			  </span>
		</c:if>
		<a href="ShopCar">❀购物车<span class="listNum">0
			</span></a>
		<a href="javascript:;">☏我的客服</a>
	</div>
</header>
<nav>
	<a class="cur navTitle">首页</a>
	<c:forEach items="${tlist}" var="t">
			<span class="listTitle">
				<a href="reachByparentid?parentid=${t.protypeId}" class="parentname" parentid="${t.protypeId}">${t.protypeName}</a>
				<ul>
					<hr />
					<c:forEach items="${t.typelist}" var="ls">
						<li  class="children" childid="${ls.protypeId}">${ls.protypeName}</li>
					</c:forEach>
				</ul>
		    </span>
	</c:forEach>
	<span class="searchBorder">
		<input type="search" class="searchText" value="阿狸手办"/>
		<input type="button" class="searchBut" value="搜索"/>
		</span>
</nav>
<div class="midAD">
	<a href="javascript:;"  class="f1">商城首页</a>
	<c:if test="${parenttype != null}">
		<span>></span><a href="reachByparentid?parentid=${parenttype.protypeId}" >${parenttype.protypeName}</a>
	</c:if>
	<c:if test="${childrentype != null}">
		<span> ></span><a href="reachBychildrenid?childrenid=${childrentype.protypeId}" >${childrentype.protypeName}</a>
	</c:if>
</div>
<div id="guanggao" width="1920" height="200">
	<div class="list-banner">
		<a href="javascript:;" class="list-banlink" style="cursor:default;">
			<img src="img/guanggao.jpg" width="1920" height="200" class="list-banimg">
		</a>
	</div>
</div>
<div class="list-shop clearfix">
	<div class="fl sidebar" id="leftbox" >
		<div class="leixing">
			<dl class="navlist type">
				<dt>
					<i class="ico-menu navl-line"></i>
					<span style="cursor: pointer;">${parenttype.protypeName}</span>
				</dt>
				<c:forEach items="${parenttype.typelist}" var="lts">
					<dd>
						<a href="javascript:;" tid="${lts.protypeId}">${lts.protypeName}</a>
					</dd>
				</c:forEach>
			</dl>
			<dl class="navlist price">
				<dt>
					<i class="ico-menu navl-line"></i>
					<span style="cursor: pointer;">价格</span>
				</dt>
				<dd>
					<a href="javascript:;" value="0-300">100-300元</a>
				</dd>
				<dd>
					<a href="javascript:;"value="301-10000">300元以上</a>
				</dd>
			</dl>
			<dl class="navlist career">
				<dt>
					<i class="ico-menu navl-line"></i>
					<span style="cursor: pointer;" >英雄</span>
				</dt>
				<dd>
					<a href="javascript:;" job="上单">上单</a>
				</dd>
				<dd>
					<a href="javascript:;" job="中单">中单</a>
				</dd>
				<dd>
					<a href="javascript:;"job="ADC">ADC</a>
				</dd>
				<dd>
					<a href="javascript:;"job="辅助">辅助</a>
				</dd>
				<dd>
					<a href="javascript:;"job="打野">打野</a>
				</dd>
				<dd>
					<a href="javascript:;"job="坦克">坦克</a>
				</dd>
				<dd>
					<a href="javascript:;" job="法师">法师</a>
				</dd>
				<dd>
					<a href="javascript:;" job="射手">射手</a>
				</dd>
				<dd>
					<a href="javascript:;" job="刺客">刺客</a>
				</dd>
			</dl>
		</div>
	</div>
	<div class="fr shopcont" >
		<div class="cr_head">
			<div class="fl sorting-filter">
				<div class="sfbox">
					<span>默 认</span>
					<i class="ico-menu sfarr"></i>
				</div>
				<ul class="sortinglist">
					<li sort="asc">价格升序</li>
					<li sort="desc">价格降序</li>
				</ul>
			</div>
			<%--<div class="fl sorting-stock">
				<i class="sorting-check"></i>
				<span>仅显示有货</span>
			</div>--%>
			<div class="pagelist fr">
				<input type="number" name="pagenum" hidden="hidden" value="1"/>
				<div class="page">
                            <span >
                            	<a href="javascript:;" class="prevpage">上一页</a>
                            </span>


					<span >
                            	<a href="javascript:;"class="nextpage">下一页</a>
                            </span>
				</div>
			</div>
		</div>
		<!--tu-->
		<div class="good-list clearfix">
			<ul class="aprodunt">
				<c:forEach items="${plist}" var="p" varStatus="pi">
					<li>
						<a href="ProductInfo?proid=${p.proId}" class="alink">
							<c:if test="${p.proNewpro==1}">
								<div class="ico-mark i-new">
									<img src="img/new.png" width="117" height="108"/>
								</div>
							</c:if>
							<c:if test="${p.proNewpro==2}">
								<div class="ico-mark i-new">
									<img src="img/xianding.png" width="117" height="108"/>
								</div>
							</c:if>
							<c:if test="${p.proNewpro==3}">
								<div class="ico-mark i-new">
									<img src="img/xiannew.png" width="117" height="108"/>
								</div>
							</c:if>
							<c:if test="p.proNum==0">
								<div class="ico-mark i-pending">
									<img src="img/quehuo.png" width="117" height="108"/>
								</div>
							</c:if>
							<div class="gl-img showp" >
								<img src="${p.xpitlist.get(0).phAdress}" width="527" height="506" />
							</div>
							<div class="gl-img gl-hovering" hidden="hidden">
								<img src="${p.xpitlist.get(1).phAdress}" width="527" height="506" />
							</div>
						</a>
						<p class="gl-name">${p.proName}</p>
						<p class="gl-price">¥${p.proPrice}0</p>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="fr cr_head">
			<div class="pagelist fr">
				<div class="page">
                            <span >
                            	<a href="javascript:;" class="prevpage">上一页</a>
                            </span>
					<span>
                            	<a href="javascript:;"class="nextpage">下一页</a>
                            </span>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="bottomshop">
	<div class="fuwubar w980">
		<ul class="fuwu clearfix">
			<li>
				<span class="fw1"></span>
				<a class="fu1">7天无理由退换货</a>
			</li>
			<li>
				<span class="fw2"></span>
				<a class="fu2">100%官方正品</a>
			</li>
			<li>
				<span class="fw4"></span>
				<a class="fu4">全场每单满199元包邮</a>
			</li>
		</ul>
	</div>
</div>
<div class="helpCenter midDiv">
	<div class="divTitle" >常见问题</div>
	<div class="divCon">
		<p class="helpTitle">
			<a>购物指南</a>
		</p>
		<p class="helpCon">
			<a>帐号注册与登录</a><br />
			<a>购买流程</a><br />
			<a>支付方式</a><br />
		</p>
	</div>
	<div class="divCon">
		<p class="helpTitle">
			<a>配送服务</a>
		</p>
		<p class="helpCon">
			<a>全场满199元免运费</a><br />
			<a>配送范围及运费</a><br />
			<a>配送进度查询</a><br />
		</p>
	</div>
	<div class="divCon">
		<p class="helpTitle">
			<a>关于售后</a>
		</p>
		<p class="helpCon">
			<a>7天无理由退换货</a><br/>
			<a>退换货流程</a><br />
			<a>商品送错的处理方案</a><br />
			<a>售后服务及投诉</a><br />
		</p>
	</div>
	<div class="divCon">
		<p class="helpTitle">
			<a>联系我们</a>
		</p>
		<p class="helpCon">
			<a>客服热线：0755-25727866</a><br />
			<a>售后：service@lolriotmall.qq.com</a><br />
		</p>
	</div>
</div>
<footer>
	<img src="img/quantou.png"/>
	<div>
		<p>
			<a>关于商城</a><span>|</span><a>服务条款</a><span>|</span><a>合作伙伴</a><span>|</span><a>法律声明</a>
		</p>
		<p>
			深圳市合泰文化发展有限公司提供客服支持 | 客服邮箱： service@lolriotmall.qq.com
		</p>
		<p>
			Copyright (C) 1998 – 2018 Tencent. All Rights Reserved.腾讯公司 版权所有
		</p>
	</div>
</footer>



</body>
</html>
