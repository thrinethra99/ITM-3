
<div id="thread_info_modal" class="modal">
	<input id ="thread_id" type="hidden">
	<div class="modal-content" style="pointer-events: none;">
		<h4>Thread info</h4>
		<div class="input-field col s12">
			<input id="thread_name" type="text" class="validate"> <label
				for="thread_name">Name/focus:</label>
		</div>
		<div>key words :</div>
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
			href="#!">Close</a></span>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#!"
			id="thread_del_btn"  style="margin-left: 10px;"
			class="waves-effect waves-green btn">Delete</a>
			
		</span>
		<span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#!"
			id="thread_edit_btn" data-mode="edit"  style="margin-left: 10px;"
			class="waves-effect waves-green btn">Edit</a>
			
		</span>
 		


	</div>
</div>
<script type="text/javascript">
	$("#thread_del_btn").click(function(){
		if("<%=session.getAttribute("role")%>"!="2"&&"<%=session.getAttribute("role")%>"!="3"){
			Materialize.toast('Please contact teacher to delete this thread !', 3000); 
			return
		}
		var threadInfo = {
				"database" :'<%=session.getAttribute("localdb")%>' ,
				"token" : '<%=session.getAttribute("token")%>',
				"threadid" :$("#thread_info_modal #thread_id").val(),
				"projectid" : <%=session.getAttribute("projectid")%>
		}
			$.ajax({
						url :  "/WSG/project/thread/del",
						type : "POST",
						data : JSON.stringify(threadInfo),
						dataType : "json",
						success : function(data, textStatus,jqXHR) {
							location.reload(true);		
							}
						})
		
	})
	
	$("#thread_edit_btn").click(function(){
		if("<%=session.getAttribute("role")%>"!="2"&&"<%=session.getAttribute("role")%>"!="3"){
			Materialize.toast('Please contact teacher to edit this thread !', 3000); 
			return
		}
		
		if( $('#wondering_area input:checked').val()!="on"){
			Materialize.toast('Please select a wondering area !', 3000);
			return
		}
		if($("#thread_edit_btn").data("mode")=="edit"){
			$("#thread_info_modal .modal-content").removeAttr("style");
			$("#thread_edit_btn").html("Save")
			$("#thread_edit_btn").data("mode","save");
		}else{
			
			//  update thread info
			var keywords = $('#thread_info_modal #thread_keywords').material_chip('data')
			var keyword = "";
			for(var i in keywords){
				keyword=keyword+keywords[i].tag+","
			}
			
			var threadInfo = {
					"database" :'<%=session.getAttribute("localdb")%>' ,
					"token" : '<%=session.getAttribute("token")%>',
					"threadid" :$("#thread_info_modal #thread_id").val(),
					"threadfocus":$("#thread_info_modal #thread_name").val().replace(/'/g,"\\\'").replace(/"/g,"\\\""),
					"authorid":'<%=session.getAttribute("id")%>',
					"mtime":new Date(),
					"resource":$("#thread_info_modal #key_resource").val().replace(/'/g,"\\\'").replace(/"/g,"\\\""),
					"keywords":keyword.replace(/'/g,"\\\'").replace(/"/g,"\\\"")
			}
				$.ajax({
							url :  "/WSG/thread/update",
							type : "POST",
							data : JSON.stringify(threadInfo),
							dataType : "json",
							success : function(data, textStatus,jqXHR) {
														
								}
							})
							
		  // delete thread wondering area relationship
		  $.ajax({
				url :  "/WSG/thread/wondering/del/threadid",
				type : "POST",
				data : JSON.stringify(threadInfo),
				dataType : "json",
				success : function(data, textStatus,jqXHR) {
					 // add new thread wondering area relationship
					addThreadWonderingAreaRelationship()
					}
				})
		 
		  
			$("#thread_edit_btn").data("mode","save");
		}
		
		
	})
	
	
	function addThreadWonderingAreaRelationship(){
		 
		 $('#wondering_area input:checked').each(function(e) {
				var wid=$(this).data("id");
				var wname=$(this).val(); 
				var thread_w_json = {
				"database" :localdb ,
				"token" : token,
				"threadid":$("#thread_info_modal #thread_id").val(),
				"areaid" : wid
				};

				$.ajax({
					url : "/WSG/thread/wondering/add",
					type : "POST",
					data : JSON.stringify(thread_w_json),
					dataType : "json",
					success : function(data, textStatus,jqXHR) {
						 // add new thread wondering area relationship
						}
				})
			})
			
			location.reload(true);		
		
		
	}
	
	function showThreadInfo(threadid){
		// get thread info 
		threadid=$.trim(threadid)
		if(threadid!=""){
			$("#thread_info_modal #thread_id").val(threadid)
		}
		var projectdata = {
				"database" :'<%=session.getAttribute("localdb")%>' ,
				"token" : '<%=session.getAttribute("token")%>',
			   "threadid" :threadid
		};
		$.ajax({
			url :  "/WSG/thread/get",
			type : "POST",
			data : JSON.stringify(projectdata),
			dataType : "json",
			success : function(data, textStatus, jqXHR) {
				var json = $.parseJSON(data.obj);
				console.log(json);
				if (null != json) {

					$("#thread_info_modal #thread_name").val(json[0].threadfocus);
					$("#thread_info_modal #key_resource").val(json[0].resources);

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
		
		

		$.ajax({
			url :  "/WSG/thread/wondering_area/get",
			type : "POST",
			data : JSON.stringify(projectdata),
			dataType : "json",
			success : function(data, textStatus, jqXHR) {
				var json = $.parseJSON(data.obj);
				console.log(json);
				if (null != json) {
					initWondering_area_in_thread_info(json)
				}
			}
		})

	}
	
	
	function initWondering_area_in_thread_info(d){
		///wondering_area/get
		var userdata = {
			"database" : '<%=session.getAttribute("localdb")%>',
			"token" : '<%=session.getAttribute("token")%>',
			"pid" : <%=session.getAttribute("projectid")%>
		};
		$.ajax({
			url :  "/WSG/wondering_area/get/byprojectid",
			type : "POST",
			data : JSON.stringify(userdata),
			dataType : "json",
			success : function(data, textStatus, jqXHR) {
				var json = $.parseJSON(data.obj);
				if(null!=json){
					$("#thread_info_modal #wondering_area").text(" ");
					for (var i = 0; i < json.length; i++) {
						if(json[i].status=="accepted"){
							var isSelected = false;
							for ( var j in d) {
									if(json[i].name==d[j].name){
										isSelected = true;
										break;
									}						
							}
							
							if(isSelected){
								var p = '<p><input type="checkbox" checked="checked"  data-id="'+json[i].id+'" id="wf_thread_info'+json[i].id+'" /><label for="wf_thread_info'+json[i].id+'">'+json[i].name+'</label></p>';
								$("#thread_info_modal #wondering_area").append(p);
							}
							else{
								var p = '<p><input type="checkbox" data-id="'+json[i].id+'" id="wf_thread_info'+json[i].id+'" /><label for="wf_thread_info'+json[i].id+'">'+json[i].name+'</label></p>';
								$("#thread_info_modal #wondering_area").append(p);
							}
						}
						
					}
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR.responseText);
			}
		});
	}
	
</script>