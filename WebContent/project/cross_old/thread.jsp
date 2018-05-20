<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../validation.jsp"%>
<%
	/************validate the user session*******************/
	String current_user = " ";
%>
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
<link type="text/css" rel="stylesheet"
	href="../../css/customerize.css" media="screen,projection" />
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="UTF-8">
<script src="../../js/plotly-latest.min.js"></script>
<script src="../../js/websocket.js"></script>
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

.btn-confirm {
	width: 80px;
	padding: 0px;
}

.blk_1 {
	width: 90%;
	display: inline-block;
	padding-left: 20px;
}

.blk_2 {
	width: 50%;
	display: inline-block;
	padding-left: 20px;
}


.loading {
	float: left;
	width: 100%;
	text-align: center;
	font-size: 13px;
	line-height: 30px;
	height: 30px;
	margin: 5px 0px 5px 0px;
}


.jot_text_area{
    overflow: scroll;
    resize: none;
    min-height: 90px;
    max-height: 90px;
}

.tmsg{
	overflow-wrap: break-word;
	max-width: 480px;
}
</style>


</head>

<body>

	<header>
		<nav class="  blue-grey">
			<%@ include file="../../header.jsp"%>
			<%@ include file="../../side_menu_hidden.jsp"%>
		</nav>
	</header>


	<ul id="slide-out-right" class="side-nav">

	</ul>

	<main> <br>
	<div class="col s2 left">
			<a class="modal-trigger waves-effect waves-light btn" id="write">Write</a>&nbsp;&nbsp;&nbsp;
		</div>
		<div class="col s2 left">
			<a href="thread_import.jsp" target="_self" class="waves-effect waves-light btn">Import</a>&nbsp;&nbsp;&nbsp;
		</div>
		<div class="col s2 left file-field">
			<div class="btn"
				style="vertical-align: middle">
				<span>Attach</span> <input type="file">&nbsp;&nbsp;&nbsp;
			</div>
			<!--<a class="waves-effect waves-light btn">Attach</a>-->
		</div>
		<div class="col s2 left">
			&nbsp;&nbsp;&nbsp;<a class="dropdown-button btn" id="compile" data-activates='compileDropDown'>Compile</a>
			<ul id='compileDropDown' class='dropdown-content'>
				<li><a class="modal-trigger" id="compileAll"
					href="#compileModal">All posts in this thread</a></li>
				<li><a class="modal-trigger" id="compileGraph"
					href="#compileModal">Posts in graph only</a></li>
				<li><a class="modal-trigger" id="compileHighlight"
					href="#compileModal">Highlighted posts only</a></li>
			</ul>
			</div>
		<div class="col s2 left">
		<input type="text" id="search" class="autocomplete"
		style="top: 60px; height: 25px; width: 200px; z-index: 998; margin-left:50px">
		 <label for="search"></label>
		</div>
			 	
		<a class="waves-effect waves-light btn" id="search-btn">
		  <i class="material-icons">search</i>
		 </a>
    	<div class="row Vertical click-to-toggle jotdetail" style="top: 68px; right: 100px; height: 50px; position: absolute;" id="jofedit">
			<a class="btn  Vertical click-to-toggle jotdetail"  id="jofedit"> Journey of Thinking </a>
		</div>

		<div id="compileModal" class="modal modal-fixed-footer" style="width:80%">
			<div class="modal-content" id="compileContent">
				<h5>A compiled list of all posts:</h5>
				<div class="row" style="margin-bottom:0px">
					<a class="dropdown-button btn" href='#'
						data-activates='compilelistdropdown'>Sort by:</a> <a
						class="btn right" id="exportLink">Download</a>
					<ul id='compilelistdropdown' class='dropdown-content'>
						<li><a href="#!" id="timeorder">Discussion order</a></li>
						<li><a href="#!" id="compile_list_sort_author">Author</a></li>
						<li><a href="#!" id="compile_list_sort_Title">Title</a></li>
						<li><a href="#!" id="compile_list_sort_Highlight">Highlight</a></li>
					</ul>
				</div>
				<div id="compileboxContent"></div>
			</div>
			<div class="modal-footer">
				<a href="#!"
					class="modal-action modal-close waves-effect waves-green btn-flat ">Close</a>
			</div>
		</div>
	</div>

	<div class="row">

		
		<div class="col s12 blue-grey lighten-4">
			<span style="font-size: 16px; font-weight: bold; margin-top:5px" class="left">This thread includes &nbsp;</span>
			<span style="font-size: 16px; color: blue; font-weight: bold; margin-top:5px" id="notecount" class="left"></span><span class="left" style="font-size: 16px; font-weight: bold; margin-top:5px">&nbsp; notes by &nbsp;</span>
			<span style="font-size: 16px; color: blue; font-weight: bold; margin-top:5px" id="authorcount" class="left"></span><span class="left" style="font-size: 16px; font-weight: bold; margin-top:5px">&nbsp; authors.&nbsp;</span>
		<div class="col s1" style="padding-left: 15px; margin-top:5px">
			<a class='dropdown-button btn' href='#' data-activates='dropdown3'>Show</a>
			<ul id='dropdown3' class='dropdown-content'>
				<li class="divider"></li>
				<li id="showtitle_li"><input class="showed" type="checkbox" id="showtitle" checked="checked" /><label for="showtitle" class="teal-text">Title</label></li>
				<li id="showauthor_li"><input type="checkbox" id="showauthor" /><label for="showauthor" class="teal-text">Author</label></li>
				<li><input type="checkbox" id="showbuildon" /><label for="showbuildon" class="teal-text">Buildon</label></li>
				<li><input type="checkbox" id="highlight" /><label for="highlight" class="teal-text">HighLight Only</label></li>
			</ul>
		</div>

		<div class="col s2" style="padding-left: 15px; margin-top:5px">
			<a class='dropdown-button btn' href='#' data-activates='dropdown5'>Order By</a>
			<ul id='dropdown5' class='dropdown-content'>
				<li><a href="#!" id="orderByAuthor">Author</a></li>
				<li><a href="#!" id="orderByScaffolds">Scaffolds</a></li>
				<li><a href="#!" id="orderByTypes">Types</a></li>
			</ul>
		</div>
			<div id="tester" style="margin-top:40px; width:100%">
			
			<div class="preloader-background" style="margin-left: 50%; margin-top: 400px;">
			<div class="preloader-wrapper big active">
			<div class="spinner-layer spinner-blue-only">
			<div class="circle-clipper left">
			<div class="circle"></div>
			</div>
			<div class="gap-patch">
			<div class="circle"></div>
			</div>
			<div class="circle-clipper right">
			<div class="circle"></div>
			</div>
			</div>
			</div>
			</div>
			</div>
		</div>
		
		
	</div>

	


