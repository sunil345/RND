<?php 
		require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" );
		$themeConfig = (array)$this->config->get('themecontrol');
		$productConfig = array(  	  
			'product_enablezoom'         => 1,
			'product_zoommode'           => 'basic',
			'product_zoomeasing'         => 1,
			'product_zoomlensshape'      => "round",
			'product_zoomlenssize'       => "150",
			'product_zoomgallery'        => 0,
			'enable_product_customtab'   => 0,
			'product_customtab_name'     => '',
			'product_customtab_content'  => '',
			'product_related_column'     => 0,        
		);
		$listingConfig = array( 	
			'category_pzoom'				          	=> 1,	
			'quickview'                                 => 0,
			'show_swap_image'                       	=> 0,
			'catalog_mode'								=> 1
		); 
		$listingConfig  				= array_merge($listingConfig, $themeConfig );
		$categoryPzoom 	    			= $listingConfig['category_pzoom']; 
		$quickview          			= $listingConfig['quickview'];
		$swapimg           				= ($listingConfig['show_swap_image'])?'swap':'';

		$productConfig 		            = array_merge( $productConfig, $themeConfig );  
		$languageID 			        = $this->config->get('config_language_id');   

?>


<?php echo $header; ?>
<script type="text/javascript" src="catalog/view/theme/kyara2/javascript/owl.carousel.min.js"></script>
<link href="catalog/view/theme/kyara2/stylesheet/owl.carousel.css" rel='stylesheet'></style>
<script src='catalog/view/javascript/jquery/jquery.elevatezoom.js'></script>
	
<style>
            /****** Rating Starts *****/
            
            .rating { 
                border: none;
                float: left;
            }

            .rating > input { display: none; } 
            .rating > label:before { 
                margin: 5px;
                font-size: 1.25em;
                font-family: FontAwesome;
                display: inline-block;
                content: "\f005";
            }

            .rating > .half:before { 
                content: "\f089";
                position: absolute;
            }

            .rating > label { 
                color: #ddd; 
                float: right; 
            }

            .rating > input:checked ~ label, 
            .rating:not(:checked) > label:hover,  
            .rating:not(:checked) > label:hover ~ label { color: #FFD700;  }

            .rating > input:checked + label:hover, 
            .rating > input:checked ~ label:hover,
            .rating > label:hover ~ input:checked ~ label, 
            .rating > input:checked ~ label:hover ~ label { color: #FFED85;  }     
			
			.buttons #button-review {    margin-top: 20px;}

          .sold-img-product {left: 0;}
			.zoompopup {
    width: 50%;
}
.img-responsive {
    display: block;
    height: auto;
    max-width: 100%;
}
#sync1 .item{
    background: #fff;
    padding: 10px 0px;
    margin: 5px;
    color: #FFF;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    text-align: center;
}
#sync2 .item{
    background: #fff;
    padding: 10px 0px;
    margin: 5px;
    color: #FFF;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    text-align: center;
    cursor: pointer;
}
#sync2 .item h1{
  font-size: 18px;
}

.owl-carousel .owl-buttons div{opacity:10 !important;}
.owl-carousel .owl-buttons .owl-prev{left:0 !important;}
.owl-carousel .owl-buttons .owl-next{right:0 !important;}
.owl-carousel .owl-buttons div{color:transparent !important;}
.accordiona .panel-headinga a.changesign::before {
    content: "+";
    font-size: 15px;
    line-height: 12px;
}
</style>


<script type="text/javascript" src="catalog/view/javascript/jquery/thumbelina.js"></script>


<div class="container">
<div class="row">
 
<?php if( $SPAN[0] ): ?>
	<aside class="col-md-<?php echo $SPAN[0];?>">
		<?php echo $column_left; ?>
	</aside>
