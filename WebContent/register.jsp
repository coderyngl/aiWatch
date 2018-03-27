<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
			<link rel="stylesheet" href="dist/css/bootstrap.min.css" />
			<link rel="stylesheet" href="css/register.css" />
		<script type="text/javascript" src="dist/js/jquery.js" ></script>
		<script type="text/javascript" src="dist/js/bootstrap.min.js" ></script>
	</head>
	<body>
		<div id="bgc">
		<!--
        	作者：961796326@qq.com
        	时间：2018-01-03
        	描述：头部
        -->
        <div class="logo">
        	<h3><a href="index.jsp">AiWatch</a></h3>
        </div>
        
        <!--
        	作者：961796326@qq.com
        	时间：2018-01-03
        	描述：注册表单
        -->
        <center>
        <div class="register">
		<form>
			<div>
				<input type="text" id="id" placeholder="id">
			</div>
			<div>
				<input type="text" id="name" placeholder="用户名">
			</div>
			<div>
				<input type="text" id="age" placeholder="年龄">
			</div>
			<div>
				<input type="password" id="password" placeholder="设置密码">
			</div>
			<div>
				<input type="text" id="sex" placeholder="性别">
			</div>
			<div>
				<input type="text" id="phonenum" placeholder="手机号">
			</div>
			<div>
				<input type="text" id="message" placeholder="邮箱">
			</div>
			<input  id="btn" type="button" value="注册" onclick="add();">
		</form>
        </div>
       </center>
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
		<!-- 注册函数 -->
		<script>
			function add(){
				var datas={"id":$('#id').val(),
						"name":$('#name').val(),
						"age":$('#age').val(),
						"password":$('#password').val(),
						"sex":$('#sex').val(),
						"phonenum":$('#phonenum').val(),
						"message":$('#message').val()
				}
				$.ajax({
					url:'RegisterServlet',
					type:'post',
					datatype:'json',
					data:datas,
					success:success_function,
					error:error_function
				})
			}

			function success_function(ajaxData){
				if("0"==ajaxData){
					alert("注册成功！")
					location.href="login.jsp";
				}else{
					alert("注册失败！");
				}
			}
			
			function error_function(){
				alert("错误！");
			}
		</script>        
	</body>
</html>
