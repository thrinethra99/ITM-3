<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../validation.jsp"%>
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
<link type="text/css" rel="stylesheet" href="../css/materialize.min.css"
	media="screen,projection" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="UTF-8">
<script src="../js/plotly-latest.min.js"></script>

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
</style>


</head>

<body>

	<header>
		<nav class="  blue-grey">
			<%@ include file="../header.jsp"%>
			<%@ include file="../side_menu_hidden.jsp"%>
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
				style="height: 36px; line-height: 36px; vertical-align: middle">
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
			<input id="search" placeholder="Search by content" type="text" class="validate row" style="top: 60px; height: 50px; width:auto; z-index: 998; margin-left: 150px">
    	<div class="row Vertical click-to-toggle jotdetail" style="top: 78px; right: 100px; height: 50px; position: absolute;" id="jofedit">
			<a class="btn  Vertical click-to-toggle jotdetail"  id="jofedit"> Journey of Thinking </a>
		</div>

		<div id="compileModal" class="modal modal-fixed-footer">
			<div class="modal-content" id="compileContent">
				<h5>A compiled list of all posts:</h5>
				<div class="row">
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
			<span style="font-size: 16px; font-weight: bold;">This thread includes </span>
			<span style="font-size: 16px; color: blue; font-weight: bold;" id="notecount"></span><span style="font-size: 16px; font-weight: bold;"> notes by </span>
			<span style="font-size: 16px; color: blue; font-weight: bold;" id="authorcount"></span><span style="font-size: 16px; font-weight: bold;"> authors</span>
			
			<div id="tester" style="margin: 10px auto; height: 800px; width:100%">
			
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

	<div class="row">
		<div class="col s2 left" style="">
			<input type="checkbox" id="Vertical" /><label for="Vertical"
				class="teal-text">Vertical</label>
		</div>
		<div class="col s2" style="padding-left: 30px">
			<a class='dropdown-button btn' href='#' data-activates='dropdown3'>Show</a>
			<ul id='dropdown3' class='dropdown-content'>
				<li class="divider"></li>
				<li id="showtitle_li"><input class="showed" type="checkbox" id="showtitle" checked="checked" /><label for="showtitle" class="teal-text">Title</label></li>
				<li id="showauthor_li"><input type="checkbox" id="showauthor" /><label for="showauthor" class="teal-text">Author</label></li>
				<li><input type="checkbox" id="showbuildon" /><label for="showbuildon" class="teal-text">Buildon</label></li>
				<li><input type="checkbox" id="highlight" /><label for="highlight" class="teal-text">HighLight Only</label></li>
			</ul>
		</div>

		<div class="col s2" style="padding-left: 30px">
			<a class='dropdown-button btn' href='#' data-activates='dropdown5'>Order
				By</a>
			<ul id='dropdown5' class='dropdown-content'>
				<li><a href="#!" id="orderByAuthor">Author</a></li>
				<li><a href="#!" id="orderByScaffolds">Scaffolds</a></li>
				<li><a href="#!" id="orderByTypes">Types</a></li>
			</ul>
		</div>



	</div>


	<div id="modal1" class="modal">
		<div class="modal-content">
			<h5 class="center">Add Note</h5>
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
			<h5 class="center">Add Note</h5>
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
				<img src="../res/ajax-loader.gif" />Creating note .....
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

	<div id="google_authorization_confirm" class="modal"
		style="margin-top: 100px;">
		<div class="modal-content">
			<h5 class="center">Add Note</h5>
			<div class="row">
				<input placeholder="Title" id="add_note_title" type="text" class="validate">
			</div>
			<div class="row">
				<label>Co-Author</label>
			</div>
			<div class="row">
				<select multiple id="select-user">
					<option value="-1" id="ur_select_all"></option>
				</select>

			</div>
			<div class="row">
				<label>Copy To KF5 View</label>
			</div>
			<div class="row">
				<select multiple id="selected-views">
					<option value="-1"></option>
				</select>

			</div>
			<div class="row">
				<textarea id="add_note_content">Hello, World!</textarea>
			</div>
			<div class="row">
				<form class="col s12">
					<div class="row">
						<div class="input-field col s12">
							<a id="write_in_google" href="javascript:void(0);">Or write
								in google doc</a>
						</div>
					</div>
				</form>
			</div>

		</div>
		<div class="modal-footer">
			<div class="col s2">
				<a id="btn-save" class="btn">Save</a>&nbsp;&nbsp; <a
					class="modal-trigger modal-close waves-effect waves-light btn btn-confirm"
					href="#!">Cancel</a>
			</div>
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
				<a class="col s4 offset-s4 btn jofsave center center-align done">
					Done </a>
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
					<a class="col s4 btn teal lighten-1 white-text" id="highlightnote" style="font-size: 10px; width: 100px">Edit</a> 
					<a class="col s4 btn teal lighten-1 white-text" style="margin-left: 10px; font-size: 10px; width: 100px">Build on</a>
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
		style="display: none; width: 500px; top: 120px; right: 0px; position: fixed">
		<div class="row">
			<input id="jot_id" type="hidden">
			<div>
				<h5 class="center">Journey of Thinking</h5>
			</div>
			<ul class="collapsible" data-collapsible="accordion">
				<li>
					<div class="collapsible-header expend">Our Problems:</div>
					<div class="collapsible-body">
						<div class="input-field">
							<img id="problem" src="../res/problem.gif" />
							<textarea id="problem_textarea" class="materialize-textarea"> </textarea>
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
							<textarea id="idea_textarea" class="materialize-textarea"> </textarea>
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
							<textarea id="to_do_textarea" class="materialize-textarea"> </textarea>
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
				<li class="collection-item avatar"><span class="title">Our Problems</span>
					<p>Our Problems......................................</p></li>
				<li class="collection-item avatar"><span class="title">Big Ideas We Have Learned</span>
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
	<script src="../js/jquery-3.1.0.js"></script>
	<script type="text/javascript" src="../js/materialize.min.js"></script>
	<script src="https://d3js.org/d3.v4.min.js"></script>
	<script src='../js/tinymce/tinymce.min.js'></script>
	<script src="../js/notify.js"></script>
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
	$("#page_title").html('Thread : <%=session.getAttribute("threadname")%>')
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
	console.log('threadid:<%=session.getAttribute("threadid")%>')
	console.log('threadname:<%=session.getAttribute("threadname")%>')
	
					var sel = "null";
					var title="null";
					var new_data_note_id = [];
					var data_note_id;
					var date = new Date();
					var content = "";
					var reason;
					
					
				function storeHighlightedContent(){
						var jsondata = {
			                    'token':'<%=session.getAttribute("token")%>',
			                    'database':'<%=session.getAttribute("localdb")%>',
			                    'noteid' : data_note_id,
			                    'reason' : reason,
			                    'content' : content,
			                    'threadid' :<%=session.getAttribute("threadid")%>, 
			                    'authorid': <%=session.getAttribute("id")%>,
			                    'ctime' : new Date(),
			                    'note_position' : note_position
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
		
				function checkHighlight(allContent){
                    var getHighlightedText = {
                                  'token':'7897aasdfasdf2312312',
                                  'database':'localdb',
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
                                          'database':'localdb',
                                          'threadid' : '<%=session.getAttribute("threadid")%>'
                                           }
                              $.ajax({
                            	  url : "/WSG/thread/note/highlighted/get",
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
									"database" : "<%=session.getAttribute("localdb")%>",
									"token" : "<%=session.getAttribute("token")%>"
								};
							$.ajax({
								url : "/WSG/scaffold/get/all",
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
							
							
							var projectdata = {
									"database" : "<%=session.getAttribute("localdb")%>",
									"token" : "<%=session.getAttribute("token")%>",
									"projectid" : <%=session.getAttribute("projectid")%>
								};
							
								$.ajax({
											url : "/WSG/project/user/get",
											type : "POST",
											data : JSON.stringify(projectdata),
											dataType : "json",
											success : function(data, textStatus,
													jqXHR) {
												var json = $.parseJSON(data.obj);
												for (var i = 0; i < json.length; i++) {
													tr = $('<div class="blk_2"/>');
													tr.append('<input type="checkbox" id="author'+json[i].str_id+'" name="user_group" value="'+json[i].str_id+'" /> <label for="author'+json[i].str_id+'">'+json[i].first_name+ ' '+json[i].last_name+'</label>');
													$('#coauthor').append(tr);
												}
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												//console.log(jqXHR.responseText);
											}
										});
								
								var threaddata = {
										"database" : "<%=session.getAttribute("localdb")%>",
										"token" : "<%=session.getAttribute("token")%>",
										"threadid" : <%=session.getAttribute("threadid")%>
									};
									$.ajax({
												url : "/WSG/view/get/bythreadid",
												type : "POST",
												data : JSON.stringify(threaddata),
												dataType : "json",
												success : function(data, textStatus,
														jqXHR) {
													var json = $.parseJSON(data.obj);
													if(null!=json){
														for (var i = 0; i < json.length; i++) {
															tr = $('<div class="blk_2"/>');
															tr.append('<input type="checkbox" id="view'+json[i].view_id+'" name="view_group" value="'+json[i].view_id+'" /> <label for="view'+json[i].view_id+'">'+json[i].title+'</label>');
															$('#views').append(tr);
														}
													}
												
												},
												error : function(jqXHR, textStatus,
														errorThrown) {
													//console.log(jqXHR.responseText);
												}
											});
									var notecountdata = {
											"database" : "<%=session.getAttribute("localdb")%>",
											"token" : "<%=session.getAttribute("token")%>",
											"threadid" : <%=session.getAttribute("threadid")%>
									};
									$.ajax({
										url : "/WSG/thread/number/note/get",
										type : "POST",
										data : JSON.stringify(notecountdata),
										dataType : "json",
										success : function(data, textStatus,jqXHR) {
											var json = $.parseJSON(data.obj);
											console.log("count "+json[0].count);
											$('#notecount').text(json.length);
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											//console.log(jqXHR.responseText);
										}
									});
									
									var authorcountdata = {
											"database" : "<%=session.getAttribute("localdb")%>",
											"token" : "<%=session.getAttribute("token")%>",
											"threadid" : <%=session.getAttribute("threadid")%>
									};
									$.ajax({
										url : "/WSG/thread/number/author/get",
										type : "POST",
										data : JSON.stringify(authorcountdata),
										dataType : "json",
										success : function(data, textStatus,jqXHR) {
											var json = $.parseJSON(data.obj);
											$('#authorcount').text(json.length);
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											//console.log(jqXHR.responseText);
										}
									});
									
							var userdata = {
										"database" : "<%=session.getAttribute("localdb")%>",
										"token" : "<%=session.getAttribute("token")%>",
										"username" : current_user
								};
								$.ajax({
											url : "/WSG/user/get/byusername",
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
													$('#write').attr("href","#google_authorization_confirm");
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
							 	$(".loading").html("<img src=\"../res/ajax-loader.gif\"/>Creating note .....");
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
					   	    	    url: "/IIUS/google/note/add",
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
							 	$(".loading").html("<img src=\"../res/ajax-loader.gif\"/>Creating note .....");
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
					   	    	    url: "/IIUS/google/note/add",
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
									url : "/IIUS/google/oAuth2/getUrl",
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

							$("#draggable").draggable({cancel : '.not_draggable'});

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
			   	    url: "/IIUS/google/note/refresh",
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
					"database" : "<%=session.getAttribute("localdb")%>",
					"token" : "<%=session.getAttribute("token")%>",
					"noteid" : data_note_id,
					"authorid": '<%=session.getAttribute("id")%>',
					"threadid": '<%=session.getAttribute("threadid")%>',
					"weighted_position": weighted_position
			};
			$.ajax({
				url : "/WSG/note_view_record/add",
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
			"database" : "<%=session.getAttribute("localdb")%>",
			"token" :  "<%=session.getAttribute("token")%>",
			"authorid" :  "<%=session.getAttribute("id")%>",
			"threadid" : <%=session.getAttribute("threadid")%>
			
		};
		var realdatatitle_left = [];
		var realdatatime_left = [];
		var realdataauthor_left = [];
		var realdataweight_left = [];
		var realdatatitleauthor = [];
		var realdatacontent = [];
		var realdataid = []
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

		$.ajax({
			url : "/WSG/thread/note/get",
			type : "POST",
			data : JSON.stringify(projectdata),
			dataType : "json",
			success : function(data) {
				var json = $.parseJSON(data.obj);
				var notecountdata = {
						"database" : "<%=session.getAttribute("localdb")%>",
						"token" : "<%=session.getAttribute("token")%>",
						"authorid": '<%=session.getAttribute("id")%>',
						"threadid": '<%=session.getAttribute("threadid")%>',
				};
				$.ajax({
					url : "/WSG/note_view_record/get",
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
							showgrid: false
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
					showgrid: false
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
					showgrid: false
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
						text : realdatatitleauthor,
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
					/* text : realdatatitleauthor1, */
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
							text : realdatatitleauthor,
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
					showgrid: false
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
			
			 for(var i=0; i < data.points.length; i++){
			TESTER.data[0].mode = 'markers';
			TESTER.data[1].mode = 'markers';
			Plotly.redraw(TESTER);
			 }
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
				url : "/WSG/buildon/get/bythread",
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
			console.log(from_id, to_id);
			console.log(realdatatitle_left[from_id], realdatatitle_left[to_id]);
			console.log(realdataweight_left[from_id],
					realdataweight_left[to_id]);
			console.log(realdatatime_left[from_id], realdatatime_left[to_id]);
			
			var target_x;
			var target_y;
			
			var buildondata = {"x1": String(realdatatime_left[from_id].split(".")[0]) + "," +String(realdataweight_left[from_id]), "x2": String(realdatatime_left[to_id].split(".")[0]) + "," +String(realdataweight_left[to_id])};
			
			console.log(buildondata);
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
	            url: 'http://127.0.0.1:5000/',
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
	    			console.log(x_array);
	    			console.log(y_array);
	    			var letters = '0123456789ABCDEF';
	    	        
	    			var randomcolor ='#';
	    			for (var i = 0; i < 6; i++ ) {
	    				randomcolor += letters[Math.floor(Math.random() * 16)];
	    	        }
	    			Plotly.addTraces(TESTER, {
	    				x : x_array,
	    				y : y_array,
	    				mode: 'lines',
	    				hoverinfo: 'none',
	    				line : {
	    						color : ''+randomcolor+'',
	    						width : 2,
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
			    						color : ''+randomcolor+'',
			    						width : 2,
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
			    						color : ''+randomcolor+'',
			    						width : 2,
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
			    						color : ''+randomcolor+'',
			    						width : 2,
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
		
		
		
		
		
		
	$("#btn-save").click(function(){
		 var nid ='<%=session.getAttribute("projectid")%>'+'<%=session.getAttribute("threadid")%>'+Math.floor((Math.random() * 10000) + 1).toString()
		 var json = {
				 "database" :'<%=session.getAttribute("localdb")%>' ,
				 "token" : '<%=session.getAttribute("token")%>',
				 "title":$("#add_note_title").val(),
				 "noteid":nid,
				 "content":tinyMCE.activeEditor.getContent(),
				 "ctime":new Date(),
				 "offset":"-1"
		 }
		 $.ajax({
				url : "/WSG/note/add",
				type : "POST",
				data : JSON.stringify(json),
				dataType : "json",
				success : function(data, textStatus,
						jqXHR) {
					 if(data.code=="success"){
						 console.log(1)
						
						 // view add
						 addViewNote(nid)
						 // co-author
						 addCoAuthor(nid)
						 //thread note
						  addThreadNote(nid)
						 
						 $.notify("A new note has been created","success")
						 
						 $("#google_authorization_confirm").modal("close");
						 
						 location.reload(true);
					 }
				}})
	})
	
	
	function addThreadNote(nid){
		 var json = {
				 "database" :'<%=session.getAttribute("localdb")%>' ,
				 "token" : '<%=session.getAttribute("token")%>',
				 "projectid":<%=session.getAttribute("projectid")%>,
				 "noteid":nid,
				 "threadid":<%=session.getAttribute("threadid")%>,
				 "ctime":new Date()
		 }
		$.ajax({
			url : "/WSG/thread/note/add",
			type : "POST",
			data : JSON.stringify(json),
			dataType : "json",
			success : function(data, textStatus,
					jqXHR) {
				 if(data.code=="success"){
					 console.log(1)
				 }
			}})
	}
	

	function addCoAuthor(nid){
		var json = {
				 "database" :'<%=session.getAttribute("localdb")%>' ,
				 "token" : '<%=session.getAttribute("token")%>',
				 "authorid":'<%=session.getAttribute("id")%>',
				 "noteid":nid
		 }
		$.ajax({
			url : "/WSG/note/author/add",
			type : "POST",
			data : JSON.stringify(json),
			dataType : "json",
			success : function(data, textStatus,
					jqXHR) {
				 if(data.code=="success"){
					 console.log(1)
				 }
			}
		})
		
		$('#select-user input:checked').each(function(){
			var json2 = {
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "authorid":$(this).attr('value'),
					 "noteid":nid
			 }
			$.ajax({
				url : "/WSG/note/author/add",
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
		
		})
		
	}

	tinymce.init({
	    selector: '#add_note_content'
	  });
	
	
	
	$(document).ready(function() {
	
	function init(){
		

		initUser()
		
		initViews()
		// init 
		
		initJOT()
		$('select').material_select();
		
	
		
	}
	init()
	})
	
	function initJOT(){
		var jsondata = {
				"database" :'<%=session.getAttribute("localdb")%>' ,
				"token" : '<%=session.getAttribute("token")%>',
				"threadid" : <%=session.getAttribute("threadid")%>
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
                		 $("#problem_textarea").text(d[0].ourproblem)
                		 $("#idea_textarea").text(d[0].bigidea)
                		 $("#to_do_textarea").text(d[0].more);
                		 $("#jot_id").text(d[0].id)
                	 }
				}
			}
		})
		
		
	}
	function initViews(){
		var jsondata = {
				"database" :'<%=session.getAttribute("localdb")%>' ,
				"token" : '<%=session.getAttribute("token")%>'
		};
		$.ajax({
			url : "/WSG/view/get/all",
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
				"database" :'<%=session.getAttribute("localdb")%>' ,
				"token" : '<%=session.getAttribute("token")%>',
				"threadid" : <%=session.getAttribute("threadid")%>,
				"ourproblem":$("#problem_textarea").val(),
				"createtime":new Date(),
				"authorid":'<%=session.getAttribute("id")%>',
				"bigidea" : $("#idea_textarea").val(),
				"more" : $("#to_do_textarea").val()
			};
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
				     console.log(data);
				      var json = "/IFS/resources/data/"+$.trim((data.obj).split("@")[2]);
				      addAttachementIntoThread(json)
				    }
				  });
		 }
		 
		 
		 function addAttachementIntoThread(data){
			 
			 var jsondata = {
						"database" :'<%=session.getAttribute("localdb")%>' ,
						"token" : '<%=session.getAttribute("token")%>',
						"tid" : <%=session.getAttribute("threadid")%>,
						"filePath":data,
						"ctime":new Date()
					};
			 
				
				$.ajax({
					url : "/WSG/thread/attachment/add",
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
		
		$("#problem").click(
				function() {
					$("#problem_textarea").val(
							$("#problem_textarea").val()
									+ "[ We want to understand:]");
				});
		$("#think")
				.click(
						function() {
							$("#idea_textarea").val(
									$("#idea_textarea").val()
											+ "[ We used to think:]");
						});
		$("#insight").click(
				function() {
					$("#idea_textarea")
							.val(
									$("#idea_textarea").val()
											+ "[ We now understand:]");
				});
		$("#understand").click(
				function() {
					$("#to_do_textarea").val(
							$("#to_do_textarea").val()
									+ "[ We need to further understand ]");
				});
		$("#bettertheory").click(
				function() {
					$("#to_do_textarea").val(
							$("#to_do_textarea").val()
									+ "[ We need better theories about ]");
				});
		$("#read").click(
				function() {
					$("#to_do_textarea").val(
							$("#to_do_textarea").val()
									+ "[ We need to read more about ]");
				});
		$("#evidence").click(
				function() {
					$("#to_do_textarea").val(
							$("#to_do_textarea").val()
									+ "[ We need evidence about ]");
				});
		$("#disagree").click(
						function() {
							$("#to_do_textarea")
									.val(
											$("#to_do_textarea").val()
													+ "[ We need to look at our different ideas about ]");
						});
		
		
		
		$("#compileAll").click(function () {
            $("#compileboxContent").empty();
            for (var i = 0; i < realdatatitle_left.length; i++) {
                if (i % 5 != 1)
                	 $("#compileboxContent").append('<div  style="width:950px;"><div class="card z-depth-3"><div class="card-content"><span class="card-title">"' + realdatatitle_left[i] + '" by ' + realdataauthor_left[i] + '</span><p>' + realdatacontent[i] + '</p></div></div></div>');
               
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
	</script>
</body>
</html>