<?php endif; ?> 
<!--vqcode-product-header-->
<section class="col-md-<?php echo $SPAN[1];?>"> 
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>  
	<div id="content" class="product-detail" itemscope itemtype="http://schema.org/Product">
		<?php echo $content_top; ?>		
		<div class="product-info">
			<div class="row">
				
					
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 image-container">
<?php if ($thumb || $images) { ?>
<div id="image-additional" class="image-additional">
	<div id="slider3" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
		<div class="thumbelina-but vert top"><i class="fa fa-chevron-up"></i></div>
				<ul>
               
                <?php foreach ($images as $image) {  
	   if(isset($image['popup']) && $image['popup']!='') { ?>
		   
		   <li><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" rel="" class=" " data-zoom-image="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>">
                    <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="" data-zoom-image="<?php echo $image['popup']; ?>" class="product-image-zoom img-responsive" />
                </a></li>
		   
		   <?php }} ?>
                </ul><div class="thumbelina-but vert bottom"><i class="fa fa-chevron-down"></i></div>
 </div>
    </div>
    <div class="image col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
		<!--soldout-img-tag-->
	 <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="info_colorbox">
            <img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image"  data-zoom-image="<?php echo $popup; ?>" class="img-responsive"/>
        </a>

    </div>



   <?php } ?>	