<div id="googledoc" class="modal">
		<div class="modal-content">
			<h5 class="center">New Note</h5>
			<div class="row">
				<div class="input-field col s12">
					<input value="" id="note_title" type="text" class="validate"
						placeholder="enter note title..."> <label class="active"
						for="first_name2">Title</label>
				</div>
				<div class="col s12">
					<ul class="collapsible" data-collapsible="accordion">
						<li>
							<div class="collapsible-header active">
								<b>Co-authors</b>
							</div>
							<div class="collapsible-body" style="padding: 10px 0;"
								id="coauthor"></div>
						</li>
						<li>
							<div class="collapsible-header">
								<b>Views</b>
							</div>
							<div class="collapsible-body" style="padding: 10px 0;" id="views">
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<b>Scaffolds</b>: <select id="scaffold_pkg"
									style="display: inline-block; width: 30%; padding: 0px; height: 30px;"></select>
							</div>
							<div class="collapsible-body" style="padding: 10px 0;"
								id="scaffold"></div>
						</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<form class="col s12">
					<div class="row">
						<div class="input-field col s12">
							<textarea id="plain_content" class="materialize-textarea"></textarea>
							<label for="textarea1">Textarea</label>
							<p>
								<a id="write_in_google" href="javascript:void(0);">Or write
									in google doc</a>
							</p>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="modal-footer">
			<div class="loading" style="width: 70%; display: none;">
				<img src="../../res/ajax-loader.gif" />Creating note .....
			</div>
			<div class="col s2" style="float: right;">
				<a id="savePlainText"
					class="modal-trigger waves-effect waves-light btn btn-confirm"
					style="margin-left: 10px; margin-right: 10px;">Save</a> <a
					id="cancelWrite"
					class="modal-trigger modal-close waves-effect waves-light btn btn-confirm"
					href="#!">Cancel</a>
			</div>
		</div>
	</div>

	<div id="google_authorization_confirm" class="ui-widget-content"
		style="display: none; height: 75%; width: 80%; top:150px; ;left:10% ;position: absolute; border-style: solid; border-width: 5px; border-color: #607d8b; z-index: 100;">
		<div class="row">
			<div class="col s11 blue-grey" id="add-note-title" style="height: 20px ;color:#fff">New Note</div>
			<a class="col s1 btn blue-grey white-text btn-add-note-close">X</a>

			<div class="col s12 not_draggable"
				style="padding-left: 0; padding-right: 0;">
				<div class="container"
					style="overflow-y: scroll;max-height: 665px; overflow-x: hidden;  width: 100%; padding-left: 22px; padding-right: 22px;">
						<input placeholder="Title" id="add_note_title" type="text"
							class="validate">
					
						<select multiple id="select-user">
							<option value="" disabled selected>Co-Author</option>
						</select> <select multiple id="selected-views">
							<option value="" disabled selected>Copy To KF View</option>
						</select>
						<textarea id="add_note_content"></textarea>


					<div class="row" style="float: right;">
						<div class="pull-right">
							<a id="btn-save" data-mode="new" class="btn">Save</a>
						</div>

					</div>
				</div>
			</div>

		</div>

	</div>
	
	

	
 	<div id="draggable" class="ui-widget-content"
		style="display: none; height: 500px; width: 750px; top: 200px; right: 500px; position: absolute; border-style: solid; border-width: 5px; border-color: #607d8b; z-index: 100;">
		<div class="row">
			<div class="col s11 blue-grey" style="height: 20px"></div>	
			<a class="col s1 btn blue-grey white-text" id="close">X</a>
			<div class="col s1 not_draggable" style="padding-left: 0">
				<a id="back" class="btn white center-align z-depth-0" style="height: 350px; vertical-align: middle; text-align: center; line-height: 350px;"></a>
			</div>
			<div class="col s10 not_draggable" style="padding-left: 0; padding-right: 0; width: 610px">
				<div class="container">
					<div class="row">
						<p id="title" style="overflow: auto; font-size: 20px;"></p>
						<hr>
						<p id="content" style="overflow: auto; height: 270px; font-size: 20px;"></p>
					</div>
					<script>
					
					var sel = "null";
					var title="null";
					var new_data_note_id = [];
					var data_note_id;
					var date = new Date();
					var content = "";
					var reason;
					var note_position=0;
					
					
					function GetSelectedTextYellow(){
						 sel = window.getSelection().toString();
						 if(sel != 0){
							content = sel;
							reason = "A “juicy” question for research";
							storeHighlightedContent();
						    if (sel.rangeCount && sel.getRangeAt) {
						        range = sel.getRangeAt(0);
						    }
						    document.designMode = "on";
						    document.execCommand("BackColor", false, "#fdff4a");
						    document.designMode = "off";
						 }
							else{
								Materialize.toast('Please select text to highlight!', 4000)
							}
					}
					function GetSelectedText(){
						 sel = window.getSelection().toString();
						 if(sel != 0){
							content = sel;
							reason = "A “juicy” question for research";
							storeHighlightedContent();
						    if (sel.rangeCount && sel.getRangeAt) {
						        range = sel.getRangeAt(0);
						    }
						    document.designMode = "on";
						    document.execCommand("BackColor", false, "#fdff4a");
						    document.designMode = "off";
						 }
							else{
								Materialize.toast('Please select text to highlight!', 4000)
							}
					}
					function GetSelectedTextGreen(){
						 sel = window.getSelection().toString();
						 if(sel != 0){
							content = sel;
							reason = "An “Aha” insight";
							storeHighlightedContent();
						    if (sel.rangeCount && sel.getRangeAt) {
						        range = sel.getRangeAt(0);
						    }
						    document.designMode = "on";
						    document.execCommand("BackColor", false, "#72e567");
						    document.designMode = "off";
						 }
							else{
								Materialize.toast('Please select text to highlight!', 4000)
							}
					}
					function GetSelectedTextOrange(){
						 sel = window.getSelection().toString();
						 if(sel != 0){
							content = sel;
							reason = "A seed idea to refine";
							storeHighlightedContent();
						    if (sel.rangeCount && sel.getRangeAt) {
						        range = sel.getRangeAt(0);
						    }
						    document.designMode = "on";
						   	document.execCommand("BackColor", false, "#fdb760");
						    document.designMode = "off";
						 }
							else{
								Materialize.toast('Please select text to highlight!', 4000)
							}
					}
					function GetSelectedTextBlue(){
							sel = window.getSelection().toString();
							if(sel != 0){	
							content = sel;
							reason = "An important fact to consider";
							storeHighlightedContent();
						    if (sel.rangeCount && sel.getRangeAt) {
						        range = sel.getRangeAt(0);
						    }
						    document.designMode = "on";
						    document.execCommand("BackColor", false, "#a6acff");
						    document.designMode = "off";
							}
							else{
								Materialize.toast('Please select text to highlight!', 4000)
							}
					}
					function GetSelectedTextRed(){
						 sel = window.getSelection().toString();
						 if(sel != 0){
							content = sel;
							reason = "Conflicting ideas to look into";
							storeHighlightedContent();
						    if (sel.rangeCount && sel.getRangeAt) {
						        range = sel.getRangeAt(0);
						    }
						    document.designMode = "on";
						    document.execCommand("BackColor", false, "#e53244");
						    document.designMode = "off";
						 }
							else{
								Materialize.toast('Please select text to highlight!', 4000)
							}
					}
					function GetSelectedTextPurple(){
						 sel = window.getSelection().toString();
						 if(sel != 0){
							content = sel;
							reason = "A gap of knowledge";
							storeHighlightedContent();
						    if (sel.rangeCount && sel.getRangeAt) {
						        range = sel.getRangeAt(0);
						    }
						    document.designMode = "on";
						    document.execCommand("BackColor", false, "#c0b1d0");
						    document.designMode = "off";
						 }
							else{
								Materialize.toast('Please select text to highlight!', 4000)
							}
					}
					
					</script>
					<div class="row">
					<a class="col s4 btn teal lighten-1 white-text" id="btn-edit-note" style="font-size: 10px; width: 100px">Edit</a> 
					<a class="col s4 btn teal lighten-1 white-text" id="btn-build-on-note" style="margin-left: 10px; font-size: 10px; width: 100px">Build on</a>
					<button class="col s4 dropdown-button btn teal lighten-1 white-text" id="highlightBtn" data-activates='highlightOptions' id="highlightbtn" style="margin-left: 10px; font-size: 10px; width: 200px">Highlight</button>
					<a class="col s4 dropdown-button btn teal lighten-1 white-text" href='#' data-activates='boxdropdown' style="margin-left: 10px; font-size: 10px; width: 100px">More...</a>
						
					</div>
					
					<ul id='highlightOptions' class='dropdown-content collection' style="width:100px;">
						<li><span style="color: red; font-size: 10.5px" title="Please select text to highlight, and select a reason(s):"><b>Please select text to highlight, </b></br><b>and select a reason(s): </b></span></li>
						<li style="background-color:#fdff4a"><a onmousedown="GetSelectedTextYellow()" href="#!"><span style="font-size: 11px;" title="A “juicy” question for research"><b>A “juicy” question for research</b></span></a></li>
						<li style="background-color:#72e567"><a onmousedown="GetSelectedTextGreen()" href="#!"><span style="font-size: 11px;" title="An “Aha” insight"><b>An “Aha” insight</b></span></a></li>
						<li style="background-color:#fdb760"><a onmousedown="GetSelectedTextOrange()" href="#!"><span style="font-size: 11px;" title="A seed idea to refine"><b>A seed idea to refine</b></span></a></li>
						<li style="background-color:#a6acff"><a onmousedown="GetSelectedTextBlue()" href="#!"><span style="font-size: 11px;" title="An important fact to consider"><b>An important fact to consider</b></span></a></li>
						<li style="background-color:#e53244"><a onmousedown="GetSelectedTextRed()" href="#!"><span style="font-size: 11px;" title="Conflicting ideas to look into"><b>Conflicting ideas to look into</b></span></a></li>
						<li style="background-color:#c0b1d0"><a onmousedown="GetSelectedTextPurple()" href="#!"><span style="font-size: 11px;" title="A gap of knowledge"><b>A gap of knowledge</b></span></a></li>
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
				<a id="forward" class="btn white center-align z-depth-0"
					style="height: 350px; vertical-align: middle; text-align: center; line-height: 350px;">></a>
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



	<div id="draggableJof" class="ui-widget-content"
		style="display: none; width: 50%; top: 120px; right: 0px; position: absolute">
		<div class="row" >
			<div class="row"  style="margin-bottom:0px;">
				<input id="jot_id" type="hidden">
				
				<div style="float:left;line-height:22px;line-height: 22px;padding-top: 13px;     width: 33%" >
					<a href="javascript:jotCompile()" id="btn-jot-compile"  style="color: #039be5;    padding-left: 17px;">Compile</a>
					<a href="javascript:jotDetail()" id="btn-jot-detail"  style="color: #039be5;    padding-left: 17px; display:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detail</a>
				</div>
				<div style="float:left"><h5 class="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Journey of Thinking</h5></div>
				<div style="float:right;clear:right">
					<a  id="jot_large" href="javascript:jotEnlarge()"><i class="material-icons">crop_5_4</i></a>
					<a id="jot_normal" style="display:none"  href="javascript:jotNormal()"><i class="material-icons">crop_7_5</i></a>
					
				</div>
			</div>
			<div  class="row" style="margin-bottom:0px;">
			<ul class="collapsible" data-collapsible="accordion" style="margin:0px">
				<li>
					<div class="collapsible-header expend">Our Problems:</div>
					<div class="collapsible-body">
					<div class="row" style="margin-bottom:0px;"><img id="problem" src="../../res/problem.gif"
								style="vertical-align: bottom; float: left; width: 25px;" /> </div>
						<div id="problem_textarea" class="jot_text_area"></div>
						<div>
							<span
								style="display: block; overflow: hidden;"> <input
								type="text" id="problem_text_area_input"
								style="line-height: 35px; width: 100%; margin: 0px;padding-left: 5px;" /> 
								</span>
						</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header expend">Big ideas we have
						learned:</div>
					<div class="collapsible-body">
						<div class="row" style="margin-bottom:0px;" >
						<img id="think" src="../../res/think.gif"
									style="vertical-align: bottom; float: left;width: 25px;" />
						<img id="insight" src="../../res/insight.gif"
									style="vertical-align: bottom; float: left;width: 25px;" /> 
						</div>
							<div class=" jot_text_area" id="idea_textarea">
							
							</div>
							<div>
								 <span
									style="display: block; overflow: hidden;"> <input
									type="text" id="think_text_area_input"
									style="line-height: 35px; width: 100%; margin: 0px;    padding-left: 5px;"> </input></span>
							</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header expend">We need to do more:</div>
					<div class="collapsible-body">
						<div class="row" style="margin-bottom:0px;">
							<img id="understand" src="../../res/understand.gif" 
									style="vertical-align: bottom; float: left;width: 25px;" /> 
							<img id="bettertheory" src="../../res/Better%20theory.gif"
									style="vertical-align: bottom; float: left;width: 25px;" /> 
							<img id="read" src="../../res/read.gif"
									style="vertical-align: bottom; float: left;width: 25px;" /> 
							<img id="evidence" src="../../res/evidence.gif"
									style="vertical-align: bottom; float: left;width: 25px;" /> 
							<img id="disagree" src="../../res/disagree.gif"
									style="vertical-align: bottom; float: left;width: 25px;" />			
						</div>
						<div class="jot_text_area" id="to_do_textarea">
							
						</div>
						<div>
								<span
									style="display: block; overflow: hidden;"> 
									<textarea  id="understand_text_area_input"
									style="line-height: 35px; width: 100%; margin: 0px;    padding-left: 5px;"> </textarea></span>
						</div>
						
					</div>
				</li>

			</ul>
			</div>
			
			<div class=""></div>
		</div>


	</div>
	</div>
	
	
		<div id="jotCompileModal" class="modal modal-fixed-footer" style="width:80%">
			<div class="modal-content" id="compileContent">
				<div class="row" style="margin-bottom:0px;">
				<h3>Journey of Thinking</h3>
					
				</div>
				<div id="jot-compile-content" style="word-break: break-word;word-wrap: break-word;
