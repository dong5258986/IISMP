<%@ page language="java" import="java.util.*,com.rms.model.*,com.rms.page.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

MembershipInfo memberinfo = (MembershipInfo)session.getAttribute("memberinfo");

if(memberinfo.getM_username()==null){
	response.sendRedirect(request.getContextPath() + "/login.jsp");
}
List<AttendanceChart> adc = (List<AttendanceChart>)request.getAttribute("attendanceChart");
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
    
    <!-- 日期显示 -->
    <link rel="stylesheet" type="text/css" href="css/pikaday.css"/>
	<script type="text/javascript" src="js/pikaday.min.js"></script>
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
    <!--导航选中效果 -->
    <script type="text/javascript">
      $(function(){
         $("a").siblings("li").removeClass("pre");//这个是将页面的上的所有不选中
         $("a[lang=0]").addClass("pre");//设置选中的
         $("a[lang=0]").css("color","#fff");
         $(".pre").hover(
	      function () {
	        $(this).css({"background-color":"#080808"});
	      }  
	     );
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
			
				<!-- 考勤导航 -->
				<jsp:include page="atten_navigation.jsp"></jsp:include>
				
				<!-- 我的考勤 -->
				<div class="col-md-9 column" style="-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);border:#EDEFF0 solid;border-width:5px; background-color: #FFFFFF;">
					<h4 style="margin-top:10px;">
						<span>考勤管理>>考勤导出</span>
						<span class="navbar-right" style="margin-right: 5px;">
						    <button type="button" onclick="shuaxindangqianjiemain();" class="btn btn-info btn-default btn-xs"> 刷&nbsp;新 </button>
						    <button type="button" onclick="openexportmodaldialog();" class="btn btn-info btn-default btn-xs"   data-toggle="modal" data-target="#modal-container-184701"> 导&nbsp;出 </button>
						    
						<!-- 导出开始 -->
						<div class="modal fade" id="modal-container-184701" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">
											导出文件
										</h4>
									</div>
									<div class="modal-body">
										<form class="form-inline" role="form">
										<div>
										  <div class="form-group">
										  	<label  class="p14-999">时间范围：</label>
										    <input type="text" class="form-control input-sm" id="datepicker" placeholder="****-**-**">
										    <script type="text/javascript">
											    var picker = new Pikaday(
											    {
											        field: document.getElementById('datepicker'),
											        firstDay: 1,
											        minDate: new Date('2010-01-01'),
											        maxDate: new Date('2020-12-31'),
											        yearRange: [2000,2020]
											    });
											</script>
											~
											<input type="text" class="form-control input-sm" id="datepicker1" placeholder="****-**-**">
										    <script type="text/javascript">
											    var picker = new Pikaday(
											    {
											        field: document.getElementById('datepicker1'),
											        firstDay: 1,
											        minDate: new Date('2010-01-01'),
											        maxDate: new Date('2020-12-31'),
											        yearRange: [2000,2020]
											    });
											</script>
										  </div>
										  </div><br>
										  <div>
										   <div class="form-group">
											    <label class="p14-999">选择列表：</label>
											    <select class="form-control input-sm" id="sectionexport_select">
											      <option>全部</option>
											      <option>javaweb组</option>
											      <option>Android组</option>
											      <option>PHP组</option>
											    </select>
											</div>
											</div><br>
											<div class="p14">
											<label class="p14-999">选择类型：</label>
											  <label class="checkbox-inline">
											    <input type="checkbox" id="tongji" name="tongjin">考勤统计表
											  </label>&nbsp;&nbsp;&nbsp;
											  <label class="checkbox-inline">
											    <input type="checkbox" id="jilu" name="jilun">考勤记录表
											  </label>&nbsp;&nbsp;&nbsp;
											  <label class="checkbox-inline">
											    <input type="checkbox" id="shenhe" name="shenhen">考勤审核表
											  </label>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										 <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
										 <button type="button" onclick="tijiaodaochuxinxi();" class="btn btn-primary">提交</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 导出结束 -->
						</span>
					</h4>
					<hr style="margin-top: 10px; height:1px;border:none;border-top:2px dotted ;">
					<div class="col-md-12 column" style="overflow-x:hidden; height:495px; ">
						<table class="table table-hover" style="font-size: 13px;">
						  <thead>
						    <tr>
						      <th>文件名称</th>
						      <th>导出人</th>
						      <th>导出时间</th>
						    </tr>
						  </thead>
						  <tbody id="attenexportbody">
						  <%
						  if(adc != null && adc.size() > 0){
							  for(int i=0;i<adc.size();i++){
						  	  		AttendanceChart a = adc.get(i);
						  %>
						    <tr id="<%=a.getId() %>">
						      <td>
						      	<span><%=a.getFilename() %></span>&nbsp;&nbsp;
						      	<a href="downloadFile?filename=<%=a.getFilename() %>" onclick="javascript:void(0);" style="text-decoration: none;">下载</a>&nbsp;&nbsp;
						      	<a href="javascript:void(0);" onclick="deletethisexportchart('<%=a.getId() %>');" style="text-decoration: none;">删除</a>
						      </td>
						      <td><%=a.getExportman() %></td>
						      <td><%=a.getTime() %></td>
						    </tr>
						    <%
							  }
						  }else{
						    %>
						    <tr><td>无信息...</td><td></td><td></td></tr>
						    <%
						  }
						    %>
						  </tbody>
						</table>
					
					</div>	
				</div>
				<!-- 我的考勤 -->
			</div>
		</div>
</div>
  </body>
</html>
