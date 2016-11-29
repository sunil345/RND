<?php require( ThemeControlHelper::getLayoutPath( 'common/config.tpl' ) );  ?> 
<?php echo $header; ?>
<div class="container">
<style>
		 .view_product { 
			 color: #FFFFFF;
			font-size: 14px;
			font-style: italic;
		 }
.hover-image .img > img {
	background-color:#fff;
}
.product-block .image .hover-image {
  position: absolute;
  text-align: center;
  top: 0;
  width: 100%;
  left: 0;
  transform: rotateY(-180deg);
  -webkit-transform: rotateY(-180deg);
  -moz-transform: rotateY(-180deg);
  transform-style: preserve-3d;
  -webkit-transform-style: preserve-3d;
  -moz-transform-style: preserve-3d;
  -webkit-backface-visibility: hidden;
  -moz-backface-visibility: hidden;
  backface-visibility: hidden;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}
.product-block .image:hover .hover-image {
  transform: rotateX(0deg) rotateY(0deg);
  -webkit-transform: rotateX(0deg) rotateY(0deg);
  -moz-transform: rotateX(0deg) rotateY(0deg);
}
</style>
	<div class="row"> 
		<?php if ($thumb) { ?>
					<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive" /></div>
					<?php } ?>
				<div id="breadcrumb" style="display:none;"><ol class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ol></div>	
					
		<?php if( $SPAN[0] ): ?>
			<aside class="col-md-<?php echo $SPAN[0];?>">
				<?php echo $column_left; ?>
			</aside>	
		<?php endif; ?> 
		<section id="content" class="col-md-<?php echo $SPAN[1];?>">	
					
			<div>
				<h1 class="heading-title"><?php echo $heading_title; ?></h1>
				<?php if ($description) { ?>
				<div class="category-info clearfix hidden-xs hidden-sm">
					
					<?php if ($description) { ?>
					<div class="category-description wrapper">
						<?php echo $description; ?>
					</div>
					<?php } ?>
				</div>
				<?php } ?> 

				<?php if ($categories) { ?>
				<div class="panel panel-default refine-search clearfix">
					<div class="panel-body category-list clearfix">
						<?php if (count($categories) <= 5) { ?>
						<ul>
							<li><?php echo $text_refine; ?></li>
							<?php foreach ($categories as $category) { ?>
							<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
							<?php } ?>
						</ul>
						<?php } else { ?>
						<ul><li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><?php echo $text_refine; ?></li></ul>
						<div class="clearfix"></div>
						<ul>
						<?php for ($i = 0; $i < count($categories);) { ?>
							<?php $j = $i + ceil(count($categories) / 2); ?>
							<?php for (; $i < $j; $i++) { ?>
							<?php if (isset($categories[$i])) { ?>
							<li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
							<?php } ?>
							<?php } ?>
						
						<?php } ?>
						</ul>
						<?php } ?>
					</div>
				</div>
				<?php } ?>

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

				<?php } ?>					

				<?php if (!$categories && !$products) { ?>
				<div class="content"><div class="wrapper"><?php echo $text_empty; ?></div></div>
				<div class="buttons">
					<div class="right"><a href="<?php echo $continue; ?>" class="button btn btn-default"><?php echo $button_continue; ?></a></div>
				</div>
				<?php } ?>

				<?php echo $content_bottom; ?></div>

	<script type="text/javascript">
		<!--
		function display(view) {
			if (view == 'list') {
				$('.product-grid').attr('class', 'product-list');

				$('.products-block  .product-block').each(function(index, element) {

					$(element).parent().addClass("col-fullwidth");
				});		

				$('.display').html('<span class="pull-left"><?php echo $text_display; ?></span><a class="list active"><em><?php echo $text_list; ?></em></a><a class="grid" onclick="display(\'grid\');"><em><?php echo $text_grid; ?></em></a>');

				$.cookie('display', 'list');
			} else {
				$('.product-list').attr('class', 'product-grid');

				$('.products-block  .product-block').each(function(index, element) {
					$(element).parent().removeClass("col-fullwidth");  
				});	

				$('.display').html('<span class="pull-left"><?php echo $text_display; ?></span><a class="list" onclick="display(\'list\');"><em><?php echo $text_list; ?></em></a><a class="grid active"><em><?php echo $text_grid; ?></em></a>');

				$.cookie('display', 'grid');
			}
		}

		view = $.cookie('display');

		if (view) {
			display(view);
		} else {
			display('<?php echo $DISPLAY_MODE;?>');
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

</div></div>	


<script type="text/javascript">
	
	$(document).ready(function() {

		if(typeof(localStorage.localchage) !== "undefined") {
			$("#product-change-content").removeClass('product-grid product-list');
			$("#product-change-content").addClass('product-'+localStorage.localchage);
			$("#display-change").val(localStorage.localchage);
		}	

		$("#display-change").change(function() {
			var sel = $(this).val();
			localStorage.setItem("localchage",sel);
			$("#product-change-content").removeClass('product-grid product-list');
			$("#product-change-content").addClass('product-'+sel);
		});
	});

</script>

<?php echo $footer; ?>
