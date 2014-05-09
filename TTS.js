
$(document).ready(function () {

    $("img[rel]").overlay();
  
       
});

function enablemodgrid() {
    $('.mod_pic').empty();
    $('.mod_pic').append('<img src="Pictures/-.png" id="plusimg" alt="" style="width:30px; height:30px;" onmousedown="disablemodgrid();"/>');
    $('#nmc').attr("Enabled", "true");
    $('#nmt').attr("Enabled", "true");
    $('#addmodbtn').attr("Enabled", "true");
}

function disablemodgrid() {
    $('.mod_pic').empty();
    $('.mod_pic').append('<img src="Pictures/+.png" id="minusimg" alt="" style="width:30px; height:30px;" onmousedown="enablemodgrid();"/>');
    $('#nmc').attr("Enabled", "false");
    $('#nmt').attr("Enabled", "false");
    $('#addmodbtn').attr("Enabled", "false");
}


function addmodule() {
    var newmodcode = $('#nmc').val();
    var newmodtitle = $('#nmt').val();
    alert("Module Added!");
}



function showFailed() {
    if ($('.failed').is(':hidden')) {
        $('.failed').slideDown();
    }
    else {
        $('.failed').slideUp();
    }
}
function showSearch() {
    if ($('.searchroom').is(':hidden')) {
        $('.searchroom').slideDown();
    }
    else {
        $('.searchroom').slideUp();
    }
}

function showRound_Result() {
    if ($('.r_result').is(':hidden')) {
        $('.r_result').slideDown();
    }
    else {
        $('.r_result').slideUp();
    }
}

function showRound_Result2() {
    if ($('.r_result').is(':hidden')) {
        $('.r_result').slideDown();
    }
    else {
        $('.r_result').slideUp();
    }
}

function showPending() {
    if ($('.pending').is(':hidden')) {
        $('.pending').slideDown();
    }
    else {
        $('.pending').slideUp();
    }
}

function showAllocated() {
    if ($('.allocated').is(':hidden')) {
        $('.allocated').slideDown();
    }
    else {
        $('.allocated').slideUp();
    }
}

function showCancelled() {
    if ($('.cancelled').is(':hidden')) {
        $('.cancelled').slideDown();
    }
    else {
        $('.cancelled').slideUp();
    }
}

function change_to_purple() {
    $('#alloc_filtercheck').removeClass();
    $('#alloc_filtercheck').addClass("change_to_purple");

}


function showStatus() {
    if ($('.sub_methods_status').is(':hidden')) {
        $('.methods_status').empty();
        $('.methods_status').append('<img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Status');
        $('.sub_methods_status').slideDown();
    }
    else {
        $('.methods_status').empty();
        $('.methods_status').append('<img src="Pictures/rightarrow.png" alt="" style="width:12px; height:10px;"/>Status');
        $('.sub_methods_status').slideUp();
    }
}

function showDepartment() {
    if ($('.sub_methods_dep').is(':hidden')) {
        $('.methods_dep').empty();
        $('.methods_dep').append('<img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Department');
        $('.sub_methods_dep').slideDown();
    }
    else {
        $('.methods_dep').empty();
        $('.methods_dep').append('<img src="Pictures/rightarrow.png" alt="" style="width:12px; height:10px;"/>Department');
        $('.sub_methods_dep').slideUp();
    }
}

function showModule() {
    if ($('.sub_methods_module').is(':hidden')) {
        $('.methods_module').empty();
        $('.methods_module').append('<img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Module');
        $('.sub_methods_module').slideDown();
    }
    else {
        $('.methods_module').empty();
        $('.methods_module').append('<img src="Pictures/rightarrow.png" alt="" style="width:12px; height:10px;"/>Module');
        $('.sub_methods_module').slideUp();
    }
}

function showDay() {
    if ($('.sub_methods_day').is(':hidden')) {
        $('.methods_day').empty();
        $('.methods_day').append('<img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Day');
        $('.sub_methods_day').slideDown();
    }
    else {
        $('.methods_day').empty();
        $('.methods_day').append('<img src="Pictures/rightarrow.png" alt="" style="width:12px; height:10px;"/>Day');
        $('.sub_methods_day').slideUp();
    }
}

