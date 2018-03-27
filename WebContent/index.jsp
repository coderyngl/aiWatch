<%@page import="bdqn_yl.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="bdqn_yl.dao.Impl.ILoginDaoImpl"%>
<%@page import="bdqn_yl.entity.Watch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
		<meta charset="utf-8" />
		<title>首页</title>
		<link rel="stylesheet" href="dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/index.css" />
		<script type="text/javascript" src="dist/js/jquery.js" ></script>
		<script type="text/javascript" src="dist/js/bootstrap.min.js" ></script>
	</head>
	<body>
		<!--
        	作者：961796326@qq.com
        	时间：2018-01-02
        	描述：头部导航栏
        -->
<div class="container-fluid">
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
					   <c:if test="${empty name}">
						 <a id="login" href="login.jsp">hi,请登录</a>
					  </c:if>
					  <c:if test="${not empty name}">
							 <a>hi,${name}</a>
					  </c:if>
						</li>
						<li>
							 <a href="register.jsp">注册</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的商城<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="person.jsp">个人资料</a>
								</li>
								<li>
									 <a href="order.jsp" onlick="ajax();">我的订单</a>
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
						<li>
									 <a href="login.jsp" >退出</a>
								</li>
					</ul>
				</div>
				
			</nav>
		</div>
	</div>
</div>
<!--
	作者：961796326@qq.com
	时间：2018-01-02
	描述：轮播图
-->
<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="carousel slide" id="carousel-79339">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-79339">
					</li>
					<li data-slide-to="1" data-target="#carousel-79339">
					</li>
					<li data-slide-to="2" data-target="#carousel-79339">
					</li>
					<li data-slide-to="3" data-target="#carousel-79339">
					</li>
					<li data-slide-to="4" data-target="#carousel-79339"> 
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="img/lunbo1.jpg" />
						<div class="carousel-caption">
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/lunbo2.jpg" />
						<div class="carousel-caption">
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/lunbo3.jpg" />
						<div class="carousel-caption">
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/lunbo4.jpg" />
						<div class="carousel-caption">
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/lunbo5.jpg" />
						<div class="carousel-caption">
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-79339" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-79339" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
	</div>
</div>
<!--
	作者：961796326@qq.com
	时间：2018-01-02
	描述：左侧导航菜单 
-->
<div class="left_menu" id="lm">
	<dl>
		<dt>全部商品</dt>
		<dd><a href="#">顶级品牌 </a>百达翡丽/伯爵</dd>
		<dd><a href="#">奢华品牌 </a>欧米茄/劳力士</dd>
		<dd><a href="#">轻奢品牌 </a>天梭/迪沃斯</dd>
		<dd><a href="#">时尚潮牌 </a>卡西欧/DW丹尼尔·惠灵顿</dd>
		<dd><a href="#">智能国产 </a>飞亚达/爱普生</dd>
		<dd><a href="#">表带 </a>积优/奇美拉</dd>
	</dl>
</div>


<%
	ILoginDaoImpl iLoginDaoImpl=new ILoginDaoImpl();
	List<Watch> listwatch=iLoginDaoImpl.watch();
	session.setAttribute("listwatch", listwatch);
%>
<!--
	作者：961796326@qq.com
	时间：2018-01-02
	描述：热销商品
-->
<div id="watchlist">
		<p class="hotsell">热销商品</p>
			<c:forEach var="listwatch" items="${listwatch}" varStatus="status">
				<div class="watch" id="watch">
				<a href="shopping.jsp?url=${listwatch.wurl}&ubname=${listwatch.wname}&price=${listwatch.wprice}">
				 		<ul>
							<li><img class="w-image" src="${listwatch.wurl}"/></li>
							￥<li id="price" class="w-price">${listwatch.wprice}</li>
							<li class="w-name">${listwatch.wname}</li>
						</ul>
				</a>
				</div>
			</c:forEach>
		</div>
</div>

<!--
	作者：961796326@qq.com
	时间：2018-01-03
	描述：店家推荐
-->
<%
	List<Product> listproduct=iLoginDaoImpl.product();
	session.setAttribute("listproduct", listproduct);
%>
<div id="watchlist">
		<p class="recommend">店家推荐</p>
		<p>
			<c:forEach var="listproduct" items="${listproduct}" varStatus="status">
				<div class="watch" id="watch">
				<a href="shopping.jsp?url=${listproduct.purl}&ubname=${listproduct.pname}&price=${listproduct.pprice}">
					<ul>
						<li><img class="w-image" src="${listproduct.purl}"/></li>
						￥<li class="w-price">${listproduct.pprice }</li>
						<li class="w-name">${listproduct.pname}</li>
					</ul>
					</a>
				</div>
			</c:forEach>
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
	
	<script type="text/javascript">
	function ajax(){
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