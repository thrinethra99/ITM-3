<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="../../css/materialize.min.css"
	media="screen,projection" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="UTF-8">
<script src="../../js/plotly-latest.min.js"></script>

<style>
#resizable {
	width: 150px;
	height: 150px;
	padding: 0.5em;
}

#resizable h3 {
	text-align: center;
	margin: 0;
}

@media ( min-width : 768px) {
}

.links line {
	stroke: #999;
	stroke-opacity: 0.6;
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

main {
	/*padding-left: 300px;*/
	
}

header {
	/*padding-left: 300px;*/
	
}

ul.side-nav.fixed li.logo {
	text-align: center;
	margin-top: 22px;
	margin-bottom: 62px;
	line-height: 64px;
}

.brand-logo {
	
}

nav.top-nav {
	
}

nav.top-nav a.brand-logo {
	font-size: 36px;
}
.btn-confirm{
 	width:80px;
 	padding:0px;
 }
 .blk_1{
 	width:90%;
 	display:inline-block;
 	padding-left:20px;
}
.blk_2{
	width:50%;
	display:inline-block;
	padding-left:20px;
}
.loading{
	float:left;
	width:100%;
	text-align:center;
	font-size:13px;
	line-height: 30px;
	height: 30px;
    margin: 5px 0px 5px 0px;
}
</style>


</head>

<body>

	<header>
			<nav  class="  blue-grey">
			<%@ include file="../../header.jsp" %>
			<%@ include file="../../side_menu_hidden.jsp" %>
			</nav>
	</header>

	<main> 
	<br><br>
		<div class="container">
			<div class="row">
				<div class="input-field  col s2 ">Find Notes:</div> 
				<div class=" input-field col s4 ">
					From<input type="date" id="from_date" class="datepicker">
				</div>
				<div class="input-field  col s4 ">
					To<input type="date" id="to_date" class="datepicker">
				</div>
			</div>
			
			<div class="row">
				<div class="input-field  col s2 ">In Views</div> 
				<div class="input-field  col s8 " id="views-list">
					<select multiple id="selected-views">
					<option value="-1" id="vid_select_all" onclick="viewSelectAll()">Select All</option>
				</select> <label>Views</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field  col s2 ">In Project</div> 
				<div class="input-field  col s8 " id="projects-list">
					<select multiple id="selected-projects">
					  
				</select> <label>Projects</label>
				</div>
			</div>
			
 			<div class="row">
				<div class="input-field  col s2 ">Key Word:</div> 
				<div class="input-field  col s8 ">
					<input id="search-key-words" type="text" class="validate">
         			 <label for="search-key-words">KeyWord</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field  col s2 ">Key Word in </div> 
				<div class="input-field  col s4 ">
						<select id="fields">
					      <option value="0" selected>Anywhere</option>
					      <option value="1">Note Content</option>
					      <option value="2">Note Title</option>
					    </select>
					    <label>Fields</label>
					</div>
				<div class="input-field  col s4">
						<select id="matching">
						      <option value="0" selected>Related Match</option>
						      <option value="1">Exact Match</option>
						    </select>
						   <label>Matching</label>		
						   
						   
				</div>
			</div>
			<div class="row">
				<div class="input-field  col s2 ">Belongs to Author</div> 
				<div class="input-field  col s8 " id="users-list">
						   <select multiple id="select-user">
						    	<option value="-1" id="ur_select_all" >Select All</option>
						    </select>
						   <label>Author</label>	
						   		
					</div>
			</div>
			<div class="row">
				<div class="input-field  col s2 ">
					<a id="btn-search" class="btn">Search</a>
				</div> 

			</div>
				<div class="row">
				<div class="input-field  col s6 ">
					<a id="btn-select-all" class="btn">Select All Notes</a>
					&nbsp;&nbsp;
					<a id="btn-deselect-all" class="btn">Deselect All Notes</a>
					&nbsp;&nbsp;
					<a id="btn-add-thread" class="btn">Add Into Thread</a>.
					&nbsp;&nbsp;
				</div> 

			</div>
			
		</div>
		
		
		<div class="container">
	
			<div style="padding-left: 10px; border: solid 5px; border-color: #78909c;" > 
					<table >
						<thead >
							<tr>
								<th width="50px"></th>
								<th  width="300px">Title</th>
								<th  width="200px">Author</th>
								<th >Content</th>
							</tr>
						</thead>
						<tbody id="note_list">
						</tbody>
					</table>
				</div>
		</div>
	</main>
	<br><br><br><br><br><br>

	<!--Import jQuery before materialize.js-->
	<script src="../../js/jquery-3.1.0.js"></script>
	<script src="../../js/notify.js"></script>
	<script type="text/javascript" src="../../js/materialize.min.js"></script>
	<script>

	var isSearch = false
	var isCompleteed=false
	$("#btn-select-all").click(function(){
		$(".note_list_id").prop('checked',true)
	})
	
	$("#btn-deselect-all").click(function(){
		$(".note_list_id").prop('checked',false)
	})
	
	var import_note=[]
	$("#btn-add-thread").click(function(){
		$('#note_list input:checked').each(function(){
		
			
			 var tid =<%=session.getAttribute("threadid")%>;
			 if(null==tid){
				 tid=999;
			 }
			 // get note info then add into cross project
			  var json = {
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					"token" : '<%=session.getAttribute("token")%>',
					 "noteid":$(this).attr('value'),
			 }
			 
				 $.ajax({
						url :  "/WSG/note/get/bystr_id",
						type : "POST",
						data : JSON.stringify(json),
						dataType : "json",
						success : function(data, textStatus,
								jqXHR) {
							 if(data.code=="success"){
								 var json = $.parseJSON(data.obj);
								 add_note_cross_to_project(json[0])
								 
								 get_author_by_note_id(json[0].note_id)
								 
							 }
						}})
			 
			
					
					 //note_add_keywords($(this).attr('value'))
			 
		})
		
		  $.notify('Notes has been added into thread', 'success');
		 isSearch=true
	})
	
	
	function add_note_cross_to_project(note){
		 var json = {
				 "database" :'<%=session.getAttribute("crossdb")%>' ,
				 "token" : '<%=session.getAttribute("token")%>',
				 "title":note.title.replace(/'/g,"''").replace(/"/g,"\\\""),
				 "noteid":note.note_id,
				 "content":note.content.replace(/'/g,"''").replace(/"/g,"\\\""),
				 "ctime":note.create_time,
				 "offset":"-1"
		 }
		 $.ajax({
				url :  "/WSG/supertalk/note/add",
				type : "POST",
				data : JSON.stringify(json),
				dataType : "json",
				success : function(data, textStatus,
						jqXHR) {
					 if(data.code=="success"){
						 import_note.push(json)
						 		var current_author_id='<%=session.getAttribute("id")%>'
							 add_note_author_to_project(current_author_id,data.obj[0]["GENERATED_KEY"])
							 var current_supertalk_id='<%=session.getAttribute("cross_threadid")%>'
							 add_note_supertalk_relation(data.obj[0]["GENERATED_KEY"],current_supertalk_id)
					 }
				}})
	}
	
	function get_author_by_note_id(noteid){
		 var json = {
				 "database" :'<%=session.getAttribute("localdb")%>' ,
				 "token" : '<%=session.getAttribute("token")%>',
				 "noteid":noteid

		 }
		 $.ajax({
				url :  "/WSG/note/author/get",
				type : "POST",
				data : JSON.stringify(json),
				dataType : "json",
				success : function(data, textStatus,
						jqXHR) {
					 if(data.code=="success"){
						 var json = $.parseJSON(data.obj);
						 for(var i in json){
							 add_author(json[i],noteid)
						 }
					 }
				}})
	}
	
	function add_note_author_to_project(authorid,noteid){
		var json = {
				 "database" :'<%=session.getAttribute("crossdb")%>' ,
				 "token" : '<%=session.getAttribute("token")%>',
				 "authorid":authorid,
				 "noteid":noteid
		 }
		$.ajax({
			url :  "/WSG/supertalk/note/author/add",
			type : "POST",
			data : JSON.stringify(json),
			dataType : "json",
			success : function(data, textStatus,
					jqXHR) {
				 if(data.code=="success"){
					 console.log(1)
					 //thread note
				 }
				 
			}
		})
	}
	
	function add_note_supertalk_relation(nid,sid){
		 var json = {
				 "database" :'<%=session.getAttribute("crossdb")%>' ,
				 "token" : '<%=session.getAttribute("token")%>',
				 "noteid":nid,
				 "sid":sid,
				 "ctime":new Date()
		 }
		$.ajax({
			url :  "/WSG/supertalk/supertalk_note/add",
			type : "POST",
			data : JSON.stringify(json),
			dataType : "json",
			success : function(data, textStatus,
					jqXHR) {
				 if(data.code=="success"){
					 console.log(1)
					 
				 } 
				 //$.notify("A new note has been created","success")
				 
				// $("#google_authorization_confirm").modal("close");
				 
				 //location.reload(true);
			}})
	}
	
	function add_note_note_relation(){
		
	}
	
	function add_author(author,noteid){
		 var jsondata = {
					"database" : '<%=session.getAttribute("crossdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					"username" : author.username,
					"password" : "",
					"community" : '<%=session.getAttribute("community")%>' ,
					"roletype" : '<%=session.getAttribute("role")%>' ,
					"first_name" : "null",
					"last_name" : "null",
					"google_account" : "null",
					"profile_image" : "null",
					"email" : '<%=session.getAttribute("email")%>' ,
					"gender" : "null",
					"age" :-1 ,
					"content" : "null ",
					"localdb" : " '<%=session.getAttribute("localdb")%>' ,"
				}

				$.ajax({
					url :  "/WSG/user/register",
					type : "POST",
					data : JSON.stringify(jsondata),
					dataType : "json",
					success : function(data, textStatus, jqXHR) {
						if (data.code == "failure") {
							console.log(data.desc, "error");
						} else {
							add_note_author_to_project(data.obj[0]["GENERATED_KEY"],noteid)							
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR.responseText);
					}
				}); 
		
	}
	
	
	
	
	function note_add_keywords(noteid){
		
		 var json = {
				 "database":'<%=session.getAttribute("localdb")%>' ,
				 "token":'<%=session.getAttribute("token")%>',
				 "noteid":noteid,
				 "threadid":<%=session.getAttribute("threadid")%>,
				 "projectid":<%=session.getAttribute("projectid")%>,
				 "keywords":keywords_for_search
		 }
		 $.ajax({
				url :  "/WSG/note/keyword/add",
				type : "POST",
				data : JSON.stringify(json),
				dataType : "json"
				})
		 
		
	}
	
		$(document).ajaxStop(function() {
			if(isSearch){
				// add note_note_relationship	
				isCompleteed=true
			}
			if(isCompleteed){
				window.history.back();
			}
			
	});
	
	
	
	$(".button-collapse").sideNav();
	$(".in-community").hide();
	$("#show_slide").click(function() {
		$('.button-collapse').sideNav('show');
	});
	$(".modal").modal();
	$("#page_title").html("Import")
	
	 $('.datepicker').pickadate({
		    selectMonths: true, // Creates a dropdown to control month
		    selectYears: 15 // Creates a dropdown of 15 years to control year
		  });
	
	function init(){
		
		// init views
		initViews()
		
		// init projects
		initProjects()
		
		// init user
		
		initUser()
		
		
		// init 
		$('select').material_select();
		
	
		
	}
	init()
	
	function initProjects(){
	
           $("#selected-projects").append(
          						   $("<option id='pid_<%=session.getAttribute("projectid")%>' selected></option>")
          					        .attr("value",<%=session.getAttribute("projectid")%>)
          					        .text('<%=session.getAttribute("projectname")%>')
          					        )
   					   $("#selected-projects").trigger('contentChanged');
         

	}

	var keywords_for_search="";
	$("#btn-search").click(function(){
		
		var from_date = $("#from_date").val();
		var to_date = $("#to_date").val();
		var selected_views = $("#selected-views").val();
		var search_key_words = $("#search-key-words").val();
		var selected_projects = $("#selected-projects").val();
		var fields = $("#fields").val();
		var matching = $("#matching").val();
		keywords_for_search=$("#search-key-words").val();
		var fd ={
		    	database:'<%=session.getAttribute("localdb")%>' ,
				from_date: $("#from_date").val(),
				to_date: $("#to_date").val(),
				view_ids: JSON.stringify($("#selected-views").val()),
				keywords: $("#search-key-words").val(),
				project_ids: JSON.stringify($("#selected-projects").val()),
				category: $("#fields").val(),
				isExact: $("#matching").val(),
				users:JSON.stringify($("#select-user").val())
			}
		console.log("from date:"+from_date)
		console.log("to date:"+to_date)
		console.log("selected_views :"+selected_views)
		console.log("search_key_words:"+search_key_words)
		console.log("selected_projects:"+selected_projects)
		console.log("fields:"+fields)
		console.log("matching:"+matching)
		 $.ajax({
			    type: 'post',
			    url: '/IIUS/util/search',
			    data: fd,
			    dataType: 'json',
                async: true,
			    success: function (data) {
			      // do something
			      if(data.code=="success"){
                	 var json =data.obj;
                	 if($.trim(json)!="No data aviliable."){
                		 var d = $.parseJSON(json); 
                		 if(d==""){
                			 $.notify('No note match. ', 'info');
                		 }else{
                			 initTable(d); 
                		 }
					      
                	 	}else{
                	 		$.notify('No note match. ', 'warn');
                	 	}
                	 }
			      
			      }
			  });
		
	})
	
		
  $('select').on('contentChanged', function() {
			 // re-initialize (update)
				 $(this).material_select();
		});
	
	
	
	function initViews(){
		var jsondata = {
				"database" :'<%=session.getAttribute("localdb")%>' ,
				"token" : '<%=session.getAttribute("token")%>'
		};
		$.ajax({
			url :  "/WSG/view/get/all",
			type : "POST",
			data : JSON.stringify(jsondata),
			dataType : "json",
			success : function(data, textStatus, jqXHR) {
				if(data.code=="success"){
                	 var json =data.obj;
                	 if($.trim(json)!="No data aviliable."){
	            			
                		 var d = $.parseJSON(json); 
                		  for( var i in d){
   						   $("#selected-views").append(
   						   $("<option id='vid_"+d[i].view_id+"'></option>")
   					        .attr("value",d[i].view_id)
   					        .text(d[i].title)
   					        )
   					   }
   					   $("#selected-views").trigger('contentChanged');
                	 }
				}
			}
		})
	}
	
	
	function initUser(){
			var d =JSON.parse(localStorage.users);
       		  for( var i in d){
					   $("#select-user").append(
					   $("<option id='user_"+d[i].str_id+"'></option>")
				        .attr("value",d[i].str_id)
				        .text(d[i].first_name+"　"+d[i].last_name)
				        )
				   }
				   $("#select-user").trigger('contentChanged');
       	 }
	
	
	

	function initTable(data){
		$("#note_list").html("")
		if(null!=data&&""!=data){
			for (var i in data) {
				var tr =$("#note_list")
				var html ='<tr><td width="50px"><input class="note_list_id" type="checkbox" value="'+data[i].note_id+'"  id="notes_'+data[i].note_id+'"><label for="notes_'+data[i].note_id+'"></label>'
								+ '</td>'
								if(null!=data[i].title){
									 html = html+'<td width="150px">'+data[i].title+'</td>'
								}else{
									 html = html+'<td width="150px"> null </td>'
								}
									
								if(null!=data[i].first_name){
									 html = html+'<td width="300px">'+$.trim(data[i].first_name)+'</td>'
								}else{
									 html = html+'<td width="300px"> null </td>'
								}
								
								if(null!=data[i].content||""!=data[i].content){
									var content=data[i].content.replace(/<\/?[^>]+(>|$)/g, "");
									if(content.length>50){
										 html = html+'<td >'+content.substring(0,50)+'...</td>'
									}else{
										 html = html+'<td >'+content+'</td>'
									}
									
								}else{
									 html = html+'<td> null </td>'
								}
								 html = html+'</tr>'
								 tr.append(html)
			}
		}
	}
	
	
		$(document).ready(function() {
			
			$('#views-list li:first-child').click(function(index) {
	    		  $('#views-list li:not(:first-child)').each(function(index) {
		    		  $(this).click();                       
		 		 });
	 		 });
			
			$('#projects-list li:first-child').click(function(index) {
	    		  $('#projects-list li:not(:first-child)').each(function(index) {
		    		  $(this).click();                       
		 		 });
	 		 });
			
			$('#users-list li:first-child').click(function(index) {
	    		  $('#users-list li:not(:first-child)').each(function(index) {
		    		  $(this).click();                       
		 		 });
	 		 });
			
			
		});
	

	</script>
</body>
</html>