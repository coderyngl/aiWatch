<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" href="dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/login.css" />
		<script type="text/javascript" src="dist/js/jquery.js" ></script>
		<script type="text/javascript" src="dist/js/bootstrap.min.js" ></script>
	</head>
	<body>
		<!--
        	作者：961796326@qq.com
        	时间：2018-01-03
        	描述：头部
        -->
        <div class="logo">
        	<h3>AiWatch</h3>
        </div>
        <div>
        	<img src="img/lunbo1.jpg"/>
        </div>
		<!--
        	作者：961796326@qq.com
        	时间：2018-01-03
        	描述：提交表单
        -->
        <div class="login">
        	<h4>登录</h4>
        	<form>
        		<input type="text" id="name" class="name" placeholder="用户名"/>
        		<input type="password" id="pwd" class="pwd" placeholder="密码"/><br />
        		<input type="button" value="登录" class="submit" onclick="ajax();"/>
        		<input type="button"  value="注册" class="register"/>
        	</form>
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
        <!-- 登录函数 -->
        <script type="text/javascript">
        	function ajax(){
        		var datas={"name":$('#name').val(),
        					"password":$('#pwd').val()		
        		};
        		$.ajax({
        			url:'LoginServlet',
        			type:'post',
        			datatype:'json',
        			data:datas,
        			success:success_function,
    				error:error_function
        		})
        	}
        	function success_function(ajaxData){
    			if("0"==ajaxData){
    				location.href="index.jsp";
    			}else{
    				alert("用户名或密码错误！");
    				location.href="login.jsp";
    			}
    		}
    		function error_function(){
    			alert("错误");
    		}
        </script>
	</body>
</html>
