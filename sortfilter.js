var mod_code, time, nostudents, pref, weeks, sreq;
var rtype, p, type;
var start;
var results_array = new Array();
var wks = new Array();
var fac = new Array();
var globaldays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
var globalperiods = ["09", "10", "11", "12", "13", "14", "15", "16", "17"];
var globalstatus = ["Allocated", "Amended", "Failed"];

function sortdname() {
	$('.view .round_results').load('sorts.php', { data: results_array}, function() {organised(); completeview();});
}

function sortdcode() {
	$('.view .round_results').load('sorts.php', { dcode: true, data: results_array}, function() {organised(); completeview();});
}

function sortmname() {
	$('.view .round_results').load('sorts.php', { mname: true, data: results_array}, function() {organisem(); completeview();});
}

function sortmcode() {
	$('.view .round_results').load('sorts.php', { mcode: true, data: results_array}, function() {organisem(); completeview();});
}

function nogroup() {

	$('.view .round_results').load('nogroup.php', { mcode:true, data: results_array}, function() {});
}
 
function filterwords(selector, query) {  
  query =   $.trim(query); //trim white space  
  query = query.replace(/ /gi, '|'); //add OR for regex query  
  
  $(selector).each(function() {  
    ($(this).text().search(new RegExp(query, "i")) < 0) ? $(this).hide() : $(this).show();  
  });  
}  

function organised() {
	
	$('.view .taskstable tbody').each(function() {
		var n =0;
		var mods = new Array();
		var tablerows = new Array();
		
		$(this).find('.pmwrow').each(function() {
			var txt = $(this).find('td').next().text();
			
			tablerows[n] = "<tr class='pmwrow'>"+$(this).html()+"</tr><tr>"+$(this).next().html()+"</tr>";
			mods[mods.length] = txt+ ':' + n;
			
			n++
		});
	
		mods = mods.sort();
		
		var string ="";
		
		for(i=0; i < mods.length; i++) {
	
			var row = mods[i].split(':');
		
			for(j=0; j < tablerows.length; j++){
			
				if(j == row[1])
					string += tablerows[j];
			}
		
		}
		$(this).html(string);
	});
	
}

function organisem() {
	
	$('.view .taskstable tbody').each(function() {
		var prevday = "";
		
		$(this).find('.pmwrow').each(function() {
			var thisday = $(this).find('td').next().text();
			
			if(thisday == prevday)
				$(this).remove();
				
			prevday = thisday;
		});
	
	});
	
	
	$('.view .taskstable tbody').each(function() {
		var n =0;
		var days = new Array(5);
		
		$(this).find('.pmwrow').each(function() {
			var txt = $(this).find('td').next().text();
			var index = 0;
			
			for(i=0; i < globaldays.length; i++) {
				if(txt == globaldays[i]+"[]")
					index = i;
			}
				
				
				days[index] = "<tr class='pmwrow'>"+$(this).html()+"</tr><tr>"+$(this).next().html()+"</tr>";
			
			n++
		});
	
		var string ="";
		for(i=0; i < days.length; i++) {
			if(typeof days[i] != 'undefined')
				string += days[i];
		}
		
		$(this).html(string);
	});
	
	
	
	
	
}

function sort_nogrp(by, order, obj, table) {

	if(by == "Module Code")
		sort_str(order, "mc", table);
	if(by == "Module Title")
		sort_str(order, "mt", table);
	if(by == "Time")
		sorttime(order, table);
	if(by == "Preference")
		sort_str(order, "pref", table);
	if(by == "Allocated")
		sort_str(order, "allo", table);
	
}

function sort_str(order, type, table) {

	var array = new Array();
	var tablerows = new Array();
	var n = 0;	
										//row number
	
	$(table + ".taskstable tr").each(function() {
		var txt;
		
		if(type == "allo") var txt = $(this).find('.allo').text();
		if(type == "pref") var txt = $(this).find('.pref').text();
		if(type == "mc") var txt = $(this).find('.mc').text();
		if(type == "mt") var txt = $(this).find('.mt').text();
		var failed ="";
		
		if($(this).hasClass('failed'))
			failed = "failed";
		if($(this).hasClass('failed1'))
			failed = "failed1";
		
		if(txt.length != 0){
			tablerows[n] = "<tr class ='pmwrow "+ failed + "'>" +$(this).html()+"</tr><tr>" + $(this).next().html() + "</tr>";
			array[array.length] = txt+":"+n;
			n++;
		}
	});
	
	$(table + ".taskstable tbody").html(real_stringarraysort(tablerows, array, order));
	
	if(type == "allo") done("Allocated", order, table);
	if(type == "pref") done("Preference", order, table);
	if(type == "mc") done("Module Code", order, table);
	if(type == "mt") done("Module Title", order, table);
	
}