</div>
					
				
				<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 product-view">				
				<div class="space-padding-r-35">				
					<div class="clearfix">
						<div class="row"><h1 itemprop="name" class="col-lg-11"><?php echo $heading_title; ?> </h1>
						<?php if ($slogan && ($this->config->get('config_slogn_breadcrumb') == 0)) { ?><h3 style="margin-top: 0px; margin-bottom:20px;"><?php echo $slogan; ?></h3>
						<?php } ?>
							<div class="pull-right">
								<div class="share clearfix"><!-- AddThis Button BEGIN -->
								  <div class="addthis_toolbox addthis_default_style ">
								  <a class="addthis_counter addthis_pill_style"></a>
								  </div>
								  <script type="text/javascript">var addthis_config = {"data_track_addressbar":false};</script>
								  <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-526b75a35a40dfa4"></script>
								  <!-- AddThis Button END -->
								</div>	
							</div>
						</div>
					</div>	
		 		<!--custom-field-product-->
				<!--vqcode-product-custom-field-->
					<?php if ($price) { ?>
					<div class="price" itemscope itemtype="http://schema.org/Offer">
						<div class="price-gruop">
							<span class="text-price"><?php echo $text_price; ?></span>
							<?php if (!$special) { ?>
							<?php echo $price; ?>
								<?php if( preg_match( '#(\d+).?(\d+)#',  $price, $p ) ) { ?> 
								<meta content="<?php echo $p[0]; ?>" itemprop="price">
								<?php } ?>
							<?php } else { ?>
								<?php if( preg_match( '#(\d+).?(\d+)#',  $special, $p ) ) { ?> 
								<meta content="<?php echo $p[0]; ?>" itemprop="price">
								<?php } ?>

							<span class="price-old"><?php echo $price; ?></span> 
							<span class="price-new"><?php echo $special; ?></span>
							<?php } ?>
						</div>	
						<div class="other-price">
							<?php if ($tax) { ?>
								<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br/>
							<?php } ?>
							<?php if ($points) { ?>
								<span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span>
							<?php } ?>
						</div>						
						<?php if ($discounts) { ?>			
						<div class="discount">
							<ul>
								<?php foreach ($discounts as $discount) { ?>							
								<li><?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?></li>
								<?php } ?>
							</ul>
						</div>
						<?php } ?>

						<meta content="<?php echo $this->currency->getCode(); ?>" itemprop="priceCurrency">
					</div>
					<?php } ?>

					<?php if ($tags) { ?>
					<div class="tags hidden">
						<label><?php echo $text_tags; ?></label>
						<?php for ($i = 0; $i < count($tags); $i++) { ?>
						<?php if ($i < (count($tags) - 1)) { ?>
						<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
						<?php } else { ?>
						<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
						<?php } ?>
						<?php } ?>
					</div>
					<?php } ?> 
					<hr>

					<?php if ( isset($profiles) && $profiles): ?>
					<div class="option form-group">
						<h2><span class="required">*</span><?php echo $text_payment_profile ?></h2>
						<select name="profile_id" class="form-control">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($profiles as $profile): ?>
							<option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
							<?php endforeach; ?>
						</select>
						<span id="profile-description"></span>
					</div>
					<?php endif; ?>

						<div class="description">
							<?php if ($manufacturer) { ?>
							<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
							<?php } ?>
							<span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
							<?php if ($reward) { ?>
							<span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
							<?php } ?>
							<span><?php echo $text_stock; ?></span> <?php echo $stock; ?>
						 </div> 
					
						<?php if ($minimum > 1) { ?>
							<div class="minimum"><small><?php echo $text_minimum; ?></small></div>
						<?php } ?>				
						<!--vqcode-product-option-->
						<?php if ($options) { ?>
      <div class="options clearfix">
       <!-- <h2><?php echo $text_option; ?></h2>
        <br /> -->
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>" data-option-value-id="<?php echo $option_value['option_value_id']; ?>" data-option-sku="<?php echo $option_value['option_sku']; ?>" ><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <table class="option-image">
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-<?php echo $option['option_id']; ?>">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <br />
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
					
			<div class="product-extra clearfix">
				<div class="poduct-wapper">
					
					<div class="quantity-adder clearfix">
						<div class="quantity-number pull-left">
							<span><?php echo $text_qty; ?></span>
							<input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
						</div>
						<div class="quantity-wrapper pull-left">
							<span class="add-up add-action fa fa-plus"></span> 
							<span class="add-down add-action fa fa-minus"></span>
						</div>					
						<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />	
					</div>											
					
								
				</div>	
				<!--start-hide-button-->			
				<div class="cart">					
					<!-- <input type="button" value="<?php //echo $button_cart; ?>" id="button-cart" class="button btn btn-default" /> -->
					<a id="button-cart" class="btn btn-outline-warning">						
						<span><?php echo $button_cart; ?></span>
					</a> 
				</div>

	
				<!--end-hide-button-->

<span class="wishlist"><a class="icon-heart" onclick="addToWishList('<?php echo $product_id; ?>');" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_wishlist; ?>"><span><?php echo $button_wishlist; ?></a></span></span>
				<!--show-enquiry-button-->
				<!--start-bulk-order-->
			
		</div>	
		<!-- tab -->
 <!-- star accodion -->


 <section class="custom-accordian accordiona">
<ul>
  
  <li>
  <label for="one"><?php echo $tab_description; ?></label>
    <input type="radio" id="one" name="deadMan" />
     <div class="rollMeDown">
       <p><?php echo $description; ?></p>
     </div>
  </li>
  <?php if ($cpt_show) { ?>
  <?php 
		$accordionaIndx = 2;
		foreach ($before_attributes as $tab) { ?>
		<?php if (trim($tab['content']) != '' || $cpt_show_always) { ?>
   <li>
  <label for="two<?php echo $accordionaIndx; ?>"><?php echo $tab['name']; ?></label>
    <input type="radio" id="two<?php echo $accordionaIndx; ?>" name="deadMan" />
     <div class="rollMeDown">
       <p><?php echo $tab['content']; ?></p>
     </div>
  </li>
  <?php $custom_tab_count++;$accordionaIndx++; ?>
								<?php } ?>
								<?php } ?>
		
        <?php } ?>
	<?php if ($attribute_groups) { ?>
   <li>
  <label for="three"><?php echo $tab_attribute; ?></label>
    <input type="radio" id="three" name="deadMan" />
     <div class="rollMeDown">
       <table class="table table-bordered">
                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                            <thead>
                                <tr>
                                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                    <tr>
                                        <td><?php echo $attribute['name']; ?></td>
                                        <td><?php echo $attribute['text']; ?></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        <?php } ?>
                    </table>
     </div>
  </li>
  <?php } ?>
  
  <?php if ($review_status) { ?>
  <li>
  <label for="two-review"><?php echo $tab_review; ?></label>
    <input type="radio" id="two-review" name="deadMan" />
     <div class="rollMeDown">
       
                    <div id="review"></div>
                    <h2 id="review-title"><?php echo $text_write; ?></h2>
                    <div id="divdeps" > 
						<div id="review-form" class="panel review-form-width">
							<div class="panel-body">
                        
                            <div class="form-group ">
                                <div class="col-sm-12">
                                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group ">
                                <div class="col-sm-12">
                                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                    <div class="help-block"><?php echo $text_note; ?></div>
                                </div>
                            </div>
                            <div class="form-group ">
                                <div class="col-sm-12">
                                   <label class="control-label" for="input-review">Rating :</label> 	<br/>
                                    &nbsp;&nbsp;&nbsp;
                                    
                                    <fieldset class="rating" id="demo3">
										<input type="radio" value="5" name="rating" id="star53" class="stars">
										<label title="Awesome - 5 stars" for="star53" class="full"></label>
										<input type="radio" value="4.5" name="rating" id="star4half3" class="stars">
										<label title="Pretty good - 4.5 stars" for="star4half3" class="half"></label>
										<input type="radio" value="4" name="rating" id="star43" class="stars">
										<label title="Pretty good - 4 stars" for="star43" class="full"></label>
										<input type="radio" value="3.5" name="rating" id="star3half3" class="stars">
										<label title="Meh - 3.5 stars" for="star3half3" class="half"></label>
										<input type="radio" value="3" name="rating" id="star33" class="stars">
										<label title="Meh - 3 stars" for="star33" class="full"></label>
										<input type="radio" value="2.5" name="rating" id="star2half3" class="stars">
										<label title="Kinda bad - 2.5 stars" for="star2half3" class="half"></label>
										<input type="radio" value="2" name="rating" id="star23" class="stars">
										<label title="Kinda bad - 2 stars" for="star23" class="full"></label>
										<input type="radio" value="1.5" name="rating" id="star1half3" class="stars">
										<label title="Meh - 1.5 stars" for="star1half3" class="half"></label>
										<input type="radio" value="1" name="rating" id="star13" class="stars">
										<label title="Sucks big time - 1 star" for="star13" class="full"></label>
										<input type="radio" value="0.5" name="rating" id="starhalf3" class="stars">
										<label title="Sucks big time - 0.5 stars" for="starhalf3" class="half"></label>
									</fieldset>
                                   </div>
                            </div>
                            <div class="form-group ">
								<div class="col-sm-12">
									<strong><?php echo $entry_captcha; ?></strong> <br/>
									<img src="index.php?route=product/product/captcha" alt="" id="captcha" /> <br/><br/>
									<input type="text" name="captcha" value="" class="form-control" /> 
								</div>
                            </div>
                            
                            
                            <?php if ($site_key) { ?>
                              <div class="form-group">
                                <div class="col-sm-12">
                                  <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                                </div>
                              </div>
                            <?php } ?>
                            <div class="buttons col-lg-12">
                                <div class="pull-right">
                                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-sm btn-primary"><?php echo $button_continue; ?></button>
                                </div>
                                
                            </div>
                       
                        </div></div></div>
                   
              
     </div>
  </li>
  <?php } ?>
  <?php if( $productConfig['enable_product_customtab'] && isset($productConfig['product_customtab_name'][$languageID]) ) { ?>
  <li>
  <label for="two-cust"><?php if( $productConfig['enable_product_customtab'] && isset($productConfig['product_customtab_name'][$languageID]) ) { ?> <?php echo $productConfig['product_customtab_name'][$languageID]; ?> <?php } ?></label>
    <input type="radio" id="two-cust" name="deadMan" />
     <div class="rollMeDown">
       <p><?php if( $productConfig['enable_product_customtab'] && isset($productConfig['product_customtab_content'][$languageID]) ) { ?>
                  <?php echo html_entity_decode( $productConfig['product_customtab_content'][$languageID], ENT_QUOTES, 'UTF-8'); ?>
                  <?php } ?></p>
     </div>
  </li>
  <?php } ?>
  
  
  
