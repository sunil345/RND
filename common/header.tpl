<?php 
/******************************************************
 * @package Pav Opencart Theme Framework for Opencart 1.5.x
 * @version 1.1
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Augus 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/
$this->language->load('module/themecontrol');
$themeName =  $this->config->get('config_template');
require_once(DIR_SYSTEM . 'pavothemes/loader.php');
$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
$helper->setDirection( $direction );
$helper->triggerUserParams( array('headerlayout','productlayout') );
/* Add scripts files */
$helper->addScript( 'catalog/view/javascript/jquery/jquery-1.7.1.min.js' );
$helper->addScript( 'catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js' );
$helper->addScript( 'catalog/view/javascript/jquery/ui/external/jquery.cookie.js' );
$helper->addScript( 'catalog/view/javascript/common.js' );
$helper->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
$helper->addScript( 'catalog/view/theme/'.$themeName.'/javascript/common.js' );
$helper->addScript( 'catalog/view/javascript/jquery/bootstrap/bootstrap.min.js' );
$helper->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
$helper->addScriptList( $scripts );
$helper->addCss( 'catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css' );	
$helper->addCss( 'catalog/view/javascript/jquery/colorbox/colorbox.css' );	

$ctheme=$helper->getConfig('customize_theme');
if( file_exists(DIR_TEMPLATE.$themeName.'/stylesheet/customize/'.$ctheme.'.css') ) {  
	$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/customize/'.$ctheme.'.css'  );
}

$helper->addCss('catalog/view/javascript/jquery/magnific/magnific-popup.css');
$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/animation.css' );	
$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/font-awesome.min.css' );
$helper->addScript( 'catalog/view/javascript/jquery/fancybox/jquery.fancybox.js' );	

$helper->addCssList( $styles );
 
$logoType = $helper->getConfig('logo_type','logo-theme');
$headerlayout = $helper->getConfig('header_layout');

if( $helper->getConfig('enable_paneltool') ){
	if( $helper->getParam('headerlayout') ){
		$headerlayout = $helper->getParam('headerlayout');
	}
}

$skin = $helper->getConfig('skin');


?>

<!DOCTYPE html>
<html dir="<?php echo $helper->getDirection(); ?>" class="<?php echo $helper->getDirection(); ?>" lang="<?php echo $lang; ?>">
<head>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<!-- Mobile viewport optimized: h5bp.com/viewport -->
<meta name="viewport" content="width=device-width">
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
 
