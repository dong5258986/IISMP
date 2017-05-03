<%@ page language="java" import="java.util.*,com.rms.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Announce_section> ass = (List<Announce_section>)session.getAttribute("anno_section");
List<Announcement> announcement=(List<Announcement>)request.getAttribute("an");

List<Announcement> announcement1=(List<Announcement>)request.getAttribute("ament");
Announcement ment=announcement1.get(0);
List<MembershipInfo> mm=(List<MembershipInfo>)session.getAttribute("membershipInfo");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>创新实验室自学管理平台</title>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap_3.3.4.js" type="text/javascript"></script>
	<link href="css/bootstrap_3.3.4.css" rel="stylesheet">
	<link href="css/mycss.css" rel="stylesheet">
    <link href="css/jquery.datetimepicker.css" rel="stylesheet">
    <link rel="Shortcut icon" href="img/favicon.ico">   
    
    <script src="js/myjs.js" type="text/javascript"></script>
	<script src="js/dzjs.js" type="text/javascript"></script>
	<!-- 加载动画效果 -->
    <link href="css/jiazaidonghuacss/myspinner.css" rel="stylesheet" type="text/css" />
	<!-- 编辑器 -->
    <link rel="stylesheet" href="qingeditor/qingstyle.css" />
	<script charset="utf-8" src="qingeditor/qingeditor-min.js"></script>
	<script>var textarea_name='content';</script>
	<script charset="utf-8" src="qingeditor/qingeditor-set.js"></script>
    	   
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
	    
	    <!-- 导航选中效果 -->
	    <script type="text/javascript">
	      $(function(){
	         $("a").siblings("li").removeClass("pre");//这个是将页面的上的所有不选中
	         $("a[lang=1]").addClass("pre");//设置选中的
	         $("a[lang=1]").css("color","#fff");
	         $(".pre").hover(
		      function () {
		        $(this).css({"background-color":"#080808"});
		      }  
		     );
	      }) 
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
				<jsp:include page="anno_navigation.jsp"></jsp:include>
				
				<!-- 新建公告开始 -->
				<div class="col-md-9 column" style="-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);border:#EDEFF0 solid;border-width:5px; background-color: #FFFFFF;">
					<h4 style="margin-top:10px;">
						新建公告
					</h4>
					<span style="display: none;" id="announcement_type">保存并发布</span>
					<hr style="margin-top: 10px; height:1px;border:none;border-top:2px dotted ;">
					<div style="overflow-x:hidden; height:498px; ">
						<form class="form-horizontal" role="form" >
							
							<div class="form-group">
								<label class="col-sm-2 control-label">标题：</label>
							    <div class="col-sm-4">
							      <input class="form-control"  id="announcement_title" value="<%=ment.getAnnouncement_title() %>" type="text" onKeyDown="LimitTextArea36(this)" placeholder="请不要超过36个字...">
							    </div>
							</div>	
							<div class="form-group">
							  	<label class="col-sm-2 control-label">栏目：</label>
							  	
							  	<div class="col-sm-10" style="width: 300px;">
							  	<select class="form-control"  id="as_name">
									  	<%
									if(ass!=null  && ass.size()> 0){
										for(int i=0;i<ass.size();i++){
											Announce_section s = ass.get(i);
										
									%>
								 	<option onclick="javascript:void(0);"  value="<%=s.getAs_name()%>"><%=ment.getAs_name() %></option>
									 <%
								    	  }
								      }
									%>
								  	</select>
								  		
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">接收人：</label>
							  	
							  	<div class="col-sm-10" style="width: 300px;">
								  	<select class="form-control"   id="m_role">
									 	<option onclick="javascript:void(0);">管理员</option>
									    <option onclick="javascript:void(0);">组长</option>
									    <option onclick="javascript:void(0);">组员</option>
								  	</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">公告内容：</label>
							    <div class="col-sm-8">
							 
							    	<!-- 编辑器开始 -->
							    	<form action="?" id="con" class="con" name="form1" method="post" style="width:100%;">
								      <textarea id="cot" class="cot" name="content" style="width:100%;height:285px;">
								                <%=ment.getAnnouncement_info() %>
								      </textarea>
								    </form>
							    	<!-- 编辑器结束 -->
							    	
							    </div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"></label>
							    <div class="col-sm-8" >	
							    <span style="display: none" id="anno_id"><%=ment.getAnnouncement_id() %></span> 
							    <span style="display: none" id="anno_editnote">edit</span>    	 
							      	<button type="button" class="btn btn-default btn-info"  onclick="addannocement()">保存并发布</button>&nbsp;&nbsp;
			                   <!-- <button type="button" class="btn btn-default btn-info"  onclick="baocun()">保存</button>&nbsp;&nbsp; -->
									<button type="button" class="btn btn-default" onclick="back()">取消</button>
							    </div>
							</div>
						</form>
					</div>	
				</div>
				<!-- 新建公告结束 -->
			</div>
		</div>
</div>
  </body>
</html>