</ul>
</section>


<!--tab-->
</div>

</div>
</div>
</div>




	
	<?php // echo $content_bottom; ?>

<!--vqmode-product-option-price-update-->

<style>

.custom-accordian ul {
  list-style-type: none;
}
.custom-accordian ul li {
  border-bottom: 1px solid #e3e3e3;
  margin-bottom: 10px;
  padding-bottom: 5px;
}

.custom-accordian > ul > li > label {
  cursor: pointer;
  font-size: 1.15em;
  font-weight: bold;
  width: 100%;
  display: block;
  position: relative;
  -webkit-transform: rotate(0);
          transform: rotate(0);
}
.custom-accordian > ul > li > label:after {
  content: '+';
  position: absolute;
  right: 0;
  top: 0;
  -webkit-transition: -webkit-transform 0.3s ease;
  transition: -webkit-transform 0.3s ease;
  transition: transform 0.3s ease;
  transition: transform 0.3s ease, -webkit-transform 0.3s ease;
}

.custom-accordian .rollMeDown {
  font-size: 0.9em;
  height: 100%;
  max-height: 0;
  opacity: 0;
  overflow: hidden;
  -webkit-transition: all 0.45s cubic-bezier(0.19, 1, 0.22, 1);
  transition: all 0.45s cubic-bezier(0.19, 1, 0.22, 1);
  width: 100%;
}

