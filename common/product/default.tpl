<div class="product-block" itemtype="http://schema.org/Product" itemscope>	
	<?php if ($product['thumb']) {    ?>
		<div class="image <?php echo $product['stock_class']; ?>">
		<!--test--!>
		<?php if (isset($thumb_soldout)) { ?><img style="z-index:1;position: absolute; pointer-events: none;" src="<?php echo $thumb_soldout; ?>" title="" alt="" class="sold-img-product"/><?php } ?>
		
			<?php if( $product['special'] ) {   ?>
			<div class="product-label">
				<div class="product-label-special"><?php echo $this->language->get( 'text_sale' ); ?></div>
			</div>
			<?php } ?>
			<a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
			<img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
			</a>
			<div class="wrap-hover clearfix">
				<?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
					<div class="pull-left">
						
						<a href="<?php echo $zimage;?>" class="info-view colorbox product-zoom" title="<?php echo $product['name']; ?>"><span><?php echo $this->language->get("View Product"); ?></span></a>
					</div>	
				<?php } ?>	
				<?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>	
				
				<span <?php if (($product_info['quantity'] <= 0 && $this->config->get('config_stock_checkout')==0) || ($this->config->get('config_customer_price')==1 && !$this->customer->isLogged())) { echo 'style="display:none"'; } ?> >
					<button onclick="addToCart('<?php echo $product['product_id']; ?>');" class="pull-right cart">
						<span><?php echo $this->language->get("button_cart"); ?></span>
					</button>
					</span>
				<?php } ?>		
					
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
						<?php if($this->config->get( 'config_percent_off' )){ ?>
					  <span class="saving-percentage"><?php echo (!empty($product['saving']))?$product['saving'].'% OFF':''; ?></span>
					 <?php } ?> 
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





