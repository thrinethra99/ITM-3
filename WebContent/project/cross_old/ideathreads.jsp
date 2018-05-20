<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../../validation.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href="../../css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet"
	href="../../css/customerize.css" media="screen,projection" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="UTF-8">

<style>
.links line {
	stroke: #999;
	stroke-opacity: 0.6;
}

.brand-logo{
	height:100px; !important
}

.nodes circle {
	stroke: #fff;
	stroke-width: 1.5px;
}

.container {
	margin: 0 auto;
	max-width: 1280px;
	width: 90%;
}

.wf-button {
	width: 300px;
	margin-bottom: 15px;
}

.thread_button {
	margin-right: 20px;
	border: black 1px solid;
}

.collapsible-body {
	padding: 0px !important;
}
</style>


</head>

<body>

	<header>
		<%@ include file="../../header.jsp" %>
		<%@ include file="../../side_menu_hidden.jsp" %>
	</header>
	

	<main>
	<div class="container">
		<br>
		<div class="row">
			<nav style="line-height: 20px; height: 20px">
				<div class="nav-wrapper blue-grey"
					style="line-height: 20px; height: 20px">
					<div class="col s12">
						<a href="dashboard.jsp" class="grey-text breadcrumb">Dashboard</a>
						<a href="#!" class="white-text breadcrumb">Idea Threads</a>
					</div>
				</div>
			</nav>
			<!-- 
			<div class="col s12" style="padding-top: 10px">
				<div class="card blue-grey">
					<div class="card-content white-text">
						<span class="card-title"> project name :
							${sessionScope.projectname} <a id="projectid"
							style="display: none">${sessionScope.projectid}</a>
						</span>
					</div>
				</div>
			</div>
			 -->
			<br> <a class="btn col s2 offset-s5" href="#"
				id="thread_mapping">Thread Mapping</a>
			<div class="col s11 offset-s1" style="padding-bottom: 13px;">
				<a class="col s1 offset-s1" 
					style="height: 20px; line-height: 20px">Wondering Area</a> 
				<a class="col s1 offset-s6"
					style="height: 20px; line-height: 20px">Idea Threads</a>
			</div>
			<br><br>
			<div class="col s11 offset-s1" style="padding-bottom: 13px;padding-top: 13px;">

				<a class="modal-trigger btn col s1 offset-s1" id="add_wf"
					style="height: 20px; line-height: 20px">+</a> <a
					class="modal-trigger btn col s1 offset-s6" id="add_thread"
					style="height: 20px; line-height: 20px">+</a>
			</div>
			<div class="col s12" style="height: 400px" id="container"></div>

		</div>
	</div>
	</main>


	<!-- modal -->

	<div id="field_click_modal" class="modal">
		<div class="modal-content">
			<h5 class="center" style="padding-bottom: 10px;"
				id="click_modal_field_name">Wondering area 1</h5>
			<hr>
			<div class="container" style="padding-top: 15px;">
				<div class="row">
					<button class="btn col s3">open</button>
					<button class="btn col s3 offset-s1" style="margin-left: 70px;">edit</button>
					<button class="btn col s3 right">delete</button>
				</div>
			</div>

		</div>
	</div>

	<div id="thread_click_modal" class="modal">
		<div class="modal-content">
			<h5 class="center" style="padding-bottom: 10px;"
				id="click_modal_thread_name">Wondering area 1</h5>
			<hr>
			<div class="container" style="padding-top: 15px;">
				<div class="row">
					<button class="btn col s3">open</button>
					<button class="btn col s3 offset-s1" style="margin-left: 70px;">edit</button>
					<button class="btn col s3 right">delete</button>
				</div>
			</div>

		</div>
	</div>


	<div id="thread_mapping_modal" class="modal modal-fixed-footer">
		<div class="modal-content">
			<h5 class="center">Select wondering areas and threads to map</h5>
			<hr>
			<div class="container">
				<div class="row">
					<div class="col s6" id="wbox">
						<h6 class="center">Wondering Areas</h6>
						<div class="divider"></div>
					</div>
					<div class="col s6" id="tbox">
						<h6 class="center">Threads</h6>
						<div class="divider"></div>

					</div>
				</div>
			</div>

		</div>
		<div class="modal-footer">
			<a href="../../thread/mapping.jsp" id="mapping_finish"
				class="modal-action modal-close waves-effect waves-green btn-flat ">Start
				Mapping</a> <a href="#!"
				class="modal-action modal_close_btn waves-effect waves-green btn-flat ">Cancel</a>
		</div>
	</div>


	<div id="add_field_modal" class="modal modal-fixed-footer">
		<div class="modal-content">
			<h4>Add a wondering area</h4>
			<div class="input-field col s12">
				<input id="wf_name" type="text" class="validate"> <label
					for="wf_name">Name</label>

			</div>
	

			<div class="chips chips-placeholder" id="area_keywords"></div>
			<div class="input-field col s12">
				<input id="why_important" type="text" class="validate"> <label
					for="why_important">Why Important?</label>
			</div>
			<div class="input-field col s12">
				<input id="questions" type="text" class="validate"> <label
					for="questions">Overaching questions</label>
			</div>
			<p>The new area includes idea threads:</p>
			<div class="col s12" id="thread_checkboxes"></div>
			<div class="input-field col s12">
				<input id="message" type="text" class="validate"> <label
					for="message">Message</label>
			</div>
				<div class=" col s8 offset-s2  file-field input-field">
      <div class="btn">
        <span>Topic image</span>
        <input type="file" name="filename" >
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text" placeholder="Upload JPEG">
      </div>
      	<div id="img"></div>
    </div>
    
		</div>
		<div class="modal-footer">
			<a href="#!" id="wf_finish"
				class="modal-action modal-close waves-effect waves-green btn-flat ">Finish</a>
			<a href="#!"
				class="modal-action modal_close_btn waves-effect waves-green btn-flat ">Cancel</a>
		</div>
	</div>

	<div id="add_thread_modal" class="modal modal-fixed-footer">
		<div class="modal-content">
			<h4>Add a New Idea Thread</h4>
			<div class="input-field col s12">
				<input id="thread_name" type="text" class="validate"> <label
					for="thread_name">Name/focus:</label>
			</div>
			<div class="chips chips-placeholder" id="thread_keywords"></div>
			<p>This thread contributes to the following wondering area(s):</p>
			<div id="wondering_area"></div>
			<div class="input-field col s12">
				<input id="key_resource" type="text" class="validate"> <label
					for="key_resource">Key resource (books/websites/videos) we
					may use</label>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" id="thread_finish"
				class="modal-action modal-close waves-effect waves-green btn-flat ">Finish</a>
			<a href="#!"
				class="modal-action modal_close_btn waves-effect waves-green btn-flat ">Cancel</a>
		</div>
	</div>

	<div id="modal_close_popup" class="modal">
		<div class="modal-content">
			<h4>Do you want to give up editing?</h4>
		</div>
		<div class="modal-footer">
			<a href="#!"
				class="modal-action modal-close waves-effect waves-green btn-flat ">No</a>
			<a href="#!"
				class="modal_close_sure modal-action modal_close waves-effect waves-green btn-flat ">Yes</a>
		</div>
	</div>

	<div id="modal_edit_done" class="modal">
		<div class="modal-content">
			<h4>Add a New Idea Thread</h4>
			<div id="thread_add_panel">
			</div>
		</div>
	<div class="modal-footer">
			<a href="#!" 
				class="modal-action modal-close waves-effect waves-green btn-flat ">Finish</a>
			<a href="#!"
				class="modal-action modal_close_btn waves-effect waves-green btn-flat ">Cancel</a>
		</div>
	</div>


	<script src="../../js/sigma.min.js"></script>
	<!--Import jQuery before materialize.js-->
	<script src="../../js/jquery-3.1.0.js"></script>
	<script src="../../js/notify.js"></script>
	<script type="text/javascript" src="../../js/materialize.min.js"></script>
	<script src="https://d3js.org/d3.v4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.modal').modal({dismissible: false});
			$('select').material_select();
			$('.chips-placeholder').material_chip({
				placeholder : 'Enter a keyword',
				secondaryPlaceholder : '+Keyword',
			});
			$('.datepicker').pickadate({
				selectMonths : false, // Creates a dropdown to control month
				selectYears : 15
			// Creates a dropdown of 15 years to control year
			});
			$(".button-collapse").sideNav();
			$("#show_slide").click(function() {
				$('.button-collapse').sideNav('show');
			});

			$('.collection').delegate('a', 'click', function() {
				window.location.href = "../thread/open.html";
			});
		
			
			$("#thread_mapping").click(function() {
				$('#thread_mapping_modal').modal('open');
			});


			$(".modal_close_btn").click(function() {
				$('#modal_close_popup').modal('open');
			});

			$(".modal_close_sure").click(function() {
				$('#modal_close_popup').modal("close");
				$('#add_thread_modal').modal("close");
				$('#add_field_modal').modal("close");
				$('#modal_edit_done').modal("close");
				$('#thread_mapping_modal').modal("close");
			});
		});

	
	console.log('crossdb:<%=session.getAttribute("crossdb")%>')
	console.log('token:<%=session.getAttribute("token")%>')
	console.log('community:<%=session.getAttribute("community")%>')
	console.log('c_id:<%=session.getAttribute("community_id")%>')
	console.log('type:<%=session.getAttribute("role")%>')
	console.log('urname:<%=session.getAttribute("username")%>')
	console.log('id:<%=session.getAttribute("id")%>')
	console.log('itmdb:<%=session.getAttribute("ITMDatabase")%>')
	console.log('domain:<%=session.getAttribute("domain")%>')
	console.log('token:<%=session.getAttribute("token")%>')
	console.log('school:<%=session.getAttribute("school")%>')
	console.log('country:<%=session.getAttribute("country")%>')
	console.log('city:<%=session.getAttribute("city")%>')
	console.log('projectid:<%=session.getAttribute("projectid")%>')
	
	var crossdb="<%=session.getAttribute("crossdb")%>";
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
	var buddy_project_id=""
	var project="";
	
	$("#page_title").html("<%=session.getAttribute("projectname")%>'s  Idea Threads")

	$("#mapping_finish").click(function(){
		var tboxchecked = [];
		var tboxcheckedtxt = [];
		$('#tbox p input').each(function() {
		    if($(this).is(':checked')){
		    	//console.log($($($(this).parent()).children()[1]).text());
		    	tboxcheckedtxt.push($($($(this).parent()).children()[1]).text());
		    	console.log($(this).attr('id'));
		    	tboxchecked.push($(this).attr('id').replace("mthread", ""));
		    }
		});
		var tbox_checked_str = tboxchecked.join();
		var tbox_checked_str_txt = tboxcheckedtxt.join();
		console.log(tbox_checked_str);
		console.log(tbox_checked_str_txt);
		$.ajax({
            url: '../../SET_MAPPING_FOCUS',
            type: 'POST',
            data: {mappingthreadid : tbox_checked_str, mappingthreadidtxt : tbox_checked_str_txt},
            success: function (response) {
            	window.location.href = "../../thread/mapping.jsp";
            }
        });
		
	});
	
	var s = new sigma({
		  renderers: [{
		    container: document.getElementById('container')
		  }],
		  settings: {
			  labelThreshold: 1,
			  rescaleIgnoreSize: false,
			  autoResize: false,
			  minNodeSize: 1,
			  zoomMin: 2.5,
			  zoomMax: 4,
			  defaultNodeType: 'mySillyType'
		  }
		});
	
	
	s.cameras[0].goTo({ x: 0, y: 0, angle: 0, ratio: 1.8 });

		s.bind('clickNode', function(e) {
			console.log(e);
			  console.log(e.data.node.id.replace("thread_", ""));
			  
				$
						.ajax({
							url : '../../SET_THREAD_FOCUS',
							type : 'POST',
							data : {
								threadid : e.data.node.id.replace("thread_", ""),
								threadname : e.data.node.label
							},
							success : function(
									response) {
								window.location.href = "../../thread/thread.jsp";
							}
						});
				
			});

		
		
		function init(){
			initWondering_area()
			initThread()
		}
		init()

		
		function initWondering_area(){
			var userdata = {
					"database" : crossdb,
					"token" : token,
					"pid" : project_id
				};
			$.ajax({
				url :  "/WSG/wondering_area/get/byprojectid",
				type : "POST",
				data : JSON.stringify(userdata),
				dataType : "json",
				success : function(data, textStatus, jqXHR) {
					var json = $.parseJSON(data.obj);
					console.log(json);
					if(null!=json){
						for (var i = 0; i < json.length; i++) {
							
							// init graph
							s.graph.addNode({
								// Main attributes:
								id : 'wf_' + json[i].id,
								label : json[i].name,
								// Display attributes:
								x : 0,
								y : i * 5,
								size : 360,
								color : '#3f78bf'
							})
							p = $("<p/>");
							p.append('<input type="checkbox"  data-id="'+json[i].id+'" id="mwf'+json[i].id+'" /><label for="mwf'+json[i].id+'">'+json[i].name+'</label>');
							$("#wbox").append(p);
							
						
							
						}
					}
					s.refresh();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR.responseText);
				}
			});
		}
		

		
		
		
		function initWondering_area_in_Add_thread(){
			///wondering_area/get
				var userdata = {
					"database" : crossdb,
					"token" : token,
					"pid" : project_id
				};
			$.ajax({
				url :  "/WSG/wondering_area/get/byprojectid",
				type : "POST",
				data : JSON.stringify(userdata),
				dataType : "json",
				success : function(data, textStatus, jqXHR) {
					var json = $.parseJSON(data.obj);
					console.log(json);
					if(null!=json){
						for (var i = 0; i < json.length; i++) {
							var p = '<p><input type="checkbox" data-id="'+json[i].id+'" id="wf'+json[i].id+'" /><label for="wf'+json[i].id+'">'+json[i].name+'</label></p>';
							$("#wondering_area").append(p);
						}
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR.responseText);
				}
			});
		}
		
		
		function initThread(){
			var projectdata = {
					"database" :'<%=session.getAttribute("crossdb")%>' ,
					"token" : '<%=session.getAttribute("token")%>',
					"projectid":<%=session.getAttribute("projectid")%>
				};

				$.ajax({
							url :  "/WSG/project/thread/get",
							type : "POST",
							data : JSON.stringify(projectdata),
							dataType : "json",
							success : function(data, textStatus, jqXHR) {	
								var json = $.parseJSON(data.obj);
								console.log(json);
								if(null!=json){
									$('#thread_checkboxes').html("");
									for (var i = 0; i < json.length; i++) {
										// init graph
										s.graph.addNode({
											// Main attributes:
											id : 'thread_' + json[i].id,
											label : json[i].threadfocus,
											// Display attributes:
											x : 150,
											y : i * 10,
											size : 300,
											color : '#4ee05f'
										});
										
										
										// init thread checkbox list in add wondering area panel
										var html = '<p><input type="checkbox" data-id="'+json[i].id+'"  id="thread'+json[i].id+'" /><label for="thread'+json[i].id+'">'+json[i].threadfocus+'</label></p>';
										$("#thread_checkboxes").append(html);
										
									}
									
									
									for (var i = 0; i < json.length; i++) {
										p = $("<p/>");
										p.append('<input type="checkbox" id="mthread'+json[i].id+'" /><label for="mthread'+json[i].id+'">'+json[i].threadfocus+'</label>');
										$("#tbox").append(p);
										
									}
									
									
									
									s.refresh();

									var linkdata = {
											"database" :'<%=session.getAttribute("crossdb")%>' ,
											"token" : '<%=session.getAttribute("token")%>',
											"pid":<%=session.getAttribute("projectid")%>
									};

									$.ajax({
												url :  "/WSG/wondering_area/thread/get/byprojectid",
												type : "POST",
												data : JSON.stringify(linkdata),
												dataType : "json",
												success : function(data, textStatus, jqXHR) {
													var json = $.parseJSON(data.obj);
													console.log(json);
													if(null!=json){
													for (var i = 0; i < json.length; i++) {
														s.graph
																.addEdge({
																	// Main attributes:
																	id : 'edge_' + i,
																	source : 'wf_'
																			+ json[i].wondering_area_id,
																	target : 'thread_'
																			+ json[i].thread_id,
																	color : '#7f7f7f'
																})
													}
													}
													s.refresh();
													s.cameras[0].goTo({x : 80,	y : 150, ratio : 1.9});
												},
												error : function(jqXHR, textStatus,
														errorThrown) {
													console.log(jqXHR.responseText);
												}
											});
								}
								
							},
							error : function(jqXHR, textStatus, errorThrown) {
								//console.log(jqXHR.responseText);
							}
						});
		}
		
		
		
		$(document).ready(function() {
							$(document).on(
									'click',
									'.wf-button',
									function() {
										$('#field_click_modal').modal("open");
										//console.log($(this).text());
										$('#click_modal_field_name').text(
												$(this).text());
									});

							$(document).on(
									'click',
									'.thread_button',
									function() {
										$('#thread_click_modal').modal("open");
										//console.log($(this).parent().text());
										$('#click_modal_thread_name').text(
												$(this).parent().text());
									});

							$("#add_wf")
									.click(
											function() {
												$("#wf_name").val("");
												$
														.ajax({
															type : "GET",
															url : "thread.json",
															dataType : "json",
															success : function(
																	data) {
																$.each(
																				data.thread,
																				function(
																						i,
																						item) {
																					$(
																							"#thread_checkboxes")
																							.append(
																									'<p><input type="checkbox" id="'+i+'" /> <label for="'+i+'">'
																											+ item.name
																											+ '</label></p>');
																				})
															}

														})
												$('#add_field_modal').modal(
														"open");

											});
							
							
							
							// add wondering area
							$("#wf_finish").click(function() {
												var keywords = $('#area_keywords').material_chip('data')
												var keyword = "";
												for(var i in keywords){
													keyword=keyword+keywords[i].tag+","
												}
												var wfdata = {
													"database" : crossdb,
													"token" : token,
													"wname" : $("#wf_name").val(),
													"logo" : ($(".materialboxed").attr("src")=="")?"":$(".materialboxed").attr("src"),
													"keywords" : keyword,
													"overarchingquestions" : $("#questions").val(),
													"whyimportant" : $("#why_important").val(),
													"authorid" :id,
													"wcreatetime":new Date(),
													"message" : $("#message").val()
												};

												$.ajax({
													url :  "/WSG/wondering_area/add",
													type : "POST",
													data : JSON.stringify(wfdata),
													dataType : "json",
													success : function(data,textStatus,jqXHR) {
														if(data.code=="success"){
															  if($.trim(data.desc)!=$.trim("No data aviliable.")){
																	var wid=data.obj[0]["GENERATED_KEY"];
																	// add wid with thread
																	$('#thread_checkboxes input:checked').each(function(e) {
																		var threadid=$(this).data("id");
																		var json = {
																				"database" :crossdb ,
																				"token" : token,
																				"threadid" : threadid,
																				"areaid" : wid
																			};

																		$.ajax({
																			url :  "/WSG/thread/wondering/add",
																			type : "POST",
																			data : JSON.stringify(json),
																			dataType : "json",
																			success : function(data, textStatus, jqXHR) {
																				
																			}
																			})
																		
																	})
																	
																	//add wid with project
																	var json = {
																			"database" :crossdb ,
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
															  }
														location.reload();
																
															}															
														});
											});

							$("#wf_done").click(function() {
								//location.reload();
							});

							$("#thread_finish").click(function() {
										//addthread($("#thread_name").val(),thread_count, "purple");
										//addline(3, thread_count);
										//thread_count += 1;
										
										// create thread 
										var keywords = $('#thread_keywords').material_chip('data')
										var keyword = "";
										for(var i in keywords){
											keyword=keyword+keywords[i].tag+","
										}
										
										var threadInfo = {
												"thread_focus":$("#thread_name").val(),
												"authorid":id,
												"createtime":new Date(),
												"resource":$("#key_resource").val(),
												"keywords":keyword,
												"database" : crossdb,
												"token" : token
										}
										$.ajax({
											url :  "/WSG/thread/add",
											type : "POST",
											data : JSON.stringify(threadInfo),
											dataType : "json",
											success : function(data,textStatus,jqXHR) {
												if(data.code=="success"){
													if(data.code=="success"){
														  if($.trim(data.desc)!=$.trim("No data aviliable.")){
																var tid=data.obj[0]["GENERATED_KEY"];
																
																// add thread wondering area connection
																$('#wondering_area input:checked').each(function(e) {
																		var wid=$(this).data("id");
																		var thread_w_json = {
																				"database" :crossdb ,
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
																		
																	})
																	
																
																
																// add thread into project
																	var json = {
																	"database" :crossdb ,
																	"token" : token,
																	"threadid" : tid,
																	"projectid" : project_id,
																	"authorid":id
																};
															$.ajax({
																url :  "/WSG/project/thread/add",
																type : "POST",
																data : JSON.stringify(json),
																dataType : "json",
																})
												
														  	}
														  }
													location.reload();
													}
												}
										})
									});
							
							// add thread to project
							$("#add_thread").click(function() {
								$("#wondering_area").html("");
								// get all wonderng area
								initWondering_area_in_Add_thread()
								$("#add_thread_modal").modal("open");
							});

						});
		
		
		
		
		
		
		
		
		
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
		 
		$(".side-nav").find(".blue-grey").removeClass('blue-grey')
		$(".side-nav").find(".active").removeClass('active')
		$(".side-nav").find(".show").removeClass('show')

		$(".in-work-space").addClass("active blue-grey lighten-2 ")
		$(".in-work-space-body").addClass("show")
		$(".in-work").addClass("active")
	</script>

</body>
</html>