.custom-accordian input[type="radio"] {
  visibility: hidden;
  position: absolute;
}

.custom-accordian input[type="radio"]:checked + .rollMeDown {
  max-height: 1000px;
  opacity: 1;
  -webkit-transition: all 1.95s cubic-bezier(0.19, 1, 0.22, 1);
  transition: all 1.95s cubic-bezier(0.19, 1, 0.22, 1);
}

.custom-accordian li.active label:after {
  -webkit-transform: rotate(45deg) scale(1.2);
          transform: rotate(45deg) scale(1.2);
}
.custom-accordian li.active .rollMeDown {
  padding-left: 0.5em;
}

		
 </style>
 <script>
$(document).ready(function(){
  
var $inputClicked = $('input[type="radio"]');
  
  $inputClicked.click(function() {
    
     var $parentLi = $(this).parent('li');
    
      $('li').not($parentLi ).removeClass('active');
      if($parentLi.hasClass('active')) {
       
        $parentLi.removeClass('active');
          $parentLi.find($('input[type="radio"]')).attr('checked', false).val(false);
        //$parentLi.find($('input[type="radio"]')).val(false);
      }else {
         $parentLi.addClass('active');
      }
     
    });
    
  
});

 </script>
<script>
    $(document).ready(function() {
	var sync1 = $("#sync1");
      var sync2 = $("#sync2");

      sync1.owlCarousel({
        singleItem : true,
        slideSpeed : 1000,
        navigation: true,
        pagination:false,
        afterAction : syncPosition,
        responsiveRefreshRate : 200,
      });

      sync2.owlCarousel({
        items : 15,
        itemsDesktop      : [1199,10],
        itemsDesktopSmall     : [979,10],
        itemsTablet       : [768,8],
        itemsMobile       : [479,4],
        pagination:false,
        responsiveRefreshRate : 100,
        afterInit : function(el){
          el.find(".owl-item").eq(0).addClass("synced");
        }
      });

      function syncPosition(el){
        var current = this.currentItem;
        $("#sync2")
          .find(".owl-item")
          .removeClass("synced")
          .eq(current)
          .addClass("synced")
        if($("#sync2").data("owlCarousel") !== undefined){
          center(current)
        }

      }

      $("#sync2").on("click", ".owl-item", function(e){
        e.preventDefault();
        var number = $(this).data("owlItem");
        sync1.trigger("owl.goTo",number);
      });

      function center(number){
        var sync2visible = sync2.data("owlCarousel").owl.visibleItems;

        var num = number;
        var found = false;
        for(var i in sync2visible){
          if(num === sync2visible[i]){
            var found = true;
          }
        }

        if(found===false){
          if(num>sync2visible[sync2visible.length-1]){
            sync2.trigger("owl.goTo", num - sync2visible.length+2)
          }else{
            if(num - 1 === -1){
              num = 0;
            }
            sync2.trigger("owl.goTo", num);
          }
        } else if(num === sync2visible[sync2visible.length-1]){
          sync2.trigger("owl.goTo", sync2visible[1])
        } else if(num === sync2visible[0]){
          sync2.trigger("owl.goTo", num-1)
        }
      }

    });
    
    </script> 
 <script type="text/javascript">
    $('#image-additional .item:first').addClass('active');
    $('#image-additional').carousel({interval:false});
    
    $(function(){
                $('#slider3').Thumbelina({
                    orientation:'horizontal',         // Use vertical mode (default horizontal).
                    $bwdBut:$('#slider3 .top'),     // Selector to top button.
                    $fwdBut:$('#slider3 .bottom')   // Selector to bottom button.
                });
              
            })
            
	$("#image").elevateZoom({gallery:'image-additional', cursor: 'pointer', galleryActiveClass: 'active'}); 
  </script>	
  
 <script type="text/javascript">
 <!--
