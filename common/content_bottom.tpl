<?php 
/******************************************************
 * @package Pav Megamenu module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/
?>
<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	require_once(DIR_SYSTEM . 'pavothemes/loader.php');
	$helper = ThemeControlHelper::getInstance( $this->registry, $this->config->get('config_template') );

	$modules = $helper->getModulesByPosition( 'content_bottom' ); 
	$ospans = array(1=>3, 2=>3,3=>3,4=>3);
	$cols   = 4;
	$class = $helper->calculateSpans( $ospans, $cols );

	$skin = $helper->getSkin();
	
?>
<?php if( count($modules) ) : ?>
	<div class="content-bottom">

		<?php if($skin != 'orange') { ?>
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
			<?php if(  $i++%$cols == 0 || count($modules)==1  ){  $j=1;?><div class="row"><?php } ?>	
			<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
			<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>
		<?php } else { ?>
		<?php foreach ($modules as $module) { ?>
			<?php echo $module; ?>
		<?php } ?>
		<?php } //end if check layout?>
	</div>
<?php endif; ?>