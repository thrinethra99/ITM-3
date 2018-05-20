<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href="../../css/materialize.min.css" media="screen,projection" />
	
<link type="text/css" rel="stylesheet" href="../../css/jquery-ui.css"
	media="screen,projection" />
	<script src="../../js/jquery-3.1.0.js"></script>
<script src="../../js/jquery-ui.js"></script>
<script src="../../js/jquery.sessionTimeout.js"></script>

<script src="../../js/itm.js"></script>
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="UTF-8">

</head>

<body>

	<header>
		<%@ include file="../../header.jsp" %>

		<%@ include file="../../side_menu_hidden.jsp" %>

	
	</header>

	<main>
	<div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<div class="container">
		<br>
		<div class="row">
			
			<div class="input-field col s8 offset-s2" style="padding-top: 10px">
				<input value="" id="title" type="text" class="validate"> <label
					for="title">Project title:</label>
			</div>
			<div class="input-field col s8 offset-s2"> School Year</div> 
			<div class="input-field col s4 offset-s2">
				<select id="fromYear">
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					<option value="2023">2023</option>
					<option value="2024">2024</option>
				</select> <label>From: Year</label>
				
			</div>
			
			<div class="input-field col s4">
				<select id="fromMonth">
					<option value="1">January</option>
					<option value="2">February</option>
					<option value="3">March</option>
					<option value="4">April</option>
					<option value="5">May</option>
					<option value="6">June</option>
					<option value="7">July</option>
					<option value="8">August</option>
					<option value="9">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select> <label>Month</label>
			</div>
			
			<div class="input-field col s4 offset-s2">
				<select id="toYear">
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					<option value="2023">2023</option>
					<option value="2024">2024</option>
				</select> <label>To: Year</label>
			</div>
				<div class="input-field col s4">
				<select id="toMonth">
					<option value="1">January</option>
					<option value="2">February</option>
					<option value="3">March</option>
					<option value="4">April</option>
					<option value="5">May</option>
					<option value="6">June</option>
					<option value="7">July</option>
					<option value="8">August</option>
					<option value="9">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select> <label>Month</label>
			</div>
			
			<div class="input-field col s8 offset-s2">
				<input value="" id="goal" type="text" class="validate"> <label
					for="goal">Project goal:</label>
			</div>
				<div class=" col s8 offset-s2  file-field input-field">
      <div class="btn">
        <span>Project Logo</span>
        <input type="file" name="filename" >
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text" placeholder="Upload Image File">
      </div>
      	<div id="img"></div>
    </div>
			
			<div class="input-field col s8 offset-s2 ">
			
				<select multiple id="teacher">
					<optgroup label="Language Arts">
						<option value="1">Writing</option>
						<option value="2">Reading</option>
						<option value="3">Speaking and Listening</option>
						<option value="4">Study Skills</option>
					</optgroup>
					<optgroup label="Science">
						<option value="5">Earth and Space Systems</option>
						<option value="6">Life Sciences: Boilogy</option>
					</optgroup>
				</select> 
				<label>Add Teachers</label>
			</div>

			<div class="input-field col s8 offset-s2">
				<select multiple id="select-grade">
					<option value="" disabled selected>Grade Level</option>
					<option value="15">Other</option>
				</select> <label>Grade Level</label>
			</div>
			
			<div class="input-field col s8 offset-s2">
				<select multiple id="area">
					<optgroup label="Language Arts">
						<option value="1">Writing</option>
						<option value="2">Reading</option>
						<option value="3">Speaking and Listening</option>
						<option value="4">Study Skills</option>
					</optgroup>
					<optgroup label="Science">
						<option value="5">Earth and Space Systems</option>
						<option value="6">Life Sciences: Boilogy</option>
					</optgroup>
				</select> <label>Curriculum area:</label>
			</div>
			
			<div class="input-field col s8 offset-s2" style="padding-top: 10px">
				<input value="" id="mcode" type="text" class="validate"> <label
					for="title">Teacher Code</label>
			</div>
			<div class="input-field col s8 offset-s2" style="padding-top: 10px">
				<input value="" id="wcode" type="text" class="validate"> <label
					for="title">Student Code</label>
			</div>
			<div class="input-field col s8 offset-s2" style="padding-top: 10px">
				<input value="" id="acode" type="text" class="validate"> <label
					for="title">Visitor Code</label>
			</div>
			
			
		</div>
		<div class="row">
			<div class="input-field col s8 offset-s2">
				<button class="btn waves-effect waves-light col "
				type="button" name="action" data-mode="new" id="create-submit">
				Save <i class="material-icons right">send</i>
				</button>
			<button class="btn waves-effect waves-light col after-save" style="margin-left:12px;"
				type="button" name="action" data-mode="new" id="btn-back-project-list">
				Back To Project List<i class="material-icons right">send</i>
			</button>&nbsp;&nbsp;
			<button class="btn waves-effect waves-light col  after-save" style="margin-left:12px;"
				type="button" name="action" data-mode="new" id="btn-edit-member">
				Edit Member<i class="material-icons right">send</i>
			</button>
					</div>
		</div>
	
	
	</div>
	</main>

	<!--Import jQuery before materialize.js-->

	<script type="text/javascript" src="../../js/materialize.min.js"></script>
	<script src="https://d3js.org/d3.v4.min.js"></script>
		<script src="../../js/notify.js"></script>
		<script src="../../js/itm.js"></script>
	<script type="text/javascript">
	var localdb="<%=session.getAttribute("localdb")%>";
	var token="<%=session.getAttribute("token")%>";
	var community="<%=session.getAttribute("community")%>";
	var c_id="<%=session.getAttribute("community_id")%>";
	var type="<%=session.getAttribute("role")%>";
	var urname="<%=session.getAttribute("username")%>";
	var id="<%=session.getAttribute("id")%>";
	var itmdb="<%=session.getAttribute("ITMDatabase")%>";
	var domain="<%=session.getAttribute("domain")%>";
	var token="<%=session.getAttribute("token")%>";
	var school="<%=session.getAttribute("school")%>";
	var country="<%=session.getAttribute("country")%>";
	var city="<%=session.getAttribute("city")%>";
	var project_id="<%=session.getAttribute("projectid")%>";
	$("#page_title").html("New Project")
	$(".after-save").hide()
	$(window).on('load', function() {
		var project_id =-1
		function initArea(){
			$("#area").empty().html(' ');
			var initHtml =  '<option disabled>Select Curriulums area</option>'
			 $("#area").append(  initHtml   )
			var json =JSON.parse(localStorage.curriculums);
			if(null==json)return
			   if(null!=json[0].id){
				   // find level 1 
				   var level1=[]
				   for( var i in json){
					   if(json[i].parent_id==0){
						   	if(null == level1[json[i].id]){ // level 1 have not be init
						   		level1[json[i].id]={'parent':json[i].name,'child':[]}
						   	}else{
						   	// level 1 have be inited
						   		level1[json[i].id]["parent"] =json[i].name
						   	}
							  
					   }else{
						   // if it is level2 element 
							if(null == level1[json[i].parent_id]){ // if it is parent have not be initial
								level1[json[i].parent_id]={'parent':'','child':[{'id':json[i].id,'title':json[i].name}]}
							}else{
								level1[json[i].parent_id]["child"].push({'id':json[i].id,'title':json[i].name})
							}					   
					   }

				   }
				   for(var i in level1){
					   level1[i]
					   var html  = '<optgroup label="'+level1[i].parent+'">'
					   html=html+'<option value="'+i+'">'+level1[i]["parent"]+'[parent]</option>'
					   html=""
					   for (var j in level1[i]["child"]){
						   html=html+'<option value="'+level1[i]["child"][j]["id"]+'">'+level1[i]["child"][j]["title"]+'</option>'
					   }
					   html=html+'</optgroup>'
					   $("#area").append(html)
				   }
				   $("#area").trigger('contentChanged');
			   }
		}
			
		
		function initGrades(){
			  var $selectDropdown = 
			      $("#select-grade")
			        .empty()
			        .html(' ');
				var initHtml =  '<option disabled>Select Grade</option>'
			// init grade options
			$("#select-grade").append(initHtml)
			var json =JSON.parse(localStorage.grades);
			   if(null!=json[0].id){
				   for( var i in json){
					   $selectDropdown.append(
					   $("<option></option>")
				        .attr("value",json[i].id)
				        .text(json[i].title)
				        )
					  
				   }
				   $selectDropdown.trigger('contentChanged');
			   }
		}
		function initUsers(){
			$("#teacher").empty().html(' ');
			 $("#teacher").append(
					   $("<option selected></option>")
				        .attr("value",'<%=session.getAttribute("id")%>')
				        .text('<%=session.getAttribute("username")%>')
				        )
			var json =JSON.parse(localStorage.users);
			   if(null!=json[0].id){
					   for( var i in json){
						   if(null!=json[i].username){
						   $("#teacher").append(
						   $("<option></option>")
					        .attr("value",json[i].str_id)
					        .text(json[i].first_name+"   "+json[i].last_name)
					        )
						  
					   }
					   $("#teacher").trigger('contentChanged');
				   }
				   
			}
		}
		
		
		
		function init(){
			initArea()
			initGrades()
			initUsers()
		}
		
		init()
		
		
		  $('select').on('contentChanged', function() {
    				 // re-initialize (update)
   					 $(this).material_select();
  			});
		
		
			
			$('select').material_select();
			  $('.materialboxed').materialbox();

			 $(document).on('change', '.file-field input[type="file"]', function () {
			      var file_field = $(this).closest('.file-field');
			      var path_input = file_field.find('input.file-path');
			      var files      = $(this)[0].files;
			      var file_names = [];
			      for (var i = 0; i < files.length; i++) {
			        file_names.push(files[i].name);
			      }
			      path_input.val(file_names.join(", "));
			      path_input.trigger('change');
			      uploadFile(files)
			 });
			 
			 function uploadFile(files){
				 var fd = new FormData();
				 fd.append('uploadFile',files[0])
					  $.ajax({
					    type: 'post',
					    url: '/IFS/uploadFile',
					    data: fd,
		                processData: false,
		                cache: false,
		                contentType:false,
					    success: function (data) {
					      // do something
					      console.log(data);
					      var json = "/IFS/resources/data/"+$.trim((data.obj).split("@")[2])
					    	$("#img").html("")
					    	var html ='<img class="materialboxed" width="250" src="'+json+'">'
					    	$("#img").html(html)
					    }
					  });
			 }

			 
			 	function add_project_author(projectId,authorId){
			 		var jsondata = {
							"database" :'<%=session.getAttribute("localdb")%>' ,
							"token" : '<%=session.getAttribute("token")%>',
							"projectid":projectId,
							"authorid":authorId,
							"usertype":'<%=session.getAttribute("role")%>',
							"userrole":"teacher"
			 		}
			 		
			 		$.ajax({
						url :  "/WSG/project/member/add/byauthor",
						type : "POST",
						data : JSON.stringify(jsondata),
						dataType : "json",
						success : function(data, textStatus, jqXHR) {
							console.log("add project author success");
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log(jqXHR.responseText);
						}})
			 	}
			 	
			 	
			 	function add_project_member(projectId,authorId){
			 		var jsondata = {
							"database" :'<%=session.getAttribute("localdb")%>' ,
							"token" : '<%=session.getAttribute("token")%>',
							"projectid":projectId,
							"authorid":authorId,
							"usertype":'<%=session.getAttribute("role")%>',
							"userrole":"member"
			 		}
			 		
			 		$.ajax({
						url :  "/WSG/project/member/add/byauthor",
						type : "POST",
						data : JSON.stringify(jsondata),
						dataType : "json",
						success : function(data, textStatus, jqXHR) {
							console.log("add project author success");
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log(jqXHR.responseText);
						}})
			 	}
			 	
			 	
			 	function add_project_grade(projectId,gradeId){
			 		var jsondata = {
							"database" :'<%=session.getAttribute("localdb")%>' ,
							"token" : '<%=session.getAttribute("token")%>',
							"projectId":projectId,
							"gradeId":gradeId
			 		}
			 		
			 		$.ajax({
						url :  "/WSG/project/grade/add",
						type : "POST",
						data : JSON.stringify(jsondata),
						dataType : "json",
						success : function(data, textStatus, jqXHR) {
							console.log("add project grade success");
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log(jqXHR.responseText);
						}})
			 	}
			 
			 	function add_project_curriculum(projectId,areaid){
			 		var jsondata = {
							"database" :'<%=session.getAttribute("localdb")%>' ,
							"token" : '<%=session.getAttribute("token")%>',
							"projectId":projectId,
							"areaid":areaid
			 		}
			 		
			 		$.ajax({
						url :  "/WSG/project/curriculum/add",
						type : "POST",
						data : JSON.stringify(jsondata),
						dataType : "json",
						success : function(data, textStatus, jqXHR) {
							console.log("add project grade success");
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log(jqXHR.responseText);
						}})
			 	}
			 	function add(){
			 		if(
			 				$("#acode").val()==$("#wcode").val()||
			 				$("#wcode").val()==$("#mcode").val()||
			 				$("#mcode").val()==$("#acode").val()){
			 			
			 			Materialize.toast('The codes should not be same to each other. ', 4000)
			 			return
			 		}
			 		var jsondata = {
							"database" :'<%=session.getAttribute("localdb")%>' ,
							"token" : '<%=session.getAttribute("token")%>',
							"title" : $("#title").val().replace(/"/g,"\\\""),
							"logo" : ($(".materialboxed").attr("src")=="")?"":$(".materialboxed").attr("src"),
							"fromyear" : $("#fromYear option:selected").text()+"/"+$("#fromMonth option:selected").val(),
							"toyear" : $("#toYear option:selected").text()+"/"+$("#toMonth option:selected").val(),
							"access_code_read" :$("#acode").val(),
							"access_code_write" :$("#wcode").val(),
							"access_code_manage" : $("#mcode").val(),
							"buddy_project_accept" : -1,
							"goal" : ($("#goal").val()=="")?"":$("#goal").val().replace(/"/g,"\\\"").replace(/'/g,"\\\'"),
							"project_create_time":new Date(),
							
						};
			 		$.ajax({
						url :  "/WSG/project/add",
						type : "POST",
						data : JSON.stringify(jsondata),
						dataType : "json",
						success : function(data, textStatus, jqXHR) {
							if (data.code == "failure") {
								console.log(data.desc, "error");
							} else {
								project_id=data.obj[0].GENERATED_KEY
								add_project_author(project_id,'<%=session.getAttribute("id")%>')
								
								if($("#teacher").val()!=""){
									var teacherIds= $("#teacher").val()
									for(var i in teacherIds){
										add_project_author(project_id,teacherIds[i])
									}
								}
								if($("#select-grade").val()!=""){
									var gradeIdes= $("#select-grade").val()
									for(var i in gradeIdes){
										add_project_grade(project_id,gradeIdes[i])
									}
								}
								
								
								if($("#area").val()!=""){
									var areaIdes= $("#area").val()
									for(var i in areaIdes){
										add_project_curriculum(project_id,areaIdes[i])
									}
								}
								create_a_public_wondering_area(project_id)
								
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log(jqXHR.responseText);
						}
					});
			 	}
			 	
				function create_a_public_wondering_area(project_id){
			 		
					var jsondata = {
							"database" :'<%=session.getAttribute("localdb")%>' ,
							"token" : '<%=session.getAttribute("token")%>',
							"logo" : "",
							"wname" : "Open area",
							"authorid" : "<%=session.getAttribute("id")%>",
							"wcreatetime" : new Date(),
							"wstatus" : "accepted",
							"keywords" : "",
							"overarchingquestions" : "",
							"whyimportant" : ""
						};
				
					$.ajax({
						url :  "/WSG/wondering_area/add",
						type : "POST",
						data : JSON.stringify(jsondata),
						dataType : "json",
						success : function(data, textStatus, jqXHR) {
							if (data.code == "failure") {
								console.log(data.desc, "error");
							} else {
								wid=data.obj[0].GENERATED_KEY
								
							project_wondering(project_id,wid);
							creat_a_public_thread(project_id,wid)
								
								
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log(jqXHR.responseText);
						}
					});
			 	}
			 	
			 	
			 	
			 	function creat_a_public_thread(pid,wid){
			 		
			 		var jsondata = {
							"database" :'<%=session.getAttribute("localdb")%>' ,
							"token" : '<%=session.getAttribute("token")%>',
							"thread_focus" : "Open talk",
							"authorid" : '<%=session.getAttribute("id")%>',
							"createtime" : new Date(),
							"keywords" : "",
							"resource" :""
						};
				
		 		$.ajax({
					url :  "/WSG/thread/add",
					type : "POST",
					data : JSON.stringify(jsondata),
					dataType : "json",
					success : function(data, textStatus, jqXHR) {
						if (data.code == "failure") {
							console.log(data.desc, "error");
						} else {
							thread_id=data.obj[0].GENERATED_KEY
							
							thread_project(thread_id,pid);
							thread_wondering(thread_id,wid);
						}
					}})
			 	}
			 	
			 
			 	function thread_project(tid,pid){
			 		
			 		var jsondata = {
							"database" :'<%=session.getAttribute("localdb")%>' ,
							"token" : '<%=session.getAttribute("token")%>',
							"projectid" : pid,
							"authorid" : '<%=session.getAttribute("id")%>',
							"threadid" : tid,
							"keywords" : ""
						};
				
		 		$.ajax({
					url :  "/WSG/project/thread/add",
					type : "POST",
					data : JSON.stringify(jsondata),
					dataType : "json",
					success : function(data, textStatus, jqXHR) {
						if (data.code == "failure") {
							console.log(data.desc, "error");
						}
					}})
			 		
			 	}
			 	
			function thread_wondering(tid,wid){
			 		
				var thread_w_json = {
						"database" :localdb ,
						"token" : token,
						"threadid" : tid,
						"areaid" : wid
					};
				$.ajax({
					url :  "/WSG/thread/wondering/add",
					type : "POST",
					data : JSON.stringify(thread_w_json),
					dataType : "json",
					})
			 	}
			 
			function project_wondering(project_id,wid){
				var json = {
						"database" :localdb ,
						"token" : token,
						"pid" : project_id,
						"areaid" : wid
					};

				$.ajax({
					url :  "/WSG/project/wondering/add",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus, jqXHR) {
						
					}
					})
			}
			
			 	
			 	function del(){
			 			var jsondata = {
								"database" :'<%=session.getAttribute("localdb")%>' ,
								"token" : '<%=session.getAttribute("token")%>',
								"projectid":$("#create-submit").data("mode")
				 		}
				 		
				 		$.ajax({
							url :  "/WSG/project/del",
							type : "POST",
							data : JSON.stringify(jsondata),
							dataType : "json",
							success : function(data, textStatus, jqXHR) {
								if(data.code=="success"){
									add()
								}
							},
							error : function(jqXHR, textStatus, errorThrown) {
								console.log(jqXHR.responseText);
							}})
					
			 	}
	
			 
				// submit to create a project
				$("#create-submit").click(function() {
					if($("#create-submit").data("mode")=="new"){
						add()
					}else{
						del()
					}
				
				});
				
				
				$(".button-collapse").sideNav();
				$("#show_slide").click(function() {
					$('.button-collapse').sideNav('show');
				});
				
				
				$(document).ajaxStop(function() {
					if(project_id!=-1){
						window.history.back();
					}
				});
				
				$("#btn-back-project-list").click(function(){
						window.history.back();
				})
				
				
				$("#btn-edit-member").click(function(){
					window.location.href = "members.jsp";
				})

		});
	
	$(".side-nav").find(".blue-grey").removeClass('blue-grey')
	$(".side-nav").find(".active").removeClass('active')
	$(".side-nav").find(".show").removeClass('show')

	$(".in-teacher-space").addClass("active blue-grey lighten-2 ")
	$(".in-teacher-space-body").addClass("show")
	$(".in-teacher").addClass("active")
	sessionTimeOut(<%=session.getAttribute("SessionTimeOut")%>)
	</script>
</body>
</html>