function real_stringarraysort(tablerows, array, order) {
	
	var string = "";
	var aas = array.sort();
	
	if(order == "asc") {
	
		for(i=0; i < aas.length; i++) {
	
			var row = aas[i].split(':');
		
			for(j=0; j < tablerows.length; j++){
			
				if(j == row[1])
					string += tablerows[j];
			}
		
		}
	} else {
	
		for(i=aas.length - 1; i > -1; i--) {
	
			var row = aas[i].split(':');
		
			for(j=0; j < tablerows.length; j++){
			
				if(j == row[1])
					string += tablerows[j];
			}
		
		}
	}
	
	return string;
	
}

function sorttime(order, table) {

	var day_array = [[], [], [], [], []];
	var tablerows = new Array();
	var n = 0;										//row number
	
	$(table + ".taskstable tr").each(function() {
		
		var day = $(this).find('.days').text();
		var p = $(this).find('.periods').text();
		var index = 0;
		var failed ="";
		
		if($(this).hasClass('failed'))
			failed = "failed";
		if($(this).hasClass('failed1'))
			failed = "failed1";
		
		if(day.length != 0){
			tablerows[n] = "<tr class ='pmwrow "+ failed + "'>" +$(this).html()+"</tr><tr>" + $(this).next().html() + "</tr>";
			
			for(i=0; i < globaldays.length; i++) {
				if(day == globaldays[i])
					index = i;
			}
			
			day_array[index][day_array[index].length] = p+":"+n;
			n++;
		}
	});
	
	for(j=0; j < day_array.length; j++) {
		
		day_array[j] = sort_times(day_array[j]);
		
	}
	
	$(table + ".taskstable tbody").html(realtimesort(tablerows, day_array, order));
	done("Time", order, table);
	
}

function sort_times(array) {
	
	var sort = true;
	
	if(array.length != 0) {
		while (sort) {

		sort = false;

			for (i=0; i < array.length-1; i++) {
			
				var time = array[i].split(':');
				var time1 = array[i+1].split(':');
			
				if(time[0] == "09")
					time[0] = 9;
				if(time1[0] == "09")
					time1[0] = 9;
				
				parseInt(time[0]); parseInt(time1[0]);
				
				if (time[0] > time1[0]) {

					var temp = array[i];  
					array[i] = array[i+1];  
					array[i+1] = temp;
				
					sort = true;
            	}

			}
		}
	}

	return array;
	
}

function done(type, order, table) {
	
	$(table + ".taskstable th").each(function() {
		$(this).find("img").remove();
		
		if($(this).text() == type) {
		
		if(table == ".nogroup ") {
			if(order == "asc")
				$(this).html( type + "<img src='../images/wdownarrow.png'/>");
			else
				$(this).html( type + "<img src='../images/wuparrow.png'/>");
		} else {
		
			if(order == "asc")
				$(this).html( type + "<img src='../images/downarrow.png'/>");
			else
				$(this).html( type + "<img src='../images/uparrow.png'/>");
				
		}
			
		}
	});
	
	refilter();
		
}

function sort(by, order, obj) {
	
	if(by == "Preference")
		sortpref_grp(order, obj);
	if(by == "Time")
		sorttime_grp(order, obj);
	if(by == "Allocated Room")
		sortallo_grp(order, obj);
		
		
}

function sortpref_grp(order, obj) {
	
	var pref_array = new Array();
	var tablerows = new Array();
	var n = 0;										//row number
	
	$(obj).parents('.subtable').find('tbody tr').each(function() {
		
		var pref = $(this).find('.pref').text();
		
		
		if(pref.length != 0){
			tablerows[n] = "<tr>" +$(this).html()+"</tr>";
			pref_array[pref_array.length] = pref+":"+n;
			n++;
		}
	});
	
	$(obj).parents('.subtable').find('tbody').html(real_stringarraysort(tablerows, pref_array, order));
	done_grp("Preference", order, obj);
	
}

function sortallo_grp(order, obj) {
	
	var allo_array = new Array();
	var tablerows = new Array();
	var n = 0;										//row number
	
	$(obj).parents('.subtable').find('tbody tr').each(function() {
		
		var allo = $(this).find('.allo').text();
		
		
		if(allo.length != 0){
			tablerows[n] = "<tr>" +$(this).html()+"</tr>";
			allo_array[allo_array.length] = allo+":"+n;
			n++;
		}
	});
	
	$(obj).parents('.subtable').find('tbody').html(real_stringarraysort(tablerows, allo_array, order));
	done_grp("Allocated Room", order, obj);
	
}

function done_grp(type, order, obj) {
	
	$(obj).parents('.subtable').find('th').each(function() {
		$(this).find("img").remove();
	});
	
	$(obj).each(function() {
		
		if($(this).text() == type) {
		
			if(order == "asc")
				$(this).html( type + "<img src='../images/downarrow.png'/>");
			else
				$(this).html( type + "<img src='../images/uparrow.png'/>");
			
		}
	});
		
}

