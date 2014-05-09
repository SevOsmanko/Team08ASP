var current_user, lastactivity;
var global_comment, global_replies;
var g_numofposts = 8;
var lastrefresh = Math.round((new Date()).getTime() / 1000);
var lastrefresh_rep = Math.round((new Date()).getTime() / 1000);
var newreply;
var newid;
var users = ["Anthony", "Ade", "Stuart", "Keelan", "Jonny", "Katy"];



setInterval(function() {
		
	$('.alert_new_posts').load('newposts_check.php', { latestref_p: lastrefresh+1, latestref_r: lastrefresh_rep+1 }, function() {
			if($('.alert_new_posts .new').html() == "New post" || $('.alert_new_posts .new').html() == "New reply") {
				
				if($('.alert_new_posts .new').html() == "New reply") {
				
					newreply = true;
					newid = '#blog' + ($('.alert_new_posts .new').attr('id')).substring(1) + ' .blogcom:last';
					
				} else
					newreply = false;
				$('.alert_new_posts').animate({
					height: 40
				}, 1500 );
				
			}
			
	});
	
	
}, 5000);

setInterval(function() {
	
	if(((Math.round((new Date()).getTime() / 1000) - lastactivity) > 900 )) {	
		$('body').load('logout.php', {timeout: true}, function() {
			window.location.reload();
		});
	}
	
	
}, 5000);

function rebind() {

		$(".comcon textarea").TextAreaExpander(12, 50);

}

var animate;
function anim() {
	
   		$(".new_is_here").animate({"left": "-=50px"}, { queue: true, duration: 500 }).animate({"left": "+=50px"}, { queue: true, duration: 500 });

}

function stopanim() {
	
   		$(".new_is_here").remove();

}

function format(text) {

	var formatted = "<div>";
	var count = 0;
	var tag_counter = 0;
	var list = false;
	
	for(i = 0; i < text.length; i++) {
		if(text[i] == '\n' && !list)
			formatted += "</div><div>";
		else if(text[i] == '\n' && list && text[i-1] == '\n') {
			formatted += "</li></div><div>";
			tag_counter++;
		} else if(text[i] == '~' && !list) {
			formatted += "<ul><li>";
			list = true;
			tag_counter++;
		} else if(text[i] == '~' && list) {
			formatted += "</li><li>";
			tag_counter += 2;
		} else {
			formatted += text[i];
			if(text[i] != ' ') count ++;
		}
	}
	
	if((tag_counter % 2) != 0)
		formatted += "</li>";
		
	if(count > 0 && !list)
		return formatted += "</div>";
	else if(count > 0 && list)
		return formatted += "</ul></div>";
	else
		return "";
		
}

function count(text) {

	var count = 0;
	
	for(i = 0; i < text.length; i++) {
		if(text[i] != '\n' && text[i] != ' ')
			count += 1;
	}
	
	if(count > 0)
		return text;
	else
		return "";
		
}


function showprog() {
	
	$('.infoArea .Head').each( function(){ 

		if($(this).hasClass("Head_hover")){
			
			$(this).find(".progress").hide();

		} else {
			$(this).find(".progress").html($(this).next().find(".pmwprogress").html()+'%');
			$(this).find(".progress").show();
			
		}	  
	});
}

