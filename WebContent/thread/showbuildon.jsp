<script>

function show_buildon(){
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
			var x1=[];
			var x2=[];
			var y1=[];
			var y2=[];
		 
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
					buildonallids.push(realdatanoteid[from_id]);
					buildonallids.push(realdatanoteid[to_id]);
					buildonfromtoid.push(realdatanoteid[from_id]+"@#$"+realdatanoteid[to_id]);
					
					var x0=realdatatime_left[from_id];
					var date_x0 = new Date(x0); 
					var milliseconds_x0 = date_x0.getTime(); 
					
					var x1=realdatatime_left[to_id];
					var date_x1 = new Date(x1); 
					var milliseconds_x1 = date_x1.getTime(); 
					
					var y0 = realdataweight_left[from_id];
					var y1 = realdataweight_left[to_id];
					
					
					x1[i]=milliseconds_x0;
					x2[i]=milliseconds_x1;
					y1[i]=y0;
					y2[i]=y1;
					
					
					var max = 255;
			        var min = 10;
			        var green = Math.floor(Math.random() * (max - min + 1)) + min;
					var color = 'hsl(' + green + ', ' + 99 + '%, ' + 65 + '%)';
					
					/* var trace_arrow = {
					x : [milliseconds_x1],
					y : [y1],
					text : [realdatatitle_to],
					mode : 'text',
					type : 'scatter',
					textposition : 'right',
					marker : {
						size : 8,
						color : color
					},
					textfont: {
						size: 10,
					    color: color
					 },
					 hoverinfo:'none',
					 hovermode: 'closest'
				} */
			
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
				
			
				Plotly.update(TESTER,
						
						final_buildon_trace,layout
				
				);
				
				}
						
			
			else{
				$('#showbuildon').attr('checked', true);  
			}
			
		}
	});
}

</script> 