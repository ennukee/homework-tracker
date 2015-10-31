$(document).ready(function() {
	$('button[id=thisthing]').click(function() {
		prompt("test","test");
	});

	$('.assn_names').on("mouseover", function () {
		//$(this).animate({backgroundColor: "#FF0000"}, 1000);
		$(this).css('backgroundColor','#DDCCBB');
	});
	$('.assn_names').on("mouseout", function () {
		//$(this).animate({backgroundColor: "#FF0000"}, 1000);
		$(this).css('backgroundColor','white');
	});
});

