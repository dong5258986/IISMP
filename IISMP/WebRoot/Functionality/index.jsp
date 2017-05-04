<%@ page language="java" import="java.util.*,com.rms.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
MembershipInfo memberinfo = (MembershipInfo)session.getAttribute("memberinfo");

if(memberinfo.getM_username()==null){
	response.sendRedirect(request.getContextPath() + "/login.jsp");
}
%>
<!-- 这是个测试方法 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>" >
    <title>创新实验室自主学习管理平台</title>
	<script src="js/jquery.min.js"></script>	
	<script src="js/bootstrap_3.3.4.js" type="text/javascript"></script>
	<link href="css/bootstrap_3.3.4.css" rel="stylesheet">
	<link href="css/mycss.css" rel="stylesheet">
	<script type="text/javascript" src="js/myjs.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
    <link href="css/jquery.datetimepicker.css" rel="stylesheet">
 
     <link rel="Shortcut icon" href="img/favicon.ico">   
   
    <script type="text/javascript" src="js/annojs.js"></script>
     
    <!-- 下划线跟随效果 -->  
    <link href="css/lanrenzhijia.css" rel="stylesheet" type="text/css" />
    <!-- 加载动画效果 -->
    <link href="css/jiazaidonghuacss/myspinner.css" rel="stylesheet" type="text/css" />

	<!-- 日期显示 -->
    <link rel="stylesheet" type="text/css" href="css/pikaday.css"/>
	<script type="text/javascript" src="js/pikaday.min.js"></script>
    
<script type="text/javascript">
		$(document).ready(function () { 
			$("#memberinfosid").hide();
			$("#stydyplanid").hide();
			$("#announcementid").show();
			//根据成员id查询是否签到
			//var m_id = $("#memberinfo_ids").val();
			var m_id= <%=memberinfo.getM_id() %>;
			//alert(m_id);
			url1 = url + '/judgememberatten';
			$.ajax({   
		    	type:'POST', //用POST方式传输   
		        url:url1,      //目标地址 
		        datatype:"html",       
		        data:{"m_id":m_id},
				cache:false,
		        success:function(data) {
		        	//alert(data);
		        	var checkin = "&nbsp;";
		        	var checkout = "&nbsp;";
		        	var kaoqinanniu = "";
		        	var str = eval("("+data+")");
		        	if(str.isCheckin){
		        		if(str.instate){
		        			checkin = "<h3 style='color: red'>" + str.check_in_time + "</h3>";
		        		}else{
		        			checkin = "<h3 style='color: #999'>" + str.check_in_time + "</h3>";
		        		}
		        		kaoqinanniu = "<button type='button' onclick='qiantuimethod();' class='btn btn-default btn-block btn-info' style='margin-bottom: 20px;'>签退</button>";
		        		checkout = '<h3 id="shangban"></h3>';
		        	}else {
		        		kaoqinanniu = "<button type='button' onclick='qiandaomethod();' class='btn btn-default btn-block btn-info' style='margin-bottom: 20px;'>签到</button>";
		        		checkin = '<h3 id="shangban"></h3>';
		        		checkout = "<h3>00:00:00</h3>";
		        	}
		        	if(str.isCheckout){
		        		if(str.outstate){
		        			checkout = "<h3 style='color: red'>" + str.check_out_time + "</h3>";
		        		}else{
		        			checkout = "<h3 style='color: #999'>" + str.check_out_time + "</h3>";
		        		}
		        		kaoqinanniu = "<button type='button' class='btn btn-default btn-block btn-info disabled' style='margin-bottom: 20px;'>签退</button>";
		        	}
		       		document.getElementById('checkindate').innerHTML = checkin;
		       		//document.getElementById('checkoutdate').innerHTML = checkout;
		       		$("#check_in_id").html(str.check_in);
		       		$("#check_out_id").html(str.check_out);
		       		$("#checkoutdate").html(checkout);
		       		$("#kaoqinanniu").html(kaoqinanniu);
		         	//alert(checkout);
		        },
		        error:function(data) {
					alert("操作失败，请刷新后重新操作！！");
				}
		    }); 
			
		});
			var t=new Date().valueOf();
			function fillzero(v){
				if(v<10){
					v="0"+v;
				}
				return v;
			}
			showTime();
			function getLocalTime(Sj) {
				var timess = fillzero(new Date(parseInt(Sj)).getHours())+":"+fillzero(new Date(parseInt(Sj)).getMinutes())+":"+fillzero(new Date(parseInt(Sj)).getSeconds());
				//alert(timess);
				//document.getElementById("shangban").innerHTML=timess;
				$("#shangban").html(timess);
			}
			function showTime() {
				t+=1000;
				getLocalTime(t);
				window.setTimeout(showTime,1000);
			}
		
</script>
    
  </head>
  <!-- overflow:hidden; -->
<body style="background-color: #EDEFF0;" >
		
<!-- 导航栏开始 -->
<jsp:include page="navigation.jsp"></jsp:include>
<!-- 导航栏结束 -->
<!-- 主界面   -->
<div class="container"  style="margin-top:60px;">
	<div class="row clearfix">
			<div class="row clearfix">
				<!-- 个人资料 -->
				<jsp:include page="index_navigation.jsp"></jsp:include>
				
				<!-- 学习公告 -->
				<div id="announcementid"><jsp:include page="index_announcement.jsp"></jsp:include></div>
				
				<!-- 学习计划 -->
				<div id="stydyplanid"><jsp:include page="index_studyplan.jsp"></jsp:include></div>
				
				<!-- 通讯录 -->
				<div id="memberinfosid"><jsp:include page="index_memberinfos.jsp"></jsp:include></div>
				
				<div class="col-md-3 column">
					<div class="col-md-12 column" style="-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);border:#EDEFF0 solid;border-width:5px; background-color: #FFFFFF;">
					<table class="table table-bordered">

					  <caption>
					         考勤
					    <a href="Functionality/attendence/atten_index.jsp" style="text-decoration:none;float:right;">>></a> 
					  </caption>
					  <tbody>
					    <tr>
					      <td align="center">
					      	<h4 >上班</h4>
					      	<span id="check_in_id"> 19:00</span>
					      </td>
					      <td id="checkindate"></td>
					    </tr>
					    <tr>
					      <td align="center">
					      	<h4 >下班</h4>
					      	<span id="check_out_id"> 22:00</span>
					      </td>
					      <td id="checkoutdate"></td>
					    </tr>
					  </tbody>
					</table>
					 	<div id="kaoqinanniu">
						</div>
					</div>					
					
					<!-- 日历开始 -->
					<div class="col-md-12 column" style="-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);border:#EDEFF0 solid;border-width:5px; background-color: #FFFFFF;z-index:1;">
			          <div id="datetimepicker" style="width:100%;">
			            <input id="datetimepicker3" style="display: none;" type="text" />			          			            
			          </div>				
			        </div>
			        <!-- 日历结束-->	
			       
	    </div>
     </div>
  </div>
</div>

</body>
  
   <!--  <script src="js/jquery.datetimepicker.js"></script>
    <script src="js/jqueryback.js"></script> -->
    <script src="js/jquery.datetimepicker.full.js"></script>
    <script>
    
		$.datetimepicker.setLocale('ch');
		$('#datetimepicker').datetimepicker({
		dayOfWeekStart : 1,
		lang:'ch',
		disabledDates:['1986/01/08','1986/01/09','1986/01/10'],
		startDate:	'1986/01/05'
		});
		
		$('#datetimepicker3').datetimepicker({
			inline:true
		});

</script>

    <!-- 下划线跟随效果 -->  
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

</html>
