<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>购买</title>
			<link rel="stylesheet" href="dist/css/bootstrap.min.css" />
			<link rel="stylesheet" href="css/shopping.css" />
		<script type="text/javascript" src="dist/js/jquery.js" ></script>
		<script type="text/javascript" src="dist/js/bootstrap.min.js" ></script>
	</head>
	<body>
		<!--
        	作者：961796326@qq.com
        	时间：2018-01-03
        	描述：头部导航
       -->
	<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="index.jsp">AiWatch</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="login.jsp">登录</a>
						</li>
						<li>
							 <a href="index.jsp">退出</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的商城<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a onclick="query();">我的订单</a>
								</li>
								<li>
									 <a href="person.jsp">个人资料</a>
								</li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input class="form-control" type="text" />
						</div> <button type="submit" class="btn btn-default">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#">网址导航</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">帮助中心<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">客服</a>
								</li>
								<li>
									 <a href="#">投诉</a>
								</li>
								<li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</div>

<!--
	作者：961796326@qq.com
	时间：2018-01-03
	描述：商品信息与交易
-->
<%
			String url = new String(request.getParameter("url").getBytes("ISO-8859-1"), "utf-8");
			String ubname = new String(request.getParameter("ubname").getBytes("ISO-8859-1"), "utf-8");
			String price = new String(request.getParameter("price").getBytes("ISO-8859-1"), "utf-8");
			session.setAttribute("url", url);
			session.setAttribute("ubname", ubname);
			session.setAttribute("price", price);
		%>

		<span id="name" style="display: none;">${name}</span>
<div>
	<div class="img_left">
		<img src="<%=url %>" id="url"/>
	</div>
	<div class="info_right">
			<ul>
			<li class="w-name"><p id="ubname"><%=ubname %>></p></li>
			<li class="w-price">￥<p id="price"><%=price %></p></li>
			<li>送货至：
				<select name="address">
				<option value="0">安徽省</option>	
				<option value="1">浙江省</option>
				<option value="2">江苏省</option>
				<option value="3">广东省</option>
				<option value="4">湖南省</option>
				<option value="5">湖北省</option>
			</select>
				<select name="address">
				<option value="00">北京</option>	
				<option value="11">上海</option>
				<option value="22">广州</option>
				<option value="33">深圳</option>
				<option value="44">合肥</option>
				<option value="55">芜湖</option>
			</select>
			</li>
			<li>购买数量:<input class="w-num" type="text" id="number" value="1"/></li>
			<li>
				<span><input class="btn" type="button" value="立即购买"  onclick="ajax1(1);"/></span>
				<span><input class="btn"  type="button" value="加入购物车"  onclick="ajax2(0);"/></span>
			</li>
		</ul>
	</div>
</div>


           <!--
        	作者：961796326@qq.com
        	时间：2018-01-03
        	描述：底部
        -->
        <div class="footer">
        	<p>友情链接：<a href="#">百度</a>|<a href="#">搜狐</a>|<a href="#">新浪</a>|<a href="#">淘宝</a>|<a href="#">京东</a>|</p>
        	<p>@Copyright<a href="#">合肥爪洼科技有限公司</a>联系电话：18355094052</p>
        </div>
	</body>
	<script type="text/javascript">
		/* 立即购买  */
		function ajax1(num){
			var datas={
					"url":$('#url')[0].src,
					"name":$('#name').text(),
					"ubname":$('#ubname').text(),
					"price":$('#price').text(),
					"number":$('#number').val(),
					"status":num,
					}
			$.ajax({
				url:'UserBuy',
				type:'post',
				dataType:'json',
				data:datas,
				success:success_function,
				error:error_function,
			});
			function success_function(ajaxdata){
				if(0==ajaxdata){
					alert("购买成功，请在我的订单查看。");
				}else{
					alert("购买失败");
				}
			}
			function error_function(){
				alert("错误");
			}
		}
		
		/*  加入购物车   */
		function ajax2(num){
			var datas={
					"url":$('#url')[0].src,
					"name":$('#name').text(),
					"ubname":$('#ubname').text(),
					"price":$('#price').text(),
					"number":$('#number').val(),
					"status":num,
					}
			$.ajax({
				url:'ShoppingServlet',
				type:'post',
				dataType:'json',
				data:datas,
				success:success_function,
				error:error_function,
			});
			function success_function(ajaxdata){
				if(0==ajaxdata){
					alert("添加购物车成功，请在我的订单查看。");
				}else{
					alert("加入购物车失败");
				}
			}
			function error_function(){
				alert("错误！")
			}
		}
		
		/* 查询订单 */
		function query(){
			var datas={
					"name":$('#name').text(),
					"pageNo":1,
					}
			$.ajax({
				url:'PageServlet',
				type:'post',
				dataType:'json',
				data:datas,
				success:success_function,
				error:error_function,
			});
			function success_function(ajaxdata){
				if(0==ajaxdata){
					location.href="order.jsp";
				}else{
					alert("查询失败");
				}
			}
			function error_function(){
				alert("错误！")
			}
		}
	</script>
</html>