function showStartPeriod() {
    if ($('.sub_methods_period').is(':hidden')) {
        $('.methods_period').empty();
        $('.methods_period').append('<img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Start Period');
        $('.sub_methods_period').slideDown();
    }
    else {
        $('.methods_period').empty();
        $('.methods_period').append('<img src="Pictures/rightarrow.png" alt="" style="width:12px; height:10px;"/>Start Period');
        $('.sub_methods_period').slideUp();
    }
}

function showRoom() {
    if ($('.sub_methods_room').is(':hidden')) {
        $('.methods_room').empty();
        $('.methods_room').append('<img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Room');
        $('.sub_methods_room').slideDown();
    }
    else {
        $('.methods_room').empty();
        $('.methods_room').append('<img src="Pictures/rightarrow.png" alt="" style="width:12px; height:10px;"/>Room');
        $('.sub_methods_room').slideUp();
    }
}


function adddephoverbtn() {
        $('.filterbtn_dep').css("background-image", "url(Pictures/hoverbtn.png)");
}

function removedephoverbtn() {
    $('.filterbtn_dep').css("background-image", "url(Pictures/btn.png)");
}

function addmodhoverbtn() {
    $('.filterbtn_mod').css("background-image", "url(Pictures/hoverbtn.png)");
}

function removemodhoverbtn() {
    $('.filterbtn_mod').css("background-image", "url(Pictures/btn.png)");
}

function addroomhoverbtn() {
    $('.filterbtn_room').css("background-image", "url(Pictures/hoverbtn.png)");
}

function removeroomhoverbtn() {
    $('.filterbtn_room').css("background-image", "url(Pictures/btn.png)");
}


$('body').delegate(".selectable", "click", function () {


    $(".singlediv #endtime").html("<option>09:50</option><option>10:50</option><option>11:50</option><option>12:50</option><option>13:50</option><option>14:50</option><option>15:50</option><option>16:50</option><option>17:50</option>");

    var strt = parseInt($(this).parent().prev().prev().val()) + ":00";
    var temp = 0;

    $('.singlediv #day').val($(this).parent().prev().val());

    for (i = 0; i < time_array.length; i++) {
        if (time_array[i] == strt)
            strt = i;
    }

    $('.singlediv #period').val(strt);

    $(".singlediv #endtime option").each(function () {

        if (temp < strt)
            $(this).remove();

        temp++;
    });

    $('.singlediv #modcode').focus();

});

$(document).ready(function () {
 
    $("a.roomAV").fancybox({
        'titlePosition': 'over'
    });

    $("a[rel=example_group]").fancybox({
        'transitionIn': 'none',
        'transitionOut': 'none',
        'titlePosition': 'below',
        'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
            return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
        }
    });


});

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    else {
        return true;
    }
}

function showtooltip() {
    $('.tooltip').show();
}

function hidetooltip() {
    $('.tooltip').hide();
}

function showsemtooltip() {
    $('.semtooltip').show();
}

function hidesemtooltip() {
    $('.semtooltip').hide();
}

function noStuds() {
    alert("No number of students");
}

function hello() {
    var prioritycount = 1;
    var priority_checked = false;
    $('#priorityButton').click(function () {
        prioritycount = prioritycount + 1;
        if (prioritycount % 2 == 0) {
        $('#priorityButton').removeClass();
        $('#priorityButton').addClass('priority_btn_click');
        priority_checked = true;
        alert("checked");
        }
        else if (prioritycount % 2 == 1) {
            $('#priorityButton').removeClass();
            $('#priorityButton').addClass('priority_btn');
            priority_checked = false;
            alert("not checked");
        }
    });
}

function callBoxFancy() {
var j1 = document.getElementById("mies1");
j1.href = my_href;
$('#mies1').trigger('click');
}

