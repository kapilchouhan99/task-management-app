const changeStatus = function () {
	$('.dropdown-item').on('click', function(e){
		var status = e.target.getAttribute('data-status')
		var taskId = e.target.getAttribute('data-id')
		$.ajax({
				method: 'PATCH',
				url: '/tasks/' + taskId + '/update_status.js',
				data: {status: status},
				success: function (data){
				}
		})
	})
}

export { changeStatus }