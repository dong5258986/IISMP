var url = 'http://' + window.location.host + '/IISMP/';
function findthisannouncementinfo(obj){
	$("#spinnerid").css('display','block');
	//alert("sdfs");
	var annoid=obj;
	var url1 = url + "findthisannouncementinfoByid";
	//alert(annoid);
	$.ajax({
		type:'POST',
		url:url1,
		datatype:"html",
		data:{"announcement_id":annoid},
		cache:false,
		success:function(data){
			//alert("success");
			var str = eval("("+data+")");
			$("#g_title").html(str.announcement_title);
			$("#g_fabushijian").html(str.announcement_time);
			$("#g_liulan").html(str.announcement_views);
			$("#g_faburen").html(str.faburen);
			$("#g_leibie").html(str.suoshuleixing);
			$("#g_content").html(str.announinfo);
			
			$("#spinnerid").css('display','none'); 
		},
		error : function(data) {
			alert("操作失败，请刷新后重新操作！！");
			$("#spinnerid").css('display','none'); 
		}
	});
	$("#spinnerid").css('display','none'); 
}

/**
 * 根据id删除公告
 */
function deletethisannounbyid(obj){
	$("#spinnerid").css('display','block');
	var annoid=obj;
	var announcement_type=$("#announcement_type").html();
	var as_name=$("#as_name_anno").html();
	var pageNow = $("#m_pagenow").html();
	var url1 = url + "deletethisannounbyid";
	if(confirm("是否确定删除这条公告？")){
		$.ajax({
			type:'POST',
			url:url1,
			datatype:"html",
			data:{
				"announcement_id":annoid,
				"pageNow":pageNow,
				"announcement_type":announcement_type,
				"as_name":as_name
			},
			cache:false,
			success:function(data){
				alert("操作成功！！");
				var str = eval("("+data+")");
				if(str.isempty==false){
					//table表的显示
					var thisstr="";
					$.each(str.jsona, function() {
						
						var t1 = '<tr><td><a href="javascript:void(0);" data-toggle="modal" onclick="findthisannouncementinfo('+this.announcement_id+');" data-target="#modal-container-722522">'+this.announcement_title+'</a></td>';
						var t2 ='<td class="p13-999">'+this.announcement_time+'</td>';
						var t3 = '<td class="p13-999">'+this.m_username+'</td>';
						var t4 ='<td class="p13-999">'+this.announcement_views+'</td><td style="cursor:pointer;">';
						var t5 = '<a href="editAnnoByid?announcement_id='+this.announcement_id+'" style="text-decoration: none;">';
						var t6 = '<img src="img/edit.png"  data-toggle="tooltip" data-placement="bottom" title="编辑"/></a>&nbsp;';
						var t7 = '<a href="javascript:void(0);"  onclick="deletethisannounbyid('+this.announcement_id+');" style="text-decoration: none;">';
						var t8 = '<img src="img/del.png"  data-toggle="tooltip" data-placement="bottom" title="删除"/></a></td></tr>';
						
						thisstr = thisstr+t1+t2+t3+t4+t5+t6+t7+t8;
					});
					document.getElementById('annotbodyid').innerHTML=thisstr;
					//分页按钮的显示
					var listring = "<tr><th>第<span id='m_pagenow'>" + str.pageNow + "</span>/<span id='m_pagecount'>"+ str.pageCount +"</span>页&nbsp;&nbsp;</th><th><ul class='pagination'>";
					if(str.pageNow!=1){
						listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" +startpage+ ");'>首页</a></li>";
					}
					if(str.isHasPrev){
						listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.getPervPage + ");'>上页</a></li>";
					}
					if(str.isHasNext){
						listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.getNextPage + ");'>下页</a></li>";
					}
					if(str.pageCount!=str.pageNow){
						listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.pageCount + ");'>尾页</a></li>";
					}
					listring = listring + "</ul></th>";
					if(str.pageCount!=1){
						listring = listring + "<th>&nbsp;&nbsp;</th><th><div class='col-lg-6'><div class='input-group'><input type='text' class='form-control input-sm' maxlength='2' style='width: 45'><span class='input-group-btn'><button class='btn btn-default btn-sm' type='button'>跳转</button></span></div></div></th></tr>";
					}
					
					$("#qwert").html(listring);
			
				}else{
					var thisstr="";
					var t1 = '<tr><td>无信息...</td>';
					var t2 ='<td class="p13-999"></td>';
					var t3 = '<td class="p13-999"></td>';
					var t4 ='<td class="p13-999"></td><td style="cursor:pointer;"></td></tr>';
					
					thisstr = t1+t2+t3+t4;
					document.getElementById('annotbodyid').innerHTML=thisstr;
				}
				$("#spinnerid").css('display','none'); 
			},
			error : function(data) {
				alert("操作失败，请刷新后重新操作！！");
				$("#spinnerid").css('display','none'); 
			}
		});
	}
	$("#spinnerid").css('display','none'); 
}

