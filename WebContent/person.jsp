<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人资料</title>
		<link rel="stylesheet" href="dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/person.css" />
		<script type="text/javascript" src="dist/js/jquery.js" ></script>
		<script type="text/javascript" src="dist/js/bootstrap.min.js" ></script>
	</head>
	<body>
		<div class="container-fluid">
	<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> 
					 <a class="navbar-brand" href="index.jsp">AiWatch</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="login.jsp">登录</a>
						</li>
						<li>
							 <a href="login.jsp">退出</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的商城<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="order.jsp" onclick="query();">我的订单</a>
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
	描述：个人信息展示
-->
<div class="person">
	<h2>个人资料</h2>
	<ul>
		<li>用户名:<input type="text" value="${name}" id="name"/></li>
		<li>&nbsp;&nbsp;&nbsp;&nbsp;年龄:<input type="text" value="${age}" id="age"/></li>
		<li>&nbsp;&nbsp;&nbsp;&nbsp;性别:<input type="text" value="${sex}" id="sex"/></li>
		<li>手机号:<input type="text" value="${phonenum }" id="phonenum"/></li>
		<li>&nbsp;&nbsp;&nbsp;&nbsp;邮箱:<input type="text" value="${message}" id="message"/></li>
	</ul>
	<input class="btn"  value="修改信息" onclick="update();"/>
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
        
        <!-- 修改函数 -->
        <script>
        	function update(){
        		var datas={"name":$('#name').val(),
        				"age":$('#age').val(),
        				"sex":$('#sex').val(),
        				"phonenum":$('#phonenum').val(),
        				"message":$('#message').val()
        		}
        		$.ajax({
        			url:'UpdateUser',
        			type:'post',
        			datatype:'json',
        			data:datas,
        			success:success_function,
					error:error_function
        		})
        	}
        	function success_function(ajaxData){
				if("0"==ajaxData){
					alert("修改成功")
					location.href="person.jsp";
				}else{
					alert("修改失败！");
				}
			}
			
			function error_function(){
				alert("错误！");
			}
			
        </script>
	</body>
</html>