"></div>
			</div>
			<div class="modal-footer">
				<a href="#!"
					class="modal-action modal-close waves-effect waves-green btn-flat ">Close</a>
			</div>
		</div>
		
		
	<%@ include file="thread_info_modal.jsp"%>

	</main>

	<!--Import jQuery before materialize.js-->
	<script src="../../js/jquery-3.1.0.js"></script>
	<script type="text/javascript" src="../../js/materialize.js"></script>
	<script src="https://d3js.org/d3.v4.min.js"></script>
	<script src='../../js/tinymce/tinymce.min.js'></script>
	<script src="../../js/notify.js"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
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
		});
		document.addEventListener("DOMContentLoaded", function(){
			$('.preloader-background').delay(1700).fadeOut('slow');
			$('.preloader-wrapper')
				.delay(1700)
				.fadeOut();
		});
	</script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
	
	$(".button-collapse").sideNav();
	$(".in-community").hide();
	$("#show_slide").click(function() {
		$('.button-collapse').sideNav('show');
	});
	$(".modal").modal();
	
					var sel = "null";
					var title="null";
					var new_data_note_id = [];
					var data_note_id;
					var date = new Date();
					var content = "";
					var reason;
					
					window.uid='<%=session.getAttribute("id")%>'
						function initNavBar(){
						// get thread by project id
					    
						var projectdata = {
							"database" :'itm3' ,
								"token" : '<%=session.getAttribute("token")%>',
								"sid" : <%=session.getAttribute("cross_threadid")%>
							};
							$.ajax({
										url :  "/WSG/supertalk/get",
										type : "POST",
										data : JSON.stringify(projectdata),
										dataType : "json",
										success : function(data, textStatus,jqXHR) {
											var json = $.parseJSON(data.obj);
											console.log(json);
											if(null!=json){
											var html2 ='<a href="../../dashboard.jsp"><%=session.getAttribute("community")%></a>><a href="../../thread/cross_project_sharing.jsp"><%=session.getAttribute("projectname")%>"</a> >[CROSS PROJECT]&nbsp&nbsp&nbsp&nbsp'
											        var html =' <div style="float:left"><select id="thread_list">'	
												for (var i in json) {
												if(json[i].id!=<%=session.getAttribute("cross_threadid")%>){
														html=html+'  <option value="'+json[i].id+'">'+json[i].question+'</option>'
													}else{
														 html =html+''
															    +''
															    +'<option value="" disabled selected>'+json[i].question+'</option>'
													}
												}
												    html=html+'</select></div><div style="float:left"><a href="javascript:showThreadInfo()"><i class="material-icons">info</i></a></div>'
												    +' ';
												    
												    $("#page_title").html(html2)
												    $("#page_title").after(html)
											}
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											//console.log(jqXHR.responseText);
										}
									});
						
						
					}
					initNavBar()
					
					
					$('nav').on('change', 'select', function(){ 
									console.log($("nav select option:selected" ).text())
									console.log($("nav select option:selected" ).val())
									
									$.ajax({
										url : '../SET_CROSS_THREAD_FOCUS',
										type : 'POST',
										data : {
											threadid : $("nav select option:selected" ).val(),
											threadname : $("nav select option:selected" ).text()
										},
											success : function(response) {
												window.location.href = "thread.jsp";
											}
										});
									
					});
					
									
				function storeHighlightedContent(){
						var jsondata = {
			                    'token':'<%=session.getAttribute("token")%>',
			                   'database':'itm3',
			                    'noteid' : data_note_id,
			                    'reason' : reason,
			                    'content' : content,
			                    'sid' :<%=session.getAttribute("cross_threadid")%>, 
			                    'authorid': '<%=session.getAttribute("id")%>',
			                    'ctime' : new Date(),
					    'author':'<%=session.getAttribute("username")%>',
			                    'note_position' : note_position
			                     }
					 $.ajax({
			                url :  "/WSG/supertalk/note/highlight/add",
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
		
				function checkHighlight(allContent){
                   var getHighlightedText = {
                		   		'token':'<%=session.getAttribute("token")%>',
                                  'database':'itm3',
                                  'noteid' : parseInt(data_note_id),
                                  'sid':<%=session.getAttribute("cross_threadid")%>,
                                   }
                          $.ajax({
                               url :  "/WSG/supertalk/note/highlight/get",
                              type : "post",
                              data:JSON.stringify(getHighlightedText),
                              dataType:"json",
                              success : function(data, textStatus, jqXHR) {
                                  var json = $.parseJSON(data.obj);
                                  var output=allContent;
                                  
                                  if(null!=json){
                                  for(var item = 0; item < json.length; item++){
                                      console.log("json2 " +json[item].content);
                                  if(json[item].reason == 'A “juicy” question for research'){
                                          var regex = new RegExp(json[item].content,'gi');
                                          output=output.replace(regex, '<span style="background-color:#fdff4a;">'+json[item].content+"</span>");
                                  }
                                   else if(json[item].reason == 'An “Aha” insight'){
                                          var regex = new RegExp(json[item].content,'gi');
                                          output=output.replace(regex, '<span style="background-color:#72e567;">'+json[item].content+"</span>");
                                      } 
                                  else if(json[item].reason == 'A seed idea to refine'){
                                          var regex = new RegExp(json[item].content,'gi');
                                          output=output.replace(regex, '<span style="background-color:#fdb760;">'+json[item].content+"</span>");
                                      } 
                                  else if(json[item].reason == 'An important fact to consider'){
                                            var regex = new RegExp(json[item].content,'gi');
                                          output=output.replace(regex, '<span style="background-color:#a6acff;">'+json[item].content+"</span>");
                                      } 
                                  else if(json[item].reason == 'Conflicting ideas to look into'){
                                            var regex = new RegExp(json[item].content,'gi');
                                          output=output.replace(regex, '<span style="background-color:#e53244;">'+json[item].content+"</span>");
                                      } 
                                  else if(json[item].reason == 'A gap of knowledge'){
                                            var regex = new RegExp(json[item].content,'gi');
                                          output=output.replace(regex, '<span style="background-color:#c0b1d0;">'+json[item].content+"</span>");
                                      }
                                  else{
                                      output=output;
                                }
                                  $("#content").html(output)
                                   }
                                  }
                                  var getHighlightedNote = {
                                         'token':'7897aasdfasdf2312312',
                                          'database':'<%=session.getAttribute("crossdb")%>',
                                          'sid':<%=session.getAttribute("cross_threadid")%>
                                           }
                              $.ajax({
                            	   url :  "/WSG/supertalk/note/highlighted/get",
                                  type : "post",
                                  data:JSON.stringify(getHighlightedNote),
                                  dataType:"json",
                                  success : function(data, textStatus, jqXHR) {
                                      var json = $.parseJSON(data.obj);
                                      if(json!=null){
                                    	  
                                      }
                                      },
                                      error : function(jqXHR, textStatus, errorThrown) {
                                          console.log(jqXHR.responseText);
                                      }
                              });    
                                  
                              
                              },
                              error : function(jqXHR, textStatus, errorThrown) {
                                  console.log(jqXHR.responseText);
                              }
                          });
                    }

				$(document).ready(function() {
							var communitydata = {
									"database" : "itm3",
									"token" : "<%=session.getAttribute("token")%>"
								};
							$.ajax({
								url :  "/WSG/supertalk/scaffold/get/all",
								type : "POST",
								data : JSON.stringify(communitydata),
								dataType : "json",
								success : function(data, textStatus,
										jqXHR) {
									var json = $.parseJSON(data.obj);
									//console.log(json);
									//scaffold structure: id, title, p_title
									for(e in json){
										var sf = {};
										sf.id = json[e].id;
										sf.title = json[e].title;
										if(scaffold_pkgs[json[e].p_title] == undefined){
											scaffold_pkgs[json[e].p_title] = [];
										}
										scaffold_pkgs[json[e].p_title].push(sf);
									}
									var scaffold_pkg_dom = document.getElementById("scaffold_pkg");
							   	 	var s = "";
									for(s in scaffold_pkgs){
							   	 		var opt = document.createElement("option");
							   	 		opt.setAttribute("value",s);
							   	 		opt.innerHTML = s;
							   	 		scaffold_pkg_dom.appendChild(opt);
							   	 	}
									scaffold_pkg_dom.addEventListener('click', function(e){
										e.stopPropagation();
										e.preventDefault();
							   	 	});
							   	 	scaffold_pkg_dom.addEventListener('change', function(){
							   	 		showScaffolds($(this).val());
							   	 	});
							   	 	$('#scaffold_pkg').val(s);
							   	 	showScaffolds(s);
								},
								error : function(jqXHR, textStatus,
										errorThrown) {
									//console.log(jqXHR.responseText);
								}
							});
							
							

									var notecountdata = {
											"database" : "itm3",
											"token" : "<%=session.getAttribute("token")%>",
											'sid':<%=session.getAttribute("cross_threadid")%>
									};
									$.ajax({
										url :  "/WSG/supertalk/number/note/get",
										type : "POST",
										data : JSON.stringify(notecountdata),
										dataType : "json",
										success : function(data, textStatus,jqXHR) {
											var json = $.parseJSON(data.obj);
										if(json!=null){
											if(json.length<20){
												var tester_height= 800
												$("#tester").height(tester_height);
											}
											else{
											var tester_height= json.length*26;
											$("#tester").height(tester_height);
											}
											$('#notecount').text(json.length);
										     }
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											//console.log(jqXHR.responseText);
										}
									});
									
									var authorcountdata = {
										"database" : "itm3",
											"token" : "<%=session.getAttribute("token")%>",
											'sid':<%=session.getAttribute("cross_threadid")%>
									};
									$.ajax({
										url :  "/WSG/supertalk/number/author/get",
										type : "POST",
										data : JSON.stringify(authorcountdata),
										dataType : "json",
										success : function(data, textStatus,jqXHR) {
											var json = $.parseJSON(data.obj);
											if(json!=null){
												$('#authorcount').text(json.length);
											}
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											//console.log(jqXHR.responseText);
										}
									});
									
							var userdata = {
										"database" : "itm3",
										"token" : "<%=session.getAttribute("token")%>",
										"username" : "<%=session.getAttribute("username")%>"
								};
								$.ajax({
											url :  "/WSG/user/get/byusername",
											type : "POST",
											data : JSON.stringify(userdata),
											dataType : "json",
											success : function(data, textStatus,
													jqXHR) {
												var json = $.parseJSON(data.obj);
												//console.log(json);
												if(json == null){
													GAuthorized = false;
												}
												else{
													//console.log(json[0].refresh_token);
													GAuthorized = (json[0].refresh_token == null ? false : true);
													current_user_info = json[0];
												}
												
												//GAuthorized = true;
												if(GAuthorized){
													$('#write').attr("href","#googledoc");
												}
												else{
													$('#write').attr("onclick","show_note_write()");
												}
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												//console.log(jqXHR.responseText);
											}
										});
								
								
							$('#write_in_google').click(function(){
								//alert("go to google editor");
								var title=$('#note_title').val();
							 	if(title == '' || title.trim() == ''){
							 		$(".loading").html("Title cannot be empty.");
							 		$(".loading").css("display", "block");
							 		$(".loading").css("color", "red");
							 		return;
							 	}
							 	var coauthors = ""; 
							 	$('input[name="user_group"]:checked').each(function(){ 
							 		coauthors = coauthors + $(this).val() + ",";
							 	});
							 	if(coauthors != "") {
							 		coauthors = coauthors.substring(0, coauthors.length-1);
							 	}
							 	var views = ""; 
							 	$('input[name="view_group"]:checked').each(function(){ 
							 	  views = views + $(this).val() + ",";
							 	});
							 	if(views != "") {
							 		views = views.substring(0, views.length-1);
							 	}
							 	if(views == '' || views.trim() == ''){
							 		$(".loading").html("Please select at least one view.");
							 		$(".loading").css("display", "block");
							 		$(".loading").css("color", "red");
							 		return;
							 	}
							 	var scaffolds = "";
							 	$('input[name="scaffold_group"]:checked').each(function(){
							 		scaffolds = scaffolds + $(this).val() + ","
							 	});
							 	if(scaffolds != "") {
							 		scaffolds = scaffolds.substring(0, scaffolds.length-1);
							 	}
							 	var plain_content=$('#plain_content').val();
							 	$(".loading").html("<img src=\"../../res/ajax-loader.gif\"/>Creating note .....");
							 	$(".loading").css("display", "block");
							 	$(".loading").css("color", "black");
							 	
							 	var data = {
							 			project_id: parseInt($('#projectid').text()),
						   	    	    thread_id: parseInt($('#threadid').text()),
						   	    	    username: current_user,
						   	    	    title: title,
						   	    	    coauthors:coauthors,
						   	    	    views: views,
						   	    	    scaffolds: scaffolds,
						   	    	    plain_content:plain_content
						   	    };
				   	  			$.ajax({
					   	    	    type: "POST",
					   	    	    async: true,
					   	    	    url:  "/IIUS/google/note/add",
					   	    	    data: data,
					   	    	    success: function(response) {
					   	    	    	if(response =='session expired'){
					   	    	    		parent.location.href = "../";
					   	    	    	}
					   	    	    	else{
					   	    	   	    	//todo... find a way to synchronized with google Drive
					   	    	   	    	var data = $.parseJSON(response.obj);
					   	    	   	  		/* $(".loading").html("note created!");
									 		$(".loading").css("display", "block");
									 		$(".loading").css("color", "green"); */
					   	    	   	    	$('#cancelWrite').trigger('click');
					   	    	   	  		currentDocid = data.docid;
				   	    	   	    		popupWindow = window.open('http://docs.google.com/document/d/'+currentDocid+'/edit',
				   	    	   	 			"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=850, height=500,top=100,left=300");
				   	    	   	    		setTimeout(pullDataFromGoogle, 500);
					   	    	    	}
					   	    	    },
					   	    	    error: function(response) {
					   	    	    	alert(response);
					   	    	    }
					   	    	  });
							})
							
							$('#savePlainText').click(function(){
								var title=$('#note_title').val();
							 	if(title == '' || title.trim() == ''){
							 		$(".loading").html("Title cannot be empty.");
							 		$(".loading").css("display", "block");
							 		$(".loading").css("color", "red");
							 		return;
							 	}
							 	var coauthors = ""; 
							 	$('input[name="user_group"]:checked').each(function(){ 
							 		coauthors = coauthors + $(this).val() + ",";
							 	});
							 	if(coauthors != "") {
							 		coauthors = coauthors.substring(0, coauthors.length-1);
							 	}
							 	var views = ""; 
							 	$('input[name="view_group"]:checked').each(function(){ 
							 	  views = views + $(this).val() + ",";
							 	});
							 	if(views != "") {
							 		views = views.substring(0, views.length-1);
							 	}
							 	if(views == '' || views.trim() == ''){
							 		$(".loading").html("Please select at least one view.");
							 		$(".loading").css("display", "block");
							 		$(".loading").css("color", "red");
							 		return;
							 	}
							 	var scaffolds = "";
							 	$('input[name="scaffold_group"]:checked').each(function(){
							 		scaffolds = scaffolds + $(this).val() + ","
							 	});
							 	if(scaffolds != "") {
							 		scaffolds = scaffolds.substring(0, scaffolds.length-1);
							 	}
							 	var plain_content=$('#plain_content').val();
							 	if(plain_content == '' || plain_content.trim() == ''){
							 		$(".loading").html("Note content cannot be empty.");
							 		$(".loading").css("display", "block");
							 		$(".loading").css("color", "red");
							 		return;
							 	}
							 	$(".loading").html("<img src=\"../../res/ajax-loader.gif\"/>Creating note .....");
							 	$(".loading").css("display", "block");
							 	$(".loading").css("color", "black");
							 	
							 	var data = {
							 			project_id: parseInt($('#projectid').text()),
						   	    	    thread_id: parseInt($('#threadid').text()),
						   	    	    username: current_user,
						   	    	    title: title,
						   	    	    coauthors:coauthors,
						   	    	    views: views,
						   	    	    scaffolds: scaffolds,
						   	    	    plain_content:plain_content
						   	    };
				   	  			$.ajax({
					   	    	    type: "POST",
					   	    	    async: true,
					   	    	    url:  "/IIUS/google/note/add",
					   	    	    data: data,
					   	    	    success: function(response) {
					   	    	    	if(response =='session expired'){
					   	    	    		parent.location.href = "../";
					   	    	    	}
					   	    	    	else{
					   	    	   	    	//todo... find a way to synchronized with google Drive
					   	    	   	    	var data = $.parseJSON(response.obj);
					   	    	   	  		$(".loading").html("note created!");
									 		$(".loading").css("display", "block");
									 		$(".loading").css("color", "green");
					   	    	   	    	$('#cancelWrite').trigger('click');
					   	    	   	  		currentDocid = data.docid;
					   	    	   	  		pullDataFromGoogle();
					   	    	    	}
					   	    	    },
					   	    	    error: function(response) {
					   	    	    	alert(response);
					   	    	    }
					   	    	  });
							})
							
							$('#gotoAuthorzation').click(function(){
								$.ajax({
									url :  "/IIUS/google/oAuth2/getUrl",
									type : "POST",
									data : {"username":current_user},
									dataType : "json",
									success : function(data, textStatus,
											jqXHR) {
										console.log(data);
										window.location.replace(data.obj);
									},
									error : function(jqXHR, textStatus,
											errorThrown) {
									}
								});
							})
							

							$(".modal").modal();
							/* $('.modal-trigger').leanModal(); */

							/* $("#write").click(function() {
								$("#modal1").modal("open");
							}) */

							$("#draggable").draggable({cancel : '.not_draggable'}).resizable();

							var noteinfo = [
											'"My Theory" by Erika Irwin',
											'"Great theory! Why?" by Kirk Stacey',
											'"blood" by Ty Mortier, Finn Burke, Calvin Marlow',
											'"Bruises and blood journey of thinking" by Finn Burke, Calvin Marlow',
											'"Blood and Dreams" by Finn Burke',
											'"blood" by Calvin Marlow' ]

							$("#jofedit").click(function() {
								$("#draggableJof").toggle();
							});

						

							$(".edit").click(function() {
								$(".notedetail").removeClass("s12");
								$(".notedetail").addClass("s8");
								$("html, body").animate({
									scrollTop : $(document).height()
								}, "slow");
								$(".joteditpart").show();
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

						
							$("#Vertical").click(function() {
								window.location.href = "./detail2.jsp";
							});

						});
	</script>
	<script>
		TESTER = document.getElementById('tester');
		function randomsort(a, b) {
			return Math.random() > .5 ? -1 : 1;
		}
		
		var current_user = "<%=current_user%>";
		var GAuthorized = false;
		var current_user_info = {};
		var scaffold_pkgs = {};
		var popupWindow = null;
		var currentDocid = "";
		function showScaffolds(idx){
			var scaffolds = scaffold_pkgs[idx];
			var scaffold_data = document.getElementById("scaffold");
			scaffold_data.innerHTML = "";
			if(null!=scaffolds){
				for(var m = 0; m< scaffolds.length; m++){
					var div = document.createElement("div");
					div.setAttribute("class","blk_1");
			    	var input = document.createElement("input");
				   	  input.setAttribute("type","checkbox");
				   	  input.setAttribute("id","scaffold"+scaffolds[m].id);
				   	  input.setAttribute("name","scaffold_group");
				   	  input.setAttribute("value",scaffolds[m].title);
				   	div.appendChild(input);
				   	var label = document.createElement("label");
				   	label.setAttribute("for","scaffold"+scaffolds[m].id);
				   	label.innerHTML = scaffolds[m].title;
				   	div.appendChild(label);
				   	scaffold_data.appendChild(div);	
				}
			}

		}
		
		function pullDataFromGoogle(){
			if(popupWindow && !popupWindow.closed){
				setTimeout(pullDataFromGoogle, 500);
			}
			else{
				$.ajax({
			   	    type: "POST",
			   	    async: true,
			   	    url:  "/IIUS/google/note/refresh",
			   	    data: {
			   	      docid:currentDocid,
			   	      username: current_user
			   	    },
			   	    success: function(response) {
			   	    	location.reload(true);
			   	    },
			   	    error: function(response) {
			   	    	alert(response);
			   	    }
			   	  });
			}
			
		}
		
		function  noteRead(data_note_id,weighted_position){
			var notecountdata = {
					"database" : "itm3",
					"token" : "<%=session.getAttribute("token")%>",
					"noteid" : data_note_id,
					"authorid": '<%=session.getAttribute("cross_id")%>',
					'sid':<%=session.getAttribute("cross_threadid")%>,
					"ctime":new Date(),
					"weighted_position": weighted_position
			};
			$.ajax({
				url :  "/WSG/supertalk_note_view_record/add",
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
		
		
		var projectdata = {
			"database" : "itm3",
			"token" :  "<%=session.getAttribute("token")%>",
			"authorid": '<%=session.getAttribute("cross_id")%>',
			'sid':<%=session.getAttribute("cross_threadid")%>
			
		};
		var realdatatitle_left = [];
		var realdatatime_left = [];
		var realdataauthor_left = [];
		var realdataweight_left = [];
		var realdatatitleauthor = [];
		var realdatacontent = [];
		var realdataid = [];
		var realdatanoteid=[];
		var new_data_title = [];
		var new_data_time = [];
		var new_data_author = [];
		var new_data_content = [];
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
		var note_read = [];
		var note_view_length = [];
		realdatacontent.push(null);
		var temp_realdatatitle_left1 = [];
		var temp_realdatatime_left1 = [];
		var temp_realdataweight_left1 = [];
		var temp_realdatatitleauthor1 = [];
		var new_data_note_str_id=[]

		$.ajax({
			url :  "/WSG/supertalk/note/get",
			type : "POST",
			data : JSON.stringify(projectdata),
			dataType : "json",
			success : function(data) {
				var json = $.parseJSON(data.obj);
				var notecountdata = {
						"database" : "itm3",
						"token" : "<%=session.getAttribute("token")%>",
						"authorid": '<%=session.getAttribute("id")%>',
						"sid": '<%=session.getAttribute("cross_threadid")%>',
				};
				$.ajax({
					url :  "/WSG/supertalk_note_view_record/get",
					type : "POST",
					data : JSON.stringify(notecountdata),
					dataType : "json",
					success : function(data1, textStatus,jqXHR) {
						var json1=$.parseJSON(data1.obj);
						
						
						
						$.each(json, function(item) {
						realdataauthor_left.push(json[item].first_name + " "+ json[item].last_name);
						realdatatime_left.push(json[item].create_time);
						realdataweight_left.push(parseInt(item));
						realdatatitle_left.push(json[item].title);
						realdatatitleauthor.push(json[item].title + " by " + json[item].first_name + " "+ json[item].last_name);
						realdataid.push(json[item].id);
						realdatanoteid.push(json[item].note_id);
						content = json[item].content;
						
						if(content != null){
							cleanText = content.replace(/<\/?[^>]+(>|$)/g, "").replace(/\&nbsp;/g, '');
							realdatacontent.push(cleanText);
						}
						
						if(json1!=null){
							note_view_length=json1.length;
							
							$.each(json1, function(item) {
								realdataauthor_left1.push(json1[item].last_name + " "+ json1[item].first_name);
								realdatatime_left1.push(json1[item].create_time);
								realdataweight_left1.push(json1[item].weighted_position);
								realdatatitle_left1.push(json1[item].title);
								realdatatitleauthor1.push(json1[item].title + " by " + json1[item].last_name + " "+ json1[item].first_name);
								})
							}
					})
					
					 
						for (var n = 0; n < realdataweight_left.length; n++) {
						for (var m = 0; m < realdataweight_left.length; m++) {
							if (realdataweight_left[m] == n) {
								
								new_data_title.push(realdatatitle_left[m]);
								new_data_author.push(realdataauthor_left[m]);
								new_data_content.push(realdatacontent[m+1]);
								new_data_note_id.push(realdataid[m]);
								new_data_note_str_id.push(realdatanoteid[m]);
								
							}
						}
					} 
					
					var data;
					 if(json1!=null){
						var trace_left = {
								x : realdatatime_left,
								y : realdataweight_left,
								text : realdatatitle_left,
								
								mode : 'markers+text',
								type : 'scatter',
								textposition : 'left',
								marker : {
									size : 9,
									color : 'blue'
								}
							};

						var trace_right = {
							x : realdatatime_left1,
							y : realdataweight_left1,
							mode : 'markers+text',
							type : 'scatter',
							textposition : 'left',
							
							marker : {
								size : 9,
								color : 'red'
							}
						};
						
						
						data = [trace_left, trace_right]
					 }
					 else{
						 var trace_left = {
									x : realdatatime_left,
									y : realdataweight_left,
									text : realdatatitle_left,
									mode : 'markers+text',
									type : 'scatter',
									textposition : 'left',
									marker : {
										size : 9,
										color : 'blue'
									}
								};
						 data = [trace_left]
					 }
					 
					Plotly.newPlot(TESTER, data,{
						xaxis:{
							showgrid: false,
							side: 'top'
						},
						yaxis : {
							showgrid: false,
							autorange : true,
							zeroline : false,
							showline : false,
							autotick : true,
							ticks : '',
							gridwidth: 2,
							showticklabels : false
						},
						showLink : false,
						hovermode : 'closest',
						showlegend : false
					}, {
						displayModeBar : false
					});
					
					
					var dragLayer = document.getElementsByClassName('nsewdrag')[0];
					
					TESTER.on('plotly_hover', function(data){
						dragLayer.style.cursor = 'pointer'
					})
					
					TESTER.on('plotly_unhover', function(data){
						dragLayer.style.cursor = ''
					})
					
					TESTER.on('plotly_click', function(data) {

					   
						if(data.points[0].y%1==0){
							 $("#draggable").show();
							console.log(data.points[0].y);
							i = data.points[0].y
							currenton = i;
							note_position = i;
							title=new_data_title[i];
							$("#title").text("\"" + new_data_title[i] + "\"" + " by "+ new_data_author[i]);
							$("#content").html(new_data_content[i]); 
							data_note_id = new_data_note_id[i];
							data_note_str_id=new_data_note_str_id[i];
							checkHighlight(new_data_content[i]);
							noteRead(data_note_id,i);
							temp_realdatatitle_left1.push(new_data_title[i]);
							temp_realdatatime_left1.push(data.points[0].x);
							temp_realdataweight_left1.push(i);
							temp_realdatatitleauthor1.push(new_data_title[i] + " by "+ new_data_author[i])
						}
					});
				},
				error : function(jqXHR, textStatus,
						errorThrown) {
				}
			});
			}

		});
		
		var currenton = 0;

		function show_title() {
			if(note_view_length>0){
				var trace_left = {
						x : realdatatime_left,
						y : realdataweight_left,
						text : realdatatitle_left,
						mode : 'markers+text',
						type : 'scatter',
						textposition : 'left',
						marker : {
							size : 9,
							color : 'blue'
						}
					};
			
			
				var trace_right = {
					x : realdatatime_left1,
					y : realdataweight_left1,
					/* text : realdatatitle_left1, */
					mode : 'markers+text',
					type : 'scatter',
					textposition : 'left',
					marker : {
						size : 9,
						color : 'red'
					}
				};
				data = [trace_left, trace_right]
			 }
			 else{
				 var trace_left = {
							x : realdatatime_left,
							y : realdataweight_left,
							text : realdatatitle_left,
							mode : 'markers+text',
							type : 'scatter',
							textposition : 'left',
							marker : {
								size : 9,
								color : 'blue'
							}
						};
				 data = [trace_left]
			 }
			
			Plotly.newPlot(TESTER, data, {
				xaxis:{
					showgrid: false,
					side: 'top'
				},
				yaxis : {
					showgrid: false,
					autorange : true,
					zeroline : false,
					showline : false,
					autotick : true,
					ticks : '',
					showticklabels : false
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
						size : 9,
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
					$("#draggable").show();
					console.log(data.points[0].y);
					i = data.points[0].y
					currenton = i
					note_position = i;
					title=new_data_title[i];
					$("#title").text("\"" + new_data_title[i] + "\"" + " by "+ new_data_author[i]);
					$("#content").html(new_data_content[i]);
					data_note_id = new_data_note_id[i];
					data_note_str_id = new_data_note_str_id[i]
					checkHighlight(new_data_content[i]);
					noteRead(data_note_id,i);
					temp_realdatatitle_left1.push(new_data_title[i]);
					temp_realdatatime_left1.push(data.points[0].x);
					temp_realdataweight_left1.push(i);
					temp_realdatatitleauthor1.push(new_data_title[i] + "\"" + " by "+ new_data_author[i])
				}
			});
		}

		function show_author() {
			if(note_view_length>0){
				var trace_left = {
						x : realdatatime_left,
						y : realdataweight_left,
						text : realdataauthor_left,
						mode : 'markers+text',
						type : 'scatter',
						textposition : 'left',
						marker : {
							size : 9,
							color : 'blue'
						}
					};
			
			
				var trace_right = {
					x : realdatatime_left1,
					y : realdataweight_left1,
					/* text : realdataauthor_left1, */
					mode : 'markers+text',
					type : 'scatter',
					textposition : 'left',
					marker : {
						size : 9,
						color : 'red'
					}
				};
				data = [trace_left, trace_right]
			 }
			 else{
				 var trace_left = {
							x : realdatatime_left,
							y : realdataweight_left,
							text : realdataauthor_left,
							mode : 'markers+text',
							type : 'scatter',
							textposition : 'left',
							marker : {
								size : 9,
								color : 'blue'
							}
						};
				 data = [trace_left]
			 }
			
			Plotly.newPlot(TESTER, data, {
				xaxis:{
					showgrid: false,
					side: 'top'
				},
				yaxis : {
					showgrid: false,
					autorange : true,
					zeroline : false,
					showline : false,
					autotick : true,
					ticks : '',
					showticklabels : false
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
						size : 9,
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
					$("#draggable").show();
					console.log(data.points[0].y);
					i = data.points[0].y
					currenton = i
					note_position = i;
					title=new_data_title[i];
					$("#title").text("\"" + new_data_title[i] + "\"" + " by "+ new_data_author[i]);
					$("#content").html(new_data_content[i]);
					data_note_id = new_data_note_id[i];
					checkHighlight(new_data_content[i]);
					noteRead(data_note_id,i);
					temp_realdatatitle_left1.push(new_data_title[i]);
					temp_realdatatime_left1.push(data.points[0].x);
					temp_realdataweight_left1.push(i);
					temp_realdatatitleauthor1.push(new_data_title[i] + "\"" + " by "+ new_data_author[i])
				}
			});
		}

		function show_author_title() {
			if(note_view_length>0){
				var trace_left = {
						x : realdatatime_left,
						y : realdataweight_left,
						text : realdatatitle_left,
						mode : 'markers+text',
						type : 'scatter',
						textposition : 'left',
						marker : {
							size : 9,
							color : 'blue'
						}
					};
				var trace = {
						x : realdatatime_left,
						y : realdataweight_left,
						text : realdataauthor_left,
						mode : 'markers+text',
						type : 'scatter',
						textposition : 'right',
						marker : {
							size : 9,
							color : 'blue'
						}
					};
			
				var trace_right = {
					x : realdatatime_left1,
					y : realdataweight_left1,
					/* text : realdatatitleauthor1, */
					mode : 'markers+text',
					type : 'scatter',
					textposition : 'left',
					marker : {
						size : 9,
						color : 'red'
					}
				};
				data = [trace_left,trace, trace_right]
			 }
			 else{
				 var trace_left = {
							x : realdatatime_left,
							y : realdataweight_left,
							text : realdatatitle_left,
							mode : 'markers+text',
							type : 'scatter',
							textposition : 'left',
							marker : {
								size : 9,
								color : 'blue'
							}
						};
				 var trace = {
							x : realdatatime_left,
							y : realdataweight_left,
							text : realdataauthor_left,
							mode : 'markers+text',
							type : 'scatter',
							textposition : 'right',
							marker : {
								size : 9,
								color : 'blue'
							}
						};
				 data = [trace_left,trace]
			 }
			
			Plotly.newPlot(TESTER, data, {
				xaxis:{
					showgrid: false,
					side: 'top'
				},
				yaxis : {
					showgrid: false,
					autorange : true,
					zeroline : false,
					showline : false,
					autotick : true,
					ticks : '',
					showticklabels : false
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
						size : 9,
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
					var dragLayer = document.getElementsByClassName('nsewdrag')[0];
					
					TESTER.on('plotly_hover', function(data){
						dragLayer.style.cursor = 'pointer'
					})
					
					TESTER.on('plotly_unhover', function(data){
						dragLayer.style.cursor = ''
					})
					TESTER.on('plotly_click', function(data) {
					if(data.points[0].y%1==0){
					$("#draggable").show();
					console.log(data.points[0].y);
					i = data.points[0].y
					currenton = i
					note_position = i;
					title=new_data_title[i];
					$("#title").text("\"" + new_data_title[i] + "\"" + " by "+ new_data_author[i]);
					$("#content").html(new_data_content[i]);
					data_note_id = new_data_note_id[i];
					checkHighlight(new_data_content[i]);
					noteRead(data_note_id,i);
					temp_realdatatitle_left1.push(new_data_title[i]);
					temp_realdatatime_left1.push(data.points[0].x);
					temp_realdataweight_left1.push(i);
					temp_realdatatitleauthor1.push(new_data_title[i] + " by "+ new_data_author[i])
					
				}
			});
		}

		function show_nothing() {
			TESTER.data[0].mode = 'markers';
			TESTER.data[1].mode = 'markers';
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

		$("#close").click(function() {
			$("#draggable").hide();
			var temp_trace = {
					x : temp_realdatatime_left1,
					y : temp_realdataweight_left1,
					mode : 'markers+text',
					type : 'scatter',
					textposition : 'left',
					marker : {
						size : 9,
						color : 'red'
					}
			};
			
			Plotly.addTraces(TESTER, [temp_trace])
		});

		
		function show_buildon(){
			$
			.ajax({
				url :  "/WSG/supertalk/buildon/get/bythread",
				type : "POST",
				data : JSON.stringify(projectdata),
				dataType : "json",
				success : function(data) {
					var json = $.parseJSON(data.obj);
					console.log(json);
					
					for (var i = 0; i < json.length; i++) {
						found_note_weight_and_time(json[i]);
					}
					
					//found_note_weight_and_time(json[0]);
				}
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

		function found_note_weight_and_time(json_data) {
			
			var from_id = 0;
			var to_id = 0;
			for (var i = 0; i <= realdataid.length; i++) {
				if (json_data.from_note_id == realdataid[i])
					from_id = i
				if (json_data.to_note_id == realdataid[i])
					to_id = i
			}
			/* console.log(from_id, to_id);
			console.log(realdatatitle_left[from_id], realdatatitle_left[to_id]);
			console.log(realdataweight_left[from_id],
					realdataweight_left[to_id]);
			console.log(realdatatime_left[from_id], realdatatime_left[to_id]);
			 */
			var target_x;
			var target_y;
			
			var buildondata = {"x1": String(realdatatime_left[from_id].split(".")[0]) + "," +String(realdataweight_left[from_id]), "x2": String(realdatatime_left[to_id].split(".")[0]) + "," +String(realdataweight_left[to_id])};
			/* 
			console.log(buildondata); */
			/*
			$
			.ajax({
				url : "http://127.0.0.1:5000/",
				type : "POST",
				data : JSON.stringify(buildondata),
				contentType: "application/json",
				success : function(data) {
					console.log(data);
				}
			});*/
			var x_array = [];
            var y_array = [];
            
            $.ajax({
	            url: 'http://'+window.location.hostname+':5000/',
	            data: JSON.stringify(buildondata),
	            contentType: 'application/json;charset=UTF-8',
	            type: 'POST',
	            success: function(response) {
	                target_x = response.split(";")[0];
	                target_y = response.split(";")[1];
	                
	                x_array_string = String(target_x).split(", ");
	                y_array_string = String(target_y).split(", ");
	    			for(var i = 0; i < x_array_string.length; i++)
	    				{
	    					x_array.push(parseInt(x_array_string[i]));
	    					y_array.push(parseFloat(y_array_string[i]));
	    					
	    				}
	    			/* console.log(x_array);
	    			console.log(y_array); */
	    			/* var letters = '0123456789ABCDEF'; */
	    			h = 240;
	    			s = Math.floor(Math.random() * 100);
	    			l = Math.floor(Math.random() * 100);
	    			var color = 'hsl(' + h + ', ' + s + '%, ' + l + '%)';
	    			/* var randomcolor ='#'; */
	    			/* for (var i = 0; i < 6; i++ ) {
	    				randomcolor += letters[Math.floor(Math.random() * 16)];
	    	        } */
	    			Plotly.addTraces(TESTER, {
	    				x : x_array,
	    				y : y_array,
	    				mode: 'lines',
	    				hoverinfo: 'none',
	    				line : {
	    						color : ''+color+'',
	    						width : 1,
	    						shape:'spline',
							    smoothing:1.3
	    				}
	    			});
	    			
	    			var start = x_array[0];
	    			var end = x_array[x_array.length-1];
	    			
	    			var theta = (y_array[x_array.length-1] - y_array[0])/(end-start)* (-100000000);
	    			console.log(theta);
	    			
	    			if(start>end){
	    				if(theta>2){
		    				Plotly.addTraces(TESTER, {
			    				x : [x_array[25], x_array[25], x_array[25]+500],
			    				y : [y_array[25]-1.5, y_array[25], y_array[25]],
			    				mode: 'lines',
			    				hoverinfo: 'none',
			    				line : {
			    						color : ''+color+'',
			    						width : 1,
			    						shape:'spline',
									    smoothing:1.3
			    				}
			    			});
	    				}
	    				else if(theta<-2){
		    				Plotly.addTraces(TESTER, {
			    				x : [x_array[25], x_array[25], x_array[25]+500],
			    				y : [y_array[25]+1.5, y_array[25], y_array[25]],
			    				mode: 'lines',
			    				hoverinfo: 'none',
			    				line : {
			    						color : ''+color+'',
			    						width : 1,
			    						shape:'spline',
									    smoothing:1.3
			    				}
			    			});
	    				}
	    				else{
		    				Plotly.addTraces(TESTER, {
			    				x : [x_array[25]+50000000, x_array[25], x_array[25]+500],
			    				y : [y_array[25]+1, y_array[25], y_array[25]-1],
			    				mode: 'lines',
			    				hoverinfo: 'none',
			    				line : {
			    						color : ''+color+'',
			    						width : 1,
			    						shape:'spline',
									    smoothing:1.3
			    				}
			    			});
	    				}
	    			}
	    			
	            },
	            error: function(error) {
	                console.log(error);
	            }
	        });
			
		}
		$(".btn-close").click(function() {
			$("#draggable").hide();
		});
		$(".btn-add-note-close").click(function() {
			$("#google_authorization_confirm").hide();
		});
		
		
		
		
		
		
		$("#btn-save").click(function(){
			if($("#btn-save").data("mode")=="new"){
				add()
			}
			if($("#btn-save").data("mode")=="edit"){
				update()
			}
			if($("#btn-save").data("mode")=="buildon"){
				buildon()
			}
	})
	
		function addBuildOn(fid,tid){
			 var json = {
					  "database" :'itm3' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "fromnoteid":fid,
					 "tonoteid":tid,
					 'sid':<%=session.getAttribute("cross_threadid")%>,
					 "linktype":"buildon"
			 }
			 $.ajax({
					url :  "/WSG/supertalk_note_note/add",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 console.log(1)
							 // view add
							 //addViewNote(tid)
							 addCoAuthor(nid)
						 }
					}})
					
		}
		
		function addViewNote(nid){
			// add project teacher
			if($("#selected-views").val()!=""){
				var vids= $("#selected-views").val()
				for(var i in vids){
				var json = {
						 "database" :'<%=session.getAttribute("localdb")%>' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "viewid":vids[i],
						 "noteid":nid
				 }
				$.ajax({
					url :  "/WSG/view_note/add",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 console.log(1)
							 // co-author
							 
							
						 }
						 addCoAuthor(nid)
					}
				})
			}}else{
				addCoAuthor(nid)
				
			}
		}
		
		function add(){
			 var nid ='<%=session.getAttribute("projectid")%>'+'<%=session.getAttribute("cross_threadid")%>'+Math.floor((Math.random() * 10000) + 1).toString()
			 var json = {
					 "database" :'itm3' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "title":$("#add_note_title").val(),
					 "noteid":nid,
					 "content":tinyMCE.activeEditor.getContent(),
					 "ctime":new Date(),
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
							 console.log(1)
							 // view add
							 //addViewNote(nid)
							 addCoAuthor(data.obj[0].GENERATED_KEY)
						 }
					}})
		}
		
		

		function update(){
			updateNote()
		}
		
		function updateNote(){
			 var json = {
					 "database" :'itm3' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "title":$("#add_note_title").val(),
					 "noteid":data_note_str_id,
					 "content":tinyMCE.activeEditor.getContent(),
					 "mtime":new Date(),
					 "offset":"-1",
					 "reason":""
			 }
			 $.ajax({
					url :  "/WSG/supertalk/note/update",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 console.log(1)
							 // view add
							 updateCoAuthor(data_note_str_id)
						 }
					}})
		}
		
		
		function buildon(){
		console.log(1)
			var currentNoteId =$("#btn-save").data("noteid")
			
			 var nid ='<%=session.getAttribute("cross_projectid")%>'+'<%=session.getAttribute("threadid")%>'+Math.floor((Math.random() * 10000) + 1).toString()
			 var json = {
					 "database" :'itm3' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "title":$("#add_note_title").val(),
					 "noteid":nid,
					 "content":tinyMCE.activeEditor.getContent(),
					 "ctime":new Date(),
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
							 console.log(1)
							 // view add
							 addBuildOn(currentNoteId,nid)
						 }
					}})
			
		}
		
		
		
		function addThreadNote(nid){
		var json = {
					  "database" :'itm3' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "noteid":nid,
					 "sid":<%=session.getAttribute("cross_threadid")%>,
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
					 
					 $("#google_authorization_confirm").modal("close");
					 
					 location.reload(true);
				}})
		}
	

		function addCoAuthor(nid){
			var json = {
					 "database" :'itm3' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "authorid":'<%=session.getAttribute("cross_id")%>',
					 "noteid":nid
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
					 addThreadNote(nid)
					 
				}
			})
			
				if($("#select-user").val()!=""){
					var uids= $("#select-user").val()
					for(var i in uids){
				var json2 = {
						 "database" :'itm3' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "authorid":uids[i],
						 "noteid":nid
				 }
				$.ajax({
					url :  "/WSG/supertalk/note/author/add",
					type : "POST",
					data : JSON.stringify(json2),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 console.log(1)
						 }
						 
					}
				})
			}}
			
		}

		function addViewNote(nid){
			// add project teacher
			if($("#selected-views").val()!=""){
				var vids= $("#selected-views").val()
				for(var i in vids){
				var json = {
						 "database" :'itm3' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "viewid":vids[i],
						 "noteid":nid
				 }
				$.ajax({
					url :  "/WSG/view_note/add",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 console.log(1)
							 // co-author
							 
							
						 }
						 addCoAuthor(nid)
					}
				})
			}}else{
				addCoAuthor(nid)
				
			}
		}

		tinymce.init({
		    selector: '#add_note_content',
		    height : "180",
		    theme: 'modern',
		    menu: {
		        file: {title: 'File', items: 'print'},
		        edit: {title: 'Edit', items: 'undo redo | cut copy paste pastetext | selectall'},
		        table: {title: 'Table', items: 'inserttable tableprops deletetable | cell row column'},
		      },
		    plugins: [
		      'advlist autolink lists link image charmap print preview hr anchor pagebreak',
		      'searchreplace wordcount visualblocks visualchars code fullscreen',
		      'insertdatetime media nonbreaking save table contextmenu directionality',
		      'template paste textcolor colorpicker textpattern imagetools codesample toc help'
		    ],
		    toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent |forecolor backcolor',
		    image_advtab: true,
		  });
	
	
	
	$(document).ready(function() {
	
	function init(){
		

		initUser()
		
		initViews()
		// init 
		
		$('select').material_select();
		
	
		
	}
	init()
	})
	

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
	
	  $('select').on('contentChanged', function() {
					 $(this).material_select();
			});
	  
	  
	  
	  
		$(".jofsave").click(function() {
			$("#draggableJof").hide();
			// SAVE  JOT
			var jsondata = {
					"database" :'itm3' ,
				"token" : '<%=session.getAttribute("token")%>',
				"sid" : <%=session.getAttribute("cross_threadid")%>,
				"ourproblem":$("#problem_textarea").val(),
				"createtime":new Date(),
				"authorid":'<%=session.getAttribute("cross_id")%>',
				"bigidea" : $("#idea_textarea").val(),
				"more" : $("#to_do_textarea").val()
			};
			$.ajax({
				url :  "/WSG/supertalk/jot/add",
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
		});
	
		$("#google_authorization_confirm").draggable({cancel : '.not_draggable'});
						
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
				     console.log(data);
				      var json = "/IFS/resources/data/"+$.trim((data.obj).split("@")[2]);
				      addAttachementIntoThread(json)
				    }
				  });
		 }
		 
		 
		 function addAttachementIntoThread(data){
			 
			 var jsondata = {
						"database" :'itm3' ,
						"token" : '<%=session.getAttribute("token")%>',
						"sid" : <%=session.getAttribute("cross_threadid")%>,
						"filePath":data,
						"ctime":new Date()
					};
			 
				
				$.ajax({
					url :  "/WSG/supertalk/attachment/add",
					type : "POST",
					data : JSON.stringify(jsondata),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						if (data.code == "success") {
							var json = data.obj;
							if ($.trim(json) != "No data aviliable.") {
								$.notify("Attachment has be uploaded. ","success")
							} else {
								$.notify("Error ", "warn")
							}
						}
					}
				})
		 }
		
		
		$("#compileAll").click(function () {
            $("#compileboxContent").empty();
            for (var i = 0; i < realdatatitle_left.length; i++) {
                if (i % 5 != 1)
                	 $("#compileboxContent").append('<div  style="width:100%;"><div class="card z-depth-3"><div class="card-content"><span class="card-title">"' + realdatatitle_left[i] + '" by ' + realdataauthor_left[i] + '</span><p>' + realdatacontent[i] + '</p></div></div></div>');
               
            }
        });
		
		$("#compileGraph").click(function () {
            $("#compileboxContent").empty();
            tmp_graph_list_id = TESTER.data[0].y;
            for (var i = 0; i < tmp_graph_list_id.length; i++) {
                $("#compileboxContent").append('<div class="col s12"><div class="card z-depth-3"><div class="card-content"><span class="card-title">"' + realdatatitle_left[tmp_graph_list_id[i] - 1] + '" by ' + realdataauthor_left[tmp_graph_list_id[i] - 1] + '</span><p>' + realdatacontent[tmp_graph_list_id[i] - 1] + '</p></div></div></div>');
            }
        });
		
		$("#search").change(function () {
//          alert("1");
          console.log($("#search").val());
          var tmpauthor = [];
          var tmptitle = [];
          var tmpweight = [];
          var tmptime = [];
          var tmpcontent = [];
          var tmpcolor = []
          for (var i = 0; i < realdatatitle_left.length; i++) {

              if (String(realdatatitle_left[i]).toLowerCase().indexOf(String($("#search").val()).toLowerCase()) >= 0) {
                  console.log(String(realdatatitle_left[i]));
                  console.log(i);
                  tmpauthor.push(realdataauthor_left[i]);
                  tmptitle.push(realdatatitle_left[i]);
                  tmpweight.push(realdataweight_left[i]);
                  tmptime.push(realdatatime_left[i]);
                  tmpcontent.push(realdatacontent[i]);
                  
              }
              if (tmpauthor.length > 0) {
                  TESTER.data[0].x = tmptime;
                  TESTER.data[0].y = tmpweight;
                  TESTER.data[0].text = tmptitle;
				  Plotly.redraw(TESTER);
              }
          }
      });
		
		  $('#search.autocomplete').autocomplete({
		        source:function(request, response){

		          
		           var notecountdata = {
		              "database" : "<%=session.getAttribute("crossdb")%>",
		              "token" : "<%=session.getAttribute("token")%>",
		              "sid": <%=session.getAttribute("cross_threadid")%>,
		        };
		        $.ajax({
		          url :  "/WSG/supertalk/keywords/get",
		          type : "POST",
		          data : JSON.stringify(notecountdata),
		          dataType : "json",
		          success : function(data, textStatus, jqXHR) {

		             if(data.code=="success"){
		               
		               var keywords={}
		               if($.trim(data.obj)!="No data aviliable."){
		                 var json = $.parseJSON(data.obj);
		                 for(var i in json){
		                   if(json[i].keywords in keywords){
		                     keywords[json[i].keywords]+=1;
		                   }else{
		                     keywords[json[i].keywords]=1;
		                   }
		                 }
		               }
		              
		               var availableTags = Object.keys(keywords).sort(function(a, b) {
		                  return data[b] - data[a];
		                })

		             
		              
		              response(availableTags)
		                
		                
		            }
		             return null;
		            
		          },
		          error : function(jqXHR, textStatus, errorThrown) {
		            return null;      }
		        });
		        
		        
		        }
		        });
		function show_note_write() {
			$("#add-note-title").html("New Note")
			$("#add_note_title").val("")
			$("#google_authorization_confirm").show()
			$("#btn-save").data("mode", "new");
			$('#selected-views').find('option').prop('selected', false);
			$("#selected-views").trigger('contentChanged');
			$('#select-user').find('option').prop('selected', false);
			$("#select-user").trigger('contentChanged');
			tinyMCE.activeEditor.setContent("")
			
			
		}
		
	
		$("#btn-edit-note").click(function(){
			// show edit 
			// data_note_id
			 var json = {
					 "database" :'<%=session.getAttribute("crossdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "noteid":data_note_id
			 }
			 $.ajax({
					url :  "/WSG/supertalk/note/get/byid",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 var json = $.parseJSON(data.obj);
							 console.log(1)
							 initViewNote()
							 // init title
							 $("#add_note_title").val(json[0].title)
							 $("#add-note-title").html("Edit Note")
							 
							 // init texteare
							// $("#add_note_content").val(json[0].content)
							 tinyMCE.activeEditor.setContent(json[0].content)
						 }
					}})
			
		})
		
		 function initViewNote(){
			 var json = {
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "noteid":data_note_str_id
			 }
			 $.ajax({
					url :  "/WSG/note/view/get",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 var json = $.parseJSON(data.obj);
							 for(var i in json){
								 $('#selected-views').find('option[value="'+json[i].view_id+'"]').prop('selected', true);
							 }
							 
							 $("#selected-views").trigger('contentChanged'); 
							  
						 }
						 initCoAuthor()
					}})
					
			
		}
		 function initCoAuthor(){
				 var json = {
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "noteid":data_note_str_id
			 }
			 $.ajax({
					url :  "/WSG/supertalk/note/author/get",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 var json = $.parseJSON(data.obj);
							 $("#add-note-title").html("Edit Note")
							 for(var i in json){
								 $('#select-user').find('option[value="'+json[i].author_id+'"]').prop('selected', true);
							 }
							 
							 $("#select-user").trigger('contentChanged'); 
							 
							
						 }
						 $("#draggable").toggle();
							$("#btn-save").data("mode","edit");
							$("#google_authorization_confirm").show()
					}})
					
					
		 }
		 
		 function updateViewNote(nid){
				// del privious view note , then add new view note relationship
				 var json = {
						 "database" :'<%=session.getAttribute("localdb")%>' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "noteid":nid
				 }
				 $.ajax({
						url :  "/WSG/view_note/del",
						type : "POST",
						data : JSON.stringify(json),
						dataType : "json",
						success : function(data, textStatus,
								jqXHR) {
							 if(data.code=="success"){
								 console.log(1)
								 // add view note ~~ add 
								 updateCoAuthor(nid)
							 }
						}})	
				
			}
			
			
			
			function updateCoAuthor(nid){
				// del privious view note , then add new view note relationship
				 var json = {
						 "database" :'<%=session.getAttribute("crossdb")%>' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "noteid":nid
				 }
				 $.ajax({
						url :  "/WSG/supertalk/note/author/del/bynote",
						type : "POST",
						data : JSON.stringify(json),
						dataType : "json",
						success : function(data, textStatus,
								jqXHR) {
							 if(data.code=="success"){
								 console.log(1)
								 // delete  co author
								 addViewNote(nid)
							 }
						}})	
			}
			
	</script>
	<%@ include file="jot.jsp"%>
</body>
</html>
