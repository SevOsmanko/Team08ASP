$(document).ready(function(){
	$('.mainArea').load('discussions.html');

});

function showdiscussion() {
	if ($('.discussion').is(':hidden')) {
		$('.discussion').slideDown();
	}
	else {
		$('.discussion').slideUp();
	}
}

function showforum() {
	if ($('.forum').is(':hidden')) {
		$('.forum').slideDown();
	}
	else {
		$('.forum').slideUp();
	}
}

function showtasks() {
	if ($('.tasks').is(':hidden')) {
		$('.tasks').slideDown();
	}
	else {
		$('.tasks').slideUp();
	}
}

function showmeetings() {
	if ($('.meetings').is(':hidden')) {
		$('.meetings').slideDown();
	}
	else {
		$('.meetings').slideUp();
	}
}

function showreqandcon() {
	if ($('#reqandcon').is(':hidden')) {
		$('#reqandcon').slideDown();
	}
	else {
		$('#reqandcon').slideUp();
	}
}

function showreportA() {
	if ($('#reporta').is(':hidden')) {
		$('#reporta').slideDown();
	}
	else {
		$('#reporta').slideUp();
	}
}

function showreportB() {
	if ($('#reportb').is(':hidden')) {
		$('#reportb').slideDown();
	}
	else {
		$('#reportb').slideUp();
	}
}

function showreportC() {
	if ($('#reportc').is(':hidden')) {
		$('#reportc').slideDown();
	}
	else {
		$('#reportc').slideUp();
	}
}


function navbarClick(button){
	$('.buttons').removeClass("activeButton");
	$(button).addClass("activeButton");
	
}

function UserBar(user){
	$('.User').removeClass("User");
	$(user).addClass("ActiveUser");
}

function showDiscussions(){
	$('.mainArea').load('discussions.html');
}

function showMembers(){
	$('.mainArea').load('members.html');
}

function showProjOverview(){
	$('.mainArea').load('projectOverview.html');
}

function showreqcon(){
	$('.mainArea').load('reqcon.html');
}

function showdocs(){
	$('.mainArea').load('docs.html');
}

function showtts() {
	$('.mainArea').load('Login.aspx');
}

function show_user(a) {
	if(document.getElementById(a).style.display == "block")
		{ 
			document.getElementById(a).style.display = "none"; 
		}
	else 
		{ 
			document.getElementById(a).style.display = "block"; }
	}

function show_developer(a) {
	if(document.getElementById(a).style.display == "none") {
		document.getElementById(a).style.display = "block"; 
	}
	else {
		document.getElementById(a).style.display = "none"; 
	}
}

function show_overview(a) {
	if(document.getElementById(a).style.display == "none") {
		document.getElementById(a).style.display = "block";
	}
	else {
		document.getElementById(a).style.display = "none";
	}
}

function show_pop_up(id, num) {
	var number = num;
	$('#overlay'+number).fadeIn('fast',function(){
		$('#box'+number).removeClass('box');
		$('#box'+number).addClass('box_visible');
		$('#box'+number).animate({'top':'160px'},0);
	});
	$('#boxclose'+number).click(function(){
		$('#box'+number).animate({'top':'-200px'},0,function(){
		$('#box'+number).removeClass('box_visible');
		$('#box'+number).addClass('box');   
		$('#overlay'+number).fadeOut('fast');
		});
	});
}

		$(function(){
			$('#example1').fbWall({ id:'361836277171399',accessToken:'AAAC7gAoWDQ0BAKueol5h4Kg0ZARcRb1ZBQ2HZAhZAM7RRc1llGBnQIQhwbq4w0XhBd4xIj7AZCbFIZBVfYrqZBymDtaSmxMInwZD'});
		});
		
$(document).ready(function() {
 $(".pdf").click(function() {
  $.fancybox({
   'width': '70%', // or whatever
   'height': '90%',
   'autoDimensions': false,
   'content': '<embed src="'+this.href+'#nameddest=self&page=1&view=FitH,0&zoom=80,0,0" type="application/pdf" height="99%" width="100%" />',
   'onClosed': function() {
     $("#fancybox-inner").empty();
   }
  });
  return false;
 }); // pdf 
}); // ready
