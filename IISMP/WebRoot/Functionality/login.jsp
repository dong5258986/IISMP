<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String error=(String)request.getAttribute("error");

System.out.println("a="+error);

boolean a=(error!=null);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>创新实验室自学管理平台</title>
    
    <link href="css/bootstraplogin.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css-v=4.4.0.css" tppabs="http://www.zi-han.net/theme/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/style.min.css" rel="stylesheet">
    <link href="css/login.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/login.min.css" rel="stylesheet">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    
    <link rel="Shortcut icon" href="img/favicon.ico">   
    
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
    <script type="text/javascript">
		var a=<%=a%>;
		if(a){
			alert('<%=error %>');
		}
		function checkLog() {
			if(form1.username.value==""){
				window.alert("用户名不能为空！！");
				return false;
				
			}
			if(form1.m_password.value==""){
				window.alert("密码不能为空！！");
				return false;
			}
			
		}
	</script>
	
	<!-- 蒲公英动画 -->
    <script type="text/javascript" src="Functionality/jquery.min.js"></script>
	<script type="text/javascript" src="Functionality/all.js"></script> 
	
</head>

<body class="signin">
   
    <!--蒲公英动画 -->
    <div class="snow-container" style="position:fixed;top:0;left:0;width:100%;height:100%;">
    </div>
    
     <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                       <captial style="font-size:32px;">创新实验室自学管理平台 </captial>
                    </div>
                    <div class="m-b"></div>
                    <br />
                    
                    <ul class="m-b" style="margin-left:30px;font-size:22px;">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 科研</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 创新</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 合作</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 前沿 </li>                       
                     </ul>
                   
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="loginAction">
                    <font class="no-margins" style="font-size:22px;"onclick="return checkLog();">登录：</font>
                    <br />
                    <input  name="m_username" type="text" class="form-control uname" placeholder="用户名" />
                    <input name="m_password" type="password" class="form-control pword m-b" placeholder="密码" />
                    <a href="">忘记密码了？</a>
                    <button class="btn btn-success btn-block" onclick="checkLog();">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2016 移动互联网创新中心 版权所有
            </div>
        </div>
    </div>
    
</body>

</html>
 
