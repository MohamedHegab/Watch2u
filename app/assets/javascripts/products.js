jQuery(document).ready(function() {
	// $('select[data-option-dependent-value=true]').each(function (i) {
	// 	var observer_dom_id = $(this).attr('id');
	// 	var observed_dom_id = $(this).data('option-observed');

	// });
	$('#product_price').on('keyup', function() {
		calculate_price();
	});

	$('#product_discount').on('keyup', function() {
		calculate_price();
	});

	function calculate_price() {
		price = parseFloat($('#product_price').val());
		discount = parseFloat($('#product_discount').val()/100);
		new_price = price - (price * discount);
		$('#product_new_price').val(new_price);
	}

	calculate_price();

	function calculate_sub_total() {
		var sum = 0;
    $(".price_field").each(function(){
        sum += +$(this).val();
    });
		$('#order_sub_total').val(sum);
	}
});
