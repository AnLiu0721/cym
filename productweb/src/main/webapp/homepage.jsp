<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页-次元猫周边商城</title>
	<link rel="stylesheet" href="css/home.css" />
	<script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
	<style>
		 .children,.listTitle .parentname{
		  cursor: pointer;
	  }
		 #ni,#nicheng{z-index: 120;
								   cursor: pointer;
								   position: relative;
							   }


	</style>
	<script type="text/javascript">
        $(window).resize(function(){
            jusWidth();
        });
        function jusWidth(){
            if($(window).width()>1300){
                $(".headerAD").width(600);
            }else{
                $(".headerAD").width(320);
            }
        }
        $(function () {

            $(".children").on('click',function(){
                var childrenid =$(this).attr("childid");
               window.location.href="reachBychildrenid?childrenid="+childrenid;
            })
            $("#nicheng").mouseover(function(){
                $(".info").show();
            }).mouseout(function () {
                $(".info").hide();
            })

        })
        $(document).ready(function(){
            jusWidth();
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
            var i = 1;
            var r = 0;
            var timer;
            $('.item').eq(0).show().siblings('.item').hide();
            showTime();
            function showTime(){
                timer = setInterval(function(){
                    Show();
                    i++;
                    if(i==3){
                        i=0;
                    }
                },5000);
            }
            function Show(){
                $('.item').eq(i).fadeIn().siblings('.item').hide();
                $('.sepAD input').eq(i).addClass('active').siblings('.sepAD input').removeClass('active');
            };
            $('.sepAD input').click(function(){
                i = $(this).index();
                Show();
            })
            reachcnum();


        });

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
		<marquee behavior="scroll" scrollamount="2" onmouseover=this.stop() onmouseout=this.start()>活动期间发货量巨大，新增订单将于七个工作日内发货，感谢理解！</marquee>
	</div>
	<div class="headerInfo">
		<c:if test="${empty u}">
			<a href="http://148.70.168.210/infoweb/login.jsp"><span id="ni" style="cursor: pointer;">你好，请登录</span></a>
		</c:if>
		<c:if test="${u!=null}">
			<span id="nicheng">欢迎，<a href="">${u.userNickname}</a>
			  	<div class="info" style="position: absolute; z-index: 15; padding-left:30px;display: none;">
			  	 	<ul>
			  	 		<li><a href="http://148.70.168.210/infoweb/showorder">我的订单</a></li>
			  	 		<li><a href="http://148.70.168.210/infoweb/collect.jsp">我的收藏</a></li>
			  	 		<li><a href="http://148.70.168.210/infoweb/user.jsp">个人信息</a></li>
			  	 		<%--<li><a href="">退出</a></li>--%>
			  	 	</ul>
			  	 </div>
			  </span>
		</c:if>
		<a href="ShopCar">❀购物车<span class="listNum">0</span></a>
		<a href="javascript:;">☏我的客服</a>
	</div>
</header>
<nav>
	<a class="cur navTitle">首页</a>
	<c:forEach items="${tlist}" var="t">
			<span class="listTitle">
				<a href="javascript:;" class="parentname" parentid="${t.protypeId}">${t.protypeName}</a>
				<ul>
					<hr />
					 <c:set var="tplist2" value="${t.typelist}"></c:set>
					<c:forEach items="${tplist2}" var="ls2">
						<li class="children" childid="${ls2.protypeId}">${ls2.protypeName}</li>
					</c:forEach>
				</ul>
		    </span>
	</c:forEach>
	<span class="searchBorder">
		<input type="search" id="searchText" class="searchText" value="阿狸手办"/>
		<input type="button" class="searchBut" value="搜索"/>
		</span>
</nav>
<div class="midAD">
	<ul id="play">
		<a class="item" href="#"><img src="img/ad01.jpg"/></a>
		<a class="item" href="#"><img src="img/ad02.jpg"/></a>
		<a class="item" href="#"><img src="img/ad03.jpg"/></a>
	</ul>
	<div class="sepAD">
		<input type="button" id="sepAD01" class="active"/>
		<input type="button" id="sepAD02" />
		<input type="button" id="sepAD03" />
	</div>
</div>
<div class="newPro midDiv">
	<div class="divTitle">新品速递</div>
	<div class="divCon">
		<a href=""></a> <img src="img/guanlangaoshou.jpg"/>
		<p>灌篮高手 德莱厄斯 手办（XL版）</p>
	</div>
	<div class="divCon">
		<a href=""></a><img src="img/kapai.jpg" />
		<p>卡牌大师 逆命 手办</p>
	</div>
	<div class="divCon">
		<a href=""></a><img src="img/lpl.jpg" />
		<p>LPL新品周边</p>
	</div>
	<div class="divCon">
		<a href=""></a><img src="img/zhandou.jpg" />
		<p>战斗校长 悠米专区</p>
	</div>
</div>
<div class="helpCenter midDiv">
	<div class="divTitle">常见问题</div>
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
			<a>7天无理由退换货</a><br />
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