<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../validation.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="../css/materialize.min.css"
	media="screen,projection" />
<link type="text/css" rel="stylesheet"
	href="../css/customerize.css" media="screen,projection" />
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="UTF-8">
<script src="../js/jquery-3.1.0.js"></script>
<script src="../js/plotly-latest.min.js"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/jquery.sessionTimeout.js"></script>
<script src="../js/itm.js"></script>

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
	stroke-opacity: 0.2;
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

/* title2_tester{
   
    height:1000px;
    margin-right:5px;
    float:left;
    background-color: white;
} */
#title2{
	 float:left;
	 background-color: white;
	 height:1000px;
     width:18%;
}
 #tester{
	 float:left;
	 width:100%;
    margin-right:5px;
}


</style>
<script>
var localdb =getUrlParameter('localdb');
var token =getUrlParameter('token');
var community =getUrlParameter('community');
var c_id =getUrlParameter('c_id');
var type =getUrlParameter('type');
var urname =getUrlParameter('urname');
var id =getUrlParameter('id');
var itmdb =getUrlParameter('itmdb');
var domain =getUrlParameter('domain');
var school =getUrlParameter('school');
var country =getUrlParameter('country');
var city =getUrlParameter('city');
var projectid =getUrlParameter('projectid');

</script>

</head>

<body>
<header>
		<nav class="blue-grey">
			<%@ include file="../header.jsp"%>
			<%@ include file="../side_menu_hidden.jsp"%>
		</nav>
	</header>
	
	<span id="mappingthreadid" style="display: none">${sessionScope.mappingthreadid}</span>
	<span id="mappingthreadidtxt" style="display: none">${sessionScope.mappingthreadidtxt}</span>	
	
<ul id="slide-out-right" class="side-nav">

	</ul>
	
	<main> <br>

	<div class="row">
		<div class="row">
		<!-- <div class="col s2 left" style="">
			<input type="checkbox" id="Vertical" /><label for="Vertical"
				class="teal-text">Vertical</label>
		</div> -->
		<div class="col s1">
			<a class='dropdown-button btn' href='#' data-activates='dropdown3'>Show</a>
			<ul id='dropdown3' class='dropdown-content'>
				<li class="divider"></li>
				<li><input class="showed" type="checkbox" id="showtitle" checked="checked" /><label for="showtitle" class="teal-text">Title</label></li>
				<li><input type="checkbox" id="showauthor" /><label for="showauthor" class="teal-text">Author</label></li>
				<li><input type="checkbox" id="showbuildon" /><label for="showbuildon" class="teal-text">Buildon</label></li>
				<li><input type="checkbox" id="showreference" /><label for="showreference" class="teal-text">Reference</label></li>
				<li><input type="checkbox" id="highlight" /><label for="highlight" class="teal-text">HighLight Only</label></li>
			</ul>
		</div>

		<div class="col s1">
			<a class='dropdown-button btn' href='#' data-activates='dropdown5'>Order
				By</a>
			<ul id='dropdown5' class='dropdown-content'>
				<li><a href="#!" id="orderByAuthor">Author</a></li>
				<li><a href="#!" id="orderByScaffolds">Scaffolds</a></li>
				<li><a href="#!" id="orderByTypes">Types</a></li>
			</ul>
		</div>


	</div>

	<div class="row" id="title2_tester">
		<div class="col s12 blue-grey lighten-4">
			<!-- <div id="title2" style="margin: 10px auto;"></div> -->
			<div id="tester" style="margin: 10px auto; height: 1200px;"></div>
		</div>
		
	</div>


	


	<div id="modal1" class="modal">
		<div class="modal-content">
			<h5 class="center">Add Notes</h5>
			<div class="divider"></div>
			<div style="margin-top: 20px;">
				<div class="row">
					<a class="col s3 offset-s2 center btn">From Existing Notes</a> <a
						class="col s3 offset-s2 center btn modal-trigger"
						href="#googledoc">Write A New Note</a>
				</div>
				<div class="row">
					<p class="col s3 offset-s2 center light">Search notes from the
						current database and add them</p>
					<p class="col s3 offset-s2 center light">You can also add a
						note by yourself!</p>
				</div>
			</div>
		</div>
	</div>

	<div id="googledoc" class="modal">
		<div class="modal-content">
			<div class="row">
				<div class="input-field col s12">
					<input value="Alvin" id="first_name2" type="text" class="validate">
					<label class="active" for="first_name2">Title</label>
				</div>
				<div class="col s12">
					<ul class="collapsible" data-collapsible="accordion">
						<li>
							<div class="collapsible-header active">Co-authors</div>
							<div class="collapsible-body">
								<p>
									<input type="checkbox" id="author1" /> <label for="author1">A</label>
									<input type="checkbox" id="author2" /> <label for="author2">B</label>
									<input type="checkbox" id="author3" /> <label for="author3">C</label>
								</p>
							</div>
						</li>
						<li>
							<div class="collapsible-header">Views</div>
							<div class="collapsible-body">
								<p>test</p>
							</div>
						</li>
						<li>
							<div class="collapsible-header">Scaffolds</div>
							<div class="collapsible-body">
								<div class="input-field">
									<select>
										<option value="" disabled selected>Choose your option</option>
										<option value="1">Option 1</option>
										<option value="2">Option 2</option>
										<option value="3">Option 3</option>
									</select> <label>Materialize Select</label>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<form class="col s12">
					<div class="row">
						<div class="input-field col s12">
							<textarea id="textarea4" class="materialize-textarea"></textarea>
							<label for="textarea1">Textarea</label>
							<p>
								<a>Or write in google doc</a>
							</p>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!"
				class="modal-action modal-close waves-effect waves-green btn-flat ">Agree</a>
		</div>
	</div>

	<div id="infomodal" class="modal">
		<div class="modal-content">
			<ul class="collection">
				<li class="collection-item">Thread Name:<span
					style="margin-left: 100px; font-size: 23px;">blood</span><a
					href="#!" class="secondary-content editmodal"><i
						class="material-icons ">edit</i></a></li>
				<li class="collection-item">Project Name:<span
					style="margin-left: 100px; font-size: 23px;">Human body, Mrs
						Kirk, 2015-2016</span><a href="#!" class="secondary-content editmodal"><i
						class="material-icons ">edit</i></a></li>
				<li class="collection-item">Created by:<span
					style="margin-left: 100px; font-size: 23px;">Mrs Kirk</span><a
					href="#!" class="secondary-content editmodal"><i
						class="material-icons">edit</i></a>
				</li>
				<li class="collection-item">Keywords:<a href="#!"
					class="secondary-content editmodal"><i class="material-icons">edit</i></a></li>
				<li class="collection-item">Overarching question(s):<a
					href="#!" class="secondary-content editmodal"><i
						class="material-icons">edit</i></a></li>
				<li class="collection-item">Time created:<a href="#!"
					class="secondary-content editmodal"><i class="material-icons">edit</i></a></li>
				<li class="collection-item">History:<a href="#!"
					class="secondary-content editmodal"><i class="material-icons">send</i></a>
				</li>
				<li class="collection-item">Mark as deleted:<a href="#!"
					class="secondary-content"><input type="checkbox" id="test5" /><label
						for="test5"></label></a></li>
			</ul>
			<a class="col s4 offset-s4 btn jofsave center center-align"> Done
			</a>
		</div>
	</div>

	<div id="editmodal" class="modal">
		<div class="modal-content">
			<div class="row">
				<div class="input-field col s12">
					<input id="password" type="text" class="validate"> <label
						for="password">Password</label>
				</div>
				<a class="col s4 offset-s4 btn jofsave center center-align done">
					Done </a>
			</div>
		</div>
	</div>

	
