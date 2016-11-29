<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); ?>

<?php echo $header; ?>
<?php require( ThemeControlHelper::getLayoutPath( 'common/breadcrumb.tpl' ) );  ?> 
<div class="container">
<div class="row">

<?php if( $SPAN[0] ): ?>
	<aside class="col-md-<?php echo $SPAN[0];?>">
		<?php echo $column_left; ?>
	</aside>
<?php endif; ?> 

<?php $class_3cols = (!empty($column_left) && !empty($column_left))?'three-columns':''; ?>

<section class="col-md-<?php echo $SPAN[1];?> <?php echo $class_3cols;?> ">	
	<div id="content">
		<?php echo $content_top; ?>  
		<div class="search">
			<h1><?php echo $heading_title; ?></h1>
			<!-- <label for="input-search" class="control-label"><?php echo $text_critea; ?></label> -->
			<div class="content">
				<div class="wrapper">
					<div class="row">
						<div class="col-md-4">
							<div class="form-horizontal">
								<div class="form-group">
									<!-- <label for="search" class="col-md-3 control-label hidden-xs hidden-sm"><?php echo $entry_search; ?></label> -->
									<div class="col-md-12">
										<?php if ($search) { ?>
										<input type="text" name="search" value="<?php echo $search; ?>" class="input-text form-control" />
										<?php } else { ?>
										<input type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;"  class="input-text form-control" />
										<?php } ?>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<select name="category_id" class="form-control">
								<option value="0"><?php echo $text_category; ?></option>
								<?php foreach ($categories as $category_1) { ?>
								<?php if ($category_1['category_id'] == $category_id) { ?>
								<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
								<?php } ?>
								<?php foreach ($category_1['children'] as $category_2) { ?>
								<?php if ($category_2['category_id'] == $category_id) { ?>
								<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
								<?php } ?>
								<?php foreach ($category_2['children'] as $category_3) { ?>
								<?php if ($category_3['category_id'] == $category_id) { ?>
								<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
								<?php } ?>
								<?php } ?>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div>
						<label for="description" class="checkbox">
							<?php if ($description) { ?>
							<input type="checkbox" name="description" value="1" id="description" checked="checked" />
							<?php } else { ?>
							<input type="checkbox" name="description" value="1" id="description" />
							<?php } ?>
							<?php echo $entry_description; ?>
						</label>
						<label for="sub_category" class="checkbox">
								<?php if ($sub_category) { ?>
								<input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
								<?php } else { ?>
								<input type="checkbox" name="sub_category" value="1" id="sub_category" />
								<?php } ?>
								<?php echo $text_sub_category; ?>
						</label>
					</div>
				</div>				
			</div>
  
			<div class="buttons">
				<div class="left"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button btn btn-default" /></div>
			</div>
  
			<h2><?php echo $text_search; ?></h2>
			<?php if ($products) { 
				$themeConfig = (array)$this->config->get('themecontrol');
							$theme  = $this->config->get('config_template');
							 $listingConfig = array( 
								'listing_products_columns' 		     		=> 0,
								'listing_products_columns_small' 	     	=> 2,
								'listing_products_columns_minismall'    	=> 1,
								'cateogry_display_mode' 			     	=> 'grid',
								'category_pzoom'				          	=> 1,	
								'quickview'                                 => 0,
								'show_swap_image'							 =>  $themeConfig['swapimage'],
								'product_layout'							=> 'default',
								'catalog_mode'								=> 0,
								'enable_paneltool'							=> 0
							); 
							$listingConfig  	= array_merge($listingConfig, $themeConfig );
							$DISPLAY_MODE 	 	= $listingConfig['cateogry_display_mode'];
							$MAX_ITEM_ROW    = $themeConfig['cateogry_product_row'] ? $themeConfig['cateogry_product_row'] : 3; 
							$MAX_ITEM_ROW_SMALL = $listingConfig['listing_products_columns_small']?$listingConfig['listing_products_columns_small']:2;
							$MAX_ITEM_ROW_MINI  = $listingConfig['listing_products_columns_minismall']?$listingConfig['listing_products_columns_minismall']:1; 
							$categoryPzoom 	    = $listingConfig['category_pzoom']; 
							$quickview          = $listingConfig['quickview'];
							$swapimg            = ($listingConfig['show_swap_image'])?'swap':'';  

							if( $listingConfig['enable_paneltool'] && isset($_COOKIE[$theme.'_productlayout']) && $_COOKIE[$theme.'_productlayout'] ){
								$listingConfig['product_layout'] = trim($_COOKIE[$theme.'_productlayout']);
							} 
							require( ThemeControlHelper::getLayoutPath( 'product/product_filter.tpl' ) );  
							$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
							if( !is_file($productLayout) ){
								$listingConfig['product_layout'] = 'default';
							}
						 
						?>   	
						<div id="product-change-content" class="product-list"> 
							<div class="products-block">
								<?php
								$cols = $MAX_ITEM_ROW ;
								$span = floor(12/$cols);
								$small = floor(12/$MAX_ITEM_ROW_SMALL);
								$mini = floor(12/$MAX_ITEM_ROW_MINI);
								foreach ($products as $i => $product) { ?>
								<?php if( $i++%$cols == 0 ) { ?>
								<div class="row products-row">
								<?php } ?>

								<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-<?php echo $mini;?> product-col">			
									<div class="product-block" itemtype="http://schema.org/Product" itemscope>	
							<?php if ($product['thumb']) {    ?>
								<div class="image <?php echo $product['stock_class']; ?> ">
									<?php if( $product['special'] ) {   ?>
									<div class="product-label">
										<div class="product-label-special"><?php echo $this->language->get( 'text_sale' ); ?></div>
									</div>
									<?php } ?>
									<!--soldout-img-tag-->
									<a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
									<img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
									</a>
									
									<?php if( $listingConfig['show_swap_image'] ){
											$product_images = $this->model_catalog_product->getProductImages( $product['product_id'] );
											if(isset($product_images) && !empty($product_images)) {
											$flag_key = false;
											foreach ($product_images as $image) {
											if(in_array($product['db_thumb_name'],$image)){ $flag_key = true; }
											}
												if($product_images[1]['image'] && $flag_key) {
													$thumb2 = $this->model_tool_image->resize($product_images[1]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
												} else {
													$thumb2 = $this->model_tool_image->resize($product_images[0]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
												}
												
											?>	
											<?php if(isset($thumb2) && !empty($thumb2)) { ?>
											<span class="hover-image">
												<a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $thumb2; ?>" alt="<?php echo $product['name']; ?>"></a>
											</span>
									<?php } } }?>
				
									<div class="wrap-hover clearfix">
										<?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
											<div class="pull-left">
												<a href="<?php echo $product['href']; ?>" class="info-view view_product" title="<?php echo $product['name']; ?>"><span><?php echo $this->language->get("View Product"); ?></span></a>
											</div>	
										<?php } ?>	
										<!--start-hide-button-->
										<?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>	
											<button onclick="addToCart('<?php echo $product['product_id']; ?>');" class="pull-right cart">
												<span><?php echo $this->language->get("button_cart"); ?></span>
											</button>
										<?php } ?>	
										<!--end-hide-button-->	
											
									</div>
										
										<div class="right">		
											<div class="action hidden-sm hidden-xs">
												
													<div class="wishlist">
														<a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_wishlist"); ?>"><i class="fa fa-heart"></i>
															<span><?php echo $this->language->get("button_wishlist"); ?></span>
														</a>	
													</div>	
											</div>		 
										</div>	
								</div>
							<?php } ?>
											 
							<div class="product-meta">		  
								<div class="left">
									<h3 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
									<?php if( isset($product['description']) ){ ?> 
									<p class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
									<?php } ?>	

									<?php if ($product['price']) { ?>
										<div class="price clearfix" itemtype="http://schema.org/Offer" itemscope itemprop="offers">
											<?php if (!$product['special']) {  ?>
												<span class="special-price"><?php echo $product['price']; ?></span>
												<?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?> 
												<meta content="<?php echo $p[0]; ?>" itemprop="price">
												<?php } ?>
											<?php } else { ?>
												<span class="price-new"><?php echo $product['special']; ?></span>
												<span class="price-old"><?php echo $product['price']; ?></span> 
												<?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?> 
												<meta content="<?php echo $p[0]; ?>" itemprop="price">
												<?php } ?>

											<?php } ?>
											<?php if ( isset($product['tax']) && $product['tax']) { ?>	        
												<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
											<?php } ?>

											<meta content="<?php echo $this->currency->getCode(); ?>" itemprop="priceCurrency">
										</div>
										<?php } ?>

								</div> 
							</div>		 
						</div>






								</div>
								
								<?php if( $i%$cols == 0 || $i==count($products) ) { ?>
								</div>
								<?php } ?>				
								<?php } ?>
							</div>
						</div>
						<div class="pagination paging clearfix"><?php echo $pagination; ?></div>
						<div id="top" class="top"><a class="scrollup" href="#"><i class="fa fa-angle-up"></i>Back to top</a></div>
			<?php } else  { ?>
			<div class="content"><div class="wrapper"><?php echo $text_empty; ?></div></div>
    		<?php } ?>
			<?php echo $content_bottom; ?>
		</div>
  
  
