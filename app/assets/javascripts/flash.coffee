#$(document).on('ready page:load', function() {
#	setTimeout(function() {
#		$('#flash-wrapper').fadeOut('slow', function() {
#			$(this).remove();
#		});
#	}, 3000);
#});

$(document).on 'ready page:load', ->
	setTimeout ->
		$('#flash-wrapper').fadeOut 'slow', ->
			$(this).remove()
	, 3000