<div id="draggable" class="ui-widget-content"
		style="display: none; height: 500px; width: 750px; top: 200px; right: 500px; position: absolute; border-style: solid; border-width: 5px; border-color: #607d8b; z-index: 100;">
		<div class="row">
			<div class="col s11 blue-grey" style="height: 20px"></div>	
			<a class="col s1 btn blue-grey white-text" id="close1">X</a>
			<div class="col s1 not_draggable" style="padding-left: 0">
				<a id="backward" class="btn white center-align z-depth-0" title="This note builds on..." style="height: 350px; vertical-align: middle; text-align: center; line-height: 350px;"><span style="font-size: 24px"><</span></a>
			</div>
			<div class="col s10 not_draggable" style="padding-left: 0; padding-right: 0; width: 610px">
				<div class="container">
					<div class="row">
						<p id="title" style="overflow: auto; font-size: 20px;"></p>
						<hr>
						<p id="content" style="overflow: auto; height: 270px; font-size: 20px;"></p>
						<input type="hidden" id="t_id">
					</div>
					<script>
					
					var sel = "null";
					var title="null";
					var new_data_note_id = [];
					var data_note_id;
					var date = new Date();
					var content = "";
					var reason;
					var new_data_note_id=[];
					
					function storeHighlightedContent(reason){
						var jsondata = {
			                    'token':token,
			                    'database':localdb,
			                    'noteid' : data_note_id,
			                    'reason' : reason,
			                    'content' : content,
			                    'threadid' :$("#t_id").val(), 
			                    'authorid': id,
			                    'ctime' : new Date()
			                     }
					 $.ajax({
			                url : "/WSG/thread/note/highlight/add",
			                type : "post",
			                data:JSON.stringify(jsondata),
			                dataType:"json",
			                success : function(data, textStatus, jqXHR) {
			                   
			                    console.log(jsondata);
			                },
			                error : function(jqXHR, textStatus, errorThrown) {
			                    console.log(jqXHR.responseText);
			                }
			            });
					}
					
					
					function GetSelectedTextHighlight(color, reason){
						 sel = window.getSelection().toString();
						 if(sel != 0){
							content = sel;
							storeHighlightedContent(reason);
						    if (sel.rangeCount && sel.getRangeAt) {
						        range = sel.getRangeAt(0);
						    }
						    document.designMode = "on";
						    document.execCommand("BackColor", false, color);
						    document.designMode = "off";
						 }
							else{
								Materialize.toast('Please select text to highlight!', 4000)
							}
					}
					
					
					
					function checkHighlight(allContent, data_note_id){
						var getHighlightedText = {
					                    'token':token,
					                    'database':localdb,
					                    'noteid' : parseInt(data_note_id),
					                     }
							 $.ajax({
					                url : "/WSG/thread/note/highlight/get",
					                type : "post",
					                data:JSON.stringify(getHighlightedText),
					                dataType:"json",
					                success : function(data, textStatus, jqXHR) {
					                    var json = $.parseJSON(data.obj);
					                    var output=allContent;
					                    if(json!=null){
					                    for(var item = 0; item < json.length; item++){
					                    
					                    if(json[item].reason == 'A “juicy” question for research'){
					                            var regex = new RegExp(json[item].content,'gi');
					                            output=output.replace(regex, '<span style="background-color:yellow;">'+json[item].content+"</span>");
					                    }
					                    if(json[item].reason == 'An “Aha” insight'){
					                            var regex = new RegExp(json[item].content,'gi');
					                            output=output.replace(regex, '<span style="background-color:#72e567;">'+json[item].content+"</span>");
					                        } 
					                    if(json[item].reason == 'A seed idea to refine'){
					                            var regex = new RegExp(json[item].content,'gi');
					                            output=output.replace(regex, '<span style="background-color:#fdb760;">'+json[item].content+"</span>");
					                        } 
					                    if(json[item].reason == 'An important fact to consider'){
						                        var regex = new RegExp(json[item].content,'gi');
					                            output=output.replace(regex, '<span style="background-color:#a6acff;">'+json[item].content+"</span>");
					                        } 
					                    if(json[item].reason == 'Conflicting ideas to look into'){
						                        var regex = new RegExp(json[item].content,'gi');
					                            output=output.replace(regex, '<span style="background-color:#e53244;">'+json[item].content+"</span>");
					                        } 
					                    if(json[item].reason == 'A gap of knowledge'){
						                        var regex = new RegExp(json[item].content,'gi');
					                            output=output.replace(regex, '<span style="background-color:#72e567;">'+json[item].content+"</span>");
					                        }
					                    
					                    $("#content").html(output)
					                     }
					                    }
					                },
					                error : function(jqXHR, textStatus, errorThrown) {
					                    console.log(jqXHR.responseText);
					                }
					            });
						}
					</script>
					<div class="row">
					<a class="col s4 btn teal lighten-1 white-text" id="highlightnote" style="font-size: 10px; width: 100px">Edit</a> 
					<a class="col s4 btn teal lighten-1 white-text" style="margin-left: 10px; font-size: 10px; width: 100px">Build on</a>
					<button class="col s4 dropdown-button btn teal lighten-1 white-text" id="highlightBtn" data-activates='highlightOptions' id="highlightbtn" style="margin-left: 10px; font-size: 10px; width: 200px">Highlight</button>
					<a class="col s4 dropdown-button btn teal lighten-1 white-text" href='#' data-activates='boxdropdown' style="margin-left: 10px; font-size: 10px; width: 100px">More...</a>
						
					</div>
					
					<ul id='highlightOptions' class='dropdown-content collection' style="width:100px;">
						<li><span style="color: red; font-size: 10.5px" title="Please select text to highlight, and select a reason(s):"><b>Please select text to highlight, and select a reason(s): </b></span></li>
						<li style="background-color:#fdff4a"><a onmousedown="GetSelectedTextHighlight('#fdff4a','A “juicy” question for research')" href="#!"><span style="font-size: 11.5px;color:black;" title="A “juicy” question for research"><b>A “juicy” question for research</b></span></a></li>
						<li style="background-color:#72e567"><a onmousedown="GetSelectedTextHighlight('#72e567','An “Aha” insight')" href="#!"><span style="font-size: 11.5px;color:black;" title="An “Aha” insight"><b>An “Aha” insight</b></span></a></li>
						<li style="background-color:#fdb760"><a onmousedown="GetSelectedTextHighlight('#fdb760','A seed idea to refine')" href="#!"><span style="font-size: 11.5px;color:black;" title="A seed idea to refine"><b>A seed idea to refine</b></span></a></li>
						<li style="background-color:#a6acff"><a onmousedown="GetSelectedTextHighlight('#a6acff','An important fact to consider')" href="#!"><span style="font-size: 11.5px;color:black;" title="An important fact to consider"><b>An important fact to consider</b></span></a></li>
						<li style="background-color:#ff5b5b"><a onmousedown="GetSelectedTextHighlight('#ff5b5b','Conflicting ideas to look into')" href="#!"><span style="font-size: 11.5px;color:black;" title="Conflicting ideas to look into"><b>Conflicting ideas to look into</b></span></a></li>
						<li style="background-color:#c0b1d0"><a onmousedown="GetSelectedTextHighlight('#c0b1d0','A gap of knowledge')" href="#!"><span style="font-size: 11.5px;color:black;" title="A gap of knowledge"><b>A gap of knowledge</b></span></a></li>
						<!-- <li><div style="height: 10px; width: 10px; background-color: #728DA5; margin-left: 5px;"></div><a onmousedown="GetSelectedTextLightBlue()" href="#!">Other: type here <input type="text" name="highlightReason"></a></li> -->
					</ul>
					<ul id='boxdropdown' class='dropdown-content'>
						<li><a href="#!">Collect</a></li>
						<li><a href="#!">Copy to thread</a></li>
						<li><a href="#!">Remove</a></li>
						<li><a href="#!">Delete</a></li>
					</ul>
				</div>
			</div>
			<div class="col s1 not_draggable"
				style="padding-left: 0; padding-right: 0;">
				<a id="forward" class="btn white center-align z-depth-0" title="This note is built on by..." style="height: 350px; vertical-align: middle; text-align: center; line-height: 350px;"><span style="font-size: 24px">></span></a>
			</div>
		</div>
	</div>


	<div id="searchoption" class="collection"
		style="display: none; width: 330px; position: fixed; right: 60px; top: 168px">
		<a href="#!" class="collection-item searchbyoptions">By author</a> <a
			href="#!" class="collection-item searchbyoptions">By scaffold</a> <a
			href="#!" class="collection-item searchbyoptions">By highlight</a> <a
			href="#!" class="collection-item searchbyoptions">By contribution
			type</a> <a href="#!" class="collection-item searchboxclose">Close</a>
	</div>

	<div id="searchbyauthor" class="modal">
		<div class="modal-content">
			<ul class="collection">
			</ul>
			<a class="col s4 offset-s4 btn jofsave center center-align"> Done
			</a>
		</div>
	</div>

	<div id="draggableJof" class="ui-widget-content"
		style="display: none; height: 235px; width: 500px; top: 120px; right: 0px; position: fixed">
		<div class="row">
			<div>
				<h5 class="center">Journey of Thinking</h5>
			</div>
			<ul class="collapsible" data-collapsible="accordion">
				<li>
					<div class="collapsible-header expend">Our Problems:</div>
					<div class="collapsible-body">
						<div class="input-field">
							<img id="problem" src="../res/problem.gif" />
							<textarea id="textarea1" class="materialize-textarea"> </textarea>
						</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header expend">Big ideas we have
						learned:</div>
					<div class="collapsible-body">
						<div class="input-field">
							<br> <img id="think" src="../res/think.gif" /><img
								id="insight" src="../res/insight.gif" />
							<textarea id="textarea2" class="materialize-textarea"> </textarea>
						</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header expend">We need to do more:</div>
					<div class="collapsible-body">
						<div class="input-field">
							<br> <img id="understand" src="../res/understand.gif" /><img
								id="bettertheory" src="../res/Better%20theory.gif" /><img
								id="read" src="../res/read.gif" /><img id="evidence"
								src="../res/evidence.gif" /><img id="disagree"
								src="../res/disagree.gif" />
							<textarea id="textarea3" class="materialize-textarea"> </textarea>
						</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<a class="col s4 offset-s4 btn jofsave center center-align">
							Done </a>
					</div>
				</li>
			</ul>
			<div class=""></div>
		</div>


	</div>
	</div>

	<div id="jotmodal" class="modal">
		<div class="modal-content">
			<ul class="collection">
				<li class="collection-item avatar"><span class="title">Our
						Problems</span>
					<p>Our Problems......................................</p></li>
				<li class="collection-item avatar"><span class="title">Big
						Ideas We Have Learned</span>
					<p>Big Ideas......................................</p></li>
				<li class="collection-item avatar"><span class="title">We
						need to do more</span>
					<p>We need to do more......................................</p></li>
			</ul>

		</div>
		<div class="modal-footer">
			<a href="#!" class="waves-effect waves-green btn">Edit</a>
		</div>
	</div>

	</main>


	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="../js/materialize.min.js"></script>
	<script src="https://d3js.org/d3.v4.min.js"></script>
	<script src="../js/itm.js"></script>
	<script>
		$(document).ready(function() {
			$("#close1").click(function() {
				$("#draggable").hide();
				var temp_trace = {
						x : temp_realdatatime_left1,
						y : temp_realdataweight_left1,
						mode : 'markers+text',
						type : 'scatter',
						textposition : 'left',
						marker : {
							size : 6,
							color : 'red'
						}
				};
				
				Plotly.addTraces(TESTER, [temp_trace])
			});
			
			$('#button-collapse').sideNav('hide');
			$('#button-collapse').sideNav({
				menuWidth : 300, // Default is 240
				edge : 'left', // Choose the Vertical origin
				closeOnClick : true
			// Closes side-nav on <a> clicks, useful for Angular/Meteor
			});
			$('#button-collapse2').sideNav({
				menuWidth : 300, // Default is 240
				edge : 'left', // Choose the Vertical origin
				closeOnClick : true
			// Closes side-nav on <a> clicks, useful for Angular/Meteor
			});
			$('#button-collapse-right').sideNav({
				menuWidth : 500, // Default is 240
				edge : 'right', // Choose the Vertical origin
				closeOnClick : true
			// Closes side-nav on <a> clicks, useful for Angular/Meteor
			});
			$("#draggable").draggable({cancel : '.not_draggable'});
		});
		
		console.log('localdb:<%=session.getAttribute("localdb")%>')
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
		
		<%-- var localdb="<%=session.getAttribute("localdb")%>";
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
		var project_id="<%=session.getAttribute("projectid")%>"; --%>
		
		
		
		
		var buddy_project_id=""
		var project="";
		
	</script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('.modal-trigger').leanModal();
							
							$("#draggable").draggable();

							window
									.setInterval(
											function() {
												$(".jofsave")
														.html(
																'<div class="preloader-wrapper small active"><div class="spinner-layer spinner-red-only"> <div class="circle-clipper left"> <div class="circle"></div> </div> <div class="gap-patch"> <div class="circle"></div> </div> <div class="circle-clipper right"> <div class="circle"></div> </div> </div> </div>');

												setTimeout(function() {
													$(".jofsave").html("Done");
												}, 2000);

											}, 10000);

							var noteinfo = [
									'"My Theory" by Erika Irwin',
									'"Great theory! Why?" by Kirk Stacey',
									'"blood" by Ty Mortier, Finn Burke, Calvin Marlow',
									'"Bruises and blood journey of thinking" by Finn Burke, Calvin Marlow',
									'"Blood and Dreams" by Finn Burke',
									'"blood" by Calvin Marlow' ]

							$(".modaledit").click(function() {
								$(".notedetail").removeClass("s12");
								$(".notedetail").addClass("s8");
								$("html, body").animate({
									scrollTop : $(document).height()
								}, "slow");
								$(".joteditpart").show();
							});

							$(".jofsave").click(function() {
								$(".notedetail").removeClass("s8");
								$(".notedetail").addClass("s12");
								$(".joteditpart").hide();
							});

							$(".edit").click(function() {
								$(".notedetail").removeClass("s12");
								$(".notedetail").addClass("s8");
								$("html, body").animate({
									scrollTop : $(document).height()
								}, "slow");
								$(".joteditpart").show();
							});

							$(".jotdetail").click(function() {
								$('#jotmodal').openModal();
							});

							$("#highlight")
									.click(
											function() {
												if (!$(this).hasClass("showed")) {
													$("#newtest li input")
															.show();
													$("#newtest li label")
															.show();
													$(this).addClass("showed");
													$("#highlightbar")
															.append(
																	'<a class="btn" id="highlightdone"><i class="material-icons left">done</i>Done</a>');
												}
											});

							$(document).on('click', '#highlightdone',
									function() {
										$("#newtest li input").hide();
										$("#newtest li label").hide();
										$("#highlight").removeClass("showed");
										$(this).remove();
									});

						
							$("#button-collapse-right").click(function() {
								$("html, body").animate({
									scrollTop : $(document).height()
								}, "slow");
								$("#newshow").removeClass("s12");
								$("#newshow").addClass("s6");
							});

							$("#showtitle").click(function() {
								if ($(this).hasClass("showed")) {
									//                alert("1");
									TESTER.data[0].mode = 'markers';
									Plotly.redraw(TESTER);
									$(this).removeClass("showed");
									//                $(this).text("SHOW TITLE");
								} else {
									//                alert("1");
									$("#showauthor").removeClass("showed");
									TESTER.data[0].mode = 'markers+text';
									TESTER.data[0].text = newtext;
									TESTER.data[0].textposition = 'top center';
									Plotly.redraw(TESTER);
									$(this).addClass("showed");
									$(this).text("HIDE TITLE");
								}
							});

							

							$("#showbuildon").click(function() {
												if ($(this).hasClass("showed")) {
													//                TESTER.data[0] = data[0];
													alert("1");
													Plotly.deleteTraces(TESTER, -10);
													Plotly.redraw(TESTER);
													$(this).removeClass("showed");
													//                $(this).text("SHOW BUILD-ON");
												} else {
													Plotly
															.addTraces(
																	TESTER,
																	{
																		x : [
																				'2016-02-04 10:53:00',
																				'2015-10-20 12:11:00' ],
																		y : [
																				2,
																				5 ]
																	});
													$(this).addClass("showed");
													$(this).text(
															"HIDE BUILD-ON");
												}
											});

							$("#showauthor").click(function() {
								if ($(this).hasClass("showed")) {
									TESTER.data[0].mode = 'markers';
									Plotly.redraw(TESTER);
									$(this).removeClass("showed");
									//                $(this).text("SHOW AUTHOR");
								} else {
									$("#showtitle").removeClass("showed");
									TESTER.data[0].mode = 'markers+text';
									TESTER.data[0].text = newauthor;
									TESTER.data[0].textposition = 'top center';
									Plotly.redraw(TESTER);
									$(this).addClass("showed");
									//                $(this).text("HIDE AUTHOR");
								}
							});

							$(".showauthor").click(function() {
								if ($(this).hasClass("showed")) {
									//                TESTER.data[0].mode = 'markers';
									//                Plotly.redraw(TESTER);
									//                $(this).removeClass("showed");
									//                $(this).text("SHOW AUTHOR");
								} else {
									$("#showtitle").removeClass("showed");
									TESTER.data[0].mode = 'markers+text';
									TESTER.data[0].text = newauthor;
									TESTER.data[0].textposition = 'top center';
									Plotly.redraw(TESTER);
									$(this).addClass("showed");
									$(this).text("HIDE AUTHOR");
								}
							});

							$("#orderByAuthor").click(
									function() {
										TESTER.data[0].y = [ 1, 2, 3, 4, 5, 6,
												7, 8, 9, 10, 11, 12, 13, 14,
												15, 16, 17, 18, 19, 20, 21, 22,
												23, 24 ];
										Plotly.redraw(TESTER);
									});

							$("#orderByScaffolds").click(
									function() {
										TESTER.data[0].y = [ 1, 4, 11, 22, 12,
												14, 20, 7, 5, 24, 18, 10, 9,
												15, 19, 2, 23, 8, 3, 16, 6, 21,
												13, 17 ];
										Plotly.redraw(TESTER);
									});

							$("#orderByTypes").click(
									function() {
										TESTER.data[0].y = [ 14, 1, 22, 2, 4,
												6, 15, 8, 11, 5, 23, 18, 12,
												17, 3, 20, 21, 16, 13, 24, 9,
												7, 10, 19 ];
										Plotly.redraw(TESTER);
									});

							$(".orderByWordCloud").click(function() {
								TESTER.data[0].y = [ 4, 2, 5, 3, 7, 6 ]
								Plotly.redraw(TESTER);
							});

							$("#showreference").click(function() {

							});

							$("#problem").click(function() {$("#textarea1").val($("#textarea1").val()+ "[ We want to understand:]");
							});
			$("#think")
					.click(
							function() {
								$("#textarea2")
										.val(
												$("#textarea2")
														.val()
														+ "[ We used to think:]");
							});
			$("#insight")
					.click(
							function() {
								$("#textarea2")
										.val(
												$("#textarea2")
														.val()
														+ "[ We now understand:]");
							});
			$("#understand")
					.click(
							function() {
								$("#textarea3")
										.val(
												$("#textarea3")
														.val()
														+ "[ We need to further understand ]");
							});
			$("#bettertheory")
					.click(
							function() {
								$("#textarea3")
										.val(
												$("#textarea3")
														.val()
														+ "[ We need better theories about ]");
							});
			$("#read")
					.click(
							function() {
								$("#textarea3")
										.val(
												$("#textarea3")
														.val()
														+ "[ We need to read more about ]");
							});
			$("#evidence")
					.click(
							function() {
								$("#textarea3")
										.val(
												$("#textarea3")
														.val()
														+ "[ We need evidence about ]");
							});
			$("#disagree")
					.click(
							function() {
								$("#textarea3")
										.val(
												$("#textarea3")
														.val()
														+ "[ We need to look at our different ideas about ]");
							});

			$("#Vertical").click(function() {
				window.location.href = "./detail2.html";
			});
						});
	</script>
	<script>
	var new_data_note_id = [];
	var realdatatitle_left = [];
	var realdatatime_left = [];
	var realtimedateforaxis = [];
	var realdataauthor_left = [];
	var realdataweight_left = [];
	var realdatatitleauthor = [];
	var realdatacontent = [];
	var realdataid = []
	var new_data_title = [];
	var new_data_time = [];
	var new_data_author = [];
	var new_data_content = [];
	var new_data_thread_id = [];
	realdatacontent.push(null);
	var mapping_thread_id = [];
	var mapping_thread_txt = [];
	var realdataid = [];
	var temp_realdatatitle_left1 = [];
	var temp_realdatatime_left1 = [];
	var temp_realdataweight_left1 = [];
	var temp_realdatatitleauthor1 = [];
	var milliseconds_start_date = '';
	var milliseconds_end_date = '';
	var all_shapes = [];
	var all_traces = [];
	var milliseconds_start_date = '';
	var timeforxaxisrange = [];
	var realdatanoteid = [];
	var old_milliseconds_start_date=0;
	var old_milliseconds_end_date = 0;
	var y00 = 0;
	var y11 = 0;
	var temp_position = 0;
	var temp_counter = 0;
	
	TESTER = document.getElementById('tester');
		function randomsort(a, b) {
			return Math.random() > .5 ? -1 : 1;
		}
		
		var mapping_thread_id_text = $("#mappingthreadid").text();
		var mapping_thread_txt_text = $("#mappingthreadidtxt").text();
		
		
		
		for(var i = 0; i< mapping_thread_id_text.split(",").length; i++){
			mapping_thread_id.push(parseInt(mapping_thread_id_text.split(",")[i]));
			mapping_thread_txt.push(mapping_thread_txt_text.split(",")[i]);
		}
		
		var thread_count = 0;
		var left_most = 2000000000000;
		var right_most = 0;
		var notes_count = 0;
		var author_count = 0;
		var current_author_count = [];
		var realdataweighttracker = 0;
		var title_threadfocus = [];
		var title_thread_id = [];
		var old_counter = 0;
		var trace_counter = 1;
		var unique_mapping_thread_id = [];
		var note_view_length = [];
		var realdatatitle_left1 = [];
		var realdatatime_left1 = [];
		var realdataweight_left1 = [];
		var realdataauthor_left1 = [];
		var realdatatitleauthor1 = [];
		var realdatacontent1 = [];
		var realdataid1 = []
		var new_data_title1 = [];
		var new_data_time1 = [];
		var new_data_author1 = [];
		var new_data_content1 = [];
		var realdatacontentsubstring1 = [];
		var all_yaxis2_traces =[];
		var realdataweight_noteid = [];
		var realdatatime_note_id = [];
		
		 $.each(mapping_thread_id, function(i, el){
		     if($.inArray(el, unique_mapping_thread_id) === -1) unique_mapping_thread_id.push(el);
		 });
		 unique_mapping_thread_id.forEach(function(t_id){
			var projectdata = {
					"database" : localdb,
					"token" : token,
					"authorid" : "2",
					"threadid" : t_id
				};
			
			$.ajax({
				url : "/WSG/thread/note/get",
				type : "POST",
				data : JSON.stringify(projectdata),
				dataType : "json",
				success : function(data) {
					var json = JSON.parse(data.obj);
					dataThreadId=[];
					timeforxaxisrange.splice(0, timeforxaxisrange.length);
					title_threadfocus.splice(0, title_threadfocus.length);
					title_thread_id.splice(0, title_thread_id.length);
					current_author_count.splice(0, current_author_count.length);
					
					temp_counter = json.length;
					if(realdataweighttracker == 0){
						temp_position = 0
					}
					else{
						if(temp_position!=0){
							temp_position = temp_position+old_counter+10;
						}
						else{
							temp_position = old_counter+10;
						}
					}
					
					
					var super_item=0;
					$.each(json, function(item) {
						super_item = item;
						realdataauthor_left.push(json[item].first_name + " " + json[item].last_name);
						current_author_count.push(json[item].first_name + " " + json[item].last_name);
						
						
						
						
						
						//realdatatime_left.push(json[item].create_time);
						title_thread_id.push(json[item].thread_id);
						title_threadfocus.push(json[item].threadfocus);
						realtimedateforaxis.push(json[item].create_time);
						
						var temp_count = 0;
						if(realdataweighttracker == 0){
							temp_count = 0
						}
						else{
							temp_count = realdataweighttracker+10;
						}
						
						var x0=json[item].create_time;
						var date_x0 = new Date(x0);
						realdatatime_left.push(date_x0);
						
						realdataweight_left.push(temp_position + parseInt(item));
						realdataweight_noteid.push(temp_position + parseInt(item)+"@#$"+json[item].note_id);
						
						realdatatime_note_id.push(date_x0+"@#$"+json[item].note_id);
						
						realdatatitle_left.push(json[item].title);
						realdatatitleauthor.push(json[item].title + " by " 	+ json[item].first_name + " "+ json[item].last_name);
						realdataid.push(json[item].id);
						realdatanoteid.push(json[item].note_id);
						timeforxaxisrange.push(json[item].create_time);
						
						content = json[item].content;
						if(content != null){
							cleanText = content.replace(/<\/?[^>]+(>|$)/g, "").replace(/\&nbsp;/g, '');
							realdatacontent.push(cleanText);
							new_data_content.push(temp_position + parseInt(item)+"@#$"+cleanText);
						}
						
						new_data_title.push(temp_position + parseInt(item)+"@#$"+json[item].title);
						new_data_author.push(temp_position + parseInt(item)+"@#$"+json[item].first_name + " " + json[item].last_name);
						new_data_note_id.push(temp_position + parseInt(item)+"@#$"+json[item].id);
						new_data_thread_id.push(temp_position + parseInt(item)+"@#$"+t_id);
					})
					
					
					var notecountdata = {
						"database" : localdb,
						"token" : token,
						"authorid": id,
						"threadid": t_id,
				};
					$.ajax({
						url :  "/WSG/note_view_record/get",
						type : "POST",
						data : JSON.stringify(notecountdata),
						dataType : "json",
						success : function(data1, textStatus,jqXHR) {
							var json1=$.parseJSON(data1.obj);
							
							if(json1!=null){
								note_view_length=json1.length; 
								$.each(json1, function(sub_item) {
									
									realdataauthor_left1.push(json1[sub_item].first_name + " "+ json1[sub_item].last_name);
									
									var x01=json1[sub_item].create_time;
									var date_x01 = new Date(x01);
									//realdatatime_left1.push(date_x01);
									
									realdataid1.push(json1[sub_item].note_id);
									realdatatitle_left1.push(json1[sub_item].title);
									realdatatitleauthor1.push(json1[sub_item].title + " by " + json1[sub_item].first_name + " "+ json1[sub_item].last_name);
									content = json1[sub_item].content;
									
									if(content != null){
										cleanText = content.replace(/<\/?[^>]+(>|$)/g, "").replace(/\&nbsp;/g, '');
										realdatacontent.push(cleanText);
										realdatacontentsubstring1.push("Title: "+json1[sub_item].title+" Content: "+cleanText.substring(0, 50)+" ...");
									}
									
								})
							}
							
							
							 if(realdataid1.length>0){
							 for(var m=0; m<realdataweight_noteid.length;m++){
								 for(var n=0;n<realdataid1.length;n++){
									 if(realdataweight_noteid[m].split("@#$")[1]==realdataid1[n]){
										 realdataweight_left1.push(+realdataweight_noteid[m].split("@#$")[0]);
									 }
									}
							 	}
							 for(var m=0; m<realdatatime_note_id.length;m++){
								 for(var n=0;n<realdataid1.length;n++){
									 if(realdatatime_note_id[m].split("@#$")[1]==realdataid1[n]){
										 var x01=realdatatime_note_id[m].split("@#$")[0];
											var date_x01 = new Date(x01);
											realdatatime_left1.push(date_x01);
									 }
									}
							 	}
							 }
							 
							/*  var uniquerealdataweight_left1 = [];
							 $.each(realdataweight_left1, function(i, el){
							     if($.inArray(el, uniquerealdataweight_left1) === -1) uniquerealdataweight_left1.push(el);
							 });
							  */
							var uniqueAuthors = [];
							 $.each(current_author_count, function(i, el){
							     if($.inArray(el, uniqueAuthors) === -1) uniqueAuthors.push(el);
							 });
							
							 old_counter=json.length;
								if(realdataweighttracker == 0){
									y00 = -0.5;
									y11 = realdataweight_left.length
								}else{
									y00 = y11+5;
									y11 = y00+6+(old_counter);
								}
								trace_counter = trace_counter+1;
								
							var start_date = timeforxaxisrange.sort()[0];
								 var date = new Date(start_date);
								 milliseconds_start_date = (date.getTime())-(6*24*60*60*1000); 
								 
							var end_date = timeforxaxisrange.sort()[timeforxaxisrange.length-1]; 
								 var date1 = new Date(end_date);
								 milliseconds_end_date = (date1.getTime())+(2.5*24*60*60*1000); 
							
								 
								 var tempdata = [];
								 
								 if(note_view_length>0){
									 var trace_left = {
												x : realdatatime_left,
												y : realdataweight_left,
												text : realdatatitle_left,
												mode : 'markers+text',
												type : 'scatter',
												hoverinfo : 'x+text',
												textposition : 'left',
												marker : {
													size : 6,
													color : 'blue'
												},
												textfont : {
													size : 9
												}
											};
										
										var trace_right = {
											x : realdatatime_left1,
											y : realdataweight_left1,
											mode : 'markers+text',
											type : 'scatter',
											textposition : 'left',
											marker : {
												size : 6,
												color : 'red'
											},
										hoverinfo: 'none'
										};
										var tempdata = [trace_left, trace_right]
										data=tempdata.concat(all_yaxis2_traces);
									 }
									 else{
										 var trace_left = {
													x : realdatatime_left,
													y : realdataweight_left,
													text : realdatatitle_left,
													mode : 'markers+text',
													type : 'scatter',
													hoverinfo : 'x+text',
													textposition : 'left',
													marker : {
														size : 6,
														color : 'blue'
													},
													textfont : {
														size : 9
													}
												};
										
										 var tempdata = [trace_left];
										 
									 }
									
									var shape = "shape"+""+t_id;
									 shape = {
										type: 'rect',
									    xref: 'x',
									    yref: 'y',
									    x0: milliseconds_start_date,
									    x1: milliseconds_end_date,
									    y0: y00,
									    y1: y11,
									    fillcolor: randomColor(),
									    opacity: 0.1,
									    line: {
									    	color: "white",
									    	width: 1
									        }
									    }
									 all_shapes.push(shape);
									 
									 
									 var trace = "trace"+""+t_id;
									 var trace = {
											 	x : [milliseconds_start_date],
												y : [ y11+2.5 ],
												text : ["<a href='thread.jsp?localdb="+localdb+"&token="+token+"&community="+community+"&c_id="+c_id+"&type="+type+"&urname="+urname+"&id="+id+"&itmdb="+itmdb+"&domain="+domain+"&school="+school+"&country="+country+"&city="+city+"&projectid="+projectid+"&threadid="+title_thread_id[0]+"&threadname="+title_threadfocus[0]+"''><b>"+title_threadfocus[0]+"</b></a>"+" => <b>"+title_thread_id.length+" note(s) by "+uniqueAuthors.length+" author(s).</b>"],
												textposition: "right",
												hoverinfo: "none",
												textfont : {
													family : 'sans serif',
													size : [13],
													color : 'red'
												},
												mode : 'text'
											};
									 all_traces.push(trace); 
									 
									 var data1 = [], data = [];
									 tempdata.push(trace_left);
									 data1 = tempdata.concat(all_traces);
									 data = data1.concat(all_yaxis2_traces);
									 realdataweighttracker = realdataweight_left.length;
									 
											Plotly.newPlot(tester,  data, {
											shapes: all_shapes,
											yaxis : {
												showgrid: false,
												autorange : true,
												zeroline : false,
												showline : false,
												autotick: true,
											    ticks: '',
												showticklabels : false
											},
											xaxis : {
												side: 'top',
												zeroline : true,
												showline : true,
												autorange : true,
												type : 'date'
											},
												showLink : false,
												hovermode : 'closest',
												showlegend : false
												
											}, {
												displayModeBar : false
											});		 
										
										
										
										
											var temp_trace = {
							    					x : temp_realdatatime_left1,
							    					y : temp_realdataweight_left1,
							    					mode : 'markers',
							    					type : 'scatter',
							    					textposition : 'left',
							    					marker : {
							    						size : 6,
							    						color : 'red'
							    					}
							    			};
							    			
							    			Plotly.addTraces(TESTER, [temp_trace])
							    			var dragLayer = document.getElementsByClassName('nsewdrag')[0];
							    			
							    			TESTER.on('plotly_hover', function(data){
							    				dragLayer.style.cursor = 'pointer'
							    			})
							    			TESTER.on('plotly_unhover', function(data){
												dragLayer.style.cursor = ''
											})	
											

							    			TESTER.on('plotly_click', function(data) {
												
												i = data.points[0].y
												
												if(data.points[0].y%1==0){
													$("#draggable").css("top",window.scrollY+100);
													$("#draggable").css("right",window.innerWidth/4);
													$("#draggable").show();
													i = data.points[0].y
													currenton = i
													finalDataTitle="";
													finalDataAuthor="";
													finalDataContent="";
													finalDataNoteId="";
													finalDataThreadId="";
													
													for(var m=0;m<new_data_title.length;m++){
														if(new_data_title[m].split('@#$')[0]==i){
															finalDataTitle=new_data_title[m].split('@#$')[1];
														}
													}
													for(var m=0;m<new_data_author.length;m++){
														if(new_data_author[m].split('@#$')[0]==i){
															finalDataAuthor=new_data_author[m].split('@#$')[1];
														}
													}
													for(var m=0;m<new_data_content.length;m++){
														if(new_data_content[m].split('@#$')[0]==i){
															finalDataContent=new_data_content[m].split('@#$')[1];
														}
													}
													for(var m=0;m<new_data_note_id.length;m++){
														if(new_data_note_id[m].split('@#$')[0]==i){
															finalDataNoteId=new_data_note_id[m].split('@#$')[1];
														}
													}
													for(var m=0;m<new_data_thread_id.length;m++){
														if(new_data_thread_id[m].split('@#$')[0]==i){
															finalDataThreadId=new_data_thread_id[m].split('@#$')[1];
														}
													}
													
													$("#title").text("\"" + finalDataTitle + "\"" + " by "+ finalDataAuthor);
													$("#content").html(finalDataContent);
													$("#t_id").val(finalDataThreadId);
													
													data_note_id = +finalDataNoteId;
													noteRead(data_note_id, finalDataThreadId);
													temp_realdatatitle_left1.push(finalDataTitle);
													temp_realdatatime_left1.push(data.points[0].x);
													temp_realdataweight_left1.push(i);
													temp_realdatatitleauthor1.push(finalDataTitle + " by "+ finalDataAuthor)
												}
												checkHighlight(finalDataContent, data_note_id);
								});
						}
					});
					

				}

			});
		});
		 function noteRead(data_note_id, threadid){
				var notecountdata = {
						"database" :localdb,
						"token" : token,
						"noteid" : data_note_id,
						"authorid":id,
						"threadid": threadid
				};
				$.ajax({
					url :  "/WSG/note_view_record/add",
					type : "POST",
					data : JSON.stringify(notecountdata),
					dataType : "json",
					success : function(data, textStatus,jqXHR) {
						
						
					},
					error : function(jqXHR, textStatus,
							errorThrown) {
					}
				});
			}
		function show_title() {
			var trace_left = {
				x : realdatatime_left,
				y : realdataweight_left,
				text : realdatatitle_left,
				mode : 'markers+text',
				type : 'scatter',
				hoverinfo : 'x+text',
				textposition : 'left',
				marker : {
					size : 6,
					color : 'blue'
				},
				textfont : {
					size : 9
				}
			};
			
			 var tempdata = [], data = [];
			 tempdata.push(trace_left);
			 data = tempdata.concat(all_traces);
			 
			
			Plotly.newPlot(TESTER, data, {
				shapes: all_shapes,
				yaxis : {
					showgrid: false,
					autorange : true,
					zeroline : false,
					showline : false,
					autotick: true,
				    ticks: '',
					showticklabels : false
				},
				xaxis : {
					side: 'top',
					zeroline : true,
					showline : true,
					autorange : true,
					type : 'date'
				},
				showLink : false,
				hovermode : 'closest',
				showlegend : false
				
			}, {
				displayModeBar : false
			});
			var temp_trace = {
					x : temp_realdatatime_left1,
					y : temp_realdataweight_left1,
					mode : 'markers',
					type : 'scatter',
					textposition : 'left',
					marker : {
						size : 6,
						color : 'red'
					}
			};
			
			Plotly.addTraces(TESTER, [temp_trace])
			var dragLayer = document.getElementsByClassName('nsewdrag')[0];
			
			TESTER.on('plotly_hover', function(data){
				dragLayer.style.cursor = 'pointer'
			})
			TESTER.on('plotly_unhover', function(data){
						dragLayer.style.cursor = ''
					})
			TESTER.on('plotly_click', function(data) {
				
				if(data.points[0].y%1==0){
					$("#draggable").css("top",window.scrollY+100);
					$("#draggable").css("right",window.innerWidth/4);
					$("#draggable").show();
					i = data.points[0].y
					currenton = i
					finalDataTitle="";
					finalDataAuthor="";
					finalDataContent="";
					finalDataNoteId="";
					
					
					for(var m=0;m<new_data_title.length;m++){
						if(new_data_title[m].split('@#$')[0]==i){
							finalDataTitle=new_data_title[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_author.length;m++){
						if(new_data_author[m].split('@#$')[0]==i){
							finalDataAuthor=new_data_author[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_content.length;m++){
						if(new_data_content[m].split('@#$')[0]==i){
							finalDataContent=new_data_content[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_note_id.length;m++){
						if(new_data_note_id[m].split('@#$')[0]==i){
							finalDataNoteId=new_data_note_id[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_thread_id.length;m++){
						if(new_data_thread_id[m].split('@#$')[0]==i){
							finalDataThreadId=new_data_thread_id[m].split('@#$')[1];
						}
					}
					
					$("#title").text("\"" + finalDataTitle + "\"" + " by "+ finalDataAuthor);
					$("#content").html(finalDataContent);
					$("#t_id").val(finalDataThreadId);
					data_note_id = +finalDataNoteId;
					noteRead(data_note_id, finalDataThreadId);
					temp_realdatatitle_left1.push(finalDataTitle);
					temp_realdatatime_left1.push(data.points[0].x);
					temp_realdataweight_left1.push(i);
					temp_realdatatitleauthor1.push(finalDataTitle + " by "+ finalDataAuthor)
				}
				checkHighlight(finalDataContent, data_note_id);
			});
		}
		
		function show_author() {
			var trace_left = {
				x : realdatatime_left,
				y : realdataweight_left,
				text : realdataauthor_left,
				mode : 'markers+text',
				type : 'scatter',
				hoverinfo : 'x+text',
				textposition : 'right',
				marker : {
					size : 6,
					color : 'blue'
				},
				textfont: {
					size: 9,
				    color: '#929292'
				 }
			};
			
			 var tempdata = [], data = [];
			 tempdata.push(trace_left);
			 data = tempdata.concat(all_traces);
			 
			
			Plotly.newPlot(TESTER, data, {
				shapes: all_shapes,
				yaxis : {
					showgrid: false,
					autorange : true,
					zeroline : false,
					showline : false,
					autotick: true,
				    ticks: '',
					showticklabels : false
				},
				xaxis : {
					side: 'top',
					zeroline : true,
					showline : true,
					autorange : true,
					type : 'date'
				},
				showLink : false,
				hovermode : 'closest',
				showlegend : false
				
			}, {
				displayModeBar : false
			});
			var temp_trace = {
					x : temp_realdatatime_left1,
					y : temp_realdataweight_left1,
					mode : 'markers',
					type : 'scatter',
					textposition : 'left',
					marker : {
						size : 6,
						color : 'red'
					}
			};
			
			Plotly.addTraces(TESTER, [temp_trace])
			var dragLayer = document.getElementsByClassName('nsewdrag')[0];
			
			TESTER.on('plotly_hover', function(data){
				dragLayer.style.cursor = 'pointer'
			})
			TESTER.on('plotly_unhover', function(data){
						dragLayer.style.cursor = ''
					})
			TESTER.on('plotly_click', function(data) {
				
				if(data.points[0].y%1==0){
					$("#draggable").css("top",window.scrollY+100);
					$("#draggable").css("right",window.innerWidth/4);
					$("#draggable").show();
					i = data.points[0].y
					currenton = i
					finalDataTitle="";
					finalDataAuthor="";
					finalDataContent="";
					finalDataNoteId="";
					
					
					for(var m=0;m<new_data_title.length;m++){
						if(new_data_title[m].split('@#$')[0]==i){
							finalDataTitle=new_data_title[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_author.length;m++){
						if(new_data_author[m].split('@#$')[0]==i){
							finalDataAuthor=new_data_author[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_content.length;m++){
						if(new_data_content[m].split('@#$')[0]==i){
							finalDataContent=new_data_content[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_note_id.length;m++){
						if(new_data_note_id[m].split('@#$')[0]==i){
							finalDataNoteId=new_data_note_id[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_thread_id.length;m++){
						if(new_data_thread_id[m].split('@#$')[0]==i){
							finalDataThreadId=new_data_thread_id[m].split('@#$')[1];
						}
					}
					
					$("#title").text("\"" + finalDataTitle + "\"" + " by "+ finalDataAuthor);
					$("#content").html(finalDataContent);
					$("#t_id").val(finalDataThreadId);
					data_note_id = +finalDataNoteId;
					noteRead(data_note_id, finalDataThreadId);
					temp_realdatatitle_left1.push(finalDataTitle);
					temp_realdatatime_left1.push(data.points[0].x);
					temp_realdataweight_left1.push(i);
					temp_realdatatitleauthor1.push(finalDataTitle + " by "+ finalDataAuthor)
					
				}
				checkHighlight(finalDataContent, data_note_id);
			});
		}
		
		function show_author_title() {
			var trace_left = {
					x : realdatatime_left,
					y : realdataweight_left,
					text : realdatatitle_left,
					mode : 'markers+text',
					type : 'scatter',
					hoverinfo : 'x+text',
					textposition : 'left',
					marker : {
						size : 6,
						color : 'blue'
					},
					textfont : {
						size : 9
					}
				};
		 var trace = {
					x : realdatatime_left,
					y : realdataweight_left,
					text : realdataauthor_left,
					mode : 'markers+text',
					type : 'scatter',
					hoverinfo : 'x+text',
					textposition : 'right',
					marker : {
						size : 6,
						color : 'blue'
					},
					textfont: {
						size : 9,
					    color: '#929292'
					 }
				};
		 
		 var tempdata = [], data = [];
		 tempdata.push(trace_left);
		 tempdata.push(trace);
		 data = tempdata.concat(all_traces);
		 
		 
		 
			Plotly.newPlot(TESTER, data, {
				shapes: all_shapes,
				yaxis : {
					showgrid: false,
					autorange : true,
					zeroline : false,
					showline : false,
					autotick: true,
				    ticks: '',
					showticklabels : false
				},
				xaxis : {
					side: 'top',
					zeroline : true,
					showline : true,
					autorange : true,
					type : 'date'
				},
				showLink : false,
				hovermode : 'closest',
				showlegend : false
				
			}, {
				displayModeBar : false
			});
			var temp_trace = {
					x : temp_realdatatime_left1,
					y : temp_realdataweight_left1,
					mode : 'markers',
					type : 'scatter',
					textposition : 'left',
					marker : {
						size : 6,
						color : 'red'
					}
			};
			
			Plotly.addTraces(TESTER, [temp_trace])
			var dragLayer = document.getElementsByClassName('nsewdrag')[0];
			
			TESTER.on('plotly_hover', function(data){
				dragLayer.style.cursor = 'pointer'
			})
			TESTER.on('plotly_unhover', function(data){
						dragLayer.style.cursor = ''
					})
			TESTER.on('plotly_click', function(data) {
				
				if(data.points[0].y%1==0){
					$("#draggable").css("top",window.scrollY+100);
					$("#draggable").css("right",window.innerWidth/4);
					$("#draggable").show();
					i = data.points[0].y
					currenton = i
					finalDataTitle="";
					finalDataAuthor="";
					finalDataContent="";
					finalDataNoteId="";
					
					for(var m=0;m<new_data_title.length;m++){
						if(new_data_title[m].split('@#$')[0]==i){
							finalDataTitle=new_data_title[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_author.length;m++){
						if(new_data_author[m].split('@#$')[0]==i){
							finalDataAuthor=new_data_author[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_content.length;m++){
						if(new_data_content[m].split('@#$')[0]==i){
							finalDataContent=new_data_content[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_note_id.length;m++){
						if(new_data_note_id[m].split('@#$')[0]==i){
							finalDataNoteId=new_data_note_id[m].split('@#$')[1];
						}
					}
					for(var m=0;m<new_data_thread_id.length;m++){
						if(new_data_thread_id[m].split('@#$')[0]==i){
							finalDataThreadId=new_data_thread_id[m].split('@#$')[1];
						}
					}
					
					$("#title").text("\"" + finalDataTitle + "\"" + " by "+ finalDataAuthor);
					$("#content").html(finalDataContent);
					$("#t_id").val(finalDataThreadId);
					data_note_id = +finalDataNoteId;
					noteRead(data_note_id, finalDataThreadId);
					temp_realdatatitle_left1.push(finalDataTitle);
					temp_realdatatime_left1.push(data.points[0].x);
					temp_realdataweight_left1.push(i);
					temp_realdatatitleauthor1.push(finalDataTitle + " by "+ finalDataAuthor)
				}
				checkHighlight(finalDataContent, data_note_id);
			});
		}
		
		function show_nothing() {
			TESTER.data[0].mode = 'markers';
			Plotly.redraw(TESTER);
		}
		
		$("#showtitle").click(function() {
			if ($(this).hasClass("showed")) {
				if ($("#showauthor").hasClass("showed")) {
					show_author();
					if ($("#showbuildon").hasClass("showed")) {
						show_buildon();
					}
				} else {
					show_nothing();
				}
				
				$(this).removeClass("showed");
			} else {
				if ($("#showauthor").hasClass("showed")) {
					show_author_title();
				} else {
					show_title();
				}
				if ($("#showbuildon").hasClass("showed")) {
					show_buildon();
				}
				$(this).addClass("showed");
			}
		});
		
		$("#showauthor").click(function() {
			if ($(this).hasClass("showed")) {
				if ($("#showtitle").hasClass("showed")) {
					show_title();
					if ($("#showbuildon").hasClass("showed")) {
						show_buildon();
					}
				} else {
					show_nothing();
				}
				
				$(this).removeClass("showed");
			} else {
				if ($("#showtitle").hasClass("showed")) {
					show_author_title();
				} else {
					show_author();
				}
				if ($("#showbuildon").hasClass("showed")) {
					show_buildon();
				}
				$(this).addClass("showed");
			}
		});
		
		
		
		function show_buildon(){
			mapping_thread_id.forEach(function(item){
				var projectdata = {
						"database" : localdb,
						"token" : token,
						"authorid" : id,
						"threadid" : item
					};
			
			
				$.ajax({
					url : "/WSG/buildon/get/bythread",
					type : "POST",
					data : JSON.stringify(projectdata),
					dataType : "json",
					success : function(data) {
						var json = $.parseJSON(data.obj);
						var final_layout=[];
						var final_buildon_trace = [];
						var layout={
								annotations: []
						}
						var result = {};
						if(json!=null){
							for (var i = 0; i < json.length; i++) {
								
								var from_id = 0;
								var to_id = 0;
								
								for (var j = 0; j <= realdatanoteid.length; j++) {
									if (json[i].from_note_id == realdatanoteid[j])
										from_id = j
									if (json[i].to_note_id == realdatanoteid[j])
										to_id = j
								}
								
								var realdatatitle_to = '<--'+ realdatatitle_left[from_id];	
								
								var x0=realdatatime_left[from_id];
								var date_x0 = new Date(x0); 
								var milliseconds_x0 = date_x0.getTime(); 
								
								var x1=realdatatime_left[to_id];
								var date_x1 = new Date(x1); 
								var milliseconds_x1 = date_x1.getTime(); 
								
								var y0 = realdataweight_left[from_id];
								var y1 = realdataweight_left[to_id]
								
								
								
								var max = 255;
						        var min = 10;
						        var green = Math.floor(Math.random() * (max - min + 1)) + min;
								var color = 'hsl(' + green + ', ' + 99 + '%, ' + 65 + '%)';
								
								
								
								var trace_lines = {
										
										type: 'line',
										
							

										x: [milliseconds_x1,milliseconds_x0],
									
										y: [y1,y0],
									 
										}
							
								result= {
										  
									    axref: 'x',
									    ax: milliseconds_x0,
									    
									    aref: 'x',
									    x: milliseconds_x1 ,
									    
									    ayref: 'y',
									    ay:y0 ,
									    
									    aref: 'y',
									    y: y1,
									    
									    showarrow: true,
									    arrowcolor: color,
								        arrowsize: 1.5,
								        arrowwidth: 2,
								        arrowhead: 3,
								        opacity: 0.8
									 }

								
								
								layout.annotations.push(result);
								final_buildon_trace.push(trace_lines);
								
								
							}
							
							//Plotly.addTraces(TESTER, final_buildon_trace);
							Plotly.update(TESTER, final_buildon_trace,layout
							
							);
							
						}
						
					}
				});
		});
		}
	
	
	
	
	
		$("#showbuildon").click(
				function() {
					console.log($(this));
					if ($(this).hasClass("showed")) { 
						if ($("#showtitle").hasClass("showed")) {
							if ($("#showauthor").hasClass("showed")) {
								show_author_title();
							}
							else{
								show_title();
							}
						}
						else if ($("#showauthor").hasClass("showed")) {
							if ($("#showtitle").hasClass("showed")) {
								show_author_title();
							}
							else{
								show_author();
							}
						}
						
						$(this).removeClass("showed");
					}
					else{
						$(this).addClass("showed");
						show_buildon();
					
					}
				})
				
				function randomColor(){
			var letters = '0123456789ABCDEF';
			var color = '#';
			for (var i = 0; i < 6; i++) {
				color += letters[Math.floor(Math.random() * 16)];
			}
				  return color;
			}
				
		function found_note_weight_and_time(json_data) {
			
			var from_id = 0;
			var to_id = 0;
			for (var i = 0; i <= realdataid.length; i++) {
				if (json_data.from_note_id == realdataid[i])
					from_id = i
				if (json_data.to_note_id == realdataid[i])
					to_id = i
			}
			
			var target_x;
			var target_y;
			var realdatatitle_to = '<--'+ realdatatitle_left[from_id];	
			var x0=realdatatime_left[from_id];
			
			var date_x0 = new Date(x0); 
			
			var milliseconds_x0 = date_x0.getTime(); 
			
			var x1=realdatatime_left[to_id];
			var date_x1 = new Date(x1); 
			var milliseconds_x1 = date_x1.getTime(); 
			
			var y0 = realdataweight_left[from_id];
			var y1 = realdataweight_left[to_id]
			
			h = 250;
			s = Math.floor(Math.random() * 100);
			l = Math.floor(Math.random() * 100);
			var color = 'hsl(' + h + ', ' + s + '%, ' + l + '%)';
			
			var trace_lines = {
					x : [milliseconds_x0, milliseconds_x1],
					y : [y0, y1],
					type : 'line',
					mode: 'lines',
					line: {
						shape: 'spline',
						smoothing:1.3,
					    color: color,
					    width: 1
					},
					 hoverinfo:'none',
					 opacity:0.1
						 
				};
			
			var trace_arrow = {
					x : [milliseconds_x1],
					y : [y1],
					text : [realdatatitle_to],
					mode : 'markers+text',
					type : 'scatter',
					textposition : 'right',
					marker : {
						size : 4,
						color : color
					},
					textfont: {
						size: 8,
					    color: color
					 },
					 hoverinfo:'none'
				}
			Plotly.addTraces(TESTER, [trace_lines, trace_arrow] );
		}
		
		
		var authorcount;
		
		function threadname(threadid2,notecount,authorcount){
			var notecountdata = {
					"database" : localdb,
					"token" : token,
					"threadid" : threadid2
			};
			$.ajax({
				url : "/WSG/thread/get",
				type : "POST",
				data : JSON.stringify(notecountdata),
				dataType : "json",
				success : function(data, textStatus,jqXHR) {
					var json = $.parseJSON(data.obj);
					
					json.sort();
					for(var i = 0; i<json.length;i++){
					/* $("#title2").append('<br><br><br><br><br><br><br><br><span ><a class="threadsclick" href="#" id="'+ json[i].id +'">'+json[i].threadfocus+'</a> <br>( '+notecount+ ' notes by '+authorcount+ ' Authors )</span><br><br><br><br><br><br><br>'); */
					}
				},
				error : function(jqXHR, textStatus,	errorThrown) {
				}
			});
		}
		
		$(document).delegate('.threadsclick','click',function() {
			console.log($(this)[0].id);
			$
					.ajax({
						url : '../SET_THREAD_FOCUS',
						type : 'POST',
						data : {
							threadid : $(this)[0].id,
							threadname : $(this).text()
						},
						success : function(response) {
							window.location.href = "../thread/thread.jsp";
						}
					});
		});
		
		mapping_thread_id.sort();
		mapping_thread_id.forEach(function(item){
		
		
		});
		
		
	</script>


	<script type="text/javascript">
		//this is for click operation

		var currenton = 0;
		TESTER
				.on(
						'plotly_click',
						function(data) {
							console.log(data);
							if (data.points[0].data.mode == "text") {
								window.location.href = "http://naifengliu.github.io/ITM3/WebContent/thread/detail.html";
							} else {
								$("#draggable").css("top",window.scrollY+100);
								$("#draggable").css("right",window.innerWidth/4);
								$("#draggable").show();
								console.log(data.points[0].y);
								i = data.points[0].y - 1
								currenton = i
								for (var j = 0; j < realdatatitle.length; j++) {
									Plotly.restyle(TESTER, 'marker.color[' + j
											+ ']', colororiginal[j]);
								}

								Plotly.restyle(TESTER, 'marker.color[' + i
										+ ']', [ 'rgb(165, 29, 24)' ]);

								$("#title").text(
										"\"" + realdatatitle[i] + "\"" + " by "
												+ realdataauthor[i]);
								$("#content").text(content[i]);
							}
						});

		

		$("#back").click(
				function() {
					number = parseInt(currenton) - 1;

					for (var i = 0; i < realdatatitle.length; i++) {
						Plotly.restyle(TESTER, 'marker.color[' + i + ']',
								colororiginal[i]);
					}

					Plotly.restyle(TESTER, 'marker.color[' + number + ']',
							[ 'rgb(165, 29, 24)' ]);

					$("#title").text(
							"\"" + realdatatitle[currenton - 1] + "\"" + " by "
									+ realdataauthor[currenton - 1]);
					$("#content").text(content[currenton - 1]);
					currenton--;
				});

		$("#forward").click(
				function() {
					number = parseInt(currenton) + 1;
					for (var i = 0; i < realdatatitle.length; i++) {
						Plotly.restyle(TESTER, 'marker.color[' + i + ']',
								colororiginal[i]);
					}

					Plotly.restyle(TESTER, 'marker.color[' + number + ']',
							[ 'rgb(165, 29, 24)' ]);

					console.log(currenton + 1);

					$("#title").text(
							"\"" + realdatatitle[currenton + 1] + "\"" + " by "
									+ realdataauthor[currenton + 1]);
					$("#content").text(content[currenton + 1]);
					currenton++;
				});
		sessionTimeOut(<%=session.getAttribute("SessionTimeOut")%>)
		
	</script>
</body>
</html>