$(document).ready(function() {

	$('#username').focus();
	
	$('body').delegate(".infoArea .Head",  "click", function() {

	if($(this).next(".introArea").is(":hidden")){
			
			$(this).next(".introArea").slideDown();

			$(this).addClass('Head_hover');

		} else {
			
			$(this).next(".introArea").slideUp();
						
			$(this).removeClass('Head_hover');
		}	
	showprog();
	
	});
	

$('body').delegate(".pmwrow",  "click", function(){ 
	lastactivity = Math.round((new Date()).getTime() / 1000);

	if($(this).next().find(".subtask").is(":hidden")){
			$(this).addClass('row_hover').find("img.plus").attr("src", "../images/minussign.png");
			$(this).next().find(".subtask").show();

	} else {
			$(this).removeClass('row_hover').find("img.plus").attr("src", "../images/plussign.png");
			$(this).next().find(".subtask").hide();
			
		}	
	showprog();  
	});

	$('body').delegate(".documentPage table td span",  "mouseover", function(){
	
							$('.documentPage table td span').removeClass('previewHighlight');
							$(this).addClass('previewHighlight');
							
							if($(this).attr('id') == 'i1')
								tswImageCarouselSelectPage('previewWindow',0);
							if($(this).attr('id') == 'i2')
								tswImageCarouselSelectPage('previewWindow',1);
							if($(this).attr('id') == 'i3')
								tswImageCarouselSelectPage('previewWindow',2);
							if($(this).attr('id') == 'i4')
								tswImageCarouselSelectPage('previewWindow',3);
							if($(this).attr('id') == 'i5')
								tswImageCarouselSelectPage('previewWindow',4);
							if($(this).attr('id') == 'i6')
								tswImageCarouselSelectPage('previewWindow',5);
	});

	$('body').delegate(".imgcontainer img",  "mouseout", function(){ $('.popup').hide(); });
	
	$('body').delegate(".alert_new_posts",  "click", function(){ 
	
		$('.mainArea').load('forum.php', {user: current_user, numofposts: g_numofposts}, 
			function() { 
				
				$('.mainArea').load('forum.php', {user: current_user, numofposts: g_numofposts }, 
				function() { 
					lastrefresh = Math.round((new Date()).getTime() / 1000);
					lastactivity = lastrefresh;
					positionarrow();
					rebind();
					animate = self.setInterval(anim, 1000);
					window.setTimeout(stopanim, 8000);
					rebind();
					
				});
		});
		
		$(".alert_new_posts").hide();
		
	});


	$('body').delegate(".r_main .close",  "click", function(){
						var t = $(this).parents('.blogcom').next('.author1').find('span').attr('title');
							
						$($(this).parents('.comcon')).load('reply_db_changes.php', { user: current_user, removerep: true, time: t, commentid: getblogid(this), allreplies: isAllReply(this) }, 
															function() { lastrefresh_rep = Math.round((new Date()).getTime() / 1000); lastactivity = lastrefresh_rep; $('.alert_new_posts .new').remove(); rebind(); });
						
	});
	
	$('body').delegate(".r_main, .closecontainer",  "mouseover", function(){
							if($(this).find('.reply').find('b').html() == current_user)
								$(this).find('img.close').show();
	});
	$('body').delegate(".r_main, .closecontainer",  "mouseout", function() {
							if($(this).find('.reply').find('b').html() == current_user)
								$(this).find('img.close').hide();
	});
	
	$('body').delegate(".c_main",  "mouseover", function(){
							if($(this).find('.membericon').attr('alt') == current_user)
								$(this).find('img.c').show();
	});
	$('body').delegate(".c_main",  "mouseout", function() {
							if($(this).find('.membericon').attr('alt') == current_user)
								$(this).find('img.c').hide();
	});
	
	$('body').delegate(".c_main .close",  "click", function(){
							
						$('.mainArea').load('forum.php', { user: current_user, removecom: true, commentid: getblogid(this), numofposts: g_numofposts }, 
						function(){ 
							
							minposts();
							$('.mainArea').load('forum.php', { user: current_user, numofposts: g_numofposts }, function() { lastrefresh = Math.round((new Date()).getTime() / 1000); lastactivity = lastrefresh; rebind(); }); 
							
						});
						
	});

	$('body').delegate(".comcon textarea",  "click", function(){
		
			if(this.value == "Write a comment...")
				$(this).val('').css('color', '#000');
	});
		
	$('body').delegate(".comcon textarea",  "focusout", function(){
			if(this.value == "" || this.value == "\n")
				$(this).val("Write a comment...").css('color', '#888');
	});
	
	$('body').delegate(".comcon textarea",  "keydown", function(e){
			
				if(e.which == 13 && $(this).val() != "" ){
					
					$($(this).parents('.comcon')).load('reply_db_changes.php', { user: current_user, reply: count($(this).val()), commentid: getblogid(this), allreplies: isAllReply(this) }, 
					
					function(){ lastrefresh_rep = Math.round((new Date()).getTime() / 1000); lastactivity = lastrefresh_rep; $('.alert_new_posts .new').hide(); rebind(); $(e.target).val(''); });
						
        		} else if(e.which == 13 && $(this).val() == "") {
					$(e.target).val('');
					lastactivity = Math.round((new Date()).getTime() / 1000);
				}
				
	});
	
	$('body').delegate(".viewpost",  "mouseover", function(){ $('.viewpost a').css('text-decoration', 'underline'); });
	$('body').delegate(".viewpost",  "mouseout", function() { $('.viewpost a').css('text-decoration', 'none'); });
		
	$('body').delegate("img.close",  "mouseover", function() { $(this).attr('src', 'http://co-project.lboro.ac.uk/team18/images/close_hover.png'); });
	$('body').delegate("img.close",  "mouseout", function() { $(this).attr('src', 'http://co-project.lboro.ac.uk/team18/images/close.png'); });
	
	$('body').delegate(".alert_new_posts",  "mouseover", function() { $('.alert_new_posts').addClass('alert_new_posts_hover'); });
	$('body').delegate(".alert_new_posts",  "mouseout", function() { $('.alert_new_posts').removeClass('alert_new_posts_hover'); });
		
	$('body').delegate(".commentBar textarea",  "click", function(){
		lastactivity = Math.round((new Date()).getTime() / 1000);
			if($(".commentBar textarea").val() == "Write a post...") {
				$(".commentBar textarea").val('').css({'color': '#000', 'height': 60});
				$(".commentBar button").show();
			}
	});
		
	$('body').delegate(".comconhover",  "mouseover", function(){ $(this).find('a').addClass('hover'); });
	$('body').delegate(".comconhover",  "mouseout", function(){ $(this).find('a').removeClass('hover'); } );
	
	$('body').delegate(".comconhover",  "click", function(){ $($(this).parent()).load('reply_db_changes.php', { user: current_user, commentid: getblogid(this), allreplies: true },
													function() { lastrefresh_rep = Math.round((new Date()).getTime() / 1000); lastactivity = lastrefresh_rep;rebind(); }); });
		
	$('body').delegate(".commentBar textarea",  "focusout", function(){
		
			if($(".commentBar textarea").val() == "") {
				$(".commentBar textarea").val("Write a post...").css({'color': '#888', 'height': 14});
				$(".commentBar button").hide();
			}
	});
		
	$('.login-container').delegate("#username, #password",  "keypress", function(e){ if(e.which == 13 ) $('.login-container #submitButton').click(); });
		
	$('body').delegate(".maincomment button",  "click", function(){
	lastactivity = Math.round((new Date()).getTime() / 1000);
			if($('.maincomment textarea').val() != "" ) {
				$('.mainArea').load('forum.php', { user: current_user, comment: format($('.maincomment textarea').val()), allreplies: isAllReply(this), numofposts: g_numofposts }); 
				
			}
	});

	
});

