# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$("#stockDT").dataTable({
		processing: true,
		serverSide: true, 
		ajax: $('stockDT').data('source'),
		pagingType: "full_numbers",
		responsive: true
	})