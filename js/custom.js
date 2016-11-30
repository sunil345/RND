$(document).ready(function(){

		

		var search_visibility = 0;

	// Animation for the search button

$("#show_search").bind("click", function(){

    if (search_visibility == 0) {

        $("#search_bar").fadeIn();

        search_visibility = 1;

    } else {

        $("#search_bar").fadeOut();

        search_visibility = 0;

    }

});	


});







function Notification(msg, type){

	var box = $('<div class="' + type + '"><div class="close"></div><div class="icon"></div>' + msg + '</div>').hide();

	

	$('#notification').prepend(box);

	

	if(type != 'warning'){	

		box.fadeIn(500).delay(10000).fadeOut(500, function(){

			box.remove();	

		});

	}else{

		box.fadeIn(500);	

	}

	

	box.find('.close').on('click', function(){

		box.stop().fadeOut(500, function(){

			box.remove();	

		});	

	});

}



function addToCart(product_id, quantity) {

	quantity = typeof(quantity) != 'undefined' ? quantity : 1;



	$.ajax({

		url: 'index.php?route=checkout/cart/add',

		type: 'post',

		data: 'product_id=' + product_id + '&quantity=' + quantity,

		dataType: 'json',

		success: function(json) {

			if (json['redirect']) {

				location = json['redirect'];

			}

			

			if (json['success']) {

				Notification(json['success'], 'success');

				addToCartConfirm();

				

			}	

		}

	});

}



function addToWishList(product_id) {

	$.ajax({

		url: 'index.php?route=account/wishlist/add',

		type: 'post',

		data: 'product_id=' + product_id,

		dataType: 'json',

		success: function(json) {		

			if (json['success']) {

				Notification(json['success'], 'success');



				$('#wishlist-total').html(json['total']);

			}	

		}

	});

}



function addToCompare(product_id) { 

	$.ajax({

		url: 'index.php?route=product/compare/add',

		type: 'post',

		data: 'product_id=' + product_id,

		dataType: 'json',

		success: function(json) {	

			if (json['success']) {

				Notification(json['success'], 'success');

				

				$('#compare-total').html(json['total']);

			}	

		}

	});

}
function addToCartConfirm() {
			$('#cart').load('index.php?route=module/cart #cart > *', function() {
				
				$.fancybox({
						content:$('#cart .content').html(),
						showCloseButton:false,
						/*autoDimensions:false,
						scrolling:'no',
						height:'auto',
						width:"500"*/
				});				
				
				$('#fancybox-content .btn-mini:first').attr('href', 'javascript:$.fancybox.close();');
				$('#fancybox-content .btn-mini:first').html('Continue');				
			});				
		}


$(document).ready(function(){

	$('.messages > div').each(function(i, e){

		Notification($(e).html(), $(e).attr('class'));	

	});

});



