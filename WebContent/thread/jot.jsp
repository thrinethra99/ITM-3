
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
		function findNoteTitle(noteId){
			var json = {
					 "database" :localdb,
					 "token" : token,
					 "noteid":nid
			 }
			 $.ajax({
					url :  "/WSG/note/get/bystrid",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,jqXHR) {
						 if(data.code=="success"){
							data.obj.
							findNoteAuthor(noteId)
						 }
					}})
			
		}
		
		function clickToViewNote(noteId){
			
		}
		
		function findNoteAuthor(noteId){
			
			
		}
		
		websocket.onmessage = function(event) {
			var data=JSON.parse(event.data);
			if(	
					data.database==localdb
					&&data.thread==threadid
					&&data.project==projectid
			){
				if(data.action=="refresh"){
					
					// refresh the  thread graph page
					var $toastContent = $("<span>"+data.message+"</span>").add($('<button onclick="location.reload()">Reload</button>'));
					Materialize.toast(data.message, 8000)
					return	
				}
				if(data.cate=="problem"){
						$("#problem_textarea").append(
								"<div class='tmsg' data-id="+data.id+"><label class='name'>&nbsp;"+data.username+" : "+new Date(data.create_time).Format("yyyy-MM-dd hh:mm:ss")
								+"</label><div class='tmsg_text'>"+(data.content).replace("[ We want to understand:]","<b>[ We want to understand:]</b>")+"</div></div>"
								)
								scrollToBottom($("#problem_textarea"))
						
				}
				if(data.cate=="idea"){
					$("#idea_textarea").append(
							"<div class='tmsg' data-id="+data.id+"><label class='name'>&nbsp;"+data.username+" : "+new Date(data.create_time).Format("yyyy-MM-dd hh:mm:ss")
							+"</label><div class='tmsg_text'>"+data.content.replace("[ We used to think:]","<b>[ We used to think:]</b>")
 							.replace("[ We now understand:]","<b> [ We now understand:]</b>")+"</div></div>"
							)
							scrollToBottom($("#idea_textarea"))
				}
				if(data.cate=="more"){
					$("#to_do_textarea").append(
							"<div class='tmsg' data-id="+data.id+"><label class='name'>&nbsp;"+data.username+" : "+new Date(data.create_time).Format("yyyy-MM-dd hh:mm:ss")
							+"</label><div class='tmsg_text'>"+data.content
 							.replace("[ We need to further understand ]","<b>[ We need to further understand ]</b>")
 							.replace("[ We need better theories about ]","<b>[ We need better theories about ]</b>")
 							.replace("[ We need to read more about ]","<b>[ We need evidence about ]</b>")
 							.replace("[ We need evidence about ]","<b>[ We need evidence about ]</b>")
 							.replace("[ We need to look at our different ideas about ]","<b>[ We need to look at our different ideas about ]</b>")+"</div></div>"
							)
								scrollToBottom($("#to_do_textarea"))
				}
				
				
			}
		
		
		};		
		
		
		function scrollToBottom(e){
			e.scrollTop(e[0].scrollHeight)
		}
	
	
		function sendMsg(cate,data){
				// save Jot into Database
				saveJot(cate,data)
				// websocket 
				data.cate=cate
				websocket_broadcast(data);
		}

		
		
		function websocket_broadcast(jsondata){
			$.ajax({
				url : "/ITM3/msg/broadcast",
				type:"post",
				data:JSON.stringify(jsondata),
				dataType:"json",
				contentType: 'application/json',
				success:function(data){
				}
			});
		}
		
		
		function saveJot(cate,data) {
			// SAVE  JOT
			var jsondata = {
				"database" :localdb,
				"token" : token,
				"threadid" :threadid,
				"ourproblem":"",
				"createtime":new Date(),
				"authorid":id,
				"bigidea" : "",
				"more" : ""
			};
			
			if(cate=="problem"){
				jsondata.ourproblem=data.content.replace(/'/g,"\\\'").replace(/"/g,"\\\"")
				
			}
			if(cate=="idea"){
				jsondata.bigidea=data.content.replace(/'/g,"\\\'").replace(/"/g,"\\\"")
			}
			if(cate=="more"){
				jsondata.more=data.content.replace(/'/g,"\\\'").replace(/"/g,"\\\"")
			}
			
			$.ajax({
				url : "/WSG/jot/add",
				type : "POST",
				data : JSON.stringify(jsondata),
				dataType : "json",
				success : function(data, textStatus,
						jqXHR) {
					if (data.code == "success") {
						var json = data.obj;
						if ($.trim(json) != "No data aviliable.") {
							$.notify("Journey of thinking has been updated. ","success")
						} else {
							$.notify("Error ", "warn")
						}
					}
				}
			})
		};
		

		
		
		
	
		
		
	  function initJOT(){
		var jsondata = {
				"database" :localdb,
				"token" : token,
				"threadid" :threadid
		};
		
		$.ajax({
			url : "/WSG/jot/get/bythread",
			type : "POST",
			data : JSON.stringify(jsondata),
			dataType : "json",
			success : function(data, textStatus, jqXHR) {
				if(data.code=="success"){
                	 var json =data.obj;
                	 if($.trim(json)!="No data aviliable."){
                		 var d = $.parseJSON(json); 
                		 if("<%=session.getAttribute("role")%>"=="2"||"<%=session.getAttribute("role")%>"=="3"){
                			 for(var i in d){
                    			 if(d[i].ourproblem!=""){
             						$("#problem_textarea").append(
             								"<div class='tmsg' data-id="+d[i].id+"><label class='name'>&nbsp;"+d[i].username+" : "+new Date(d[i].time_stamp).Format("yyyy-MM-dd hh:mm:ss")
             								+"</label><div class='tmsg_text'>"+d[i].ourproblem.replace("[ We want to understand:]","<b>[ We want to understand:]</b>")
             								+"<a onclick='jotEdit(this)' style='color: #039be5; cursor: pointer;'>&nbsp;&nbsp;[edit]</a></div></div>"
             								)
             								
             						
             					}
             					if(d[i].bigidea!=""){
             					$("#idea_textarea").append(
             							"<div class='tmsg' data-id="+d[i].id+"><label class='name'>&nbsp;"+d[i].username+" : "+new Date(d[i].time_stamp).Format("yyyy-MM-dd hh:mm:ss")
             							+"</label><div class='tmsg_text'>"+d[i].bigidea.replace("[ We used to think:]","<b>[ We used to think:]</b>")
             							.replace("[ We now understand:]","<b> [ We now understand:]</b>")
             							+"<a onclick='jotEdit(this)' style='color: #039be5; cursor: pointer;'>&nbsp;&nbsp;[edit]</a></div></div>"
             							)
             					}
             					if(d[i].more!=""){
             					$("#to_do_textarea").append(
             							"<div class='tmsg' data-id="+d[i].id+"><label class='name'>&nbsp;"+d[i].username+" : "+new Date(d[i].time_stamp).Format("yyyy-MM-dd hh:mm:ss")
             							+"</label><div class='tmsg_text'>"+d[i].more
             							.replace("[ We need to further understand ]","<b>[ We need to further understand ]</b>")
             							.replace("[ We need better theories about ]","<b>[ We need better theories about ]</b>")
             							.replace("[ We need to read more about ]","<b>[ We need evidence about ]</b>")
             							.replace("[ We need evidence about ]","<b>[ We need evidence about ]</b>")
             							.replace("[ We need to look at our different ideas about ]","<b>[ We need to look at our different ideas about ]</b>")
             							.replace("[ We now understand:]","<b> [ We now understand:]</b>")
             							+"<a onclick='jotEdit(this)' style='color: #039be5; cursor: pointer;'>&nbsp;&nbsp;[edit]</a></div></div>"
             							)
             					}
                    			 
                    			 
                    		 }
                		 }else{
                			 for(var i in d){
                    			 if(d[i].ourproblem!=""){
             						$("#problem_textarea").append(
             								"<div class='tmsg' data-id="+d[i].id+"><label class='name'>&nbsp;"+d[i].username+" : "+new Date(d[i].time_stamp).Format("yyyy-MM-dd hh:mm:ss")
             								+"</label><div class='tmsg_text'>"+d[i].ourproblem.replace("[ We want to understand:]","<b>[ We want to understand:]</b>")
             								+"</div></div>"
             								)
             								
             						
             					}
             					if(d[i].bigidea!=""){
             					$("#idea_textarea").append(
             							"<div class='tmsg' data-id="+d[i].id+"><label class='name'>&nbsp;"+d[i].username+" : "+new Date(d[i].time_stamp).Format("yyyy-MM-dd hh:mm:ss")
             							+"</label><div class='tmsg_text'>"+d[i].bigidea.replace("[ We used to think:]","<b>[ We used to think:]</b>")
             							.replace("[ We now understand:]","<b> [ We now understand:]</b>")
             							+"</div></div>"
             							)
             					}
             					if(d[i].more!=""){
             					$("#to_do_textarea").append(
             							"<div class='tmsg' data-id="+d[i].id+"><label class='name'>&nbsp;"+d[i].username+" : "+new Date(d[i].time_stamp).Format("yyyy-MM-dd hh:mm:ss")
             							+"</label><div class='tmsg_text'>"+d[i].more
             							.replace("[ We need to further understand ]","<b>[ We need to further understand ]</b>")
             							.replace("[ We need better theories about ]","<b>[ We need better theories about ]</b>")
             							.replace("[ We need to read more about ]","<b>[ We need evidence about ]</b>")
             							.replace("[ We need evidence about ]","<b>[ We need evidence about ]</b>")
             							.replace("[ We need to look at our different ideas about ]","<b>[ We need to look at our different ideas about ]</b>")
             							.replace("[ We now understand:]","<b> [ We now understand:]</b>")
             							+"</div></div>"
             							)
             					}
                    			 
                    			 
                    		 }
                			 
                			 
                			 
                		 }
                	
                		 
                		 scrollToBottom($("#problem_textarea"))
                		 scrollToBottom($("#idea_textarea"))
                		 scrollToBottom($("#to_do_textarea"))
                	 }
				}
			}
		})
		
		
	}
	  
	  initJOT()
	
	  
	  	
		function jotNormal(){
			$("#jot_large").show()
			$("#jot_normal").hide()
  			$("#draggableJof").css("width","50%")
  		}
		
		function jotEnlarge(){
			$("#jot_large").hide()
			$("#jot_normal").show()
			$("#draggableJof").css("width","80%")
		}
	
		function jotCompile(){
			$("#jot-compile-content").empty().html("")
			
			var html =""
				html+="<b>Our Problem</b>"
				html+="<div>"+$("#problem_textarea .tmsg_text").text().replace(/\[([edit\]]+)\]/g,"")+"</div>"
				html+="<b>Big ideas we have learned:</b>"
				html+="<div>"+$("#idea_textarea .tmsg_text").text().replace(/\[([edit\]]+)\]/g,"")+"</div>"
				html+="<b>We need to do more:</b>"
				html+="<div>"+$("#to_do_textarea .tmsg_text").text().replace(/\[([edit\]]+)\]/g,"")+"</div>"
			$("#jot-compile-content").html(html)	
			$("#jotCompileModal").modal('open')
		}
		
		
		
		
		
	  function jotEdit(element){
		  var jotId=$(element.parentElement.parentElement).data("id");
		  var cate =$(element.parentElement.parentElement.parentElement).attr("id");
		  var content=$(element.parentElement).html().substring(0,$(element.parentElement).html().length-90)
		  $(element.parentElement).html("<input type='text' id='change_jot' data-id="+jotId+" value='"+content.replace(/<\/?[^>]+(>|$)/g, "")+"'> </input></div></div>")
		  
	  }
	  
	  $('body').on('keyup', '#change_jot', function (e) {
		  
		  if(e.keyCode == 13)
			{
			  // the user click enter button
			 
			 jotUpdate(
					 $(this.parentElement.parentElement.parentElement).attr("id"),
					 $(this).data("id"),
					 $(this).val()
					)
					  $(this.parentElement).html(
 							"<div class='tmsg_text'>"+ $(this).val()
 							.replace("[ We need to further understand ]","<b>[ We need to further understand ]</b>")
 							.replace("[ We need better theories about ]","<b>[ We need better theories about ]</b>")
 							.replace("[ We need to read more about ]","<b>[ We need evidence about ]</b>")
 							.replace("[ We need evidence about ]","<b>[ We need evidence about ]</b>")
 							.replace("[ We need to look at our different ideas about ]","<b>[ We need to look at our different ideas about ]</b>")
 							.replace("[ We want to understand:]","<b>[ We want to understand:]</b>")
 							.replace("[ We used to think:]","<b>[ We used to think:]</b>")
 							+"<a onclick='jotEdit(this)' style='color: #039be5; cursor: pointer;'>&nbsp;&nbsp;[edit]</a></div></div>"
 							)
			}
		});
     
     
	  
	  function jotUpdate(cate,Jid,content){
			var jsondata={
					"database" :localdb,
					"token" : token,
					"mtime":new Date(),
					"editorId":id,
					"ourproblem":"",
					"bigidea":"",
					"more":"",
					"jotId":Jid
			}
		  if(cate == "problem_textarea"){
			  jsondata["ourproblem"]=content.replace(/'/g,"\\\'").replace(/"/g,"\\\"")
		  }
		 if(cate == "idea_textarea"){
			 jsondata["bigidea"]=content.replace(/'/g,"\\\'").replace(/"/g,"\\\"")
		  }
		 if(cate == "to_do_textarea"){
			 jsondata["more"]=content.replace(/'/g,"\\\'").replace(/"/g,"\\\"")
		 }
			
			$.ajax({
				url : "/WSG/jot/update",
				type : "POST",
				data : JSON.stringify(jsondata),
				dataType : "json",
				success : function(data, textStatus, jqXHR) {
					
				
					}
				})
		 
	  }
		

		
		var jot_websocket_data ={
				'uid':id,
				'token':token,
				'username':urname,
				'database':localdb,
				'project' :projectid,
				'thread' :threadid,
				'cate' : '',
				'action' : 'add',
				'create_time' : new Date(),
				'to' : 'all',
				'content' : ""
			}

	$("#problem").click(
			function() {
				$("#problem_text_area_input").val(
						$("#problem_text_area_input").val()
								+ "[ We want to understand:]");
			});

	$('#problem_text_area_input').bind("enterKey", function(e) {
		jot_websocket_data.content = $("#problem_text_area_input").val()
		sendMsg("problem", jot_websocket_data)
		$("#problem_text_area_input").val("");
	})
	$('#problem_text_area_input').keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger("enterKey");
		}
	});

	$("#think").click(
			function() {
				$("#think_text_area_input").val(
						$("#think_text_area_input").val()
								+ "[ We used to think:]");
			});

	$('#think_text_area_input').bind("enterKey", function(e) {

		jot_websocket_data.content = $("#think_text_area_input").val()
		sendMsg("idea", jot_websocket_data)
		$("#think_text_area_input").val("");
	})
	$('#think_text_area_input').keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger("enterKey");
		}
	});

	$("#insight").click(
			function() {
				$("#think_text_area_input").val(
						$("#think_text_area_input").val()
								+ "[ We now understand:]");
			});

	$('#insight_text_area_input').bind("enterKey", function(e) {

		jot_websocket_data.content = $("#insight_text_area_input").val()
		sendMsg("idea", jot_websocket_data)
		$("#insight_text_area_input").val("");
	})
	$('#insight_text_area_input').keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger("enterKey");
		}
	});

	$("#understand").click(
			function() {
				$("#understand_text_area_input").val(
						$("#understand_text_area_input").val()
								+ "[ We need to further understand ]");
			});

	$('#understand_text_area_input').bind("enterKey", function(e) {

		jot_websocket_data.content = $("#understand_text_area_input").val()
		sendMsg("more", jot_websocket_data)
		$("#understand_text_area_input").val("");
	})
	$('#understand_text_area_input').keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger("enterKey");
		}
	});

	$("#bettertheory").click(
			function() {
				$("#understand_text_area_input").val(
						$("#understand_text_area_input").val()
								+ "[ We need better theories about ]");
			});



	$("#read").click(
			function() {
				$("#understand_text_area_input").val(
						$("#understand_text_area_input").val()
								+ "[ We need to read more about ]");
			});




	$("#evidence").click(
			function() {
				$("#understand_text_area_input").val(
						$("#understand_text_area_input").val()
								+ "[ We need evidence about ]");
			});

	$("#disagree")
			.click(
					function() {
						$("#understand_text_area_input")
								.val(
										$("#understand_text_area_input").val()
												+ "[ We need to look at our different ideas about ]");
					});


	Date.prototype.Format = function(fmt) { //author: meizz 
		var o = {
			"M+" : this.getMonth() + 1, //月份 
			"d+" : this.getDate(), //日 
			"h+" : this.getHours(), //小时 
			"m+" : this.getMinutes(), //分 
			"s+" : this.getSeconds(), //秒 
			"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
			"S" : this.getMilliseconds()
		//毫秒 
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	}
</script>