<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); 
	$themeConfig = $this->config->get('themecontrol');
	 
	 $categoryConfig = array( 
		'listing_products_columns' 		     => 0,
		'listing_products_columns_small' 	 => 2,
		'listing_products_columns_minismall' => 1,
		'cateogry_display_mode' 			 => 'grid',
		'category_pzoom'				     => 1,
		'show_swap_image'					 => $themeConfig['swapimage'],
		'quickview' => 1,
	); 
	$categoryConfig  = array_merge($categoryConfig, $themeConfig );
	$DISPLAY_MODE 	 = $categoryConfig['cateogry_display_mode'];
	$MAX_ITEM_ROW 	 = $themeConfig['cateogry_product_row']?$themeConfig['cateogry_product_row']:3; 
	$MAX_ITEM_ROW_SMALL = $categoryConfig['listing_products_columns_small']?$categoryConfig['listing_products_columns_small']:2;
	$MAX_ITEM_ROW_MINI  = $categoryConfig['listing_products_columns_minismall']?$categoryConfig['listing_products_columns_minismall']:1; 
	$categoryPzoom 	    = $categoryConfig['category_pzoom']; 
	$quickview = $categoryConfig['quickview'];

?>
<?php echo $header; ?>
<style>
.product-filter .display a, .pagination .display a {
background-image: url("catalog/view/theme/pav_fashion/image/default/icon-grid-list.png")!important;
}
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
<section id="content" class="col-md-10">




<h1 class="heading-title"><?php echo $heading_title; ?></h1>

<?php if ($values_selected) { ?>

<div id="filter_box_big">

  <dl id="onasearch" class="filters">

    <dt><span><em>&nbsp;</em><?php echo $entry_selected; ?></span></dt>

    <dd class="page_preload">

      <ul id="navlistasearch" >

        <?php foreach ($values_selected as $value_selected){ ?>

        <li class="active"><em>&nbsp;</em><a class="link_filter_del smenu {dnd:'<?php echo $value_selected['href'];?>',ajaxurl:'<?php echo $value_selected['ajax_url'];?>',gapush:'no'}" href="javascript:void(0)" <?php echo $nofollow; ?>><img src="image/supermenu/spacer.gif" alt="<?php echo $remove_filter_text; ?>" class="filter_del2" /></a> <span class="txtdnd"><?php echo $value_selected['dnd']; ?>:</span> <?php echo $value_selected['name'];?></li>

        <?php } ?>

      </ul>

    </dd>

  </dl>

</div>

<?php } ?>

<?php echo $content_filter; ?>


<?php if ($products) { ?>
   <div class="product-filter clearfix">
		<?php echo $content_top; ?>
		<div class="pull-right view">
			<span class="caret-down fa fa-caret-down"></span>
			<select id="display-change" class="form-control">
			<option value="list"><?php echo $text_list; ?></option>
			<option value="grid">Grid</option>
			</select>
		</div>
			

		<div class="sort pull-right"><span class="space-padding-l-10"><?php echo $text_sort; ?></span>
			<span class="caret-down fa fa-caret-down"></span>
			<select class="form-control" onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
				<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</div>	
		<div class="limit pull-right"><span class="caret-down fa fa-caret-down"></span><span class="space-padding-l-10"><?php echo $text_limit; ?></span>
			
			<select class=" caret-down fa fa-caret-down form-control" onchange="location = this.value;">
				<?php foreach ($limits as $limits) { ?>
				<?php if ($limits['value'] == $limit) { ?>
				<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</div>
		<div class="product-compare pull-right"><a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-white"><?php echo $text_compare; ?></a></div>   
	

</div>

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
									
									<?php if( $categoryConfig['show_swap_image'] ){
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
				</section>	
					
    <?php }  else { ?>

<div class="content"><?php echo $text_empty; ?></div>

<?php }?>
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

<script type="text/javascript"><!--
$("div.pagination div.links a").click(function(event){
		event.preventDefault();
		var hreflink = $(this).attr("href");
		if (hreflink.indexOf("product/asearch")!=-1){//don't have seo
			var someVar=hreflink.replace(/http(.*?)&/i,"");
		}else{//have seo
			var someVar=hreflink.replace(/http(.*?)\?/i,"")+"&path=<?php echo $path; ?>";
		}
		<?php if ($is_ajax){ ?>
			Ajaxmenup(someVar);
		<?php }else{ ?>
			location.replace(hreflink);
		<?php } ?>
		return false;
	 });
//--></script>

<?php if( $SPAN[2] ): ?>
	<aside class="col-lg-<?php echo $SPAN[2];?> col-md-<?php echo $SPAN[2];?> col-sm-12 col-xs-12">	
		<?php echo $column_right; ?>
	</aside>
<?php endif; ?>
<!--vqmod-os-scoller-->
