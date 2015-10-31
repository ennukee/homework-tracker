$(document).ready(function() {
	$('button[id=thisthing]').click(function() {
		prompt("test","test");
	});

	$('.assn_names').on("mouseover", function () {
	});
});

function registerFT (handler, ev, func) {
  $('.bootstrap-environment').on(ev, handler, func);
}