/**
 * 翻页按钮的点击事件
 */
function fanyeanno(obj){
	$("#spinnerid").css('display','block');
	var startpage = 1;
	var pageNow = obj;
	url1 = url + '/fanye';
	var announcement_type=$("#announcement_type").html();
	var as_name=$("#as_name_anno").html();

	$.ajax({
		type:'post',
		datetype:'html',
		url:url1,
		cache:false,
		data:{
			"pageNow":pageNow,
			"announcement_type":announcement_type,
			"as_name":as_name
		},
		success:function(data) {
			var str = eval("("+data+")");
			if(str.isempty==false){
				//table表的显示
				var thisstr="";
				$.each(str.jsona, function() {
					
					var t1 = '<tr><td><a href="javascript:void(0);" data-toggle="modal" onclick="findthisannouncementinfo('+this.announcement_id+');" data-target="#modal-container-722522">'+this.announcement_title+'</a></td>';
					var t2 ='<td class="p13-999">'+this.announcement_time+'</td>';
					var t3 = '<td class="p13-999">'+this.m_username+'</td>';
					var t4 ='<td class="p13-999">'+this.announcement_views+'</td><td style="cursor:pointer;">';
					var t5 = '<a href="editAnnoByid?announcement_id='+this.announcement_id+'" style="text-decoration: none;">';
					var t6 = '<img src="img/edit.png"  data-toggle="tooltip" data-placement="bottom" title="编辑"/></a>&nbsp;';
					var t7 = '<a href="javascript:void(0);"  onclick="deletethisannounbyid('+this.announcement_id+');" style="text-decoration: none;">';
					var t8 = '<img src="img/del.png"  data-toggle="tooltip" data-placement="bottom" title="删除"/></a></td></tr>';
					
					thisstr = thisstr+t1+t2+t3+t4+t5+t6+t7+t8;
				});
				document.getElementById('annotbodyid').innerHTML=thisstr;
				//分页按钮的显示
				var listring = "<tr><th>第<span id='m_pagenow'>" + str.pageNow + "</span>/<span id='m_pagecount'>"+ str.pageCount +"</span>页&nbsp;&nbsp;</th><th><ul class='pagination'>";
				if(str.pageNow!=1){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" +startpage+ ");'>首页</a></li>";
				}
				if(str.isHasPrev){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.getPervPage + ");'>上页</a></li>";
				}
				if(str.isHasNext){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.getNextPage + ");'>下页</a></li>";
				}
				if(str.pageCount!=str.pageNow){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.pageCount + ");'>尾页</a></li>";
				}
				listring = listring + "</ul></th>";
				if(str.pageCount!=1){
					listring = listring + "<th>&nbsp;&nbsp;</th><th><div class='col-lg-6'><div class='input-group'><input type='text' class='form-control input-sm' maxlength='2' style='width: 45'><span class='input-group-btn'><button class='btn btn-default btn-sm' type='button'>跳转</button></span></div></div></th></tr>";
				}
				
				$("#qwert").html(listring);
		
			}else{
				var thisstr="";
				var t1 = '<tr><td>无信息...</td>';
				var t2 ='<td class="p13-999"></td>';
				var t3 = '<td class="p13-999"></td>';
				var t4 ='<td class="p13-999"></td><td style="cursor:pointer;"></td></tr>';
				
				thisstr = t1+t2+t3+t4;
				document.getElementById('annotbodyid').innerHTML=thisstr;
			}
			$("#spinnerid").css('display','none'); 
		},
		error:function(data) {
			alert("操作失败，请刷新后重新操作！！");
			$("#spinnerid").css('display','none'); 
		}
	});
	$("#spinnerid").css('display','none'); 
}

/**
 * 查看已发布的公告
 */
function yifabubuttonmethod(){
	$("#announcement_type").html("保存并发布");
	fanyeanno(1);
}

/**
 * 查看未发布公告
 */
