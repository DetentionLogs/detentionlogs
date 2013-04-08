
 	   moment().format();
	   var first_day = moment("<%= params[:date_first] %>") 
		console.log(first_day)
		$(document).ready(function(){

			
		    $(".summary-text").each(
				
				function(){
					
					var summary_text = $(this).html();

					summary_text = summary_text.replace(/s\.\s*47F\(1\)/g, "<span style='background-color:#DDD;padding:3px 4px 4px 3px; font-size:11px;border:1px solid #ccc;cursor: help;' class='section-47'>s.&nbsp;47F(1)</span>");
				
					$(this).html(summary_text);
				})
			
			
		});
		
	  var m_names = new Array("January", "February", "March", 
	  "April", "May", "June", "July", "August", "September", 
	  "October", "November", "December"); 
	  
	  
	  if (!Date.prototype.toISOString) {
	      Date.prototype.toISOString = function() {
	          function pad(n) { return n < 10 ? '0' + n : n }
	          return this.getUTCFullYear() + '-'
	              + pad(this.getUTCMonth() + 1) + '-'
	              + pad(this.getUTCDate()) + 'T'
	              + pad(this.getUTCHours()) + ':'
	              + pad(this.getUTCMinutes()) + ':'
	              + pad(this.getUTCSeconds()) + 'Z';
	      };
	  }
	  
	  
	  var weekday=new Array(7);
	  weekday[0]="Sunday";
	  weekday[1]="Monday";
	  weekday[2]="Tuesday";
	  weekday[3]="Wednesday";
	  weekday[4]="Thursday";
	  weekday[5]="Friday";
	  weekday[6]="Saturday";
	  
	  var start_date;
	  var end_date;
	  function get_nth_suffix(date) {
	     switch (date) {
	       case 1:
	       case 21:
	       case 31:
	          return 'st';
	       case 2:
	       case 22:
	          return 'nd';
	       case 3:
	       case 23:
	          return 'rd';
	       default:
	          return 'th';
	     }
	   }
	   
	  	
	    $(function() {
			
			
			
  	      $( "#slider_start" ).draggable({containment: 'parent', drag: setDates});
  	      $( "#slider_end" ).draggable({containment: 'parent', drag: setDates});
		  var start_date_string;
		  var end_date_string;
		  var start_date_val;
		  var end_date_val;
		  var start_range;
		  var end_range;
		function setDates() {
			
			var date_string = "dddd, MMMM Do YYYY";	
			
			var slider_one_position = parseInt($("#slider_start").css("left"), 10);
			var slider_two_position = parseInt($("#slider_end").css("left"), 10);
				
			var first_day_of_set = moment("Aug 25, 2010") ;
			 start_range = first_day_of_set.add('days', slider_one_position);
		
			var first_day_of_set = moment("Aug 25, 2010") ;	
			 end_range = first_day_of_set.add('days', slider_two_position);	
		
			start_date_string = start_range.format(date_string);
			
			end_date_string = end_range.format(date_string);
			
			start_date_val = start_range.format("YYYY-MM-DD") 
			end_date_val = end_range.format("YYYY-MM-DD") 
			setDateString() 
			 

			 if(start_range.diff(end_range) < 1) {
			 	$('#in_between').css("left", (parseInt($("#slider_start").css("left"), 10) + 5) + "px");
				width_of_element = (parseInt($("#slider_end").css("left"), 10) - parseInt($("#slider_start").css("left"), 10) - 5) + "px";
				$('#in_between').css("width", width_of_element); 
				
			 }
			 
			 else {
 			 	$('#in_between').css("left", (parseInt($("#slider_end").css("left"), 10) + 5) + "px");
 				width_of_element = (parseInt($("#slider_start").css("left"), 10) - parseInt($("#slider_end").css("left"), 10) - 5) + "px";
 				$('#in_between').css("width", width_of_element); 
			 }
			 
		}
		
		var first_day_of_set = moment("Aug 25, 2010") ;
		
		start_day = moment("<%= params[:date_first] %>")
		$("#slider_start").css("left", start_day.diff(first_day_of_set, 'days'));
		
		end_day = moment("<%= params[:date_second] %>")
		$("#slider_end").css("left", end_day.diff(first_day_of_set, 'days'));
		
		
					
		function setDateString()
		{
			
			if(start_range.diff(end_range) > 1) {
		
				$("#date_first").val(end_date_val );
				$("#date_second").val(start_date_val);
			$( "#date_counter").html("From " + end_date_string + "\n until " +  start_date_string)} 
			else if (start_date_string==end_date_string){$( "#date_counter").text("On " + start_date_string)
			$("#date_first").val(start_date_val);
			$("#date_second").val(end_date_val);
		} 
			else {
				$("#date_first").val(start_date_val);
				$("#date_second").val(end_date_val);
			 $( "#date_counter").html("From " + start_date_string + "\n until " + end_date_string);}
		}
		
		
	   	setDates() 
		
		var locations = "<%= params[:location] %>";
		var locations_array = locations.split(',');
		
		for(i = 0; i < locations_array.length; i++)
		{
			$("#location-list li:contains('" + locations_array[i] + "')").addClass("selected")
		}
		
		iterateOverLocationList()		
		
		$("#location-list li").click(function()  {
		
			if($(this).hasClass("selected")) {$(this).removeClass("selected")}
			else {$(this).addClass("selected")}
			iterateOverLocationList()	

	})
	
	function iterateOverLocationList() {
		var selector_array = [];
		$("#location-list li").each(function() {if($(this).hasClass("selected")){selector_array.push($(this).html())} });
		var list_of_locations_string = selector_array.join(", ");
		$("#location-input").val(selector_array.join(","));
		if(selector_array.length == 1)
		{
		$(".center-filter .current").html(selector_array[0]);
		}
		else if (selector_array.length == 0){
		$(".center-filter .current").html("None selected");			
		}
		else
		{
		$(".center-filter .current").html(selector_array.length + ' selected');
		}
	}
	
	
	var incident_types = "<%= params[:incident] %>";
	var incident_types_array = incident_types.split(',');
	
	for(i = 0; i < incident_types_array.length; i++)
	{
		$("#incident-list li:contains('" + incident_types_array[i] + "')").addClass("selected")
	}
	
	iterateOverIncidentList()		
	
	$("#incident-list li").click(function()  {
	
		if($(this).hasClass("selected")) {$(this).removeClass("selected")}
		else {$(this).addClass("selected")}
		iterateOverIncidentList()	

})

function iterateOverIncidentList() {
	var selector_array = [];
	$("#incident-list li").each(function() {if($(this).hasClass("selected")){selector_array.push($(this).html())} });
	var list_of_incident_string = selector_array.join(", ");
	$("#incident-input").val(selector_array.join(","));
	if(selector_array.length == 1)
	{
	$(".incident-filter .current").html(selector_array[0]);
	}
	else if (selector_array.length == 0){
	$(".incident-filter .current").html("None selected");			
	}
	else
	{
	$(".incident-filter .current").html(selector_array.length + ' selected');
	}
}
	
	
	
	var level_types = "<%= params[:level] %>";
	var level_types_array = level_types.split(',');
	
	for(i = 0; i < level_types_array.length; i++)
	{
		$("#level-list li:contains('" + level_types_array[i] + "')").addClass("selected")
	}
	
	iterateOverLevelList()		
	
	$("#level-list li").click(function()  {
	
		if($(this).hasClass("selected")) {$(this).removeClass("selected")}
		else {$(this).addClass("selected")}
		iterateOverLevelList()	

})

function iterateOverLevelList() {

	var selector_array = [];
	$("#level-list li").each(function() {	console.log("Here"); if($(this).hasClass("selected")){selector_array.push($(this).html())} });
	var list_of_level_string = selector_array.join(", ");
	$("#level-input").val(selector_array.join(","));
	if(selector_array.length == 1)
	{
	$(".level-filter .current").html(selector_array[0]);
	}
	else if (selector_array.length == 0){
	$(".level-filter .current").html("None selected");			
	}
	else
	{
	$(".level-filter .current").html(selector_array.length + ' selected');
	}
}
})


