<%@ page language="java" import="java.util.*,com.rms.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

/* MembershipInfo memberinfo = (MembershipInfo)session.getAttribute("memberinfo");

if(memberinfo.getM_username()==null){
	response.sendRedirect(request.getContextPath() + "/login.jsp");
} */
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>创新实验室自学管理平台</title>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap_3.3.4.js" type="text/javascript"></script>
	<link href="css/bootstrap_3.3.4.css" rel="stylesheet">
	<link href="css/mycss.css" rel="stylesheet">
    <link href="css/jquery.datetimepicker.css" rel="stylesheet">
    <!-- 加载动画效果 -->
    <link href="css/jiazaidonghuacss/myspinner.css" rel="stylesheet" type="text/css" />
     <link rel="Shortcut icon" href="img/favicon.ico">   
    
    <script src="js/myjs.js" type="text/javascript"></script>

   <!-- 下划线跟随效果 -->
	    <link href="css/lanrenzhijia.css" rel="stylesheet" type="text/css" />
	    <script type="text/javascript" src="js/jquery.easing.min.js"></script>
	    <script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
	    <script type="text/javascript">
	        $(function() {
	            $("#line").lavaLamp({
	                fx: "backout", 
	                speed: 600,
	                click: function(event, menuItem) {
	                    return false;
	                }
	            });
	        });
	    </script>
  </head>
  
<body style="background-color: #EDEFF0;">

 
<!-- 导航栏开始 -->
<jsp:include page="../navigation.jsp"></jsp:include>
<!-- 导航栏结束 -->