function sorttime_grp(order, obj) {

	var day_array = [[], [], [], [], []];
	var tablerows = new Array();
	var n = 0;	
	var times = new Array();									//row number
	
	$(obj).parents('.subtable').find('tbody tr').each(function() {
		
		var day = $(this).find('.days').text();
		var p = $(this).find('.periods').text();
		var index = 0;
		
		tablerows[n] = "<tr>" +$(this).html()+"</tr>";
		
		if(day.length != 0){
			
			
			for(i=0; i < globaldays.length; i++) {
				if(day == globaldays[i])
					index = i;
			}
			
			day_array[index][day_array[index].length] = p+":"+n;
			
		} else if(p.length != 0){
			times[times.length] = p+":"+n;
		}
		n++;
	});
	
	if(times.length > 0)
		$(obj).parents('.subtable').find('tbody').html(realtimesort1(tablerows, times, order));
	else
		$(obj).parents('.subtable').find('tbody').html(realtimesort(tablerows, day_array, order));
		
	done_grp("Time", order, obj);
	
}

function realtimesort1(tablerows, day_array, order) {
	
		day_array = sort_times(day_array);
	
	var string = "";
	
	if(order == "asc") {
	
		for(i=0; i < day_array.length; i++) {
	
			var row = day_array[i].split(':');
		
				for(k=0; k < tablerows.length; k++){
			
					if(k == row[3])
						string += tablerows[k];
				}	
		}
	} else {
	
		for(i=day_array.length - 1; i > -1; i--) {
	
				var row = day_array[i].split(':');
		
				for(k=0; k < tablerows.length; k++){
			
					if(k == row[3])
						string += tablerows[k];
				}	
		
		}
	
	}
	
	return string;
}


function realtimesort(tablerows, day_array, order) {
	
	for(s=0; s < day_array.length; s++) {
	
		day_array[s] = sort_times(day_array[s]);
		
	}
	
	var string = "";
	
	if(order == "asc") {
	
		for(i=0; i < day_array.length; i++) {
	
			for(j=0; j < day_array[i].length; j++) {
				var row = day_array[i][j].split(':');
		
				for(k=0; k < tablerows.length; k++){
			
					if(k == row[3])
						string += tablerows[k];
				}	
		
			}
		}
	} else {
	
		for(i=day_array.length - 1; i > -1; i--) {
	
			for(j=day_array[i].length - 1; j > -1; j--) {
				var row = day_array[i][j].split(':');
		
				for(k=0; k < tablerows.length; k++){
			
					if(k == row[3])
						string += tablerows[k];
				}	
		
			}
		}
	
	}
	
	return string;
}

function dfilters() {

	var depfilters = new Array;
	
	if($(".leftpanel .depfilts .hiddeps").length != 0) {
		$(".leftpanel .depfilts .hiddeps").each( function() {
		
			depfilters[depfilters.length] = $(this).val();
		});
	}
	return depfilters;
}

function mfilters() {

	var filters = new Array;
	
	if($(".leftpanel .modfilts a").length != 0) {
		$(".leftpanel .modfilts a").each( function() {
		
			filters[filters.length] = $(this).text();
		});
	}
	
	
	return filters;
}

function roomfilters() {

	var filters = new Array;
	
	if($(".leftpanel .roomfilts a").length != 0) {
		$(".leftpanel .roomfilts a").each( function() {
		
			filters[filters.length] = $(this).text();
		});
	}
	
	
	return filters;
}

function refilter() {

	var filters = new Array; 
		
	$(".leftpanel span").each( function() {
		
			if($(this).parent().find('input').attr('checked')) {
				filters[filters.length] = $(this).parent().find("label").html();
			}
		
	});
	
	filter(filters);
		
}

function filter(filters) {

var dfilter = new Array(); var sfilter = new Array(); var pfilter = new Array();
var depfilters = dfilters();
var modfilters = mfilters();
var rfilters = roomfilters();

if(filters.length != 0 || depfilters.length != 0 || modfilters.length != 0 ||  rfilters.length != 0) {

	$('.nogroup .pmwrow').hide();
	
	for(i=0; i < filters.length; i++) {
		for(a=0; a < globaldays.length; a++) {
			if(filters[i] == globaldays[a])
				dfilter[dfilter.length] = filters[i];
		}
		
		for(b=0; b < globalstatus.length; b++) {
		
			if(filters[i] == globalstatus[b])
				sfilter[sfilter.length] = filters[i];
		}
		
		for(c=0; c < globalperiods.length; c++) {
		var start = filters[i].split(':');
		
			if(start[0] == globalperiods[c])
				pfilter[pfilter.length] = start[0];
		}
		
	}

	$('.nogroup .pmwrow').each(function() {
	
		if((statusfilter(this, sfilter) || sfilter.length == 0) && (dayfilter(this, dfilter) || dfilter.length == 0) && (periodfilter(this, pfilter) || pfilter.length == 0) && (departfilter(this, depfilters) || depfilters.length == 0) && (modulefilter(this, modfilters) || modfilters.length == 0) && (rmfilter(this, rfilters) || rfilters.length == 0))
			$(this).show();
	
	});
	
	
	
} else 
	$('.nogroup .pmwrow').show();
	
}