$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
    type: 'post',
    data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
    dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
    success: function(json) {
      $('.success, .warning, .attention, information, .error').remove();
            
      if (json['success']) {
                $('#profile-description').html(json['success']);
      } 
    }
  });
});


$('#button-cart').bind('click', function() {
	var button_lable = $('#button-cart').html();
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
    dataType: 'json',
    beforeSend: function() {
				$('#button-cart').attr('disabled','disabled');
				$('#button-cart').css('cursor','none');
				$('#button-cart').button('loading');
		},
    success: function(json) {
		$('#button-cart').html(button_lable);
		$('#button-cart').removeAttr('disabled');
		$('#button-cart').removeClass('disabled');
		$('#button-cart').css('cursor','pointer');
      $('.success, .warning, .attention, information, .error').remove();
      
      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            $('.options').before('<span class="error">' + json['error']['option'][i] + '</span>');
          }
        }
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
      } 
     
      if (json['success']) {
        $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/close.png" alt="" class="close" /></div>');
          
        $('.success').fadeIn('slow');
        
        $('#cart').load('index.php?route=module/cart #cart > *', addToCartConfirm());
        
        $('#cart-total').html(json['total']);

        $('#cart-total', window.parent.document ).html(json['total']);

        $('.quick-cart').load('index.php?route=module/cart .quick-cart > *');

        $('html, body').animate({ scrollTop: 0 }, 'slow'); 
      } 
    }
  });
});
//-->
</script>

<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
  action: 'index.php?route=product/product/upload',
  name: 'file',
  autoSubmit: true,
  responseType: 'json',
  onSubmit: function(file, extension) {
    $('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/loading.gif" class="loading" style="padding-left: 5px;" />');
    $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
  },
  onComplete: function(file, json) {
    $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
    
    $('.error').remove();
    
    if (json['success']) {
      alert(json['success']);
      
      $('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
    }
    
    if (json['error']) {
      $('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
    }
    
    $('.loading').remove(); 
  }
});
//-->
</script>

<?php } ?>
<?php } ?>
<?php } ?>

<script type="text/javascript">
<!--
$('#review .pagination a').live('click', function() {
  $('#review').fadeOut('slow');
    
  $('#review').load(this.href);
  
  $('#review').fadeIn('slow');
  
  return false;
});     

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
  $.ajax({
    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
    data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
    beforeSend: function() {
      $('.success, .warning').remove();
      $('#button-review').attr('disabled', true);
      $('#review-title').after('<div class="attention"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
    },
    complete: function() {
      $('#button-review').attr('disabled', false);
      $('.attention').remove();
    },
    success: function(data) {
      if (data['error']) {
        $('#review-title').after('<div class="warning">' + data['error'] + '</div>');
      }
      
      if (data['success']) {
        $('#review-title').after('<div class="success">' + data['success'] + '</div>');
                
        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').attr('checked', '');
        $('input[name=\'captcha\']').val('');
      }
    }
  });
});
//-->
</script> 

<script type="text/javascript">
<!--
$('#tabs a').tabs();
//-->
</script> 

<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
</section>


 
<?php if( $SPAN[2] ): ?>
<aside class="col-md-<?php echo $SPAN[2];?>">	
	<?php echo $column_right; ?>
</aside>
<?php endif; ?>


</div>
<div class="container">
	<?php echo $content_bottom; ?>
</div>
<script type="text/javascript">

$(document).ready(function() {
	$(".product-info .accordiona .panel-headinga a").bind("click",function(){

	var cls = $(this).parent().parent().next("div.panel-collapsea").hasClass("in");
		if(cls==true){
			$(this).addClass("changesign");
			$(this).parent().parent().next("div.panel-collapsea").removeClass("in").css("height","auto");
		}else{
			$(this).removeClass("changesign");
			$(this).parent().parent().next("div.panel-collapsea").addClass("in");			
		}
	});
});
</script> 

<script type="text/javascript">
<!--
$(document).ready(function() {
  $('.info_colorbox').colorbox({
    overlayClose: true,
    opacity: 0.5,
    rel: "colorbox"
  });

  
   
});
//-->
</script> 
<?php echo $footer; ?>