<!-- 主界面   -->
<div class="container"  style="margin-top:60px;">
	<div class="row clearfix">
			<div class="row clearfix">
			
				<!-- 公告栏导航 -->
				<jsp:include page="personal_navigation.jsp"></jsp:include>
						
				<!-- 全部公告 -->
				<div class="col-md-9 column" style="-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);border:#EDEFF0 solid;border-width:5px; background-color: #FFFFFF;">
					<h4 style="margin-top:10px;">
						<span>个人设置</span>
					</h4>
					<hr style="margin-top: 10px; height:1px;border:none;border-top:2px dotted ;">
					<div class="col-md-12 column" style="overflow-x:hidden; height:495px; ">
						<div class="col-md-7 column">
							<span class="p13-999" style="margin-left: -20px;">基本信息</span>
							<span class="p13-999">
								--------- ---------- --------- -------- ------- ------ ----- ---- --- -- - - - - - 
							</span>
							<br><br>
							<div class="form-horizontal" style="font-size: 13px;">
								<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999" >姓名：</span></label>
							    	<div class="col-sm-9">
							      		<span>武媚娘</span>
							    	</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999">姓别：</span></label>
							    	<div class="col-sm-9">
							      		女
							    	</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999">分组：</span></label>
							    	<div class="col-sm-9">
							      		JavaWeb组
							    	</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999">职务：</span></label>
							    	<div class="col-sm-9">
							      		管理员
							    	</div>
							  	</div>
							  		<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999">QQ号：</span></label>
							    	
							    	
							    	<!-- 如果qq号为空 -->
								    	<div id="tianjiaqq">
								    		<div class="col-sm-9">
							      				 <button type="button" onclick="hidethis11();" class="btn btn-link btn-xs">
							      				 	<span style="margin-left: -5px;">添加QQ号</span>
							      				 </button>
								    		</div>
								    	</div>
								    	<div id="tijiaoQQhao">
									    	<div class="col-sm-6">
									      		<input type="text"  class="form-control input-sm" placeholder="请输入QQ号">
									    	</div>
									    	<div class="col-sm-4">
									    		<button class="btn btn-default btn-info btn-sm" type="button">提交</button>
									    		<button onclick="hidequxiao11();" class="btn btn-default btn-sm" type="button">取消</button>
									    	</div>
								    	</div>
								    	<script type="text/javascript">
								    	 $(function(){
									    	 	$("#tijiaoneirong").hide(); 
									    	 	$("#beizhuneirong").hide(); 
									    	 	$("#tijiaoQQhao").hide();
									    	 	$("#youxiang2").hide(); 
									    	 	$("#tijiaobanji").hide();
									    	 	/* $('#"hidethis"').click(function(){
									    	 		alert("sdf");
									            }); */
									     });
								    	 	
								    	 function hidethis11(){
								    		 $("#tijiaoQQhao").show(); 
								    		 $("#tianjiaqq").hide(); 
								    	 }
								    	 function hidequxiao11(){
								    		 $("#tijiaoQQhao").hide(); 
								    		 $("#tianjiaqq").show();
								    	 }
								    	</script>
								    <!-- 如果qq号为空 -->
							  	</div>
								<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999">手机：</span></label>
							    	
							    	
							    	<!-- 如果手机号为空 -->
								    	<div id="lianjie">
								    		<div class="col-sm-9">
							      				 <button type="button" onclick="hidethis();" class="btn btn-link btn-xs">
							      				 	<span style="margin-left: -5px;">添加手机号码</span>
							      				 </button>
								    		</div>
								    	</div>
								    	<div id="tijiaoneirong">
									    	<div class="col-sm-6">
									      		<input type="text"  class="form-control input-sm" placeholder="请输入手机号">
									    	</div>
									    	<div class="col-sm-4">
									    		<button class="btn btn-default btn-info btn-sm" type="button">提交</button>
									    		<button onclick="hidequxiao();" class="btn btn-default btn-sm" type="button">取消</button>
									    	</div>
								    	</div>
								    	<script type="text/javascript">
								    	
								    	 function hidethis(){
								    		 $("#tijiaoneirong").show(); 
								    		 $("#lianjie").hide(); 
								    	 }
								    	 function hidequxiao(){
								    		 $("#tijiaoneirong").hide(); 
								    		 $("#lianjie").show();
								    	 }
								    	</script>
								    <!-- 如果手机号为空 -->
							  	</div>
							  	
							  	
							  	<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999">班级：</span></label>
							  	<!-- 如果所在班级为空 -->
								    	<div id="lianjiebanji">
								    		<div class="col-sm-9">
							      				 <button type="button" onclick="hidethisbanji();" class="btn btn-link btn-xs">
							      				 	<span style="margin-left: -5px;">添加所在班级</span>
							      				 </button>
								    		</div>
								    	</div>
								    	<div id="tijiaobanji">
									    	<div class="col-sm-6">
									      		<input type="text"  class="form-control input-sm" placeholder="请输入班级名称">
									    	</div>
									    	<div class="col-sm-4">
									    		<button class="btn btn-default btn-info btn-sm" type="button">提交</button>
									    		<button onclick="hidequxiaobanji();" class="btn btn-default btn-sm" type="button">取消</button>
									    	</div>
								    	</div>
								    	<script type="text/javascript">
								    	
								    	 function hidethisbanji(){
								    		 $("#tijiaobanji").show(); 
								    		 $("#lianjiebanji").hide(); 
								    	 }
								    	 function hidequxiaobanji(){
								    		 $("#tijiaobanji").hide(); 
								    		 $("#lianjiebanji").show();
								    	 }
								    	</script>
								    <!-- 如果如果所在班级为空 -->
							  	</div>
							  	
							  	<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999">备注：</span></label>
							    	
							    	<!-- 如果备注为空 -->
							    	<div id="beizhuwenzi">
							    		<div class="col-sm-9">
						      				 <button type="button" onclick="hidezhu();" class="btn btn-link btn-xs">
						      				 	<span style="margin-left: -5px;">添加备注信息</span>
						      				 </button>
							    		</div>
							    	</div>
							    	<div id="beizhuneirong">
								    	<div class="col-sm-6">
								      		<textarea class="form-control" rows="3"></textarea>
								    	</div>
								    	<div class="col-sm-4">
								    		<br><br><br>
								    		<button class="btn btn-default btn-info btn-sm" type="button">提交</button>
								    		<button onclick="hidebei();" class="btn btn-default btn-sm" type="button">取消</button>
								    	</div>
								    </div>
								    <script type="text/javascript">
							    	 	
							    	 function hidezhu(){
							    		 $("#beizhuneirong").show(); 
							    		 $("#beizhuwenzi").hide(); 
							    	 }
							    	 function hidebei(){
							    		 $("#beizhuneirong").hide(); 
							    		 $("#beizhuwenzi").show();
							    	 }
								    </script>
								    <!-- 如果备注为空 -->
							  	</div>
							 </div>
							 <span class="p13-999" style="margin-left: -20px;">账号信息</span>
								<span class="p13-999">
									--------- ---------- --------- -------- ------- ------ ----- ---- --- -- - - - - - 
								</span>
							<br><br>
							<div class="form-horizontal" style="font-size: 13px;">
								<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999" >账号：</span></label>
							    	<div class="col-sm-9">
							      		<span>admin777</span>
							    	</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999" >邮箱：</span></label>
							    	
							    	<!-- 如果邮箱为空 -->
								    	<div id="youxiang1">
								    		<div class="col-sm-9">
							      				 <button type="button" onclick="youxiang3();" class="btn btn-link btn-xs">
							      				 	<span style="margin-left: -5px;">添加邮箱</span>
							      				 </button>
								    		</div>
								    	</div>
								    	<div id="youxiang2">
									    	<div class="col-sm-6">
									      		<input type="text"  class="form-control input-sm" placeholder="请输入email">
									    	</div>
									    	<div class="col-sm-4">
									    		<button class="btn btn-default btn-info btn-sm" type="button">提交</button>
									    		<button onclick="youxiang4();" class="btn btn-default btn-sm" type="button">取消</button>
									    	</div>
								    	</div>
								    	<script type="text/javascript">
								    	 function youxiang3(){
								    		 $("#youxiang2").show(); 
								    		 $("#youxiang1").hide(); 
								    	 }
								    	 function youxiang4(){
								    		 $("#youxiang2").hide(); 
								    		 $("#youxiang1").show();
								    	 }
								    	</script>
								    <!-- 如果邮箱为空 -->
							  	</div>
							    <div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999" >密码：</span></label>
							    	<div class="col-sm-7">
							      		********
							    	</div>
							    	<div class="col-sm-2">
								    	<a id="modal-722544" href="#modal-container-712543" data-toggle="modal" style="text-decoration: none;">修改</a>
							    	</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="col-sm-2"><span class="p13-999" >时间：</span></label>
							    	<div class="col-sm-9">
							      		<span>2016-11-09</span>
							    	</div>
							  	</div>
				<!-- 弹框开始 -->
		      	<div class="modal fade" id="modal-container-712543" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">
									修改密码
								</h4>
							</div>
							<div class="modal-body" style="font-size: 13px;">
								<form class="form-horizontal" role="form">
								  <div class="form-group">
								    <label for="firstname" class="col-sm-2 control-label">当前密码：</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control input-sm" id="firstname" placeholder="请输入当前密码">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="lastname" class="col-sm-2 control-label">新密码：</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control input-sm" id="lastname" placeholder="请输入新密码">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="lastname" class="col-sm-2 control-label">确认密码：</label>
								    <div class="col-sm-8">
								      <input type="password" class="form-control input-sm" id="lastname" placeholder="请确认密码">
								    </div>
								  </div>
								</form>
							</div>
							<div class="modal-footer">
								 <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button> 
								 <button type="button" class="btn btn-primary btn-sm">保存</button>
							</div>
						</div>
					</div>
				</div>
		      	<!-- 弹框结束 -->
							</div>
						</div>
						<div class="col-md-3 column">
							<div align="center">
							<br>
							<img src="img/user2.jpg" class="img-responsive" style="border-radius: 50%;width: 150px;height: 150px;margin-top: 20px;margin-bottom: 20px;"/>
								<a href="javascript:void(0);" style="text-decoration: none;">
									<span class="p13">修改</span>
								</a>
							</div>
						</div>
						<div class="col-md-1 column"></div>
					</div>	
				</div>
				<!-- 全部公告 -->
			</div>
		</div>
</div>
  </body>
</html>
