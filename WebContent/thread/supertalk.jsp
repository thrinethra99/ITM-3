<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../validation.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script src="../js/plotly-latest.min.js"></script>
<script src="../js/jquery-3.1.0.js"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/jquery.sessionTimeout.js"></script>
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
</style>


</head>

<body>

	<header>

	<ul id='dropdown1' class='dropdown-content'>
		<li><a href="#!">English</a></li>
		<li><a href="#!">Français</a></li>
		<li><a href="#!">中文简体</a></li>
		<li><a href="#!">中文繁體</a></li>
	</ul>

	<ul id='threaddropdown' class='dropdown-content'>
		<li><a href="#!">Rename</a></li>
		<li><a href="#!">History</a></li>
		<li><a href="#!">Delete</a></li>
		<li><a href="#!">...</a></li>
	</ul>

	<div class="navbar-fixed">
		<nav class="top-nav blue-grey">
		<div class="nav-wrapper blue-grey">
			<!-- <a href="#" class="brand-logo center">Idea Thread Mapper</a> -->
			<a class="brand-logo center white-text blue-grey"
				style="margin-left: 20px; font-size: 20px;">Super Talk</span></a>
			<ul class="left">
				<li><a href="../project/ourspace/dashboard.jsp"><i class="material-icons left">reorder</i></a></li>
				<!--<li><a class="dropdown-button" href="#!" data-activates="threaddropdown">Thread<i-->
				<!--class="material-icons right">arrow_drop_down</i></a></li>-->
			</ul>


		</div>
		</nav>
	</div>


	<ul id="slide-out" class="side-nav">
		<li class="no-padding">
			<ul class="collapsible collapsible-accordion">
				<li class="bold"><a
					class="collapsible-header  waves-effect waves-teal"
					style="padding: 0 30px;">Project</a>
					<div class="collapsible-body" style="">
						<ul>
							<li><a href="../project/create.html"
								style="padding: 0 50px;">Create</a></li>
							<li><a href="../project/openedit.html"
								style="padding: 0 50px;">Open/Edit</a></li>
							<li><a href="../project/visit.html" style="padding: 0 50px;">Visit</a></li>
							<li><a href="../project/deleted.html"
								style="padding: 0 50px;">Deleted</a></li>
						</ul>
					</div></li>
				<li class="bold"><a
					class="collapsible-header  waves-effect waves-teal"
					style="padding: 0 30px;">Thread</a>
					<div class="collapsible-body" style="">
						<ul>
							<li><a href="../thread/create.html" style="padding: 0 50px;">Create</a></li>
							<li><a href="../thread/open.html" style="padding: 0 50px;">Open</a></li>
							<li><a href="../thread/deleted.html"
								style="padding: 0 50px;">Deleted</a></li>
						</ul>
					</div></li>
				<li class="bold"><a
					class="collapsible-header  waves-effect waves-teal"
					style="padding: 0 30px;">Map</a></li>
				<li class="bold"><a
					class="collapsible-header  waves-effect waves-teal"
					style="padding: 0 30px;">Network</a></li>

				<div class="divider"></div>

				<li class="bold"><a
					class="collapsible-header  waves-effect waves-teal"
					href="index.html" style="padding: 0 30px;">Logout</a></li>
			</ul>
		</li>


	</ul>
	</header>


	<ul id="slide-out-right" class="side-nav">

	</ul>

	<main> <br>
	<div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
     
	<div class="row">
	
		<div class="col s2 left">
			<a class="modal-trigger waves-effect waves-light btn" href="#modal1">Write</a>
		</div>
		<div class="col s2 left">
			<a class="waves-effect waves-light btn">Import</a>
		</div>
		<div class="col s2 left file-field">
			<div class="btn"
				style="height: 36px; line-height: 36px; vertical-align: middle">
				<span>Attach</span> <input type="file">
			</div>
			<!--<a class="waves-effect waves-light btn">Attach</a>-->
		</div>
		<div class="col s2 left">
			<a class="dropdown-button btn" id="compile"
				data-activates='compileDropDown'>Compile</a>
			<ul id='compileDropDown' class='dropdown-content'>
				<li><a class="modal-trigger" id="compileAll"
					href="#compileModal">All posts in this thread</a></li>
				<li><a class="modal-trigger" id="compileGraph"
					href="#compileModal">Posts in graph only</a></li>
				<li><a class="modal-trigger" id="compileHighlight"
					href="#compileModal">Highlighted posts only</a></li>
			</ul>
		</div>
		<div class="input-field"
			style="position: fixed; top: 115px; right: 50px; width: 350px;">
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
			<div id="tester" style="margin: 10px auto; height: 650px;"></div>
		</div>
		<div class="fixed-action-btn Vertical click-to-toggle jotdetail"
			style="top: 70px; right: 100px; height: 50px;" id="jofedit">
			<a class="btn"> Journey of Thinking </a>
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
				<li><input class="showed" type="checkbox" id="showtitle"
					checked="checked" /><label for="showtitle" class="teal-text">Title</label>
				</li>
				<li><input type="checkbox" id="showauthor" /><label
					for="showauthor" class="teal-text">Author</label></li>
				<li><input type="checkbox" id="showbuildon" /><label
					for="showbuildon" class="teal-text">Buildon</label></li>
				<li><input type="checkbox" id="showreference" /><label
					for="showreference" class="teal-text">Reference</label></li>
				<li><input type="checkbox" id="highlight" /><label
					for="highlight" class="teal-text">HighLight Only</label></li>
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
		style="display: none; height: 500px; width: 750px; top: 200px; right: 500px; position: fixed; border-style: solid; border-width: 5px; border-color: black; z-index: 100">
		<div class="row">
			<div class="col s11 black" style="height: 20px"></div>
			<a class="col s1 btn black white-text lighten-2" id="close">X</a>
			<div class="col s1 not_draggable" style="padding-left: 0">
				<a id="back" class="btn white center-align z-depth-0"
					style="height: 350px; vertical-align: middle; text-align: center; line-height: 350px;"><</a>
			</div>
			<div class="col s10 not_draggable"
				style="padding-left: 0; padding-right: 0; width: 610px">
				<div class="container">
					<div class="row">
						<p id="title" style="overflow: auto; font-size: 20px;"></p>
						<hr>
						<p id="content"
							style="overflow: auto; height: 270px; font-size: 20px;"></p>
					</div>
					<div class="row">
						<a class="col s4 btn grey lighten-1" id="highlightnote"
							style="font-size: 10px; width: 100px">Highlight</a> <a
							class="col s4 btn grey lighten-1"
							style="margin-left: 10px; font-size: 10px; width: 100px">Remove</a>
						<a class="col s4 dropdown-button btn grey lighten-1" href='#'
							data-activates='boxdropdown'
							style="margin-left: 10px; font-size: 10px; width: 100px">More</a>
					</div>
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
	</script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							/* $('.modal-trigger').leanModal(); */

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

							$("#jofedit").click(function() {
								$("#draggableJof").show();
							});

							$(".jofsave").click(function() {
								$("#draggableJof").hide();
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

							//        $(".collection-item").click(function () {
							//            if ($(this).hasClass("active") == false) {
							//                $(".collection-item").removeClass("active");
							//                $(this).addClass("active");
							//                console.log($(".collection-item").index($(this)));
							//                $(".card-title").text(noteinfo[$(".collection-item").index($(this))]);
							//                $("#notetext").text(notetext[$(".collection-item").index($(this))]);
							//            }
							//        });

							//        textposition: 'top center',
							//                textfont: {
							//            family: 'Raleway, sans-serif'
							//        }

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


							$("#showbuildon")
									.click(
											function() {
												if ($(this).hasClass("showed")) {
													//                TESTER.data[0] = data[0];
													alert("1");
													Plotly.deleteTraces(TESTER,
															-10);
													Plotly.redraw(TESTER);
													$(this).removeClass(
															"showed");
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

							//        <li><a href="#!" id="orderByAuthor">Author</a></li>
							//                <li><a href="#!" id="orderByScaffolds">Scaffolds</a></li>
							//                <li><a href="#!" id="orderByTypes">Contribution types</a></li>
							//        <li><a href="#!" id="orderByWordCloud">Word Cloud</a></li>

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

							$("#problem")
									.click(
											function() {
												$("#textarea1")
														.val(
																$("#textarea1")
																		.val()
																		+ "[ We want to understand:]");
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
								window.location.href = "./detail2.jsp";
							});

						});
	</script>
	<script>
		TESTER = document.getElementById('tester');
		var jsondata = {
				"database" : "localdb",
				"token" : "7897aasdfasdf231231asdf",
				"projectid" : 1,
				"threadid" : 1
			};

			$.ajax({
				url :  "/WSG/thread/note/get",
				type : "POST",
				data : JSON.stringify(jsondata),
				dataType : "json",
				success : function(data, textStatus, jqXHR) {
					var json = $.parseJSON(data.obj);
					console.log(json);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR.responseText);
				}
			});

			/* var jsondata = {
					"database" : "itm3",
					"token" : "7897aasdfasdf231231asdf",
					"username" : "naifengliu",
					"password" : "naifengliu",
					"community" : "community",
					"roletype" : "roletype",
					"first_name" : "naifeng",
					"last_name" : "liu",
					"google_account" : "naifengliu.us@gmail.com",
					"profile_image" : "profile_image",
					"email" : "naifengliu.us@gmail.com",
					"gender" : "male",
					"age" : 27,
					"content" : "content",
					"localdb" : "localdb"
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
							console.log(data.desc, "success");
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR.responseText);
					}
				}); */

			$
					.ajax({
						type : "GET",
						url : "note.json",
						dataType : "json",
						success : function(data) {
							/* console.log(data); */
							var realdatatitle_left = [];
							var realdatatime_left = [];
							var realdataauthor_left = [];
							var realdataweight_left = [];
							var realdatatitle_right = [];
							var realdatatime_right = [];
							var realdataauthor_right = [];
							var realdataweight_right = [];
							$.each(data.notes,
									function(i, item) {
										if (item.weight == '74'
												|| item.weight == '73'
												|| item.weight == '71'
												|| item.weight == '68'
												|| item.weight == '50'
												|| item.weight == '26'
												|| item.weight == '21'
												|| item.weight == '13'
												|| item.weight == '7'
												|| item.weight == '57'
												|| item.weight == '59'
												|| item.weight == '54'
												|| item.weight == '2') {
											realdatatime_right.push(item.time);
											realdataweight_right
													.push(parseInt(item.weight));
											realdatatitle_right.push(item.title);
										} else {
											realdatatime_left.push(item.time);
											realdataweight_left
													.push(parseInt(item.weight));
											realdatatitle_left.push(item.title);
										}
									})

							var trace_left = {
								x : realdatatime_left,
								y : realdataweight_left,
								text : realdatatitle_left,
								mode : 'markers+text',
								type : 'scatter',
								textposition : 'left',
								marker : {
									size : 12,
									color : 'blue'
								}
							};

							var trace_right = {
								x : realdatatime_right,
								y : realdataweight_right,
								text : realdatatitle_right,
								mode : 'markers+text',
								type : 'scatter',
								textposition : 'right',
								marker : {
									size : 12,
									color : 'blue'
								}
							};

							var trace1 = {
								x : [ 1454601592000, 1454647384040, 1454693176081,
										1454738968122, 1454784760163,
										1454830552204, 1454876344244,
										1454922136285, 1454967928326,
										1455013720367, 1455059512408,
										1455105304448, 1455151096489,
										1455196888530, 1455242680571,
										1455288472612, 1455334264653,
										1455380056693, 1455425848734,
										1455471640775, 1455517432816,
										1455563224857, 1455609016897,
										1455654808938, 1455700600979,
										1455746393020, 1455792185061,
										1455837977102, 1455883769142,
										1455929561183, 1455975353224,
										1456021145265, 1456066937306,
										1456112729346, 1456158521387,
										1456204313428, 1456250105469,
										1456295897510, 1456341689551,
										1456387481591, 1456433273632,
										1456479065673, 1456524857714,
										1456570649755, 1456616441795,
										1456662233836, 1456708025877,
										1456753817918, 1456799609959,
										1456845402000, ],
								y : [ 68.00, 68.38, 68.75, 69.10, 69.43, 69.75,
										70.06, 70.35, 70.62, 70.88, 71.13, 71.36,
										71.57, 71.77, 71.96, 72.13, 72.28, 72.42,
										72.55, 72.66, 72.76, 72.84, 72.90, 72.95,
										72.99, 73.01, 73.01, 73.00, 72.98, 72.94,
										72.89, 72.82, 72.73, 72.63, 72.52, 72.39,
										72.24, 72.08, 71.91, 71.72, 71.52, 71.30,
										71.06, 70.81, 70.55, 70.27, 69.97, 69.66,
										69.34, 69.00, ],
								type : 'line',
								line : {
									color : 'green'
								}
							};

							var trace2 = {
								x : [ 1459436175000, 1459383302081, 1459330429163,
										1459277556244, 1459224683326,
										1459171810408, 1459118937489,
										1459066064571, 1459013191653,
										1458960318734, 1458907445816,
										1458854572897, 1458801699979,
										1458748827061, 1458695954142,
										1458643081224, 1458590208306,
										1458537335387, 1458484462469,
										1458431589551, 1458378716632,
										1458325843714, 1458272970795,
										1458220097877, 1458167224959,
										1458114352040, 1458061479122,
										1458008606204, 1457955733285,
										1457902860367, 1457849987448,
										1457797114530, 1457744241612,
										1457691368693, 1457638495775,
										1457585622857, 1457532749938,
										1457479877020, 1457427004102,
										1457374131183, 1457321258265,
										1457268385346, 1457215512428,
										1457162639510, 1457109766591,
										1457056893673, 1457004020755,
										1456951147836, 1456898274918,
										1456845402000, ],
								y : [ 61.00, 61.56, 62.11, 62.64, 63.15, 63.65,
										64.13, 64.59, 65.04, 65.47, 65.88, 66.28,
										66.66, 67.02, 67.37, 67.70, 68.01, 68.31,
										68.59, 68.85, 69.10, 69.33, 69.54, 69.74,
										69.92, 70.08, 70.23, 70.36, 70.47, 70.57,
										70.65, 70.71, 70.76, 70.79, 70.80, 70.80,
										70.78, 70.74, 70.69, 70.62, 70.53, 70.43,
										70.31, 70.17, 70.02, 69.85, 69.66, 69.46,
										69.24, 69.00, ],

								type : 'line',
								line : {
									color : 'green'
								}
							};

							var trace3 = {
								x : [ 1456242231000, 1456245734061, 1456249237122,
										1456252740183, 1456256243244,
										1456259746306, 1456263249367,
										1456266752428, 1456270255489,
										1456273758551, 1456277261612,
										1456280764673, 1456284267734,
										1456287770795, 1456291273857,
										1456294776918, 1456298279979,
										1456301783040, 1456305286102,
										1456308789163, 1456312292224,
										1456315795285, 1456319298346,
										1456322801408, 1456326304469,
										1456329807530, 1456333310591,
										1456336813653, 1456340316714,
										1456343819775, 1456347322836,
										1456350825897, 1456354328959,
										1456357832020, 1456361335081,
										1456364838142, 1456368341204,
										1456371844265, 1456375347326,
										1456378850387, 1456382353448,
										1456385856510, 1456389359571,
										1456392862632, 1456396365693,
										1456399868755, 1456403371816,
										1456406874877, 1456410377938,
										1456413881000, ],
								y : [ 51.00, 50.75, 50.48, 50.19, 49.89, 49.57,
										49.23, 48.88, 48.51, 48.12, 47.72, 47.30,
										46.86, 46.41, 45.94, 45.45, 44.95, 44.43,
										43.89, 43.34, 42.77, 42.18, 41.58, 40.96,
										40.32, 39.67, 39.00, 38.32, 37.61, 36.89,
										36.16, 35.40, 34.63, 33.85, 33.04, 32.22,
										31.39, 30.54, 29.67, 28.78, 27.88, 26.96,
										26.02, 25.07, 24.10, 23.11, 22.11, 21.09,
										20.05, 19.00, ],
								type : 'line',
								line : {
									color : 'green'
								}
							}

							var trace4 = {
								x : [ 1455205057000, 1455192735673, 1455180414346,
										1455168093020, 1455155771693,
										1455143450367, 1455131129040,
										1455118807714, 1455106486387,
										1455094165061, 1455081843734,
										1455069522408, 1455057201081,
										1455044879755, 1455032558428,
										1455020237102, 1455007915775,
										1454995594448, 1454983273122,
										1454970951795, 1454958630469,
										1454946309142, 1454933987816,
										1454921666489, 1454909345163,
										1454897023836, 1454884702510,
										1454872381183, 1454860059857,
										1454847738530, 1454835417204,
										1454823095877, 1454810774551,
										1454798453224, 1454786131897,
										1454773810571, 1454761489244,
										1454749167918, 1454736846591,
										1454724525265, 1454712203938,
										1454699882612, 1454687561285,
										1454675239959, 1454662918632,
										1454650597306, 1454638275979,
										1454625954653, 1454613633326,
										1454601312000, ],
								y : [ 74.00, 72.93, 71.84, 70.74, 69.62, 68.49,
										67.33, 66.16, 64.98, 63.77, 62.55, 61.32,
										60.07, 58.80, 57.51, 56.21, 54.89, 53.55,
										52.20, 50.83, 49.44, 48.04, 46.62, 45.19,
										43.73, 42.26, 40.78, 39.27, 37.76, 36.22,
										34.67, 33.10, 31.51, 29.91, 28.29, 26.65,
										25.00, 23.33, 21.64, 19.94, 18.22, 16.49,
										14.73, 12.97, 11.18, 9.38, 7.56, 5.72,
										3.87, 2.00, ],
								type : 'line',
								line : {
									color : 'green'
								}
							}

							var trace5 = {
								x : [ 1458224601000, 1458163000959, 1458101400918,
										1458039800877, 1457978200836,
										1457916600795, 1457855000755,
										1457793400714, 1457731800673,
										1457670200632, 1457608600591,
										1457547000551, 1457485400510,
										1457423800469, 1457362200428,
										1457300600387, 1457239000346,
										1457177400306, 1457115800265,
										1457054200224, 1456992600183,
										1456931000142, 1456869400102,
										1456807800061, 1456746200020,
										1456684599979, 1456622999938,
										1456561399897, 1456499799857,
										1456438199816, 1456376599775,
										1456314999734, 1456253399693,
										1456191799653, 1456130199612,
										1456068599571, 1456006999530,
										1455945399489, 1455883799448,
										1455822199408, 1455760599367,
										1455698999326, 1455637399285,
										1455575799244, 1455514199204,
										1455452599163, 1455390999122,
										1455329399081, 1455267799040,
										1455206199000, ],
								y : [ 54.00, 54.24, 54.46, 54.66, 54.85, 55.02,
										55.17, 55.31, 55.43, 55.53, 55.62, 55.69,
										55.74, 55.78, 55.80, 55.80, 55.79, 55.76,
										55.71, 55.65, 55.57, 55.47, 55.36, 55.23,
										55.08, 54.92, 54.74, 54.54, 54.33, 54.10,
										53.85, 53.59, 53.31, 53.01, 52.70, 52.37,
										52.02, 51.66, 51.28, 50.88, 50.47, 50.04,
										49.59, 49.13, 48.65, 48.15, 47.64, 47.11,
										46.56, 46.00, ],
								type : 'line',
								line : {
									color : 'green'
								}
							}

							var trace6 = {
								x : [ 1457804811000, 1457809850591, 1457814890183,
										1457819929775, 1457824969367,
										1457830008959, 1457835048551,
										1457840088142, 1457845127734,
										1457850167326, 1457855206918,
										1457860246510, 1457865286102,
										1457870325693, 1457875365285,
										1457880404877, 1457885444469,
										1457890484061, 1457895523653,
										1457900563244, 1457905602836,
										1457910642428, 1457915682020,
										1457920721612, 1457925761204,
										1457930800795, 1457935840387,
										1457940879979, 1457945919571,
										1457950959163, 1457955998755,
										1457961038346, 1457966077938,
										1457971117530, 1457976157122,
										1457981196714, 1457986236306,
										1457991275897, 1457996315489,
										1458001355081, 1458006394673,
										1458011434265, 1458016473857,
										1458021513448, 1458026553040,
										1458031592632, 1458036632224,
										1458041671816, 1458046711408,
										1458051751000, ],
								y : [ 60.00, 60.15, 60.29, 60.41, 60.52, 60.61,
										60.68, 60.73, 60.77, 60.79, 60.80, 60.79,
										60.76, 60.71, 60.65, 60.57, 60.48, 60.37,
										60.24, 60.09, 59.93, 59.76, 59.56, 59.35,
										59.12, 58.88, 58.61, 58.34, 58.04, 57.73,
										57.40, 57.06, 56.69, 56.32, 55.92, 55.51,
										55.08, 54.64, 54.18, 53.70, 53.20, 52.69,
										52.16, 51.62, 51.06, 50.48, 49.88, 49.27,
										48.64, 48.00, ],
								type : 'line',
								line : {
									color : 'green'
								}
							}

							var trace7 = {
								x : [ 1458053741000, 1458053700387, 1458053659775,
										1458053619163, 1458053578551,
										1458053537938, 1458053497326,
										1458053456714, 1458053416102,
										1458053375489, 1458053334877,
										1458053294265, 1458053253653,
										1458053213040, 1458053172428,
										1458053131816, 1458053091204,
										1458053050591, 1458053009979,
										1458052969367, 1458052928755,
										1458052888142, 1458052847530,
										1458052806918, 1458052766306,
										1458052725693, 1458052685081,
										1458052644469, 1458052603857,
										1458052563244, 1458052522632,
										1458052482020, 1458052441408,
										1458052400795, 1458052360183,
										1458052319571, 1458052278959,
										1458052238346, 1458052197734,
										1458052157122, 1458052116510,
										1458052075897, 1458052035285,
										1458051994673, 1458051954061,
										1458051913448, 1458051872836,
										1458051832224, 1458051791612,
										1458051751000, ],
								y : [ 53.00, 52.90, 52.80, 52.69, 52.59, 52.49,
										52.39, 52.29, 52.18, 52.08, 51.98, 51.88,
										51.78, 51.67, 51.57, 51.47, 51.37, 51.27,
										51.16, 51.06, 50.96, 50.86, 50.76, 50.65,
										50.55, 50.45, 50.35, 50.24, 50.14, 50.04,
										49.94, 49.84, 49.73, 49.63, 49.53, 49.43,
										49.33, 49.22, 49.12, 49.02, 48.92, 48.82,
										48.71, 48.61, 48.51, 48.41, 48.31, 48.20,
										48.10, 48.00, ],
								type : 'line',
								line : {
									color : 'green'
								}
							}

							var trace8 = {
								x : [ 1458225442000, 1458225451061, 1458225460122,
										1458225469183, 1458225478244,
										1458225487306, 1458225496367,
										1458225505428, 1458225514489,
										1458225523551, 1458225532612,
										1458225541673, 1458225550734,
										1458225559795, 1458225568857,
										1458225577918, 1458225586979,
										1458225596040, 1458225605102,
										1458225614163, 1458225623224,
										1458225632285, 1458225641346,
										1458225650408, 1458225659469,
										1458225668530, 1458225677591,
										1458225686653, 1458225695714,
										1458225704775, 1458225713836,
										1458225722897, 1458225731959,
										1458225741020, 1458225750081,
										1458225759142, 1458225768204,
										1458225777265, 1458225786326,
										1458225795387, 1458225804448,
										1458225813510, 1458225822571,
										1458225831632, 1458225840693,
										1458225849755, 1458225858816,
										1458225867877, 1458225876938,
										1458225886000, ],
								y : [ 36.00, 36.12, 36.24, 36.37, 36.49, 36.61,
										36.73, 36.86, 36.98, 37.10, 37.22, 37.35,
										37.47, 37.59, 37.71, 37.84, 37.96, 38.08,
										38.20, 38.33, 38.45, 38.57, 38.69, 38.82,
										38.94, 39.06, 39.18, 39.31, 39.43, 39.55,
										39.67, 39.80, 39.92, 40.04, 40.16, 40.29,
										40.41, 40.53, 40.65, 40.78, 40.90, 41.02,
										41.14, 41.27, 41.39, 41.51, 41.63, 41.76,
										41.88, 42.00, ],
								type : 'line',
								line : {
									color : 'green'
								}
							}

							var trace9 = {
								x : [ 1458053501000, 1458044722020, 1458035943040,
										1458027164061, 1458018385081,
										1458009606102, 1458000827122,
										1457992048142, 1457983269163,
										1457974490183, 1457965711204,
										1457956932224, 1457948153244,
										1457939374265, 1457930595285,
										1457921816306, 1457913037326,
										1457904258346, 1457895479367,
										1457886700387, 1457877921408,
										1457869142428, 1457860363448,
										1457851584469, 1457842805489,
										1457834026510, 1457825247530,
										1457816468551, 1457807689571,
										1457798910591, 1457790131612,
										1457781352632, 1457772573653,
										1457763794673, 1457755015693,
										1457746236714, 1457737457734,
										1457728678755, 1457719899775,
										1457711120795, 1457702341816,
										1457693562836, 1457684783857,
										1457676004877, 1457667225897,
										1457658446918, 1457649667938,
										1457640888959, 1457632109979,
										1457623331000, ],
								y : [ 41.00, 41.71, 42.40, 43.08, 43.74, 44.38,
										45.02, 45.63, 46.23, 46.82, 47.39, 47.95,
										48.49, 49.02, 49.53, 50.03, 50.51, 50.98,
										51.43, 51.87, 52.29, 52.69, 53.09, 53.46,
										53.82, 54.17, 54.50, 54.82, 55.12, 55.41,
										55.68, 55.94, 56.18, 56.41, 56.62, 56.82,
										57.00, 57.17, 57.32, 57.45, 57.58, 57.68,
										57.78, 57.85, 57.91, 57.96, 57.99, 58.01,
										58.01, 58.00, ],
								type : 'line',
								line : {
									color : 'green'
								}
							}

							var trace10 = {
								x : [ 1458225292000, 1458225286285, 1458225280571,
										1458225274857, 1458225269142,
										1458225263428, 1458225257714,
										1458225252000, 1458225246285,
										1458225240571, 1458225234857,
										1458225229142, 1458225223428,
										1458225217714, 1458225212000,
										1458225206285, 1458225200571,
										1458225194857, 1458225189142,
										1458225183428, 1458225177714,
										1458225172000, 1458225166285,
										1458225160571, 1458225154857,
										1458225149142, 1458225143428,
										1458225137714, 1458225132000,
										1458225126285, 1458225120571,
										1458225114857, 1458225109142,
										1458225103428, 1458225097714,
										1458225092000, 1458225086285,
										1458225080571, 1458225074857,
										1458225069142, 1458225063428,
										1458225057714, 1458225052000,
										1458225046285, 1458225040571,
										1458225034857, 1458225029142,
										1458225023428, 1458225017714,
										1458225012000, ],
								y : [ 30.00, 29.86, 29.71, 29.57, 29.43, 29.29,
										29.14, 29.00, 28.86, 28.71, 28.57, 28.43,
										28.29, 28.14, 28.00, 27.86, 27.71, 27.57,
										27.43, 27.29, 27.14, 27.00, 26.86, 26.71,
										26.57, 26.43, 26.29, 26.14, 26.00, 25.86,
										25.71, 25.57, 25.43, 25.29, 25.14, 25.00,
										24.86, 24.71, 24.57, 24.43, 24.29, 24.14,
										24.00, 23.86, 23.71, 23.57, 23.43, 23.29,
										23.14, 23.00, ],
								type : 'line',
								line : {
									color : 'green'
								}
							}

							var layout = {
								hovermode : 'closest',
								showlegend: false
							}

							/* Plotly.plot('tester', [ trace, trace5, trace6, trace7 ],
									layout, {
										showLink : false,
										displayModeBar : false
									}); */
							Plotly.newPlot('tester', [ trace_left, trace_right,
									trace1, trace2, trace3, trace4, trace5, trace6,
									trace7, trace8, trace9, trace10 ],{
								showLink: false,
								hovermode : 'closest',
								showlegend: false
							}
							, {displayModeBar: false});

						}

					});
				sessionTimeOut(<%=session.getAttribute("SessionTimeOut")%>)
	</script>
</body>
</html>