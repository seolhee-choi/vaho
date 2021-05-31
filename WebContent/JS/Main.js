$(document).ready(function() {
	setInterval(doTest, 1);	

});

function doTest() {
	var scrollLocation = $(document).scrollTop();

	if (scrollLocation < 60) {
		$(".headerMenuList").css({
			"position" : "inherit"
		});
	} else {
		$(".headerMenuList").css({
			"position" : "fixed"
		});
	}

}