<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <title>首页-次元猫周边商城</title>
    <link rel="stylesheet" href="css/dingdanzhifu.css" />
    <style type="text/css">
    	.bd{  
    		   width: 100%;
    		   margin-top: 130px;
    		    padding: 40px 0 200px;
    		   
    	}
    	.bd-main {
			    width: 1080px;
			    margin: 0 auto;
			    background: #fff;
			}
			.ep-wrapper {
				    position: relative;
				    margin-left: 0;
				}
				.bd-main-container {
    padding: 50px 270px 50px 250px;
}

.ep-order-detail {
    padding: 10px 0 20px;
}
.ep-order-tit {
    position: relative;
}
.ep-order-tit dl {
    padding-bottom: 12px;
}
.ep-order-tit dt,.ep-order-tit dd,.ep-order-tit span{
	font-size: 14px;
}
.ep-order-tit dt {
    float: left;
    color: #000;
    font-weight: 700;
    
}

.ep-order-tit dd {
    color: #707070;
}
.ep-order-tit dd input{
	border: 0px;
}
.ep-order-tit>span{
	    color: #000;
    font-weight: 700;
}
.ep-order-tit .rmb {
    margin: 0 8px 0 4px;
}
.ep-order-tit>span>em,#bigpr{
    color: #0ac265;
    font-weight: 400;
    font-size: 24px;
}
i,em{
	font-style: normal;
}
.ep-order-tit>span>em {
    color: #0ac265;
    font-weight: 400;
}
.ep-order-view {
    position: relative;
    margin-left: 10px;
    font-size: 14px;
    padding-right: 15px;
    transition: color .1s ease-in;
}
 .ep-order-tit a:hover{
    color: #3584cb;
}
.ep-order-tit a{
	text-decoration: none;
}
.ep-order-detail{
	border-bottom: 1px solid gainsboro;
}
.ep-order-detail .ep-order-con {
    padding-left: 72px;
}
.ep-order-con.show {
    display: block;
}
.ep-dl-list, .ep-order-con {
    font-size: 14px;
}
.ep-order-detail .ep-order-con dl {
    margin-top: 15px;
    margin-bottom: 0;
    
}
.show{
	 padding-bottom: 15px;
}
.show dt,.show dd{
	float: left;
	color: #707070;
}
.show dl:after{
	content: ".";
	display: block;
	clear: both;
	height: 0;
    visibility: hidden;
}
.zhifu{
	    padding-top: 25px;
	    padding-bottom: 100px;
}
.ep-btn.ep-btn-blue {
    width: 130px;
    height: 50px;
    background-color: #4580cb;
    border: 1px solid #3875c1;
    color: #fff;
    font-size: 16px;
    line-height: 50px;
}
.ep-btn {
    display: inline-block;
    border-radius: 2px;
    text-align: center;
    box-sizing: border-box;
    vertical-align: top;
    transition: color .1s ease-in,background-color .1s ease-in;
}
    </style>
    <script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
    <script type="text/javascript">
    	 $(function(){
    	 	times();
    	 	showinit();
    	 	$(".show").hide();
    	 	$(".xiangqing").click(function(){
    	 		 $(".show").toggle();
    	 	})
    	 	$(".tijiao").click(function(){
    	 		$.ajax({
         			type:"POST",
         			url:"AddOrders",
         			data:"num=num",
         			async:true,
         			dataType:"json",
         			success:function(mes){
         				if(mes!=''){
         					num.text(mes);
         				}
         			}
         		})
    	 	})
    	 })
    	 function showinit(){
    	 	var productname=$("[name='WIDsubject']").val();
    	 	var productno=$("[name='WIDout_trade_no']").val();
    	 	var productcount=$("[name='WIDtotal_amount']").val();
    	 	var productdesc=$("[name='WIDsubject']").val();
    	 	
    	 	 $("#bigpr,#smpr").text(productcount);
    	 	 $(".dingdan").text(productno);
    	 	  $("#dingname").text(productname);
    	 }
    	 function times(){
    		var shijian=document.getElementById("time");
    		var s=new Date();
    		var year=s.getFullYear();
    		var mouth=s.getMonth()+1;
    		var day=s.getDate();
    		if(mouth<10){mouth='0'+mouth;}
    		if(day<10){day='0'+day;}
    		shijian.innerHTML=year+"年"+mouth+"月"+day+"日";
    	}
    </script>
</head>
<body>
	<header>
		<img src="img/logo.png" class="logo"/>
		<img src="img/relatedlogo.png"/>
		<div id="headerAD" class="headerAD">
			<h1>订单支付</h1>
		</div>
	</header>
	
	<div class="bd" >
		<div class="bd-main">
			<div class="ep-wrapper" >
				<div class="ep-pay-step ep-step-channel bd-main-container" >
					<form action="alipay.trade.page.pay.jsp" name="alipayment" method="post" target="_blank">
					 <div class="ep-order-detail" >
					 	 <div >
					 	 	<div class="ep-order-tit">
					 	 		 <dl>
					 	 		 	<dt>商品订单：</dt>
					 	 		 	<dd class="dingdan"></dd>
					 	 		 </dl>
					 	 	</div>
					 	 	<div class="ep-order-tit">
					 	 		<span >
					 	 			支付金额：
					 	 			<em class="rmb">
					 	 				<i>¥</i>
					 	 				<span id="bigpr"></span>
					 	 			</em>
					 	 		</span>
					 	 		<a href="javascript:;" class="ep-order-view  ep-order-active xiangqing">
					 	 		    <span>订单详情</span>	
					 	 		    <i class="ep-icon ep-icon-arrow"></i>
					 	 		</a>
					 	 	</div>
					 	 	<div class="ep-order-con show" >
					 	 		<dl >
					 	 			<dt>商品名称：</dt>
					 	 			<dd id="dingname"></dd>
					 	 			<input name="WIDsubject" value="${proname}" hidden="hidden"/>
					 	 		</dl>
					 	 		<dl>
					 	 			<dt>商品订单：</dt>
					 	 			<dd class="dingdan"></dd>
					 	 			<input name="WIDout_trade_no" value="${OrderCode}" hidden="hidden"/>
					 	 		</dl>
					 	 		<dl>
					 	 			<dt>应付金额：</dt>
					 	 			<dd>
					 	 				<span >
							 	 			<em class="rmb">
							 	 				<i>¥</i>
							 	 				<span id="smpr"></span>
							 	 			</em>
					 	 		        </span>
					 	 			</dd>
					 	 			<input name="WIDtotal_amount" value="${countprice}" hidden="hidden"/>
					 	 			<input name="WIDbody"  hidden="hidden"/>
					 	 		</dl>
					 	 		<dl>
					 	 			<dt>购买时间：</dt>
					 	 			<dd id="time"></dd>
					 	 		</dl>
					 	 	</div>
					 	 </div>
					 </div>
				
				<div class="zhifu" >
				   <input type="submit" value="支付宝支付" class="ep-btn ep-btn-blue tijiao"/>
			    </div>
			   </form>
				</div>
			</div>
			
		</div>
	</div>	 
	     
</body>
</html>