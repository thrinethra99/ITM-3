
<div id="thread_info_modal" class="modal">
	<div class="modal-content" style="pointer-events: none;">
		<h4>Thread info</h4>
		<div class="input-field col s12">
			<input id="thread_name" type="text" class="validate"> <label
				for="thread_name">Name/focus:</label>
		</div>
		<div>keyWords :</div>
		<div class="chips chips-placeholder" id="thread_keywords"></div>

		<div class="input-field col s12">
			<input id="key_resource" type="text" class="validate"> <label
				for="key_resource">Key resource (books/websites/videos) we
				may use</label>
		</div>

		<p>This thread contributes to the following wondering area(s):</p>
		<div id="wondering_area"></div>
	</div>
	<div class="modal-footer">
		<span><a style="margin-left: 10px; margin-right: 16px;"
			class="modal-trigger modal-close waves-effect waves-green btn "
			href="#!">Close</a></span> <span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#!"
			id="thread_edit_btn" data-mode="edit"
			class="waves-effect waves-green btn">Edit</a>
		</span>


	</div>
</div>
<script src="../../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	
	
	$("#thread_edit_btn").click(function(){
		if($("#thread_edit_btn").data("mode")=="edit"){
			$("#thread_info_modal .modal-content").removeAttr("style");
			$("#thread_edit_btn").html("Save")
			$("#thread_edit_btn").data("mode","save");
		}else{
			
		
			var keywords = $('#thread_keywords').material_chip('data')
			var keyword = "";
			for(var i in keywords){
				keyword=keyword+keywords[i].tag+","
			}
			var threadInfo = {
					"database" :'<%=session.getAttribute("localdb")%>' ,
					"token" : '<%=session.getAttribute("token")%>',
					"threadid" :<%=session.getAttribute("threadid")%>,
					"threadfocus":$("#thread_name").val(),
					"authorid":'<%=session.getAttribute("id")%>',
					"mtime":new Date(),
					"resource":$("#key_resource").val(),
					"keywords":keyword
			}
				$.ajax({
							url :  "/WSG/thread/update",
							type : "POST",
							data : JSON.stringify(threadInfo),
							dataType : "json",
							success : function(data, textStatus,jqXHR) {
								location.reload(true);								
								}
							})
			
		}
		
		
	})
	
	
	function showThreadInfo(){
		// get thread info 
		
		var projectdata = {
				"database" :'<%=session.getAttribute("localdb")%>' ,
				"token" : '<%=session.getAttribute("token")%>',
				  'sid' :<%=session.getAttribute("cross_threadid")%>
	};
		$.ajax({
			url :  "/WSG/supertalk/get",
			type : "POST",
			data : JSON.stringify(projectdata),
			dataType : "json",
			success : function(data, textStatus, jqXHR) {
				var json = $.parseJSON(data.obj);
				console.log(json);
				if (null != json) {

					$("#thread_name").val(json[0].threadfocus);
					$("#key_resource").val(json[0].resources);

					var words = [];
					var kword = null
					if (json[0].keywords) {
						kword = json[0].keywords.split(',')
					}

					for ( var i in kword) {
						if (kword[i] != "") {
							words.push({
								tag : kword[i]
							})
						}

					}

					$('.chips-placeholder').material_chip({
						placeholder : 'Enter a keyword',
						secondaryPlaceholder : '+Keyword',
					});
					if (words.length != 0) {
						$('.chips-placeholder').material_chip({
							data : words
						});

					}

					$("#thread_info_modal").modal("open");
					Materialize.updateTextFields();
				}
			}
		})

		/*$.ajax({
			url :  "/WSG/thread/wondering_area/get",
			type : "POST",
			data : JSON.stringify(projectdata),
			dataType : "json",
			success : function(data, textStatus, jqXHR) {
				var json = $.parseJSON(data.obj);
				console.log(json);
				if (null != json) {
					var html = "<ul class='collection'>";
					for ( var i in json) {
						html += "<li  class='collection-item'>" + json[i].name
								+ "</li>"
					}
					html += "</ul>";
					$("#wondering_area").html(html)
				}
			}
		})*/

	}
</script>