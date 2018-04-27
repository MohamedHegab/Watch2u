jQuery(document).ready(function() {
	// $('select[data-option-dependent-value=true]').each(function (i) {
	// 	var observer_dom_id = $(this).attr('id');
	// 	var observed_dom_id = $(this).data('option-observed');

	// });
	$('.order_products').on('change', ".product_field", function() {
		var url_mask 				= $(this).data('option-url');
		var regexp          = /:[0-9a-zA-Z_]+/g;
		_this = $(this);
		url = url_mask.replace(regexp, $(this).val());
		
		$('.price_field').prop('disabled', true);
		$.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      success: function(data) { 
      	_this.parent().parent().find('.price_field').val(data.data.price);
      	_this.parent().parent().find('.discount_field').val(data.data.discount);
      	_this.parent().parent().find('.new_price_field').val(data.data.new_price);
      	new_price = parseFloat(data.data.new_price);
      	quantity = parseInt(_this.parent().parent().find('.quantity_field').val());
      	_this.parent().parent().find('.total_price_field').val(new_price * quantity);
      	calculate_sub_total();
      },
      error: function(err) { console.log(err) },
      beforeSend: setHeader
    });
	});

	$('.quantity_field').on('keyup', function() {
		_this = $(this);
  	new_price = parseFloat(_this.parent().parent().find('.new_price_field').val());
  	quantity = parseInt(_this.parent().parent().find('.quantity_field').val());
  	_this.parent().parent().find('.total_price_field').val(new_price * quantity);
  	calculate_sub_total();
	});

	function calculate_sub_total() {
		var sum = 0;
    $(".total_price_field").each(function(){
        sum += +$(this).val();
    });
		$('#order_sub_total').val(sum);
	}

	$('#edit_order').on('submit', function() {
		$('.price_field').prop('disabled', false);
		$('.discount_field').prop('disabled', false);
		$('#order_number').prop('disabled', false);
		$('#order_sub_total').prop('disabled', false);
		$('#order_total_price').prop('disabled', false);
	});
});

function setHeader(xhr) {
  xhr.setRequestHeader('ApiKey', 'key=1d7801c576b33db841d59216d8cf91d4');
}