function highlight(id) { 

	$(".documentPage table td span").removeClass('previewHighlight');
	$("#i"+id).addClass('previewHighlight'); 
	
}

function positionarrow() {

	if(newreply) {
		if($(newid).offset() != null)
			$(".new_is_here").addClass('flipped').show().offset({ top :$(newid).offset().top + 10, left :$(newid).offset().left + 400 });
	
	} else
		$(".new_is_here").removeClass('flipped').show().offset({ top :$('.blogs').offset().top + 20, left :$('.blogs').offset().left - $(".new_is_here").width() });
}

function isAllReply(obj) {

	if($(obj).parents('.comcon').find('.comconhover').length == 0)
		return true;
	else
		return false;
	
}

function getblogid(object) { return parseInt(($(object).parents('.blogs').attr('id')).substring(4)); }

function showMembers(){
	
	g_numofposts = 8;
	lastactivity = Math.round((new Date()).getTime() / 1000);
	
	$('.mainArea').load('../HTML/members.html', {user: current_user});

}

function showHome(str){

	if(str != null)	current_user = str;
	
	$('.mainArea').load('forum.php', {user: current_user, numofposts: g_numofposts}, 
		function() { 
			lastrefresh = Math.round((new Date()).getTime() / 1000); rebind();
			lastactivity = lastrefresh;
	});

}