function weifabubuttonmethod(){
	$("#spinnerid").css('display','block');
	var pageNow =1 ;
	var announcement_type="保存未发布";
	url1 = url + 'showfAnnounceAction';
	var as_name=$("#as_name_anno").html();
	$.ajax({
		type:'post',
		datetype:'html',
		url:url1,
		cache:false,
		data:{
			"pageNow":pageNow,
			"announcement_type":announcement_type,
			"as_name":as_name
		},
		success:function(data) {
			var str = eval("("+data+")");
			if(str.isempty==false){
				//table表的显示
				var thisstr="";
				$.each(str.jsona, function() {
					
					var t1 = '<tr><td><a href="javascript:void(0);" data-toggle="modal" onclick="findthisannouncementinfo('+this.announcement_id+');" data-target="#modal-container-722522">'+this.announcement_title+'</a></td>';
					var t2 ='<td class="p13-999">'+this.announcement_time+'</td>';
					var t3 = '<td class="p13-999">'+this.m_username+'</td>';
					var t4 ='<td class="p13-999">'+this.announcement_views+'</td><td style="cursor:pointer;">';
					var t5 = '<a href="editAnnoByid?announcement_id='+this.announcement_id+'" style="text-decoration: none;">';
					var t6 = '<img src="img/edit.png"  data-toggle="tooltip" data-placement="bottom" title="编辑"/></a>&nbsp;';
					var t7 = '<a href="javascript:void(0);"  onclick="deletethisannounbyid('+this.announcement_id+');" style="text-decoration: none;">';
					var t8 = '<img src="img/del.png"  data-toggle="tooltip" data-placement="bottom" title="删除"/></a></td></tr>';
					
					thisstr = thisstr+t1+t2+t3+t4+t5+t6+t7+t8;
				});
				document.getElementById('annotbodyid').innerHTML=thisstr;
				//分页按钮的显示
				var listring = "<tr><th>第<span id='m_pagenow'>" + str.pageNow + "</span>/<span id='m_pagecount'>"+ str.pageCount +"</span>页&nbsp;&nbsp;</th><th><ul class='pagination'>";
				if(str.pageNow!=1){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" +startpage+ ");'>首页</a></li>";
				}
				if(str.isHasPrev){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.getPervPage + ");'>上页</a></li>";
				}
				if(str.isHasNext){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.getNextPage + ");'>下页</a></li>";
				}
				if(str.pageCount!=str.pageNow){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.pageCount + ");'>尾页</a></li>";
				}
				listring = listring + "</ul></th>";
				if(str.pageCount!=1){
					listring = listring + "<th>&nbsp;&nbsp;</th><th><div class='col-lg-6'><div class='input-group'><input type='text' class='form-control input-sm' maxlength='2' style='width: 45'><span class='input-group-btn'><button class='btn btn-default btn-sm' type='button'>跳转</button></span></div></div></th></tr>";
				}
				
				$("#qwert").html(listring);
		
			}else{
				var thisstr="";
				var t1 = '<tr><td>无信息...</td>';
				var t2 ='<td class="p13-999"></td>';
				var t3 = '<td class="p13-999"></td>';
				var t4 ='<td class="p13-999"></td><td style="cursor:pointer;"></td></tr>';
				
				thisstr = t1+t2+t3+t4;
				document.getElementById('annotbodyid').innerHTML=thisstr;
				
				//分页按钮的显示
				var listring = "<tr><th>第<span id='m_pagenow'>" + str.pageNow + "</span>/<span id='m_pagecount'>"+ str.pageCount +"</span>页&nbsp;&nbsp;</th><th><ul class='pagination'>";
				if(str.pageNow!=1){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" +startpage+ ");'>首页</a></li>";
				}
				if(str.isHasPrev){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.getPervPage + ");'>上页</a></li>";
				}
				if(str.isHasNext){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.getNextPage + ");'>下页</a></li>";
				}
				if(str.pageCount!=str.pageNow){
					listring = listring + "<li><a href='javascript:void(0);' onclick='fanyeanno(" + str.pageCount + ");'>尾页</a></li>";
				}
				listring = listring + "</ul></th>";
				if(str.pageCount!=1){
					listring = listring + "<th>&nbsp;&nbsp;</th><th><div class='col-lg-6'><div class='input-group'><input type='text' class='form-control input-sm' maxlength='2' style='width: 45'><span class='input-group-btn'><button class='btn btn-default btn-sm' type='button'>跳转</button></span></div></div></th></tr>";
				}
				
				$("#qwert").html(listring);
			}
			//alert("sdf");
			$("#announcement_type").html("保存未发布");
			$("#spinnerid").css('display','none'); 
		},
		error:function(data) {
			alert("操作失败，请刷新后重新操作！！");
			$("#spinnerid").css('display','none'); 
		}
	});
	$("#spinnerid").css('display','none'); 
}
