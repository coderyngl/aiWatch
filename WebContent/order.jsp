<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
		<meta charset="UTF-8">
		<title>我的订单</title>
		<style>
			.footer{
				position: relative;
				top:400px;
				text-align: center;
			}
		</style>
		<link rel="stylesheet" href="dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/order.css" />
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
							 <a href="login.jsp">登录</a>
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
									 <a href="order.jsp">我的订单</a>
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
	描述：订单列表
-->
<table border="1" rules="all" bordercolor="grey" id="table1">
		<tr>
			<td width="110px" height="30px" style="cursor: pointer;">订单号</td>
			<td width="330px" height="30px" style="cursor: pointer;">商品</td>
			<td width="110px" height="30px" style="cursor: pointer;">总价钱</td>
			<td width="110px" height="30px" style="cursor: pointer;">数量</td>
			<td width="110px" height="30px" style="cursor: pointer;">完成状态</td>
			<td width="110px" height="30px" style="cursor: pointer;">操作</td>
		</tr>
		<c:forEach var="userbuy" items="${page.data}" varStatus="status">
			<tr id="data">
				<td height="100px" id="ordernum">${userbuy.ordernum}</td>
				<td height="100px" id="order">
					<img alt="" src="${userbuy.url }" width="100px;" height="100px;">
					<span>${userbuy.ubname}</span>
				</td>
				<td height="100px" id="price">${userbuy.price}</td>
				<td height="100px" id="number">${userbuy.num}</td>
				<c:if test="${userbuy.status ==0}" var="result" scope="request">
					<td height="100px" id="status">已加入购物车</td>
					<td><p onclick="" style="cursor: pointer; color: blue;" >移出购物车</p>
					<p onclick="" style="cursor: pointer; color: blue;" >付款</p></td>
				</c:if>
				<c:if test="${userbuy.status ==1}" var="result" scope="request">
					<td height="100px" id="status">已付款，待发货</td>
					<td><p onclick="" style="cursor: pointer; color: blue;" >查看进度</p></td>
				</c:if>
				<c:if test="${userbuy.status ==2}" var="result" scope="request">
					<td height="100px" id="status">完成交易</td>
					<td><p onclick="" style="cursor: pointer; color: blue;" >删除记录</p></td>
				</c:if>
			</tr>
		</c:forEach>
	</table >
	<div id="table2">
		<span id="dcode" style="display: none;">${name}</span>
  		 <p id="totalPage1">总共【${page.totalPage}】页 </p>
  		 <p id="pageNo">${page.pageNo}</p>
  		 <p id="xiegang">/</p>
  		 <p id="totalPage2">${page.totalPage}</p>
  		 <p id="fristpage" onclick="ajaxs(1)">首页</p>&nbsp;&nbsp;  
		 <c:choose>
		 <c:when test="${page.pageNo > 1}">
	   	 	<p id="uppage1" onclick="ajaxs(2)" style="color: blue; cursor: pointer;float: left;">上一页</p>&nbsp;&nbsp;
		 </c:when>
		 <c:otherwise><p id="uppage1">上一页 </p>&nbsp;&nbsp;</c:otherwise>
		 </c:choose>
		 <c:choose>
			 <c:when test="${page.pageNo < page.totalPage}">
	   			<p id="nextpage1" onclick="ajaxs(3)" style="color: blue; cursor: pointer;float: left;">下一页</p>&nbsp;&nbsp;
			 </c:when>
			 <c:otherwise><p id="nextpage1">下一页</p>&nbsp;&nbsp;</c:otherwise>
		 </c:choose>
  			<p id="lastpage" onclick="ajaxs(4)">尾页</p>             
   	</div>
</body>
<script type="text/javascript">
	function ajaxs(num){
		if(num==1){
			var datas={"name":$('#dcode').text(),"pageNo":1};
		}else if(num==2){
			var datas={"name":$('#dcode').text(),"pageNo":parseInt($('#table2 #pageNo').text())-1};
		}else if(num==3){
			var datas={"name":$('#dcode').text(),"pageNo":parseInt($('#table2 #pageNo').text())+1};
		}else{
			var datas={"name":$('#dcode').text(),"pageNo":$('#table2 #totalPage2').text()};
		}
		$.ajax({
			url:'PageServlet',
			type:'post',
			dataType:'json',
			data:datas,
			success:success_function,
			error:error_function
		});
	}
	function success_function(ajaxData){
		if("0"==ajaxData){
			location.href="order.jsp";
		}else{
			alert("保存失败！");
		}
	}
	function error_function(XMLHttpRequest, textStatus, errorThrown){
		 alert(XMLHttpRequest.status);
		 alert(XMLHttpRequest.readyState);
		 alert(textStatus);
	}
	
</script>
</html>

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
</html>
