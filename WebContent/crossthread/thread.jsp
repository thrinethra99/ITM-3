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
<link type="text/css" rel="stylesheet"
	href="../css/customerize.css" media="screen,projection" />
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="UTF-8">
<script src="../js/jquery-3.1.0.js"></script>
<script src="../js/plotly-latest.min.js"></script>
<script src="../js/websocket.js?id=#2ad$d"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/jquery.sessionTimeout.js"></script>
<script src="../js/itm.js"></script>
<style>
.select-wrapper input.select-dropdown {
    width: 300px;
    font-size: 16px;
    padding-left: 15px;
}

#resizable {
	width: 150px;
	height: 150px;
	padding: 0.5em;
}

#compileModal{ 
	width: 90% !important ; 
	max-height: 85% !important;
	}

.modal-content.ui-resizable {
  
}

#resizable h3 {
	text-align: center;
	margin: 0;
}
#toast-container {
  top: auto !important;
  right: auto !important;
  bottom: 50%;
  left:7%;
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


.vertical-align-center {
    /* To center vertically */
    display: table-cell;
    vertical-align: middle;
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
	width:100%
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
			<div class="col s2 left" style="padding-left: 10px;">
			<a class='dropdown-button btn' href='#' data-activates='dropdown3'>Show</a>
			<ul id='dropdown3' class='dropdown-content'>
				<li class="divider"></li>
				<li><input type="checkbox" id="showtitle" checked="checked" /><label for="showtitle" class="teal-text">Title</label></li>
				<li><input type="checkbox" id="showauthor" /><label for="showauthor" class="teal-text">Author</label></li>
				<li><input type="checkbox" id="showbuildon" /><label for="showbuildon" class="teal-text">Buildon</label></li>
				<li><input type="checkbox" id="highlight" /><label for="highlight" class="teal-text">HighLight Only</label></li>
			</ul>
		</div>

		<div class="col s2 left" style="padding-left: 10px;">
			<a class='dropdown-button btn' href='#' data-activates='dropdown5'>Order By</a>
			<ul id='dropdown5' class='dropdown-content'>
				<li><a href="#!" id="orderByAuthor">Author</a></li>
				<li><a href="#!" id="orderByScaffolds">Scaffolds</a></li>
				<li><a href="#!" id="orderByTypes">Types</a></li>
			</ul>
		</div>
		<div class="col s2 left">
		<input type="text" id="search" class="autocomplete"
		style="top: 60px; height: 23px; width: 180px; z-index: 998; margin-left:50px">
		 <label for="search"></label>
		</div>&nbsp;&nbsp;&nbsp;
			 	
		<a class="waves-effect waves-light btn" id="search-btn">
		  <i class="material-icons">search</i>
		 </a>
    	<div class="col s3 right Vertical click-to-toggle jotdetail" style="top: 68px; right: 100px; height: 50px; position: absolute;" id="jofedit">
		<a class="btn  Vertical click-to-toggle jotdetail"  id="jofedit"> Journey of Thinking </a>
		</div>
		<script>
		$('.modal-content').resizable({
		    //alsoResize: ".modal-dialog",
		    minHeight: 300,
		    minWidth: 300
		});
		$('.modal-dialog').draggable();

		/* $('#compileModal').on('show.bs.modal', function () {
		    $(this).find('.modal-body').css({
		        'max-height':'100%'
		    });
		}); */
		
		</script>
		
<div class="modal fade" id="compileModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
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
      
      <div class="modal-footer">
				<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Close</a>
			</div>
      
    </div>
  </div>
</div>
		
		
		<div  class="modal modal-fixed-footer" style="width:80%">
			<div class="modal-content">
				
				
			</div>
			
		</div>

	<div class="row">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-11 col-lg-10">
				<div id="tester" style="margin-top:5px; margin-left: 0px; width: 100%">
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
	<div id="hoverinfo" style="margin-left:80px;"></div>
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

	<div id="google_authorization_confirm" class="ui-widget-content"
		style="display: none; max-height: 500px; width: 80%; top:150px; ;left:10% ;position: absolute; z-index: 100;">
		<div class="row">
			<div class="col s11 blue-grey" id="add-note-title" style="height: 20px ;color:#fff">New Note</div>
			<a class="col s1 btn blue-grey white-text btn-add-note-close">X</a>

			<div class="col s12 not_draggable"
				style="padding-left: 0; padding-right: 0;">
				<div class="container"
					style="width: 100%;" id="new-note-container">
					<div id="new-note-for-itm" style="display:none">
					<div class="row" style="width: 92%; margin-right:auto;    margin-left: auto; margin-top: 5px;">
					 <input placeholder="Title" id="add_note_title" type="text"
							class="validate">
					
						<select multiple id="select-user">
							<option value="" disabled selected>Co-Author</option>
						</select> 
						<textarea id="add_note_content"></textarea>
						<div class="row" style="width: 100%;
											    margin-right: auto;
											    margin-left: auto;
											    margin-top: 5px;
											    text-align: right;">
						<div class="pull-right">
						<a id=""  class="btn">Cancel</a>&nbsp;&nbsp;
							<a id="btn-save" data-mode="new" class="btn">Save</a>
						</div>
					</div>
					</div>

					
					</div>
					<div class="row" id="new-note-for-kf-select-view" style="display:none;padding-left:10px;padding-right:10px;">
						<div class="col s12 " style="height: 30px">This new note will be saved in this idea thread and also in Knowledge Forum.</div>	
						<div class="col s8 " style="height: 30px">Select a Knowledge Forum view(s) for this note...  </div>	
						<div class="col s3" style="height: 30px"><a class="btn" style="color:white" id="btn-new-note-select-views" class="btn">Start writing</a></div>	
						<div class="col s12 ">
							<iframe id="iFrame" src="viewlist.jsp" style="width: 100%;"></iframe>
						</div>
							
					</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	
	

	
 	<div id="draggable" class="ui-widget-content"
		style="display: none; height: 500px; width: 750px; top: 200px; right: 500px; position: absolute; z-index: 100;">
		<div class="row">
			<div class="col s11 blue-grey" style="height: 20px"></div>	
			<a class="col s1 btn blue-grey white-text" id="close">X</a>
			
			<div class="col s1 not_draggable" style="padding-left: 0">
				<a id="backward" class="btn white center-align z-depth-0" title="This note builds on..." style="height: 350px; vertical-align: middle; text-align: center; line-height: 350px;"><span style="font-size: 24px"><</span></a>
			</div>
			
			<div class="col s10 not_draggable" style="padding-left: 0; padding-right: 0; min-width: 610px">
				<div class="container">
				
				
					<div class="row">
						<p id="title" style="overflow: auto; font-size: 20px;"></p>
						<hr>
						<p id="content" style="overflow: auto; height: 270px; font-size: 20px;"></p>
						<input type="hidden" id="note_position_y"/>
						<input type="hidden" id="note_position_x"/>
						<input type="hidden" id="note_open_id"/>
					</div>
					<script>
					var threadid="<%=session.getAttribute("threadid")%>";
					var threadname="<%=session.getAttribute("threadname")%>";
					var sel = "null";
					var title="null";
					var new_data_note_id = [];
					var data_note_id;
					var date = new Date();
					var content = "";
					
					
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
					
					</script>
					<div class="row">
					<a class="col s4 btn teal lighten-1 white-text" id="btn-edit-note" style="font-size: 10px; width: 100px">Edit</a> 
					<a class="col s4 btn teal lighten-1 white-text" id="btn-build-on-note" style="margin-left: 10px; font-size: 10px; width: 100px">Build on</a>
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
						<li><a href="#!" id="removeNote">Remove</a></li>
						<li><a href="#!" id="delNote">Delete</a></li>
					</ul>
				</div>
			</div>
			<div class="col s1 not_draggable" style="padding-left: 0; padding-right: 0;">
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
	
	
	

	<div id="draggableJof" class="ui-widget-content"
		style="display: none; width: 50%; top: 120px; right: 0px; position: absolute">
		<div class="row" >
			<div class="row"  style="margin-bottom:0px;">
				<input id="jot_id" type="hidden">
				
				<div style="float:left;line-height:22px;line-height: 22px;padding-top: 13px;     width: 33%" >
					<a href="javascript:jotCompile()" id="btn-jot-compile"  style="color: #039be5; padding-left: 17px;">Compile</a>
					<a href="javascript:jotDetail()" id="btn-jot-detail"  style="color: #039be5; padding-left: 17px; display:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detail</a>
				</div>
				<div style="float:left"><h5 class="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Journey of Thinking</h5></div>
				<div style="float:right;clear:right">
					<a  id="jot_large" href="javascript:jotEnlarge()"><i class="material-icons">crop_5_4</i></a>
					<a id="jot_normal" style="display:none"  href="javascript:jotNormal()"><i class="material-icons">crop_7_5</i></a>
					<a  href="javascript:closeJot()"><i class="material-icons">clear</i></a>
					
				</div>
			</div>
			<div  class="row" style="margin-bottom:0px;">
			<ul class="collapsible" data-collapsible="accordion" style="margin:0px">
				<li>
					<div class="collapsible-header expend">Our Problems:</div>
					<div class="collapsible-body">
					<div class="row" style="margin-bottom:0px;"><img id="problem" src="../res/problem.gif"
								style="vertical-align: bottom; float: left; width: 25px;" /> </div>
						<div id="problem_textarea" class="jot_text_area"></div>
						<div>
							<span
								style="display: block; overflow: hidden;"> <input
								type="text" id="problem_text_area_input" placeholder="Type here...hit Enter to save"
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
						<img id="think" src="../res/think.gif"
									style="vertical-align: bottom; float: left;width: 25px;" />
						<img id="insight" src="../res/insight.gif"
									style="vertical-align: bottom; float: left;width: 25px;" /> 
						</div>
							<div class=" jot_text_area" id="idea_textarea">
							
							</div>
							<div>
								 <span
									style="display: block; overflow: hidden;"> <input
									type="text" id="think_text_area_input"   placeholder="Type here...hit Enter to save"
									style="line-height: 35px; width: 100%; margin: 0px; padding-left: 5px;"> </input></span>
							</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header expend">We need to do more:</div>
					<div class="collapsible-body">
						<div class="row" style="margin-bottom:0px;">
							<img id="understand" src="../res/understand.gif" 
									style="vertical-align: bottom; float: left;width: 25px;" /> 
							<img id="bettertheory" src="../res/Better%20theory.gif"
									style="vertical-align: bottom; float: left;width: 25px;" /> 
							<img id="read" src="../res/read.gif"
									style="vertical-align: bottom; float: left;width: 25px;" /> 
							<img id="evidence" src="../res/evidence.gif"
									style="vertical-align: bottom; float: left;width: 25px;" /> 
							<img id="disagree" src="../res/disagree.gif"
									style="vertical-align: bottom; float: left;width: 25px;" />			
						</div>
						<div class="jot_text_area" id="to_do_textarea">
							
						</div>
						<div>
								<span
									style="display: block; overflow: hidden;"> 
									<input  id="understand_text_area_input" placeholder="Type here...hit Enter to save"
									style="line-height: 35px; width: 100%; margin: 0px; padding-left: 5px;"> </input></span>
						</div>
						
					</div>
				</li>

			</ul>
			</div>
			
		</div>


	</div>
	
	</div>
	
	
		<div id="jotCompileModal" class="modal modal-fixed-footer" style="width:80%">
			<div class="modal-content" id="compileContent">
				<div class="row" style="margin-bottom:0px;">
				<h3>Journey of Thinking</h3>
					
				</div>
				<div id="jot-compile-content" style="word-break: break-word;word-wrap: break-word;"></div>
			</div>
			<div class="modal-footer">
				<a href="#!"
					class="modal-action modal-close waves-effect waves-green btn-flat ">Close</a>
			</div>
		</div>
		
		
		<div id="forward_modal" class="modal bottom-sheet">
		    <div class="modal-content">
		    <ul id="buildon_list" class="collapsible" data-collapsible="accordion">
			    
			 </ul>
		     <h5 id="buildon_to_title_author"></h5>
		     <div id="buildon_to_content"></div>
		    </div>
		    <div class="modal-footer">
		      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
		    </div>
  		</div>
		
	<%@ include file="thread_info_modal.jsp"%>

	</main>


	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="../js/materialize.js"></script>
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
			$('.preloader-background').delay(2500).fadeOut('slow');
			$('.preloader-wrapper')
				.delay(2500)
				.fadeOut();
		});
	</script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<%
	String testing = request.getParameter("threadid");
	String testing1 = request.getParameter("threadname");
	%>
	
	<script type="text/javascript">
	
	$(".button-collapse").sideNav();
	$(".in-community").hide();
	$("#show_slide").click(function() {
		$('.button-collapse').sideNav('show');
	});
	$(".modal").modal({
		startingTop: '50%'
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
	console.log('threadid:<%=session.getAttribute("threadid")%>')
	console.log('threadname:<%=session.getAttribute("threadname")%>')
	
	
	if(<%=request.getParameter("threadid")%> != null){
		threadid="<%=request.getParameter("threadid")%>";
	}
	if("<%=request.getParameter("threadname")%>" != "null"){
		threadname= "<%=request.getParameter("threadname")%>";
		
	}
	
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
								"database" :'<%=session.getAttribute("localdb")%>' ,
								"token" : '<%=session.getAttribute("token")%>',
								"projectid" : <%=session.getAttribute("projectid")%>
							};
							$.ajax({
										url :  "/WSG/project/thread/get",
										type : "POST",
										data : JSON.stringify(projectdata),
										dataType : "json",
										success : function(data, textStatus,jqXHR) {
											var json = $.parseJSON(data.obj);
											var project_id = <%=session.getAttribute("projectid")%>;
											var project_json =JSON.parse(localStorage.projects);
											project = project_json[project_id]
											if(null!=json){
												var html2 ="<a href='../dashboard.jsp'><%=session.getAttribute("community")%></a>-><a href='../project/openedit.jsp'>"+project.title+"</a> >"
												var html =' <div style="float:left"><select id="thread_list">'	
												for (var i in json) {
													if(json[i].thread_id!=threadid){
														html=html+'  <option value="'+json[i].thread_id+'" style="width: 400px;">'+json[i].threadfocus+'</option>'
													}else{
														 html =html+''
															    +''
															    +'<option value="" disabled selected style="width: 400px;">'+json[i].threadfocus+'</option>'
													}
												}
												    html=html+'</select></div><div style="float:left"><a href="javascript:showThreadInfo("'+threadid+'")"><i class="material-icons">info</i></a></div>'
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
										url : '../SET_THREAD_FOCUS',
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
					
									
				function storeHighlightedContent(reason){
						var jsondata = {
			                    'token':'<%=session.getAttribute("token")%>',
			                    'database':'<%=session.getAttribute("localdb")%>',
			                    'noteid' : data_note_id,
			                    'reason' : reason.replace("\'","\\\'").replace("\"","\\\""),
			                    'content' : content.replace("\'","\\\'").replace("\"","\\\""),
			                    'threadid' :threadid, 
			                    'authorid': '<%=session.getAttribute("id")%>',
			                    'ctime' : new Date()
			                     }
					 $.ajax({
			                url :  "/WSG/thread/note/highlight/add",
			                type : "post",
			                data:JSON.stringify(jsondata),
			                dataType:"json",
			                success : function(data, textStatus, jqXHR) {
			                    var highlighted_y = $("#note_position_y").val();
			                    var highlighted_x = $("#note_position_x").val();
			                    
			                    var highlighted_temp_trace = {
			    					x : [highlighted_x],
		    						y : [highlighted_y],
		    						mode : 'markers+text',
		    						type : 'scatter',
		    						textposition : 'left',
		    						marker : {
		    							size : 13,
		    							color : 'red'
		    						},
		    						hoverinfo: 'none'
			                    }
			                    
			                    Plotly.addTraces(TESTER, [highlighted_temp_trace]);
			                    
			                },
			                error : function(jqXHR, textStatus, errorThrown) {
			                    console.log(jqXHR.responseText);
			                }
			            });
					}
		
				function checkHighlight(allContent, data_note_id){
                    var getHighlightedText = {
                            'token':'<%=session.getAttribute("token")%>',
                            'database':'<%=session.getAttribute("localdb")%>',
                            'noteid' : data_note_id,
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
                            	cleanText = json[item].content.replace(/<\/?[^>]+(>|$)/g, "").replace(/\&nbsp;/g, '');
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
                                    output=output.replace(regex, '<span style="background-color:#ff5b5b;">'+json[item].content+"</span>");
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
								url :  "/WSG/scaffold/get/all",
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
											url :  "/WSG/project/user/get",
											type : "POST",
											data : JSON.stringify(projectdata),
											dataType : "json",
											success : function(data, textStatus,
													jqXHR) {
												var json = $.parseJSON(data.obj);
												if(json!=null){
													for (var i = 0; i < json.length; i++) {
														tr = $('<div class="blk_2"/>');
														tr.append('<input type="checkbox" id="author'+json[i].str_id+'" name="user_group" value="'+json[i].str_id+'" /> <label for="author'+json[i].str_id+'">'+json[i].first_name+ ' '+json[i].last_name+'</label>');
														$('#coauthor').append(tr);
													}
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
										"threadid" : threadid
									};
									$.ajax({
												url :  "/WSG/view/get/bythreadid",
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
									
									
									
							var userdata = {
										"database" : "<%=session.getAttribute("localdb")%>",
										"token" : "<%=session.getAttribute("token")%>",
										"username" : current_user
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
						   	    	    plain_content:plain_content.replace("\'","\\\'").replace("\"","\\\"")
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
						   	    	    plain_content:plain_content.replace("\'","\\\'").replace("\"","\\\"")
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
							

							$(".modal").modal({
								startingTop: '50%'
							}); 

							$("#draggable").draggable({cancel : '.not_draggable'}).resizable(
									{
										minHeight: 150,
										minWidth: 150
									});

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
		
		
		
		var realdatatitle_left = [];
		var realdatatime_left = [];
		var realdataauthor_left = [];
		var realdataweight_left = [];
		var realdatatitleauthor = [];
		var realdatacontent = [];
		var realdatacontentsubstring = [];
		var realdatacontentsubstring1 = [];
		var realdataid = [];
		var realdataid1 = [];
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
		//realdatacontent.push(null);
		var temp_realdatatitle_left1 = [];
		var temp_realdatatime_left1 = [];
		var temp_realdataweight_left1 = [];
		var temp_realdatatitleauthor1 = [];
		var new_data_note_str_id=[]
		var thread_title = '';
		var stripes_colors=["#f4f4f4","#aeaeae"];
		var stripeColor = '';
		var timeforxaxisrange = [];
		var milliseconds_start_date = '';
		var milliseconds_end_date = '';
		var range_yaxis2 = [];
		var uniquerange_yaxis2 = [];
		var all_shapes=[] ;
		var all_yaxis2_traces =[];
		var data_note_str_id="";
		var realdatatitle_highlighted = [];
		var realdatatitle_highlighted1 = [];
		var realdatacreatedtime_highlighted = [];
		var timeforxaxisrange_highlighted = [];
		var realdataauthor_highlighted = [];
		var realdataauthor_highlighted1 = [];
		var realdatacontent_highlighted = [];
		var realdataweight_highlighted = [];
		var realdatanoteid_highlighted = [];
		var all_yaxis2_traces_highlighted = [];
		var highlighted_note_id = [];
		var highlighted_note_weighted_position = [];
		var title_highlighted = "";
		var showHighlight = false;
		var buildonfromtoid = [];
		var buildontonoteid = [];
		var buildonfromnoteid = [];
		var realdatanoteidtitleauthor = [];
		var realdatanoteidcontent = [];
		
		var notebuildonfromtoid = [];
		var notecountdata = {
	            "database" : "<%=session.getAttribute("localdb")%>",
	            "token" : "<%=session.getAttribute("token")%>",
	            "threadid": "<%=session.getAttribute("threadid")%>"
	      };
		 
	      $.ajax({
	        url :  "/WSG/thread/note/to_id",
	        type : "POST",
	        data : JSON.stringify(notecountdata),
	        dataType : "json",
	        success : function(data, textStatus, jqXHR) {
	      	  var json = $.parseJSON(data.obj);
	      	  if(json!=null){
	      		  for(var m=0; m<json.length; m++){
		        		  notebuildonfromtoid.push(json[m].from_note_id+"@#$"+json[m].to_note_id);  
		        	  }  
	      	  }
	        },
	        error : function(jqXHR, textStatus, errorThrown) {
	          return null;      }
	      });
		
		
		$('#showtitle').addClass('showed');
		
		
		
		var projectdata = {
				"database" : "<%=session.getAttribute("localdb")%>",
				"token" :  "<%=session.getAttribute("token")%>",
				"authorid" :  "<%=session.getAttribute("id")%>",
				"threadid" : threadid
				
			};

		$.ajax({
			url :  "/WSG/thread/note/get",
			type : "POST",
			data : JSON.stringify(projectdata),
			dataType : "json",
			success : function(data) {
				var json = $.parseJSON(data.obj);
				if(null!=json){
				
				if(json.length<20){
					var tester_height= 800
					$("#tester").height(tester_height);
				}
				else{
				var tester_height= json.length*23;
				$("#tester").height(tester_height);
				}
				

				$.each(json, function(item) {
					realdataauthor_left.push(json[item].first_name + " "+ json[item].last_name);
					
					var x0=json[item].create_time;
					var date_x0 = new Date(x0);
					
					realdatatime_left.push(date_x0);
					
					timeforxaxisrange.push(json[item].create_time);
					realdataweight_left.push(parseInt(item));
					realdatatitle_left.push(json[item].title);
					realdatatitleauthor.push(json[item].title + " by " + json[item].first_name + " "+ json[item].last_name);
					realdataid.push(json[item].id);
					realdatanoteid.push(json[item].note_id);
					
					realdatanoteidtitleauthor.push(json[item].note_id+"@#$"+json[item].title + " by " + json[item].first_name + " "+ json[item].last_name);
					
					
					
					if(json[item]){
						
						content = json[item].content;
					}
					
				
				if(content != null){
					cleanText = content.replace(/<\/?[^>]+(>|$)/g, "").replace(/\&nbsp;/g, '');
					var pattern = new RegExp(/<\/?[^>]+(>|$)/g)
					if(pattern.test(content)){
						content=$.trim("<span>"+content+"</span>")
						$(content).find("img").each(function( index ) {
							content =content.replace( $(this).attr("src"), '<%=session.getAttribute("kfURL")%>'+$(this).attr("src"))
							});
					}
					cleanText=content
					realdatacontent.push(cleanText);
					
					realdatanoteidcontent.push(json[item].note_id+"@#$"+cleanText);
					
					new_data_content.push(parseInt(item)+"@#$"+cleanText);
					
				}
				
				new_data_title.push(parseInt(item)+"@#$"+json[item].title);
				new_data_author.push(parseInt(item)+"@#$"+json[item].first_name + " "+ json[item].last_name)
				new_data_note_id.push(parseInt(item)+"@#$"+json[item].id);
				new_data_note_str_id.push(parseInt(item)+"@#$"+json[item].note_id);
				
				
			})
				
				var notecountdata = {
						"database" : "<%=session.getAttribute("localdb")%>",
						"token" : "<%=session.getAttribute("token")%>",
						"authorid": '<%=session.getAttribute("id")%>',
						"threadid": threadid,
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
						$.each(json1, function(item) {
							realdataauthor_left1.push(json1[item].first_name + " "+ json1[item].last_name);
							
							var x0=json1[item].create_time;
							var date_x0 = new Date(x0);
							realdatatime_left1.push(date_x0);
							
							realdataid1.push(json1[item].note_id);
							realdatatitle_left1.push(json1[item].title);
							realdatatitleauthor1.push(json1[item].title + " by " + json1[item].first_name + " "+ json1[item].last_name);
							content = json1[item].content;
							
							if(content != null){
								cleanText = content.replace(/<\/?[^>]+(>|$)/g, "").replace(/\&nbsp;/g, '');
								realdatacontent.push(cleanText);
								realdatacontentsubstring1.push("Title: "+json1[item].title+" Content: "+cleanText.substring(0, 50)+" ...");
							}
							
						})
					}
					if(realdataid1.length>0){
						for(var m=0;m<realdataid1.length;m++){
							var temp_index = realdatanoteid.indexOf(realdataid1[m]);
							realdataweight_left1.push(temp_index);
						}
					}
					
					var temp_y1 = '';
					var start_date = timeforxaxisrange.sort()[0];
					 var date = new Date(start_date);
					 milliseconds_start_date = (date.getTime()); 
					 
					 var end_date = timeforxaxisrange.sort()[timeforxaxisrange.length-1]; 
					 var date1 = new Date(end_date);
					 milliseconds_end_date = (date1.getTime()); 
						
					 testing_milliseconds=((milliseconds_end_date-milliseconds_start_date)/(24*60*60*1000));
					 
					 var uniqueAuthors = [];
					 
					 $.each(realdataauthor_left, function(i, el){
					     if($.inArray(el, uniqueAuthors) === -1) uniqueAuthors.push(el);
					 });
					 for(var i=0; i<uniqueAuthors.length;i++){
						 var y0 = +realdataauthor_left.indexOf(uniqueAuthors[i])-0.5;
						 range_yaxis2.push(realdataauthor_left.indexOf(uniqueAuthors[i]));
						 var y1 = +realdataauthor_left.indexOf(uniqueAuthors[i+1])-0.5;
						 temp_y1 = +realdataauthor_left.indexOf(uniqueAuthors[i+1]);
						 if(y1==-1.5){
							 y1=realdataauthor_left.length;
						 }
						 if(temp_y1==-1){
							 temp_y1 = +realdataauthor_left.length;
						 }
						 range_yaxis2.push(temp_y1);
						 
						 if(i % 2 == 0){
							 stripeColor = stripes_colors[0];
						 }
						 else{
							 stripeColor = stripes_colors[1];
						 }
						 var final_milliseconds_start_date;
						 var final_milliseconds_end_date;
						 
						 
						 
						 if(testing_milliseconds<5){
							 final_milliseconds_start_date = milliseconds_start_date-(0.75*24*60*60*1000);
							 final_milliseconds_end_date = milliseconds_end_date+(1*24*60*60*1000);
						 }
						 else if(testing_milliseconds>=5 || testing_milliseconds<20){
							 final_milliseconds_start_date = milliseconds_start_date-(5*24*60*60*1000);
							 final_milliseconds_end_date = milliseconds_end_date+(2*24*60*60*1000);
						 }
						 else if(testing_milliseconds>=20 || testing_milliseconds<50){
							 final_milliseconds_start_date = milliseconds_start_date-(7*24*60*60*1000);
							 final_milliseconds_end_date = milliseconds_end_date+(3*24*60*60*1000);
						 }
						 else if(testing_milliseconds>=50 || testing_milliseconds<100){
							 final_milliseconds_start_date = milliseconds_start_date-(7*24*60*60*1000);
							 final_milliseconds_end_date = milliseconds_end_date+(4*24*60*60*1000);
						 }
						 else if(testing_milliseconds>=100){
							 final_milliseconds_start_date = milliseconds_start_date-(7*24*60*60*1000);
							 final_milliseconds_end_date = milliseconds_end_date+(4.5*24*60*60*1000);
						 }
						 
						 var shape = "shape"+""+i;
						 shape = {
							type: 'rect',
						    xref: 'x',
						    yref: 'y',
						    x0: final_milliseconds_start_date,
						    x1: final_milliseconds_end_date,
						    y0: y0,
						    y1: y1,
						    fillcolor: stripeColor,
						    opacity: 0.1,
						    line: {
						    	color: "white",
						    	width: 1
						        }
						    }
						 all_shapes.push(shape);
						 
						 
						 var trace_milliseconds_end_date;
						 trace_milliseconds_end_date = milliseconds_end_date+(2.5*24*60*60*1000);
						 if(testing_milliseconds<5){
							 trace_milliseconds_end_date = milliseconds_end_date+(1*24*60*60*1000);
						 }
						 
						 var trace = "trace"+""+i;
						 trace = {
								 x: [trace_milliseconds_end_date, trace_milliseconds_end_date],
								 y: [(y0+y1)/2,y1],
								 text: [uniqueAuthors[i]], 
								 type : 'line',
								 mode: 'text',
								 textposition:'right', 
								 hoverinfo: "text",
								 textfont: {
									    color: 'rgb(148, 103, 189)',
									    size: 12										          
									 }
						    }
						 all_yaxis2_traces.push(trace); 
					 }
					 var data = [];
					 
					 
					
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
									},
									hoverinfo: 'x+text'
								};
							var trace_author_right = {
									  x: realdatatime_left,
									  y: realdataauthor_left,
									  mode : 'none',
									  yaxis: 'y2',
									  type: 'scatter'
									};
							
							var trace_right = {
								x : realdatatime_left1,
								y : realdataweight_left1,
								mode : 'markers+text',
								type : 'scatter',
								textposition : 'left',
								marker : {
									size : 10,
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
										textposition : 'left',
										marker : {
											size : 9,
											color : 'blue'
										},
										hoverinfo: 'x+text'
									};
							 var trace_author_right = {
									  x: realdatatime_left,
									  y: realdataauthor_left,
									  mode : 'none',
									  yaxis: 'y2',
									  type: 'scatter'
									};
							 var tempdata = [trace_left];
							 
						 }
						 
					 thread_title = "This thread includes " + realdataweight_left.length +" note(s) by "+ uniqueAuthors.length+" author(s).";
						 
					 var highlightdata = {
								"database" :'<%=session.getAttribute("localdb")%>' ,
								"token" : '<%=session.getAttribute("token")%>',
								"threadid" : threadid
							}
							$.ajax({
								url : "/WSG/highlight/get/byauthor/bythread",
								type : "POST",
								data : JSON.stringify(highlightdata),
								dataType : "json",
								success : function(data) {
									if(data.code=="success"){
										var json_highlighted = $.parseJSON(data.obj);
										
										for(var m=0;m<json_highlighted.length;m++){
											var x0=json_highlighted[m].create_time;
											var date_x0 = new Date(x0);
											realdatacreatedtime_highlighted.push(date_x0);
											
											var temp_index = realdatanoteid.indexOf(json_highlighted[m].note_id);
											highlighted_note_weighted_position.push(temp_index);
											}
											 
											 var notes_highlighted_trace = {
													 	x : realdatacreatedtime_highlighted,
														y : highlighted_note_weighted_position,
														mode : 'markers',
														type : 'scatter',
														marker : {
															size : 13,
															color : 'red'
														},
													hoverinfo: 'none'
											 }
											all_yaxis2_traces.push(notes_highlighted_trace)
										
									}
									
									data=tempdata.concat(all_yaxis2_traces);
									Plotly.newPlot(TESTER, data, {
										title: thread_title,
										shapes: all_shapes,
										xaxis:{
											showgrid: true,
											side: 'top',
											zeroline : true,
											zerolinecolor: 'rgb(148, 103, 189)',
											showline : true,
											tick0: 0,
											tickfont : {
												color : 'rgb(148, 103, 189)',
												size : 18
											}
										},
										yaxis : {
											showgrid: false,
											autorange : false,
											zeroline : false,
											showline : false,
											autotick : true,
											showticklabels : false,
											range: [-0.5, realdataweight_left.length]
										},
										hovermode : 'closest',
										showlegend : false
									}, {
										showLink : false,
										displayModeBar : false
									});
									

									
									
									var dragLayer = document.getElementsByClassName('nsewdrag')[0];
									
									TESTER.on('plotly_hover', function(data){
										dragLayer.style.cursor = 'pointer'
									})
									
									TESTER.on('plotly_unhover', function(data){
										dragLayer.style.cursor = ''
									})
									
									show_buildon();
									$("#showbuildon").addClass('showed');
									$("#showbuildon").attr('checked',true);
									
									TESTER.on('plotly_click', function(data) {
									   console.log(data);
										if(data.points[0].y%1==0){
											$("#draggable").css("top",window.scrollY+100);
											$("#draggable").css("right",window.innerWidth/4);
											 $("#draggable").show();
											i = data.points[0].y
											currenton = i;
											
											finalDataTitle="";
											finalDataAuthor="";
											finalDataContent="";
											finalDataNoteId="";
											finalDataThreadId="";
											finalDataNoteStrId=""
											
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
											for(var m=0;m<new_data_note_str_id.length;m++){
												if(new_data_note_str_id[m].split('@#$')[0]==i){
													finalDataNoteStrId=new_data_note_str_id[m].split('@#$')[1];
												}
											}
											$("#title").text("\"" + finalDataTitle + "\"" + " by "+ finalDataAuthor);
											$("#content").html(finalDataContent);
											$("#note_position_y").val(data.points[0].y);
											$("#note_position_x").val(data.points[0].x);
											
											note_position = i;
											title=new_data_title[i];
											data_note_id = +finalDataNoteId;
											$("#note_open_id").val(finalDataNoteStrId);
											data_note_str_id = finalDataNoteStrId;
											checkHighlight(finalDataContent, data_note_id);
											noteRead(data_note_id);
											
											temp_realdatatitle_left1.push(new_data_title[i]);
											temp_realdatatime_left1.push(data.points[0].x);
											temp_realdataweight_left1.push(i);
											temp_realdatatitleauthor1.push(new_data_title[i] + " by "+ new_data_author[i])
										}
									});
									
								}
							});
						
					},
					error : function(jqXHR, textStatus,
							errorThrown) {
					}
				});
			}
				else{
					Materialize.toast("This new idea thread does not have any note yet. Click Write to create a new note. Click Import to find and add existing notes to this thread.");
					}
				}

			});
			
			var currenton = 0;


			function show_nothing() {
				TESTER.data[0].mode = 'markers';
				console.log(TESTER.data);
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
				} 
				else {
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

			
			 $("#highlight").click(function(e) {
				 $('#showbuildon').attr('checked', false);
				 $('#showtitle').attr('checked', false);
				 $('#showauthor').attr('checked', false);
				 $("#showbuildon").attr("disabled", true);
				 $("#showtitle").attr("disabled", true);
				 $("#showauthor").attr("disabled", true);
				 if (showHighlight) {
					 $("#showbuildon").attr("disabled", false);
					 $("#showtitle").attr("disabled", false);
					 $("#showauthor").attr("disabled", false);
					 $('#showbuildon').attr('checked', false);
					 $('#showtitle').attr('checked', true);
					 $('#showbuildon').attr('checked', true);
					 $('#showauthor').attr('checked', false);
					 $('#showtitle').addClass('showed');
					 
					 if(realdataid.length<20){
							var tester_height= 800
							$("#tester").height(tester_height);
						}
						else{
						var tester_height= realdataid.length*23;
						$("#tester").height(tester_height);
						}
						
					 
					 show_title();
					 show_buildon();
					 showHighlight = false;
				 }
				 else{
				 	show_highlight();
				 	showHighlight = true;
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
							size : 7,
							color : 'red'
						},
						hoverinfo: 'none'
				};
				
				Plotly.addTraces(TESTER, [temp_trace])
			});

			$("#showbuildon").click(function() {
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
									else{
										show_nothing();
									}
									
									
									$(this).removeClass("showed");
								}
								else{
									$(this).addClass("showed");
									show_buildon();
								
								}
							});
			
				function randomColor(){
					var letters = '0123456789ABCDEF';
					var color = '#';
					for (var i = 0; i < 6; i++) {
						color += letters[Math.floor(Math.random() * 16)];
					}
						  return color;
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
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "fromnoteid":fid,
					 "tonoteid":tid,
					 "linktype":"buildon"
			 }
			 $.ajax({
					url :  "/WSG/note_note/add",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 console.log(1)
							 // view add
							 //addViewNote(tid)
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
			 var nid =<%=session.getAttribute("projectid")%>+threadid+Math.floor((Math.random() * 10000) + 1).toString();
			 var json = {
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "title":$("#add_note_title").val().replace("\'","\\\'").replace("\"","\\\""),
					 "noteid":nid,
					 "content":tinyMCE.activeEditor.getContent().replace("\'","\\\'").replace("\"","\\\""),
					 "ctime":new Date(),
					 "offset":"-1"
			 }
			 $.ajax({
					url :  "/WSG/note/add",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 console.log(1)
							 // view add
							 addViewNote(nid)
						 }
					}})
		}
		
		

		function update(){
			updateNote()
		}
		
		function updateNote(){
			 var json = {
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "title":$("#add_note_title").val().replace("\'","\\\'").replace("\"","\\\""),
					 "noteid":data_note_str_id,
					 "content":tinyMCE.activeEditor.getContent().replace("\'","\\\'").replace("\"","\\\""),
					 "mtime":new Date(),
					 "offset":"-1",
					 "reason":""
			 }
			 $.ajax({
					url :  "/WSG/note/update",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 console.log(1)
							 // view add
							 updateViewNote(data_note_str_id)
						 }
					}})
		}
		
		
		function buildon(){
			var currentNoteId =$("#btn-save").data("noteid")
			console.log(currentNoteId)
			 var nid ='<%=session.getAttribute("projectid")%>'+'threadid'+Math.floor((Math.random() * 10000) + 1).toString()
			 var json = {
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "title":$("#add_note_title").val().replace("\'","\\\'").replace("\"","\\\""),
					 "noteid":nid,
					 "content":tinyMCE.activeEditor.getContent().replace("\'","\\\'").replace("\"","\\\""),
					 "ctime":new Date(),
					 "offset":"-1"
			 }
			 $.ajax({
					url :  "/WSG/note/add",
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
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "projectid":<%=session.getAttribute("projectid")%>,
					 "noteid":nid,
					 "threadid":threadid,
					 "ctime":new Date()
			 }
			$.ajax({
				url :  "/WSG/thread/note/add",
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
					 
					 //location.reload(true);
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
				url :  "/WSG/note/author/add",
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
						 "database" :'<%=session.getAttribute("localdb")%>' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "authorid":uids[i],
						 "noteid":nid
				 }
				$.ajax({
					url :  "/WSG/note/author/add",
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
		//initKFViews()
		//initJOT()
		$('select').material_select();
		
	
		
	}
	init()
	})
	

	function initViews(){
		$("#iFrame").attr("src","viewlist.jsp?id="+Math.floor(Math.random() * 11))
	}
	
	
	
	function initTable(data){
		$("#new-note-select-views").html("")
		if(null!=data&&""!=data){
			for (var i in data) {
				var tr =$("#new-note-select-views")
				var html ='<div><span width="50px"><input class="note_list_id" type="checkbox" value="'+data[i].view_id+'"  id="notes_'+data[i].view_id+'"><label for="notes_'+data[i].view_id+'"></label>'
								+ '</span>'
								if(null!=data[i].title){
									 html = html+'<span class="cell-title">'+data[i].title+'</span>'
								}else{
									 html = html+'<span class="cell-title"> null </span>'
								}
								 html = html+'</div>'
								 tr.append(html)
			}
		}
	}
	function initKFViews(){
		var jsondata = {
				community_id :'<%=session.getAttribute("community_id")%>' ,
				thread_id: threadid
		};
		$.ajax({
			url :  "/IIUS/thread/view/get",
			type : "POST",
			data : JSON.stringify(jsondata),
			dataType:"json",
			contentType: "application/json",
			success : function(data, textStatus, jqXHR) {
				if(data.code=="success"){
                	 var json =data.obj;
                	 initTable(json)
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
				"threadid" : threadid,
				"ourproblem":$("#problem_textarea").val().replace("\'","\\\'").replace("\"","\\\""),
				"createtime":new Date(),
				"authorid":'<%=session.getAttribute("id")%>',
				"bigidea" : $("#idea_textarea").val().replace("\'","\\\'").replace("\"","\\\""),
				"more" : $("#to_do_textarea").val().replace("\'","\\\'").replace("\"","\\\"")
			};
			$.ajax({
				url :  "/WSG/jot/add",
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
						"database" :'<%=session.getAttribute("localdb")%>' ,
						"token" : '<%=session.getAttribute("token")%>',
						"tid" : threadid,
						"filePath":data,
						"ctime":new Date()
					};
			 
				
				$.ajax({
					url :  "/WSG/thread/attachment/add",
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
                if (i % 5 != 1){
                	$("#compileboxContent").append('<div style="width:100%;"><div class="card z-depth-3"><div class="card-content"><span class="card-title" style="font-size:16px;">"<b>' + realdatatitle_left[i] + '" by ' + realdataauthor_left[i] + '</b></span><p style="font-size:15px;">' + realdatacontent[i] + '</p></div></div></div>');
                	if(notebuildonfromtoid.length>0){
                		for(var m=0;m<notebuildonfromtoid.length;m++){
                			if(realdatanoteid[i]==notebuildonfromtoid[m].split("@#$")[0]){
                				var temp_index = realdatanoteid.indexOf(notebuildonfromtoid[m].split("@#$")[1]);
                				if(temp_index>0){
                					$("#compileboxContent").append('<div style="width:100%;"><div style="margin-left:30px; background-color:#e8e8fd" class="card z-depth-3"><div class="card-content"><span class="card-title" style="font-size:16px;">"<b>' + realdatatitle_left[temp_index] + '" by ' + realdataauthor_left[temp_index] + '</b></span><p style="font-size:15px;">' + realdatacontent[temp_index] + '</p></div></div></div>');
                				}
                			}
                		
                		}
                	}
                }
               
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
		              "database" : "<%=session.getAttribute("localdb")%>",
		              "token" : "<%=session.getAttribute("token")%>",
		              "threadid": threadid,
		        };
		        $.ajax({
		          url :  "/WSG/thread/keywords/get",
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
		  
		  function visit(url, success) {
		        var xhr = new XMLHttpRequest();
		        xhr.open('GET', url, true);
		        xhr.setRequestHeader("Authorization", "bearer "+'<%=session.getAttribute("kftoken")%>');
		        xhr.onreadystatechange = function() {
		            if (xhr.readyState == 4) {
		                if (success) success(xhr.response);
		            }
		        };
		        xhr.send(null);
		    }
		  
		function show_note_write() {
			if('<%=session.getAttribute("kfURL")%>'=='null/'){
				// this is ITM user. 
			$("#new-note-for-itm").show()
			$("#new-note-for-kf-select-view").hide()
			$("#add-note-title").html("New Note")
			$("#google_authorization_confirm").css("top",window.scrollY+200)
			
			$("#btn-save").data("mode", "new");
			$('#selected-views').find('option').prop('selected', false);
			$("#selected-views").trigger('contentChanged');
			$('#select-user').find('option').prop('selected', false);
			$("#select-user").trigger('contentChanged');
			tinyMCE.activeEditor.setContent("")
			$("#google_authorization_confirm").css("top",window.scrollY+200)
			$("#google_authorization_confirm").show()
			
			}else{
				// show view information 
					// this is ITM user. 
				$("#new-note-for-itm").hide()
				$("#new-note-for-kf-select-view").show()
				initViews()
				$("#google_authorization_confirm").css("top",window.scrollY+200)
				$("#google_authorization_confirm").show()
			
				
			}
		}
		
		var selected_views =[]
		$("#btn-new-note-select-views").click(function(){
			var checked = false;
			$("#iFrame").contents().find('#new-note-select-views input:checked').each(function(){
				checked=true;
				selected_views.push($(this).attr('value'))
			})
			
			if(!checked){
				$.notify("please select a view ","warn")
				return
			}
			$("#new-note-for-itm").hide()
			$("#new-note-for-kf-select-view").hide()
			$("#google_authorization_confirm").hide()
			showKFWriteNote()
		})
		
		function showKFWriteNote(){
		
			var json = {
					//"communityId" : "558abcb01f3b621e75d9bc08",
					"communityId" : "<%=session.getAttribute("community_id")%>",
					"type" : "Note",
					"title" : "",
					"created" : new Date(),
					"modified" : new Date(),
					"status" : "unsaved",
					"permission" : "protected",
					"authors" : [
						"<%=session.getAttribute("id")%>"

					],
					"data" : {
						"body" : ""
					},
					"keywords" : [ ],
					"text4search" : ""
				}
			
			 $.ajax({
					url : "<%=session.getAttribute("kfURL")%>"+"api/contributions/<%=session.getAttribute("community_id")%>",
					type : "POST",
					data : JSON.stringify(json),
					contentType:"application/json",
					beforeSend: function(request) {
						    request.setRequestHeader("Authorization", "bearer "+"<%=session.getAttribute("kftoken")%>");
					},
					dataType : "json",
					success : function(data, textStatus,jqXHR) {
						if(textStatus=="success"&&jqXHR.status==201){
							if(selected_views!=[]){
								// get all view ids
								var vids= selected_views
								// create link to kf
								for(var i in vids){
									createLink(data._id,vids[i]);
									addViewNote(data._id,vids[i]);
								}
							}
							// if this buildon , it will create buildon in ITM and KF
							if($("#btn-save").data("mode")=="buildon"){
								var currentNoteId =$("#btn-save").data("noteid")
								addBuildOn(currentNoteId,data._id)
								addKFbuildon(currentNoteId,data._id)
							}
							//open editor
							var url="<%=session.getAttribute("kfURL")%>api/contributions/<%=session.getAttribute("community_id")%>/"+data._id+"?access_token=<%=session.getAttribute("kftoken")%>"
							console.log(url)
							addThreadNote(data._id)
							//location.reload()
							var childwindow=window.open(url,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=850, height=500,top=100,left=300");
							var timer = setInterval(function() {   
							  if(childwindow.closed) {  
							    clearInterval(timer);  
							    window.location.reload();
							  }  
							}, 1000); 
						}
					}
				})
		}
		
		
		
		function sleepFor( sleepDuration ){
		    var now = new Date().getTime();
		    while(new Date().getTime() < now + sleepDuration){ /* do nothing */ } 
		}
		
		function addKFbuildon(fid,tid){
			console.log("complete add buildon to kf")
		}
		
		
		function createLink(note_id,view_id){
			var json = {
					"from" : view_id,
					"to" : note_id,
					"type" : "contains",
					"communityId" : "<%=session.getAttribute("community_id")%>",
					"data" : {
						"y" : 100,
						"x" : 100
					},
				}
			
			$.ajax({
				url : "<%=session.getAttribute("kfURL")%>"+"api/links/",
				type : "POST",
				data : JSON.stringify(json),
				contentType:"application/json",
				beforeSend: function(request) {
					    request.setRequestHeader("Authorization", "bearer "+"<%=session.getAttribute("kftoken")%>");
				},
				dataType : "json",
				success : function(data, textStatus,jqXHR) {
					if(textStatus=="success"&&jqXHR.status==201){
					}
				}
			})

		}
		
		$("#btn-edit-note").click(function(){
			// show edit 
			// data_note_id
			if('<%=session.getAttribute("kfURL")%>'=='null'){
			// if it is ITM user
			 var json = {
					 "database" :'<%=session.getAttribute("localdb")%>' ,
					 "token" : '<%=session.getAttribute("token")%>',
					 "noteid":data_note_id
			 }
			 $.ajax({
					url :  "/WSG/note/get/byid",
					type : "POST",
					data : JSON.stringify(json),
					dataType : "json",
					success : function(data, textStatus,
							jqXHR) {
						 if(data.code=="success"){
							 var json = $.parseJSON(data.obj);
							 initViewNote()
							 // init title
							 $("#add_note_title").val(json[0].title)
							 $("#add-note-title").html("Edit Note")
							 
							 // init texteare
							// $("#add_note_content").val(json[0].content)
							 tinyMCE.activeEditor.setContent(json[0].content)
							 
							 
							
						 }
					}})
					
			}else{
				// kf user
				
				$("#new-note-for-itm").hide()
				$("#new-note-for-kf-select-view").hide()
				$("#draggable").toggle();
				var url="<%=session.getAttribute("kfURL")%>api/contributions/<%=session.getAttribute("community_id")%>/"+data_note_str_id+"?access_token=<%=session.getAttribute("kftoken")%>"
				$("#google_authorization_confirm").hide()
				var childwindow2=window.open(url,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=850, height=500,top=100,left=300");
				var timer2 = setInterval(function() {   
					  if(childwindow2.closed) {  
					    clearInterval(timer2);  
					    window.location.reload();
					  }  
					}, 1000); 
			}
			
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
					url :  "/WSG/note/author/get",
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
						 
							 $("#new-note-for-itm").show()
							$("#new-note-for-kf-select-view").hide()
							$("#add-note-title").html("Edit Note")
							
						 	$("#draggable").toggle();
							$("#btn-save").data("mode","edit");
							$("#google_authorization_confirm").css("top",window.scrollY+200)
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
		 $("#close").click(function() {
				$("#draggable").hide();
				var temp_trace = {
						x : temp_realdatatime_left1,
						y : temp_realdataweight_left1,
						mode : 'markers+text',
						type : 'scatter',
						textposition : 'left',
						marker : {
							size : 10,
							color : 'red'
						},
						hoverinfo: 'none'
				};
				
				Plotly.addTraces(TESTER, [temp_trace])
			});
			
			
			
			function updateCoAuthor(nid){
				// del privious view note , then add new view note relationship
				 var json = {
						 "database" :'<%=session.getAttribute("localdb")%>' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "noteid":nid
				 }
				 $.ajax({
						url :  "/WSG/note/author/del/bynote",
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
			
			
			function closeJot(){
				
				$("#draggableJof").toggle();
				
				
				
			}
			
			
			$("#btn-build-on-note").click(function(){
				console.log(data_note_str_id)
				$("#draggable").toggle();
				$("#btn-save").data("mode", "buildon");
				$("#btn-save").data("noteid", data_note_str_id);
				
				
				if('<%=session.getAttribute("kfURL")%>'=='null'){
					// this is ITM user. 
				$("#new-note-for-itm").show()
				$("#new-note-for-kf-select-view").hide()
				$("#add-note-title").html("New Note")
				$("#google_authorization_confirm").css("top",window.scrollY+200)
				
				$('#selected-views').find('option').prop('selected', false);
				$("#selected-views").trigger('contentChanged');
				$('#select-user').find('option').prop('selected', false);
				$("#select-user").trigger('contentChanged');
				tinyMCE.activeEditor.setContent("")
				$("#google_authorization_confirm").css("top",window.scrollY+200)
				$("#google_authorization_confirm").show()
				
				}else{
					// show view information 
					// this is ITM user. 
				$("#new-note-for-itm").hide()
				$("#new-note-for-kf-select-view").hide()
					
				//$("#google_authorization_confirm").css("top",window.scrollY+200)
				//$("#google_authorization_confirm").show()
				showKFWriteBuildOnNote(data_note_str_id)
					
				}
				
			})
			function showKFWriteBuildOnNote(str_id){
				 var json = {
						 "database" :'<%=session.getAttribute("localdb")%>' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "noteid": str_id
				 }
				 $.ajax({
						url :  "/WSG/note/view/get",
						type : "POST",
						data : JSON.stringify(json),
						dataType : "json",
						success : function(data, textStatus,
								jqXHR) {
							 if(data.code=="success"){
								 console.log(1)
								 // delete  co author
								 AddBuildonWithViewIds($.parseJSON(data.obj))
							 }
						}})	
			}
			
			function addViewNote(nid,vid){
				
				 var json = {
						 "database" :'<%=session.getAttribute("localdb")%>' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "noteid":nid,
						 "viewid":vid
				 }
				 $.ajax({
						url :  "/WSG/note/view/add",
						type : "POST",
						data : JSON.stringify(json),
						dataType : "json",
						success : function(data, textStatus,jqXHR) {
						}})	
				
			}
			function AddBuildonWithViewIds(vids){
				var json = {
						//"communityId" : "558abcb01f3b621e75d9bc08",
						"communityId" : "<%=session.getAttribute("community_id")%>",
						"type" : "Note",
						"title" : "",
						"created" : new Date(),
						"modified" : new Date(),
						"status" : "unsaved",
						"permission" : "protected",
						"authors" : [
							"<%=session.getAttribute("id")%>"

						],
						"data" : {
							"body" : ""
						},
						"keywords" : [ ],
						"text4search" : ""
					}
				
				 $.ajax({
						url : "<%=session.getAttribute("kfURL")%>"+"api/contributions/<%=session.getAttribute("community_id")%>",
						type : "POST",
						data : JSON.stringify(json),
						contentType:"application/json",
						beforeSend: function(request) {
							    request.setRequestHeader("Authorization", "bearer "+"<%=session.getAttribute("kftoken")%>");
						},
						dataType : "json",
						success : function(data, textStatus,jqXHR) {
							if(textStatus=="success"&&jqXHR.status==201){
								if(null != vids){
									for(var i in vids){
										createLink(data._id,vids[i].view_id);
										addViewNote(data._id,vids[i].view_id);
									}
								}
								// if this buildon , it will create buildon in ITM and KF
								if($("#btn-save").data("mode")=="buildon"){
									var currentNoteId =$("#btn-save").data("noteid")
									addBuildOn(currentNoteId,data._id)
									addKFbuildon(currentNoteId,data._id)
								}
								//open editor
								var url="<%=session.getAttribute("kfURL")%>api/contributions/<%=session.getAttribute("community_id")%>/"+data._id+"?access_token=<%=session.getAttribute("kftoken")%>"
								console.log(url)
								addThreadNote(data._id)
								//location.reload()
								var childwindow2=window.open(url,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=850, height=500,top=100,left=300");
								var timer2 = setInterval(function() {   
									  if(childwindow2.closed) {  
									    clearInterval(timer2);  
									    window.location.reload();
									  }  
									}, 1000); 
								
							}
						}
					})
			}
			
			
			$("#removeNote").click(function(){
				var json = {
						 "database" :'<%=session.getAttribute("localdb")%>' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "noteid":data_note_str_id,
						 "projectid":'<%=session.getAttribute("projectid")%>',
						 "threadid":threadid
				 }
				 $.ajax({
						url :  "/WSG/thread/note/del",
						type : "POST",
						data : JSON.stringify(json),
						dataType : "json",
						success : function(data, textStatus,jqXHR) {
							window.location.reload();
						}})	
			})
				 
				
			$("#delNote").click(function(){
				 var json = {
						 "database" :'<%=session.getAttribute("localdb")%>' ,
						 "token" : '<%=session.getAttribute("token")%>',
						 "noteid":data_note_str_id,
				 }
				 $.ajax({
						url :  "/WSG/note/del",
						type : "POST",
						data : JSON.stringify(json),
						dataType : "json",
						success : function(data, textStatus,jqXHR) {
							window.location.reload();
						}})	
				
			})
			
			sessionTimeOut(<%=session.getAttribute("SessionTimeOut")%>)
	</script>
	<%@ include file="jot.jsp"%> 
	<%@ include file="buildontofrom.jsp"%>
	<%@ include file="showbuildon.jsp"%> 
	<%@ include file="showhighlight.jsp"%>
	<%@ include file="showauthortitle.jsp"%>
	<%@ include file="showauthor.jsp"%>
	<%@ include file="showtitle.jsp"%>
	<%@ include file="notereadadd.jsp"%>
</body>
</html>