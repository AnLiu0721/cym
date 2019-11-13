<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页-次元猫周边商城</title>
	<link rel="stylesheet" href="css/gouwuche.css" />
	<script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
	<script type="text/javascript">
        $(function(){
            showjia();
            showkong();
            reachcnum();
            $(".jia").click(function(){
                var  num=$(this).prev().children("input");
                var  li=$(this).parent().parent();
                var  pronums=$(this).parent().next().val();
                var  va=num.val();
                if(va<pronums){
                    va++;
                    num.val(va);
                }
                showxiaoji(num,va);
                alternum(li,va);
                getCount()
            })
            $(".jian").click(function(){
                var  num=$(this).next().children("input");
                var  li=$(this).parent().parent();
                var  va=num.val();
                if(va>=2){
                    va--;
                    num.val(va);
                }
                showxiaoji(num,va);
                alternum(li,va);
                getCount();
            })
            $(".allcheck").click(function(){
                var gdslen=$(".goods_list_item");
                var gdscklen=$(".goods_list_item:checked");
                if(this.checked){
                    $(".goods_list_item").prop("checked",true);
                    $(".allcheck").prop("checked",true);
                }else{
                    $(".goods_list_item").prop("checked",false);
                    $(".allcheck").prop("checked",false);
                }
                getCount();
            })
            $(".goods_list_item").click(function(){
                getCount();
            })
            $(window).scroll(function(){
                var aa=$(".buyrightbar").children("div");
                if ($(document).scrollTop()>=30) {
                    aa.addClass("navBox_2");
                    aa.removeClass("navBox_1");
                } else{
                    aa.addClass("navBox_1");
                    aa.removeClass("navBox_2");
                }
            })
            $(".clearcar").click(function(){
                var shop=$(".j-cart-item").parent();
                var is=confirm("确定清空购物车吗？");
                if(is){
                    $.ajax({
                        type:"POST",
                        url:"ClearCarAll",
                        data:"uid=uid",
                        async:false,
                        dataType:"json",
                        success: function(msg){
                            if(msg==true){
                                shop.remove();
                                showscbox("购物车清空成功！");
                                $("#blk_cart_list").show();
                                $("#toalnum").empty().text(0);
                                $("#toalprice").empty().text(0);
                            }else{
                                showscbox("操作失败请重新操作！");
                            }
                        }
                    })
                }
            })
            $(".sc_buy,.sc_close").click(function(){
                $(".shoubox").hide(400);
                $(".msgbox").hide();
            })
            $("#nicheng").mouseover(function(){
                $(".info").show();
            }).mouseout(function () {
                $(".info").hide();
            })

            $(".del").click(function(){
                var delul=$(this).parent().parent();
                var pid=delul.children("li").find("[name='newslist']").val();
                var is=confirm("确定要删除此商品吗？");
                if(is){
                    $.ajax({
                        type:"POST",
                        url:"DeleteCarOne",
                        data:"pid="+pid,
                        async:false,
                        dataType:"json",
                        success: function(msg){
                            if(msg==true){
                                delul.remove();
                                showscbox("删除成功！");
                                $("#blk_cart_list").show();
                            }else{
                                showscbox("操作失败请重新操作！");
                            }
                        }
                    })
                }
                showkong();
                getCount();
            })
            $(".jie").on('click','.buy_bot',function(){
                var a=$("#toalprice").text();
               /* alert(a)
                for ( var i = 0; i <gdids.length; i++) {
                    alert(gdids[i]);
                    alert(gdnum[i]);
                } *///"AddOrder?proCount="+a+"&gdids="+gdids+"&gdnum="+gdnum;
                window.location.href="GouOrder?proCount="+a+"&gdids="+gdids+"&gdnum="+gdnum+"&type=2";
                return false;
            })

            $(".collect").click(function(){
                var delul=$(this).parent().parent();
                var pid=delul.children("li").find("[name='newslist']").val();
                $.ajax({
                    type:"POST",
                    url:"reachCollect",
                    data:"pid="+pid,
                    async:false,
                    dataType:"json",
                    success: function(msg){
                        if(msg==true){
                            showscbox("商品收藏成功！");
                            $("#blk_cart_list").show();
                        }else{
                            showscbox("商品已收藏,请勿重复收藏！");
                            $("#blk_cart_list").show();
                        }
                    }
                })
            })
        })
        function alternum(obj,pnum){
            var pid=obj.prev().prev().prev().find("input").val();
            $.ajax({
                type:"POST",
                url:"AlterCarnum",
                data:"pid="+pid+"&pnum="+pnum,
                async:false,
                dataType:"json",
            })
        }

        function showkong(){
            var gdslen=$(".goods_list_item").length;
            if(gdslen<=0){
                $(".buyshop").remove();
                $("#blk_cart_list").show();
            }
        }
        function showjia(){
            var inpt=$("[name='number']");
            $.each(inpt, function(i,n) {
                var num=$(n).val();
                var numparent=$(n).parent().parent().parent();
                var danjia=numparent.prev().find(".j-price");
                danjia=parseInt(danjia.text());
                var xiaoji=numparent.next().find(".j-xiaoji");
                num=parseInt(num);
                xiaoji.empty().text(danjia*num);
            });
        }

        function showxiaoji(numobj,num){
            var numparent=numobj.parent().parent().parent();
            var danjia=numparent.prev().find(".j-price");
            danjia=parseInt(danjia.text());
            var xiaoji=numparent.next().find(".j-xiaoji");
            num=parseInt(num);
            xiaoji.empty().text(danjia*num);
        }
        var gdids=new Array();//拿商品id
        var gdnum=new Array();//拿商品数量
        function getCount(){
            var contpr=0;//订单总价
            var nums=0;//订单总数
            gdids.splice(0,gdids.length);
            gdnum.splice(0,gdnum.length);//清空集合
            var gdslen=$(".goods_list_item").length;
            var gdscklen=$(".goods_list_item:checked").length;
            if(gdslen!=gdscklen){
                $(".allcheck").prop("checked",false);
            }
            else{
                $(".allcheck").prop("checked",true);
            }
            if(gdscklen>0){
                $("#jiesuan").removeClass("buy_bothui");
                $("#jiesuan").addClass("buy_bot");
            }else{
                $("#jiesuan").removeClass("buy_bot");
                $("#jiesuan").addClass("buy_bothui");
            }
            $(".goods_list_item").each(function(){
                if($(this).prop("checked")){
                    var goodsid=$(this).val();
                    gdids.push(goodsid);
                    var pli=$(this).parent().parent().next().next().next();
                    var num=pli.find("input").val();
                    gdnum.push(num);
                    var xiaoji=pli.next().find(".j-xiaoji").text();
                    contpr+=parseInt(xiaoji);
                    nums+=parseInt(num);
                }
            });
            $("#toalnum").empty().text(nums);
            $("#toalprice").empty().text(contpr);
        }
        function showscbox(msg){
            $("#alert_cont").text(msg);
            $(".msgbox").show();
            $(".shoubox").show(400);
        }
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
			<span id="ni" style="cursor: pointer;">你好，请登录</span>
		</c:if>
		<c:if test="${u!=null}">
			<span id="nicheng">欢迎，<a href="">${u.userNickname}</a>
			  	<div class="info" style="position: absolute; z-index: 15; padding-left:30px;display: none;">
			  	 	<ul>
			  	 		<li><a href="">个人订单</a></li>
			  	 		<li><a href="">个人订单</a></li>
			  	 		<li><a href="">个人订单</a></li>
			  	 		<li><a href="">个人订单</a></li>
			  	 	</ul>
			  	 </div>
			  </span>
		</c:if>
		<a href="ShopCar">❀购物车<span class="listNum">0
			</span></a>
		<a href="javascript:;">☏我的客服</a>
	</div>