function rmfilter(obj, rmfilters) {

	var factor = false;
	
		for(i=0; i < rmfilters.length; i++) {
			
			var pref = $(obj).find('.pref').text();
			var allo = $(obj).find('.allo').text();
			
				if(pref == rmfilters[i] || allo == rmfilters[i] )
					factor = true;	
				
		}
	
	if(factor)
		return true;
	else
		return false;
	
}

function modulefilter(obj, mfilters) {

	var factor = false;
	
		for(i=0; i < mfilters.length; i++) {
	
			var modules = mfilters[i].split(" [");
			var mt = modules[0];
			
			var modtitle = $(obj).find('.mt').text();
			
				if(modtitle == mt)
					factor = true;	
				
			
		}
	
	if(factor)
		return true;
	else
		return false;
	
}

function departfilter(obj, depfilters) {

	var factor = false;
	
		for(i=0; i < depfilters.length; i++) {
	
			var modcode = $(obj).find('.mc').text();
			var depcode = modcode.substring(0, 2);
			
				if(depfilters[i] == depcode)
						factor = true;	
				
			
		}
	
	if(factor)
		return true;
	else
		return false;
	
}

function statusfilter(obj, sfilter) {

	var factor = false;
	
		for(i=0; i < sfilter.length; i++) {
	
			
			
				if(sfilter[i] == "Allocated"){
					if(!$(obj).hasClass('failed') && !$(obj).hasClass('failed1'))
						factor = true;	
				}
				
				if(sfilter[i] == "Amended"){
					if($(obj).hasClass('failed1'))
						factor = true;
				}
			
				if(sfilter[i] == "Failed"){
					if($(obj).hasClass('failed')) 
						factor = true;
				}
			
		
		}
	
	if(factor)
		return true;
	else
		return false;
	
}

function showfilters(type) {

	if(type == "None") {
		$('.round_results').animate({width: "76%"}, 'fast');
		$('.leftpanel').show("slide");
		/*$('.leftpanel .methods').next().slideDown();
		$('.leftpanel .methods').find('img').attr("src", "../images/downarrow.png");*/
		
	} else {
		$('.leftpanel').hide("slide")
			$('.round_results').animate({width: "98%"}, 'slow');
		
		/*$('.leftpanel .methods').next().slideUp();
		$('.leftpanel .methods').find('img').attr("src", "../images/rightarrow.png");*/
		
	}
	
}

function periodfilter(obj, pfilter) {

	var factor = false;
		
		for(i=0; i < pfilter.length; i++) {
			
			
				for(j=0; j < globalperiods.length; j++) {
					var start = ($(obj).find('.periods').text()).split(':');
					
					if(pfilter[i] == globalperiods[j] && start[0] == globalperiods[j])
						factor = true;
				}
			
		
		}
	
	if(factor)
		return true;
	else
		return false;
	
}

function dayfilter(obj, dfilter) {

	var factor = false;
	
		for(i=0; i < dfilter.length; i++) {
	
			
				for(j=0; j < globaldays.length; j++) {
			
					if(dfilter[i] == globaldays[j] && $(obj).find('.days').text() == globaldays[j])
						factor = true;
				}
			
		
		}	
	
	if(factor)
		return true;
	else
		return false;
	
}


function loadlistview() {

	$.get("populate_results.php", {collectdata: true}, function(data) { 
           results_array = data;

    }, "json");

	$('.view').load('listview.php', {mcode:true, data: results_array}, function() {
	
		nogroup();

	});
}

function completeview() {

		$('.view .pmwrow td:nth-child(4)').each( function() {
			$(this).html('[' + $(this).parent().next().find('.subtable').find('tbody').find("tr").length + ']');
		});
		
		$('.view .subtable td:nth-child(2)').each( function() {
			if($(this).html() == "<i>(1,2,3,4,5,6,7,8,9,10,11,12)</i>") 
				$(this).html("<i>(Semester One)</i>")
		});
		
		$('.view .subtable td').each( function() {
		
			if($(this).hasClass('failed')) {
				$(this).parent().addClass('failed');
				$(this).parents('table').parents('tr').prev().addClass('failed');
			}
				
		});

}