function showRoles(){

	g_numofposts = 8;
	lastactivity = Math.round((new Date()).getTime() / 1000);
	
	$('.mainArea').load('roles.php', {user: current_user},
		function() { subtaskpercent(); calculateSum(); loadProjectoverview(); });
		   
}

function showDoc(){

	g_numofposts = 8;
	lastactivity = Math.round((new Date()).getTime() / 1000);
	
	$('.mainArea').load('../HTML/documents.html', {user: current_user});

}

function showReqCon() {
	
	g_numofposts = 8;
	lastactivity = Math.round((new Date()).getTime() / 1000);
	
	$('.mainArea').load('reqcon.php', {user: current_user});
	
}

function hideAllpreviews(){
	
	$('.previews').hide();
	lastactivity = Math.round((new Date()).getTime() / 1000);
}



function load(numofcoms) {
	g_numofposts = numofcoms + 3;
	
		$('.mainArea').load('forum.php', { user: current_user, numberofcomments: g_numofposts }, function() { lastrefresh = Math.round((new Date()).getTime() / 1000); lastactivity = lastrefresh; rebind(); });
	
	
}

function navbarClick(button){
	
	lastactivity = Math.round((new Date()).getTime() / 1000);
	$('.buttons').removeClass("activeButton");
	$(button).addClass("activeButton");
	
}

function verify() {

	if($("input#username").val() != "" && $("input#password").val() != "") {
		current_user = $("input#username").val();
	} else {
		return false;
	}

}

function calculateSum() {	     

	$(".taskstable").each(function(){
		
		var percentsum = 0;
	 	var sectionprg = 0; 
		var nooftasks  = $(this).find('.pmwrow').length;

	$(this).find(".percentpmw").each(function(){

		percentsum += parseFloat($(this).val());
		
		if(this.value<100){
		
				var close = $(this).closest('tr');
				
				close.css("background-color", "#D5D5D5");
				
				if(current_user == "team18")
					close.click();
				else {
				
					$(this).parents().find(".subtable").find("tr").each(function(){
					
					var pmwrow = $(this).parent().parent().parent().parent().prev();
					
						if($(this).hasClass("hLight")) {
							pmwrow.removeClass('row_hover').find("img").attr("src", "../images/minussign.png");
							pmwrow.next().find(".subtask").show();
						}
						
					});
				}
					
		} else
				$(this).closest('tr').css("background-color", "#FFF");
		
		});
				
		sectionprg = percentsum/nooftasks;

		$(this).parent().parent().find(".pmwprogress").html(sectionprg.toFixed(0));

    });

}

function subtaskpercent(){

	$(".subtable").each(function(){

		var percentsum = 0;
		
		$(this).find(".subtaskpercent").each(function(){
		
			if(this.value < 100) {
				$(this).parent().prev().prev().html('-');
				
				var users_in = $(this).parent().parent().html();
				
				if(users_in.search(current_user) > -1 || current_user == "team18")
					$(this).parent().parent().addClass('hLight').attr("title", "Finished? Upload changes now.");
						
			}
				
			percentsum += parseFloat($(this).val());
				
		});

		var noofsubtasks = $(this).find(".subtaskpercent").length;
		
		sectionprg = percentsum/noofsubtasks;
		$(this).parent().parent().prev().find(".percentpmw").val(sectionprg.toFixed(0));

	});

}	  


function loadProjectoverview(){
	
	var percentsum = 0;
	var i = 0;
	var nooftasks = (".pmwprogress").length;
	var percentweighting = [25, 30, 10, 35]
	
	$(".introArea").each(function(){
	
		$(this).find(".pmwprogress").each(function(){
	
		
			var hello = percentweighting[i];
			i += 1;
		
		percentsum += parseFloat($(this).text()/100)*hello;
		
		});
	
		
	});
	
	$(".projectcomp").html(percentsum.toFixed(0));
	showprog();
}
 