<script type="text/javascript"><!--
$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').attr('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.products-block  .product-block').each(function(index, element) {
 
			 $(element).parent().addClass("col-fullwidth");
		});		
		
		$('.display').html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list active"><em><?php echo $text_list; ?></em></a><a class="grid" onclick="display(\'grid\');"><em><?php echo $text_grid; ?></em></a>');
	
		$.cookie('display', 'list');
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.products-block  .product-block').each(function(index, element) {
			 $(element).parent().removeClass("col-fullwidth");  
		});	
					
		$('.display').html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list" onclick="display(\'list\');"><em><?php echo $text_list; ?></em></a><a class="grid active"><em><?php echo $text_grid; ?></em></a>');
	
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('<?php echo isset($DISPLAY_MODE)?$DISPLAY_MODE:"grid";?>');
}

display('<?php echo isset($DISPLAY_MODE)?$DISPLAY_MODE:"grid";?>');
		$('#display-change').val('<?php echo isset($DISPLAY_MODE)?$DISPLAY_MODE:"grid";?>');
		$('#display-change').change(function(){
			display($(this).val());
});
//-->
</script> 

</section>
 
<?php if( $SPAN[2] ): ?>
<aside class="col-md-<?php echo $SPAN[2];?>">	
	<?php echo $column_right; ?>
</aside>
<?php endif; ?>
</div></div></div>

<?php echo $footer; ?>
