<script>

function show_highlight(){
	var highlightdata = {
		"database" :'<%=session.getAttribute("localdb")%>',
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
				var json = $.parseJSON(data.obj);
				
				if(json.length<20){
					var tester_height= 800
					$("#tester").height(tester_height);
				}
				else{
				var tester_height= json.length*23;
				$("#tester").height(tester_height);
				}
				
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
				for(var m=0;m<json.length;m++){
					realdatatitle_highlighted1.push(json[m].title+"@#$"+parseInt(m)); 
					realdatatitle_highlighted.push(json[m].title); 
					
					var x0=json[m].create_time;
					var date_x0 = new Date(x0);
					realdatacreatedtime_highlighted.push(date_x0);
					timeforxaxisrange_highlighted.push(date_x0);
					realdataauthor_highlighted.push(json[m].first_name +" "+json[m].last_name+"@#$"+parseInt(m));
					realdataauthor_highlighted1.push(json[m].first_name +" "+json[m].last_name);
					realdataweight_highlighted.push(parseInt(m));
					realdatanoteid_highlighted.push(json[m].note_id+"@#$"+parseInt(m));
					content = json[m].content;
					if(content != null){
						cleanText = content.replace(/<\/?[^>]+(>|$)/g, "").replace(/\&nbsp;/g, '');
						realdatacontent_highlighted.push(cleanText+"@#$"+parseInt(m));
						
					}
				}
				
				var trace_left_highlighted = {
					x : realdatacreatedtime_highlighted,
					y : realdataweight_highlighted,
					text : realdatatitle_highlighted,
					mode : 'markers+text',
					type : 'scatter',
					textposition : 'left',
					marker : {
						size : 10,
						color : 'blue'
					},
					hoverinfo: 'x+text'
				};
				
				var start_date = timeforxaxisrange_highlighted.sort()[0];
				 var date = new Date(start_date);
				 var milliseconds_start_date_highlighted = (date.getTime()); 
				 
				 var end_date = timeforxaxisrange_highlighted.sort()[timeforxaxisrange_highlighted.length-1]; 
				 var date1 = new Date(end_date);
				 var milliseconds_end_date_highlighted = (date1.getTime()); 
				 
				 var all_shapes_highlighted = [];
				var range_yaxis2_highlight = [];
				var uniqueAuthors = [];
				 $.each(realdataauthor_highlighted1, function(i, el){
				     if($.inArray(el, uniqueAuthors) === -1) uniqueAuthors.push(el);
				 });
				 for(var i=0; i<uniqueAuthors.length;i++){
					 
					 var y0 = +realdataauthor_highlighted1.indexOf(uniqueAuthors[i])-0.5;
					 range_yaxis2_highlight.push(realdataauthor_highlighted1.indexOf(uniqueAuthors[i]));
					 
					 var y1 = +realdataauthor_highlighted1.indexOf(uniqueAuthors[i+1])-0.5;
					 temp_y1 = +realdataauthor_highlighted1.indexOf(uniqueAuthors[i+1]);
					
					 if(y1==-1.5){
						 y1=realdataauthor_highlighted1.length;
					 }
					 if(temp_y1==-1){
						 temp_y1 = +realdataauthor_highlighted1.length;
					 }
					 range_yaxis2_highlight.push(temp_y1);
					 
					 if(i % 2 == 0){
						 stripeColor = stripes_colors[0];
					 }
					 else{
						 stripeColor = stripes_colors[1];
					 }
					 
					 var shape = "shape"+""+i;
					 shape = {
						type: 'rect',
					    xref: 'x',
					    yref: 'y',
					    x0: milliseconds_start_date-(10*24*60*60*1000),
					    x1: milliseconds_end_date+(2*24*60*60*1000),
					    y0: y0,
					    y1: y1,
					    fillcolor: stripeColor,
					    opacity: 0.1,
					    line: {
					    	color: "white",
					    	width: 1
					        }
					    }
					 all_shapes_highlighted.push(shape);
					 
					 var trace = "trace"+""+i;
					 trace = {
							 x: [milliseconds_end_date+2.5*24*60*60*1000, milliseconds_end_date+2.5*24*60*60*1000],
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
					 
					 all_yaxis2_traces_highlighted.push(trace); 
					 
				 }
				 var tempdata_highlighted = [trace_left_highlighted];
				 var data_highlight = tempdata_highlighted.concat(all_yaxis2_traces_highlighted);
				title_highlighted = "You have " +realdataweight_highlighted.length+" highlighted note(s) by " +uniqueAuthors.length+ " author(s)."
				Plotly.newPlot(TESTER, data_highlight, {
					title: title_highlighted,
					shapes: all_shapes_highlighted,
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
						range: [-0.5, realdataweight_highlighted.length]
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
						
						for(var m=0;m<realdatatitle_highlighted1.length;m++){
							if(realdatatitle_highlighted1[m].split('@#$')[1]==i){
								finalDataTitle=realdatatitle_highlighted1[m].split('@#$')[0];
							}
						}
						for(var m=0;m<realdataauthor_highlighted.length;m++){
							if(realdataauthor_highlighted[m].split('@#$')[1]==i){
								finalDataAuthor=realdataauthor_highlighted[m].split('@#$')[0];
							}
						}
						for(var m=0;m<realdatacontent_highlighted.length;m++){
							if(realdatacontent_highlighted[m].split('@#$')[1]==i){
								finalDataContent=realdatacontent_highlighted[m].split('@#$')[0];
							}
						}
						for(var m=0;m<realdatanoteid_highlighted.length;m++){
							if(realdatanoteid_highlighted[m].split('@#$')[1]==i){
								finalDataNoteId=realdatanoteid_highlighted[m].split('@#$')[0];
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
						
						
						data_note_id = +finalDataNoteId;
						$("#note_open_id").val(finalDataNoteStrId);
						checkHighlight(finalDataContent, data_note_id);
					}
				});
				
			}
			else{
				showHighlight=false;
				 $("#showbuildon").attr("disabled", false);
				 $("#showtitle").attr("disabled", false);
				 $("#showauthor").attr("disabled", false);
				$('#showbuildon').attr('checked', true);
				 $('#showtitle').attr('checked', true);
				 $('#showauthor').attr('checked', false);
				 $("#highlight").removeClass('showed');
				 $("#highlight").prop('checked',false);
				 Materialize.toast('No highlighted note(s) found for this thread!', 3000); 
			}
			
		}
	});
}

</script>