<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页-次元猫周边商城</title>
	<link rel="stylesheet" href="css/details.css" />
	<link rel="stylesheet" type="text/css" href="css/zoomio.css"/>
	<style type="text/css">
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
	</style>
	<script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
	<script type="text/javascript" src="js/jquery.animate_from_to-1.0.js"></script>
	<script type="text/javascript" src="js/zoomio.js"></script>
	<script type="text/javascript">
        $(function(){
            var user='${u.userId}';
            var fail='你还未登陆,请先登录！';
            ings();
            reachcnum();
            if(user!=''){
                isShou();
            }
            var pnum=parseInt('${product.proNum}')
            $(".sampleimage").zoomio();
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

            $(".xiangli img").click(function(){
                var aa=$(this).attr("src");
                var big=$("#big").attr("src",aa);
            })
            $("[name='number']").blur(function(){
                var num=$(this).val().trim();
                var isnum=/^[0-9]*$/g;
                var ss=isnum.test(num);
                if(!ss||num<1){
                    $("[name='number']").val(1);
                }
                if(num>pnum){
                    $("[name='number']").val(pnum);
                }
            })
            $(".jia").click(function(){
                var  num=$("[name='number']");
                var  va=num.val();
                if(va<100){
                    va++;
                    num.val(va);
                }
            })
            $(".jian").click(function(){
                var  num=$("[name='number']");
                var  va=num.val();
                if(va>=2){
                    va--;
                    num.val(va);
                }
            })
            $(".wei").click(function(){
                var addurl="addCollect";
                var wei='你已成功添加收藏!';
                if(user!=''){
                    daShou(addurl,wei);
                    $(this).hide();
                    $(".yi").show();
                }else{
                    showscbox(fail);
                }
            })
            $(".yi").click(function(){
                var delurl="delCollect";
                var yi='你已成功取消收藏!';
                daShou(delurl,yi);
                $(this).hide();
                $(".wei").show();
            })
            $(".sc_buy,.sc_close").click(function(){
                $(".shoubox").hide(400);
                $(".msgbox").hide();
            })

            $(".d_xaing").click(function(){
                $(".d_shou,.d_ping").removeClass('lcolor');
                $(".d_xaing").addClass('lcolor');
                $(".pinglun,.shouhou").hide();
                $(".pro_img").show();

            })
            $(".d_shou").click(function(){
                $(".d_xaing,.d_ping").removeClass('lcolor');
                $(".d_shou").addClass('lcolor');
                $(".pro_img,.pinglun").hide();
                $(".shouhou").show();
            })
            $(".d_ping").click(function(){
                $(".d_shou,.d_xaing").removeClass('lcolor');
                $(".d_ping").addClass('lcolor');
                $(".pro_img,.shouhou").hide();
                $(".pinglun").show();
            })
            $(".jiashop").click(function(){
                var cg='添加购物车成功';
                var addgou="Addshopcar";
                if(user!=''){
                    daShou(addgou,cg);
                    $(".jiatit").css("display","inline-block");
                }else{
                    showscbox(fail);
                }
            })

			$(".sale").click(function(){
			    var pid=$("[ name='pid']").val();
               var num= $("[name='number']").val()
				var price='${product.proPrice}';
               var count=parseInt(num)*parseInt(price);
			    if(user!=''){
                    var gdids=new Array();//拿商品id
                    var gdnum=new Array();//拿商品数量
                    gdids.push(pid);
                    gdnum.push(num);
                  window.location.href="GouOrder?proCount="+count+"&gdids="+gdids+"&gdnum="+gdnum+"&type=1";
				}else{
                    showscbox(fail);
				}
			})
			$("#nicheng").mouseover(function(){
                $(".info").show();
			}).mouseout(function () {
                $(".info").hide();
            })

            $("#dicuessprev").click(function () {
                var ul=$(".alli");
                var pagenum=$("[name='pagenum']");
                var num=pagenum.val();
                $.ajax({
                    type:"POST",
                    url:"discussPagePrevious",
                    data:"num="+num+"&size=5",
                    async:false,
                    dataType:"json",
                    success:function(mes) {
                        if(mes!=''){
                            var num = mes.num;
                            pagenum.val(num);
                            ul.empty();
                            $.each(mes.productList, function (i, n) {
                                var node ='<li style="padding:0 0 35px;" class="cboth">\n' +
                                    '\t\t\t\t\t\t\t\t<div class="userinfo" >\n' +
                                    '\t\t\t\t\t\t\t\t\t<img src="img/touxiang.png" />\n' +
                                    '\t\t\t\t\t\t\t\t\t<p class="username" >'+n.users.userNickname+'</p>\n' +
                                    '\t\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t\t<div class="mid">\n' +
                                    '\t\t\t\t\t\t\t\t\t<div class="pingfen">\n' +
                                    '\t\t\t\t\t\t\t\t\t\t<span >商品评分:</span>\n' +
                                    '\t\t\t\t\t\t\t\t\t\t<span style="margin-left: 15px;">'+n.discussMayi+'星</span>\n' +
                                    '\t\t\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t\t\t<div class="pingjia">\n' +
                                    '\t\t\t\t\t\t\t\t\t\t\t'+n.discussContect+''+
                                    '\t\t\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t\t\t<div class="time"><%--${d.discussdtimes}--%></div>\n' +
                                    '\t\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t</li>';
                                ul.append(node);
                            })
                        }
                    }
                })
            })
            $("#dicuessnext").click(function () {
                var ul=$(".alli");
                var pagenum=$("[name='pagenum']");
                var num=pagenum.val();
                $.ajax({
                    type:"POST",
                    url:"discussPageNxet",
                    data:"num="+num+"&size=5",
                    async:false,
                    dataType:"json",
                    success:function(mes) {
                        if(mes!=''){
                            var num = mes.num;
                            pagenum.val(num);
                            ul.empty();
                            $.each(mes.productList, function (i, n) {
                                var node ='<li style="padding:0 0 35px;" class="cboth">\n' +
                                    '\t\t\t\t\t\t\t\t<div class="userinfo" >\n' +
                                    '\t\t\t\t\t\t\t\t\t<img src="img/touxiang.png" />\n' +
                                    '\t\t\t\t\t\t\t\t\t<p class="username" >'+n.users.userNickname+'</p>\n' +
                                    '\t\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t\t<div class="mid">\n' +
                                    '\t\t\t\t\t\t\t\t\t<div class="pingfen">\n' +
                                    '\t\t\t\t\t\t\t\t\t\t<span >商品评分:</span>\n' +
                                    '\t\t\t\t\t\t\t\t\t\t<span style="margin-left: 15px;">'+n.discussMayi+'星</span>\n' +
                                    '\t\t\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t\t\t<div class="pingjia">\n' +
                                    '\t\t\t\t\t\t\t\t\t\t\t'+n.discussContect+''+
                                    '\t\t\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t\t\t<div class="time"><%--${d.discussdtimes}--%></div>\n' +
                                    '\t\t\t\t\t\t\t\t</div>\n' +
                                    '\t\t\t\t\t\t\t</li>';
                                ul.append(node);
                            })
                        }
                    }
                })
            })

        })
        function ings(){
            var aa=$(".xiangli img").attr("src");
            var big=$("#big").attr("src",aa);
        }
        function showscbox(msg){
            $("#alert_cont").text(msg);
            $(".msgbox").show();
            $(".shoubox").show(400);
        }

        function daShou(Url,ms){
            var pid=$("[name='pid']").val();
            $.ajax({
                type: "POST",
                url: Url,
                data: "pid="+pid,
                async:false,
                dataType:"json",
                success: function(msg){
                    if(msg==true){
                        showscbox(ms);
                    }else{
                        showscbox("操作失败请重新操作！(商品数量已达上限)");
                    }
                }
            })
        }
        function isShou(){
            var pid=$("[name='pid']").val();
            $.ajax({
                type: "POST",
                url:"reachIfCollect",
                data: "pid="+pid,
                async:false,
                dataType:"json",
                success: function(msg){
                    if(msg==true){
                        $(".wei").hide();
                        $(".yi").show();
                    }else{
                        $(".yi").hide();
                        $(".wei").show();
                    }
                }
            })
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
        /*  function showpartname(){
            var par=$("#type");
            par.empty();
             $.ajax({
                type:"POST",
                url:"shoezhuName",
                data:"name=name",
                async:false,
                dataType:"json",
                success:function(data){
                    alert(data.length)
                     for(var i=0;i<data.length;i++){
                          var node='<span class="listTitle">';
                              node+='<a href="javascript:;">'+data[i].protypeName+'</a>';
                              node+='<ul>';
                              node+='<hr/>';
                    for(var j=0;j<data[i].typelist.length;j++){
                              node+='<li>'+data[i].typelist[j].protypeName+'</li>';
                        }
                              node+='</ul>';
                              node+='</span>';
                     }
                     node=$(node);
                     par.append(node);
                }
            })
        }  */
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
			<span id="nicheng">欢迎，<a href="">${u.userNickname}</a>
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
	<div id="type">
		<c:forEach items="${tlist}" var="t">
			<span class="listTitle">
				<a href="reachByparentid?parentid=${t.protypeId}">${t.protypeName}</a>
				<ul>
					<hr/>
					<c:forEach items="${t.typelist}" var="ls">
						<a href="reachBychildrenid?childrenid=${ls.protypeId}"><li>${ls.protypeName}</li></a>
					</c:forEach>
				</ul>
		    </span>
		</c:forEach>
	</div>
	<span class="searchBorder">
		<input type="search" class="searchText" value="阿狸手办"/>
		<input type="button" class="searchBut" value="搜索"/>
		</span>
</nav>
<div class="midAD">
	<a href="javascript:;"  class="f1">商城首页</a>
	<span> ></span><a href="reachByparentid?parentid=${parentpt.protypeId}" >${parentpt.protypeName}</a>
	<span> ></span><a href="reachBychildrenid?childrenid=${childrenpt.protypeId}" >${childrenpt.protypeName}</a>
	<span> ></span><a href="javascript:;" >${product.proName}</a>
</div>
<div class="maindel">
	<div class="cleft">
		<div class="xiangli">
			<ul style="padding-top: 70px;">
				<c:forEach items="${product.xpitlist}" var="x">
					<li> <a href="javascript:;"><img src="${x.phAdress}"  style="width: 34px;height: 34px;"/></a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="bigimg" >
			<img id="big"  class="sampleimage" />
			<div class="xin">
				<c:if test="${product.proNewpro==1}">
				<img src="img/new.png" style="width:72px;height: 79px;"/>
				</c:if>
				<c:if test="${product.proNewpro==2}">
					<img src="img/xianding.png" style="width:72px;height: 79px;"/>
				</c:if>
				<c:if test="${product.proNewpro==3}">
					<img src="img/xiannew.png" style="width:72px;height: 79px;"/>
				</c:if>
			</div>
		</div>
	</div>
	<div class="cright">
		<div class="xiangq_b">
			<h2>${product.proName}</h2>
			<input name="pid" value="${product.proId}" hidden="hidden"/>
		</div>
		<div class="xiangq_p">
			<span class="jname">现价:</span>
			<span class="m">￥</span>
			${product.proPrice}0
		</div>
		<div class="xiangq_d">
			<ul>
				<li>最近销量 255</li>
				<li>累计评价${discunum}</li>
				<li>累计收藏宝贝 ${collectnum}</li>
			</ul>
		</div>
		<div class="xiangq_g">
			颜色：
			<span class="ge">彩色</span>
		</div>
		<div class="xiangq_g">
			规格：
			<span class="ge">常规</span>
		</div>
		<div class="xiangq_s">
			数量：
			<a href="javascript:;" ><span class="jian">-</span></a>
			<span><input type="text" name="number" value="1" /></span>
			<a href="javascript:;"><span class="jia">+</span></a>
			<span style="font-size: 13px; margin-left: 15px;">(库存充足)</span>
			<div class="shoucang">
				<a href="javascript:;" class="wei" > <div class="weishou" >
					<span class="hui" ></span>收藏宝贝</div>
				</a>
				<a href="javascript:;" class="yi" style="display: none;"><div class="yishou"  >
					<span class="hong" ></span>已收藏</div>
				</a>
			</div>

		</div>
		<div class="xiangq_m">
			<a href="javascript:;">
				<span class="sale">立即购买</span>
			</a>
			<a href="javascript:;"class="jiashop" ><span class="car">
		      	   	<span style="margin-right: 12px;">加入购物车</span>
		      	    </span >
			</a>
			<span class="jiatit">
			      	   	<div>&nbsp;</div>
			      	   	    成功加入！<br />
			      	   	          <a href="ShopCar" class="pl10" style="margin-left: 35px;">去购物车</a>
			      	   </span>
		</div>
		<div class="xiangq_t">
			<ul>
				<li>
					<span class="fw1"></span>
					<a href="javasrcipt:;">7无理由退换</a>
				</li>
				<li>
					<span class="fw2"></span>
					<a href="javasrcipt:;">100%官方正品</a>
				</li>
				<li>
					<span class="fw3"></span>
					<a href="javasrcipt:;">全场每单包邮</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>

<div class="mian_review">
	<div class="zong">
		<div class="tu_xiang">
			<ul>
				<li class="d_xaing lcolor">商品详情</li>
				<li class="d_ping">用户评价<span>(${discunum})</span></li>
				<li class="d_shou">售后服务</li>
			</ul>
		</div>
		<div class="san">
			<!--商品详情-->
			<div class="pro_img"  style="display: block;">
				<c:forEach items="${product.jpitlist}" var="j">
					<p><img src="${j.phAdress}"/></p>
				</c:forEach>
			</div>
			<!--评论详情-->
			<div class="pinglun" style="display: none;" >
				<ul class="alli">
					<c:if test="${ not empty dlist }">
						<c:forEach items="${dlist}" var="d">
							<li style="padding:0 0 35px;" class="cboth">
								<div class="userinfo" >
									<img src="img/touxiang.png" />
									<p class="username" >${d.users.userNickname}</p>
								</div>
								<div class="mid">
									<div class="pingfen">
										<span >商品评分:</span>
										<span style="margin-left: 15px;">${d.discussMayi}星</span>
									</div>
									<div class="pingjia">
											${d.discussContect}
									</div>
									<div class="time"><%--${d.discussdtimes}--%></div>
								</div>
							</li>
						</c:forEach>
					</c:if>
				</ul>

				<div class="dicuss">
					<div class="page">
						<input type="number" name="pagenum" hidden="hidden" value="1"/>
                            <span >
                            	<a href="javascript:;"  id="dicuessprev">上一页</a>
                            </span>
						<span >
                            	<a href="javascript:;" id="dicuessnext">下一页</a>
                            </span>
					</div>
				</div>
			</div>

			<div class="shouhou"  style="display: none;">
				<div class="helphead">7天无理由退换货</div>
				<div class="helpmain">
			     		<span>
			     			一、“"七天无理由退换货”服务的商品品类划分 <br />
			     			二、顾客提出“七天无理由退换货”服务的申请条件 <br />
			     			三、“七天无理由退换货”服务的申请流程<br />
			     			四、关于邮费争议问题<br />
			     			五、各品类《商品完好定义》<br />
			     		</span>
					<span class="sb4 cred">一、“ 七天无理由退换货”服务的商品品类划分</span>
					<span class="cred">
			     			1 目前商城大部分商品支持“七天无理由退换货”；<br />
                            2 商城中金饰类、定制预售类、福袋类产品、含虚拟道具赠品类及海报类属特殊商品，除破损等质量问题外，不支持7天无理由退换货服务；<br />
			     		</span>
					<span class="sb4">
			     			二、顾客提出“七天无理由退换货”服务的申请条件
			     		</span>
					<span >
			     				1 提出的商品需在支持“七天无理由退换货”的商品品类范围内，"七天无理由退换货"的商品品类参见《七天无理由退换货"服务的商品品类划分》。商城依据商品品类划分后的“七天无理由退换货”服务于周边商城正式上线执行，具体约定以商品服务标签为准。<br />
								2 顾客在签收商品之日起七天内（按照物流签收后的第二天零时起计算时间，满168小时为7天）发起申请；<br />
								3 顾客的服务申请在形式上符合相关法律法规的规定；<br />
								4 申请金额仅以顾客实际支付的商品价款为限；<br />
								5 顾客提出“七天无理由退换货”服务的申请，商品需完好，详见各品类《商品完好定义》；<br />
			     			</span>

					<span class="sb4">
			     			三、“七天无理由退换货”服务的申请流程
			     		</span>
					<span >
			     				1 在满足上述申请条件的前提下，顾客联系客服发起“七天无理由退换货”服务的申请；<br /> 
								2 在收到顾客“七天无理由退换货”服务申请后，客服指引顾客提供相关证明，确认及判定； <br />
								3 当LOL周边商城根据相关规范判定顾客“七天无理由退换货”服务申请成立，则开始进入退换货流程；<br />
								4 申请金额仅以顾客实际支付的商品价款为限；<br />
								5 顾客提出“七天无理由退换货”服务的申请，商品需完好，详见各品类《商品完好定义》；<br />
			     			</span>

					<span class="sb4">
			     			四、关于邮费争议问题
			     		</span>
					<span >
			     				由顾客发起的“七天无理由退换货”服务的邮费承担原则：交易中的运费争议，根据“谁过错，谁承担”的原则处理<br />
								1 如果商品存在质量问题、描述不符合等商家责任，来回运费都需要由商家承担；<br />
								2 如果是商品不喜欢等客户责任，则来回运费由客户来承担；<br />
			     			  </span>
					<span class="sb4">
			     			五、各品类《商品完好定义》
			     		</span>
					<table border="1" cellspacing="0" cellpadding="0" class="ex_table">
						<tbody style="border: 0;">
						<tr>
							<td class="tdleft">类目名称</td>
							<td class="tdleft">商品完好定义</td>
						</tr>
						<tr>
							<td class="tdleft">手办</td>
							<td>
								1 商品外包装完整，相关附（配）件齐全； 手办类商品外包装未拆封；<br/>
								2 商品表面无划痕、无磨损、无磕碰、无使用、无拆卸等痕迹；<br/>
								3 防伪标识码未刮开或撕损；<br/>
							</td>
						</tr>
						<tr>
							<td class="tdleft">服装</td>
							<td>
								1 商品外包装完整，相关附（配）件齐全； 手办类商品外包装未拆封；<br/>
								2 商品表面无划痕、无磨损、无磕碰、无使用、无拆卸等痕迹；<br/>
								3 防伪标识码未刮开或撕损；<br/>
							</td>
						</tr>
						<tr>
							<td class="tdleft">海报</td>
							<td>
								1 商品外包装完整，相关附（配）件齐全；<br/>
								2 商品表面无划痕、无破损、无使用等痕迹；<br/>
							</td>
						</tr>
						<tr>
							<td class="tdleft">适用以上所有类目</td>
							<td>
								上述商品完好定义中，赠品发票说明、定义补充如下：
								1 （若有）赠品遗失破损、发票遗失不影响原商品退还；赠品破损或遗失可折价（如能估量折价的，以估值折价为准；无法估值折价的，折价上限不超过原商品成交价的10%）、发票遗失按相应退税点由用户承担；<br/>
								2 外包装的定义：系指商品出厂原包装，不含商家或物流自行二次封装；<br/>
								3 塑封包装的定义：生产厂商采用密封条（签）或整体塑（密）封形式对商品的包装<br/>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="helphead">退换货流程</div>
				<div class="helpmain">
					<img src="img/tuihuo_lc.jpg" style="margin: 0 15%;"/>
					<span class="sb4">1. 联系客服发起退/换货申请</span>
					<span>
				     		凡在次元猫周边商城购买商品，您即可享受次元猫周边商城的售后服务。如果您需要办理退/换货，请您先通过电话或邮件的方式与次元猫周边商城客服中心联系。<br/>
								客服联系方式： QQ: 售前服务 售后服务     客服电话: 0755-25727866    客服邮箱: 1520795882@qq.com<br/>
								客服服务时间： 周一至周日（节假日均可），每天上午09:00-晚上24:00<br/>
				     	</span>
					<span class="sb4">2.客服确认是否可以退/换货</span>
					<span>
				     		<span class="cred">有质量问题商品退/换货：</span> 买家需向客服提供说明商品质量问题的图片，客服根据7天无理由退/换货相关规定对商品进行判定商品是否可以进入退/换货流程；<br/>
							<span class="cred">无质量问题商品的退/换货：</span> 客服根据7天无理由退/换货的时间规定，判定商品是否可以进入退/换货流程；<br/>
							注：手办、雕塑等易碎品需在签收快递前进行检验，如有破损，请选择拒收快递；<br/>
							如产品涉及到虚拟道具或实物礼品的赠送，我们只接受有质量问题的退换货。如您需要退货，我们将一起追回所赠送的道具或礼品。<br/>
				     	</span>
					<span class="sb4">3. 如何邮寄退/换货商品</span>
					<span>
				     		<span class="cred"> 3-1. 邮寄所需材料：</span>
							需退换货的商品+商品发货清单（详见商品包装内）+发票（如果有发票则需一同寄回）+防伪卡 <br/>
							备注：务必在商品发货单背面完善以下信息，发货单背面信息如下。<br/>
				     	</span>
					<img src="img/tuihuo_lc2.jpg" />
					<span>
				     		备注：如以上信息有缺失，可能会造成我们无法为您办理退换货事宜；如因您填写资料有误，而导致无法退换货、延误退换货的时间，英雄联盟游戏周边商城不承担责任。如商品发货单及发票(如有)未随货物一并寄回，可能造成我们延误办理退换货、甚至无法为您办理退换货。
				     	</span>
					<span>
				     		<span class="cred"> 3-2. 退/换货包裹接收地址： </span>
							快递地址：广东省东莞市常平镇田尾村富兴2号瑞金科技园1栋三楼 邮编：523570<br/>
							单位名称：深圳市合泰文化发展有限公司<br/>
							收件人：合泰退货仓<br/>
							电话：0755-25727866<br/>
				     	</span>
					<span>
				     		<span class="cred"> 3-3. 邮费说明： </span>
							商品质量问题的退/换货：我们会为您承担回邮费用（请您注意使用合理的方式进行邮寄，英雄联盟游戏周边商城为您承担的邮寄费用上限原则上不超过次元猫周边商城向您收取的货物运费金额。例如：若给您邮寄商品时的邮费是15元，则我们为您承担回邮费用不超过15元）；<br/>
							邮费承担方式：邮寄时买家需先垫付邮费，在收到商品的7日内，邮费会转到买家财付通账户或买家提供的其他账户；<br/>
							商品无质量问题的退/换货：回邮的费用需由您自行承担。<br/>
				     	</span>
					<span>
				     		<span class="sb4"> 4. 客服收货后退款/重新发货时间</span>
							退货：收到退货商品后，我们会于2个工作日内将款项退回，具体到账时间以银行到账时间为准；<br/>
							换货：收到需要换货的商品后，我们会于1个工作日内（按照物流签收后的第二天零时起计算时间，满168小时为7天）将所调换商品寄出；
				     	</span>
				</div>
			</div>
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
