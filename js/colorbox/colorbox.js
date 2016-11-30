function ColorToHex(color){
	if(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/.test(color)){
		var parts = /^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/.exec(color);
		var hex = '#';	
		
		for(var i = 1; i <= 3; ++i){
			parts[i] = parseInt(parts[i]).toString(16);
			hex += (parts[i].length == 1) ? '0' + parts[i] : parts[i];
		} 
	
		return hex;	
	} else if(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(1|0\.\d+))?\)$/.test(color)){
		var parts = /^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(1|0\.\d+))?\)$/.exec(color);	
		var hex = '#';	
		
		for(var i = 1; i <= 3; ++i){
			parts[i] = parseInt(parts[i]).toString(16);
			hex += (parts[i].length == 1) ? '0' + parts[i] : parts[i];
		} 
	
		return hex;	
	}
	
	return color;	
}

$(document).ready(function(){
	$('.cb .cb-tab').click(function(){
		if(!$('.cb').hasClass('cb-open')){
			$('.cb').animate({'left': 0}, 300, function(){$('.cb').addClass('cb-open');});
			$.cookie('cb-open', 'true');
		} else {
			$('.cb').animate({'left': -160}, 300, function(){$('.cb').removeClass('cb-open');});
			$.cookie('cb-open', 'false');	
		}
	});
	
	if($.cookie('cb-open') == 'true')
		$('.cb').css({'left': 0}).addClass('cb-open');
	
	$('.cb-color').hover(function(){
		$(this).addClass('cb-color-hover');	
	}, function(){
		$(this).removeClass('cb-color-hover cb-color-active');	
	}).mousedown(function(){
		$(this).addClass('cb-color-active');	
	}).mouseup(function(){
		$(this).removeClass('cb-color-active');	
	});

	
	$('#cb-option-bgimage').change(function(){
		$('#ts-bgimage').html('<style>body {background-image: url("catalog/view/theme/ares/image/texture/' + $(this).val() + '")!important;}</style>');
	});
	
	$('#cb-option-bgcolor').ColorPicker({
		color: ColorToHex($('body').css('backgroundColor')),
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb, hex, rgb) {
			$('#cb-option-bgcolor').css('backgroundColor', '#' + hex);
			$('#cb-option-bgcolor-value').val(hex);
			$('#ts-bgcolor').html('<style>body {background-color: #' + hex + ';}</style>');
		}
	});
	
	
	$('#cb-option-color1').ColorPicker({
		color: ColorToHex($('.theme-colors-1').css('backgroundColor')),
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb, hex, rgb) {
			$('#cb-option-color1').css('backgroundColor', '#' + hex);
			$('#cb-option-color1-value').val(hex);
			$('#ts-color1').html('<style> a, a b, #currency a:hover, #currency a b, .jcarousel55-skin-opencart .jcarousel55-item a:hover, .box-category > ul > li ul > li > a:hover, #header .links a:hover, #menu > ul > li:hover, #menu > ul > li:hover a, #menu .homemenu, .box-featured-product .name a:hover,.box-latest-product .name a:hover, .box-right-featured-product .name a:hover, .box-related-product .price, .box-category > ul > li > a:hover, .box-category > ul > li a.active,.box-information > ul > li > a:hover, .box-information > ul > li a.active, .product-compare a:hover, .product-list .name a:hover, .product-grid .name a:hover, .product-info .heading.product-info .description a:hover, .product-info .price, .product-info .price-new, .product-info .cart input, .product-info .review > div > a:hover, .product-info .review .share a:hover,#twitter li span a, .product-info .heading, .product-info .description a:hover {color: #' + hex + ';} .product-list .wishlist a:hover, .product-list .compare a:hover, .product-grid .wishlist a:hover, .product-grid .compare a:hover, .addtocompare-product-info:hover, .addtowishlist-product-info:hover, a.addtocart:hover, a.addtowishlist:hover, a.addtocompare:hover, .facebook-icon:hover, .twitter-icon:hover, .google-icon:hover, .pinterest-icon:hover, .youtube-icon:hover, .ares-share, #grid_b, #grid_a:hover, #list_b, #list_a:hover, .jcarousel-skin-opencart .jcarousel-prev-horizontal,.jcarousel-skin-opencart .jcarousel-next-horizontal, .jcarousel55-skin-opencart .jcarousel55-next-horizontal, .jcarousel55-skin-opencart .jcarousel55-prev-horizontal,.JBSlider .controller .jspTrack .jspDrag:hover {background-color: #' + hex + ';} #menu > ul > li ul > li > a:hover, .product-info .button-icon:hover { color: #' + hex + '!important;} .pagination .links a:hover, .pagination .links b, .JBSlider .controller .wrapper .item img:hover { color: #' + hex + '; border: 1px solid #' + hex + ';} a.button:hover, input.button:hover, .htabs a.selected, .htabs a:hover, a.addtocart-product-info:hover { background: #' + hex + ';}}</style>');
		}
	});
	
	$('#cb-save').click(function(){
		var Data = {
			rts_bg_texture:	$('#cb-option-bgimage').val(),
			rts_bg_color: 	$('#cb-option-bgcolor-value').val(),
			rts_color1: 	$('#cb-option-color1-value').val()
		};
		
		var Self = $(this);
		
		Self.hide();
		Self.parent().find('img').show();
		
		setTimeout(function(){
			$.post(Self.attr('href'), Data, function(out){
				Self.show();
				Self.parent().find('img').hide();
				if(out.success){
					alert($('.cb .cb-success').text());
				}else{
					alert(out.error);	
				}
			}, 'json').error(function() {
				alert($('.cb .cb-error').text());
				Self.show();
				Self.parent().find('img').hide();
			});
		}, 500);
		
		return false;
	});
});