<?php if( isset($links) && $links )  { foreach ($links as $link) {  ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } } ?>
<?php foreach ($helper->getCssLinks() as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach( $helper->getScriptFiles() as $script )  { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<?php if( $cjs=$helper->getConfig('custom_javascript') ){ ?>
	<script type="text/javascript"><!--
		$(document).ready(function() {
			<?php echo html_entity_decode(trim($cjs) ); ?>
		});
//--></script>
<?php }	?>

<?php 
	if( $helper->getConfig('enable_customfont',0) ){
	$themeConfig = $this->config->get( 'themecontrol' );	
	$css=array();
	$link = array();
	for( $i=1; $i<=3; $i++ ){
		if( trim($themeConfig['google_url'.$i]) && $themeConfig['type_fonts'.$i] == 'google' ){
			$link[] = '<link rel="stylesheet" type="text/css" href="'.trim($themeConfig['google_url'.$i]) .'"/>';
			$themeConfig['normal_fonts'.$i] = $themeConfig['google_family'.$i];
		}
		if( trim($themeConfig['body_selector'.$i]) && trim($themeConfig['normal_fonts'.$i]) ){
			$fs = (int)$themeConfig['fontsize'.$i]>0?"font-size:".$themeConfig['fontsize'.$i].'px;':'';
			$ff = $themeConfig['normal_fonts'.$i] !="inherit"? "font-family:".str_replace("'",'"',htmlspecialchars_decode(trim($themeConfig['normal_fonts'.$i]))):"";
			$css[]= trim($themeConfig['body_selector'.$i])." { ".$fs." " . $ff ."}\r\n"	;
		}
	}
	echo implode( "\r\n",$link )."\r\n";
	echo '<style type="text/css"> '.implode( " ",$css ).' </style>';
}
?>

<!--[if lt IE 9]>
<?php if( $helper->getConfig('load_live_html5') ) { ?>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<?php } else { ?>
<script src="catalog/view/javascript/html5.js"></script>
<?php } ?>
<script src="catalog/view/javascript/respond.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $themeName;?>/stylesheet/ie8.css" />
<![endif]-->

<?php if( $helper->getConfig('enable_paneltool') ){  ?>
<link  href="catalog/view/theme/<?php echo $themeName;?>/stylesheet/paneltool.css" rel="stylesheet"/>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorpicker/js/colorpicker.js"></script>
<link  href="catalog/view/javascript/jquery/colorpicker/css/colorpicker.css" rel="stylesheet" />
<?php } ?>

<?php if ( isset($stores) && $stores ) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<link rel="stylesheet" type="text/css" href="<?php echo CDN_SERVER ?><?php echo filemtime('catalog/view/javascript/jquery/fancybox/jquery.fancybox.css')."/"?>catalog/view/javascript/jquery/fancybox/jquery.fancybox.css" />
<style type="text/css"> 
.fancybox-overlay {    z-index: 500 !important;} 
.fancybox-opened {z-index: 600!important;}
.tree-menu ul li .accordion-heading span{width: 0px !important;} 
</style>
<!--<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.total-storage.min.js"></script>-->
<?php echo $google_analytics; ?>
<!--vqcode-header-->
<!--for responsive menu Start here-->
 <style>
.megamenu .caret {
   position: absolute;
   top: 16%;
   right: 15px;
}
   .pav-megamenu .navbar-nav > li > a {
       padding: 10px 15px;
       position: relative;
   }
   
   .pav-megamenu .navbar-nav > li > a .caret:before {
       right: 0;
       top: -1px;
   }
   
   .pav-megamenu .navbar-nav > li > a .caret {
       position: absolute;
       float: none;
   }

#menu-offcanvas {
       -webkit-transition: none;
       -moz-transition: none;
       transition: none;      
   }
   
   @media (min-width: 768px) {
       .collapse {
           display: block!important;
       }
   }
   
   @media (max-width: 767px) {
.button-close-menu{
display:none;
}
       .collapse {
           display: block!important;
       }
       ul.nav.navbar-nav.megamenu {
           display: none;
       }
       a.btn.btn-navbar {
           display: block !important;
       }
span.icon-bar {
           width: 35px;
           height: 5px;
           margin-bottom: 4px;
           display: inherit;
           background-color: #000;
       }
    .fa.fa-times-circle-o {
         font-size: 20px;
   } 
   }


   
   .pushmenu-left {
       left: -250px;
   }
   
   .pushmenu-left.pushmenu-open {
       left: 0;
   }
   
   .pushmenu-push {
       overflow-x: hidden;
       position: relative;
       left: 0;
   }
   
   .pushmenu-push-toright {
       left: 250px;
   }
   /*Transition*/
   
   .pushmenu,
   .pushmenu-push {
       -webkit-transition: all 0.3s ease;
       -moz-transition: all 0.3s ease;
       transition: all 0.3s ease;
   }
.offcanvas-menu::after {
z-index:-1;
}
.offcanvas-menu{
width:250px;
}
.navbar-inverse .navbar-toggle{
display:none;
}
.navbar-inverse .navbar-toggle .icon-bar {
   background-color: #000;
}
.navbar-inverse .navbar-toggle:hover  .icon-bar ,.navbar-inverse .navbar-toggle:focus .icon-bar {
   background-color: #000;
}
.navbar-inverse .navbar-toggle:hover > .icon-bar {
   background-color: #fff !important;
}
   
  


   </style>


<script>
$(document).ready(function() {
   $("body").addClass("pushmenu-push");
   $(".offcanvas-menu").addClass("pushmenu-left");

   $(".btn-navbar").click(function() {
       $(this).toggleClass('active');
       $('.pushmenu-push').toggleClass('pushmenu-push-toright');
       $(".offcanvas-menu").toggleClass('pushmenu-open');
       $(".offcanvas-menu").css({
           "visibility": "visible"
       });
   });   
});

   
</script>
<!--for responsive menu end here-->
</head>
<body id="offcanvas-container" class="offcanvas-container layout-<?php echo $helper->getParam( 'layout' ); ?>  <?php echo $helper->getPageClass();?>">
<!-- Multi header -->	
		<?php 
				require( ThemeControlHelper::getLayoutPath( 'common/skin/header.tpl' ) );  
			
		?> 

<!--/**
* sys-notification
*/-->

<section id="sys-notification">
	<div class="container">
		<?php if ($error) { ?>    
		<div class="warning"><?php echo $error ?><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/close.png" alt="" class="close" /></div>
		<?php } ?>
		<div id="notification"></div>
	</div>
</section>

<?php
/**
 * slideshow modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 */
$blockid = 'slideshow';
$blockcls = ' hidden-xs hidden-sm ';
$modules = $helper->getModulesByPosition( $blockid ); 
$ospans = array();// array(1=>3, 2=>9); 
?>

<?php
if( count($modules) ){
$cols = isset($config['block_'.$blockid])&& $config['block_'.$blockid]?(int)$config['block_'.$blockid]:count($modules);	
$class = $helper->calculateSpans( $ospans, $cols );
?>
<section class="<?php echo str_replace('_','-',$blockid); ?> <?php $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>" role="block">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
		<?php if(  $i++%$cols == 0 || count($modules)==1  ){  $j=1;?>
		<div class="container"><div class="row"><?php } ?>	
		<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
		<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div></div><?php } ?>	
		<?php  $j++;  } ?>	

</section>
<?php } ?>

<?php
/**
 * Showcase modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 */
$blockid = 'showcase';
$blockcls = '';
$modules = $helper->getModulesByPosition( $blockid ); 
$ospans = array();
require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>
 
<?php
/**
 * promotion modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 */
$blockid = 'promotion';
$blockcls = '';
$modules = $helper->getModulesByPosition( $blockid ); 
$ospans = array();
require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>

<?php if( $helper->getConfig('enable_offsidebars') ) { ?>
<section id="columns" class="offcanvas-siderbars">
<div class="row visible-xs"><div class="container"> 
	<div class="offcanvas-sidebars-buttons">
		<button type="button" data-for="column-left" class="pull-left btn btn-danger btn-default"><i class="fa fa-sort-amount-asc"></i> <?php echo $this->language->get('text_sidebar_left'); ?></button>
		
		<button type="button" data-for="column-right" class="pull-right btn btn-danger btn-default"><?php echo $this->language->get('text_sidebar_right'); ?> <i class="fa fa-sort-amount-desc"></i></button>
	</div>
</div></div>
<?php }else { ?>
<section id="columns">
<?php } ?>	
