jQuery(init);

function init($) {
	$('ul.switcher li').click(function () {
		let tab_id = $(this).attr('data-tab');

		$('li').removeClass('active');
		$('div.tab-pane').removeClass('active');

		$(this).addClass('active');
		$("#" + tab_id).addClass('active');
	})
}
