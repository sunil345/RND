<?php 
	/******************************************************
	 * @package Pav Megamenu module for Opencart 1.5.x
	 * @version 1.1
	 * @author http://www.pavothemes.com
	 * @copyright	Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
	 * @license		GNU General Public License version 2
	*******************************************************/

	require_once(DIR_SYSTEM . 'pavothemes/loader.php');
	$helper = ThemeControlHelper::getInstance( $this->registry, $this->config->get('config_template') );
?>
</section>
<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'mass_bottom' ); 
	$ospans = array(1=>12, 2=>12, 3=>12);
	$cols   = 3;
	$class = $helper->calculateSpans( $ospans, $cols );
	if( count($modules) ) { 
?>
<section id="pav-mass-bottom">
	<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
			<?php if(  $i++%$cols == 0 || count($modules)==1  ){  $j=1;?><div class="row"><?php } ?>	
			<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
			<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>
	</div>	
</section>
<?php } ?>
<!--vqcode-footer-->
<footer id="footer">
	<?php
	/**
	 * Footer Center Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
	 */
	$blockid = 'footer_top';
	$blockcls = '';
	$modules = $helper->getModulesByPosition( $blockid ); 
	$ospans = array();
	if( count($modules) &&  $helper->getConfig('enable_footer_top') ){
		require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );

	} else { ?>
	
	<div class="footer-top">
		<div class="container">
			<div class="inner">
				<div class="row">										
				
				<?php if( $content=$helper->getLangConfig('widget_logo') ) {?>
				<div class="column col-xs-12 col-sm-12 col-lg-12 col-md-12 contact">
					<?php echo $content; ?>
				</div>
				<?php } ?>
				
			 </div> 
			</div> 
	</div></div>
	<?php  } ?>	

	<?php
	/**
	 * Footer Center Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
	 */
	$blockid = 'footer_center';
	$blockcls = '';
	$modules = $helper->getModulesByPosition( $blockid ); 
	$ospans = array(1=>2,2=>2,3=>2,4=>2,5=>4);
	
	if( count($modules) &&  $helper->getConfig('enable_footer_center') ){
		require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );

	} else { ?>
	
	<div class="footer-center">
		<div class="container">
			<div class="inner">
			<div class="row">	
			

			<?php if ($informations) { ?>
			<div class="column col-xs-12 col-sm-12 col-lg-3 col-md-3">
				<div class="box info box-primary">
					<div class="box-heading"><span><?php echo $text_information; ?></span></div>
					<div class="box-content">
						<ul class="list">
						  <?php foreach ($informations as $information) { ?>
						  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
						  <?php } ?>
						</ul>
					</div>					
				</div>
			</div>
			<?php } ?>	

			<div class="column col-xs-12 col-sm-12 col-lg-3 col-md-3">
				<div class="box customer-service">
					<div class="box-heading"><span><?php echo $text_service; ?></span></div>
					<div class="box-content">
						<ul class="list">						  
							<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
							<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
							<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
							<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
							<li><a href="<?php echo $track; ?>"><?php echo $text_track; ?></a></li>
						</ul>
					</div>	
				</div>
			</div>			
			<?php if( $content=$helper->getLangConfig('widget_delivery') ) {?>
			<div class="column col-xs-12 col-sm-12 col-lg-3 col-md-3">
<div class="box info box-primary">
				<?php echo $content; ?>
			</div></div>
			<?php } ?>
			<?php if( $content=$helper->getLangConfig('widget_contact') ) {?>
			<div class="column col-xs-12 col-sm-12 col-lg-3 col-md-3">
					<div class="box info box-primary">
				<?php echo $content; ?>
</div>
			</div>
			<?php } ?>	

		 </div> </div> 
	</div></div>
<?php  } ?>	


<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
	<?php
	/**
	 * Footer Bottom
	 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
	 */
	$blockid = 'footer_bottom';
	$blockcls = '';
	$modules = $helper->getModulesByPosition( $blockid ); 
	$ospans = array();

	?>	
	<?php
	if( count($modules) ){
	$cols = isset($config['block_'.$blockid])&& $config['block_'.$blockid]?(int)$config['block_'.$blockid]:count($modules);	
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<section class="<?php echo str_replace('_','-',$blockid); ?> <?php $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>" role="block">
			<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
			<?php if(  $i++%$cols == 0 || count($modules)==1  ){  $j=1;?>
			<div class="container"><div class="inner"><div class="row"><?php } ?>	
			<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
			<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div></div></div><?php } ?>	
			<?php  $j++;  } ?>	

	</section>
	<?php } ?>
	<!--
	OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
	Please donate via PayPal to donate@opencart.com
	//-->
	<div id="powered">
		<div class="container">
			<div class="inner">
				<div class="row">
					<div class="col-xs-12 ">
						<div class="copyright text-center">
						<?php if( $helper->getConfig('enable_custom_copyright', 0) ) { ?>
							<?php echo $helper->getConfig('copyright'); ?>
						<?php } else { ?>
							<?php echo $powered; ?>. 
						<?php } ?>
					
						</div>	
					
					</div>
				</div>	
			</div>
		</div>
		<!--vqmod-powered-by-footer-->

		<!--vqcode-footer-payment-images-->
		
	</div>
</footer>
</div>

<?php if( $helper->getConfig('enable_paneltool',0) ){  ?>
	<?php  echo $helper->renderAddon( 'panel' );?>
<?php } ?>
</section>
</body></html>