</header>

<div class="buybar clearfix">
	<div class="buyleft fl">
		<div class="buyshop">
			<ul class="buyleft buytop">
				<li class="li_inp">
					<div class="buy_xuan">
						<input type="checkbox" class="allcheck"/> 全选
					</div>
				</li>
				<li class="li_sp">商品数量</li>
				<li class="li_dj">单价(元)</li>
				<li class="li_sl">数量</li>
				<li class="li_xj">小计</li>
				<li class="li_cz">操作</li>
			</ul>
			<!--商品-->
			<c:forEach items="${shoplist}" var="car">
				<ul class="j-cart-item buyli buylist clearfix">
					<li class="li_inp">
						<div class="j-radio buy_dian">
							<input type="checkbox" value="${car.shopProid}" name="newslist" class="goods_list_item"/>
						</div>
					</li>
					<li class="li_sp">
						<div class="">
							<a href="javascript:;">
								<img src="${car.product.xpitlist.get(0).phAdress}" class="gouimg"/>
							</a>
							<div class="buysp_wen fl">
								<a href="javascript:;">${car.product.proName}</a>
								<div class="mycart-item">
		 	  	 					<span class="c999 j-attr l">
		 	  	 						<span class="j-attr-name">颜色</span>
		 	  	 						:
		 	  	 						<span class="j-attr-value">彩色</span>
		 	  	 					</span>
									<span class="c999 j-attr l">
		 	  	 						<span class="j-attr-name">尺码</span>
		 	  	 						:
		 	  	 						<span class="j-attr-value">均码</span>
		 	  	 					</span>
								</div>
							</div>
						</div>
					</li>
					<li class="li_dj f14">
						<sapn>
							¥<span class="j-price">${car.product.proPrice}</span>
						</sapn>
					</li>
					<li class="li_sl sh">
						<div class="shuliang clearfix ">
							<span class="jian fl">-</span>
							<span class="fl"><input type="number" name="number" value="${car.shopPronum}" readonly="readonly"/></span>
							<span class="jia fl">+</span>
						</div>
						<input type="number" name="proNum" hidden="hidden" value="${car.product.proNum}"/>
					</li>
					<li class="li_xj" >
		 	  	 		<span >
		 	  	 			¥<span class="j-xiaoji"></span>
		 	  	 		</span>
					</li>
					<li class="li_cz">
						<a href="javascript:;" class="del">删除</a>&nbsp;&nbsp;
						<a href="javascript:;" class="collect" >收藏</a>
					</li>
				</ul>
			</c:forEach>
			<!--全选-->
			<ul class="buy_jix buyli">
				<li class="li_inp">
					<div class="buy_xuan">
						<input type="checkbox" class="allcheck"/> 全选
					</div>
				</li>
				<li class="li_sp">
					<a href="javascript:;">继续选购</a>
				</li>
				<li class="li_dj"> &nbsp;</li>
				<li class="li_sl"> &nbsp;</li>
				<li class="li_xj"> &nbsp;</li>
				<li class="li_cz">
					<a href="javascript:;" class="clearcar">清空购物车</a>
				</li>
			</ul>
		</div>

		<div id="blk_cart_list" style="display: none;">
			<div class="buyxgno">
				您的购物车中还没有商品， <a href="javasrcipt:;">去逛逛吧</a>
			</div>
		</div>
	</div>
	<div class="buyrightbar fr">
		<div class="navBox_1">
			<h3>我的购物车</h3>
			<div class="buybai">
				<div class="buy_youf buybottom">
					<span class="cfb6">全场包邮</span>
					<div class="buy_you2">
						<span class="fb cfff pl10">已满足</span>
						<a href="javasrcipt:;">更多商品</a>
					</div>
				</div>
				<div class="buy_wen buybottom jie">
					商品数量:<span style="margin-left: 15px;" id="toalnum">0</span><br/>
					商品金额:<span class="cfb6" style="margin-left: 15px; font-size: 16px;">¥<span id="toalprice">0</span>.00</span>
					<a href="javasrcipt:;" id="jiesuan" class="mt10 buy_bothui">去结算</a>
				</div>
				<div class="buy_wen clearfix">
					<div class="buy_baoz">
						<div class="fl buy_baozleft">承诺</div>
						<div class="fl buy_baozright">
							7天无理由退换货<br/>
							100%官方正品<br/>
							全场包邮<br/>
						</div>
					</div>
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
				<a class="fu4">全场包邮</a>
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
			<a>全场免运费</a><br />
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
<div class="msgbox"></div>
<div class="shoubox">
	<div class="sc_hd">
		<h4>温馨提示</h4>
		<a href="javascript:;" title="关闭" class="sc_close"><s></s></a>
	</div>
	<div class="sc_bd pd20">
		<p id="alert_cont"></p>
		<a href="javascript:;" title="确定" class="sc_buy">确定</a>
	</div>
</div>

</body>
</html>