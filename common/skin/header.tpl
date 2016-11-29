<section id="page" class="offcanvas-pusher" role="main">
<div class="main-page">

<?php if($helper->getConfig('pavlandingpage') && (!isset($this->request->get['route']) || (isset($this->request->get['route']) && $this->request->get['route'] == 'common/home'))){?>
 	<section class="intro-landingpage hidden-sm hidden-xs">
 	<?php
   		if(!(isset($_COOKIE['pavlandingpage']) && $_COOKIE['pavlandingpage'])){
	   		$landingpage = $this->config->get('pavlandingpage');
	   		if ( !empty($landingpage) && file_exists(DIR_TEMPLATE.$themeName.'/template/common/addon/landingpage.tpl')) {  
	   			require_once( DIR_TEMPLATE.$themeName.'/template/common/addon/landingpage.tpl' ); 
	   		}
   		}
   ?>
   </section>
<?php } ?>

<style>
#header #top-bar .container{background-color: #000; padding: 10px 5px;}
#header #top-bar a{color:#fff; display: inline-block; padding: 0 10px; text-transform: uppercase;}
#header-main #logo { text-align: center;}
#search .input-group-addon .button-search{height:26px; width:23px; background:url('catalog/view/theme/kyara2/image/search.jpg') no-repeat center; display: inline-block;}
#header-main .input-group-addon{display: inline-block;}
#cart{margin-top:0;}
#header-main .container{background-color: #fff;}
#header-main .wrap { color: #3d3d3d; padding-right: 35px;  padding-top: 10px;  position: relative;}
#pav-mainnav .navbar-inverse{background: #fff;  border:0; margin-bottom:0;}
.pav-megamenu .navbar-nav > li { display: inline-block; float: none;}
.navbar-nav{float:none;}
li.deeper:hover > div {
    display: block;
}
.deeper > div {
    background: #fff none repeat scroll 0 0;
    display: none;
    min-width: 150px;
    position: absolute;
    z-index: 99;
}
</style>

<section id="header">
<section id="top-bar">
	<div class="container">
		<div class="inner">
		<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="login pull-right">
				 <div class="currency pull-left" style="display:none;">
                    <?php echo $currency; ?>
                 </div>
				<?php if (!$logged) { ?>
								<?php echo $text_welcome; ?>
								<?php } else { ?>
								<?php echo $text_logged; ?>
								<?php } ?> 					
							</div>
		</div>
		</div>
		</div>
	</div>
</section>
<section id="header-main">
			<div class="container">
				<div class="row header-wrap">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 inner">
				<div id="search"><span class="input-group-addon form-control input-lg"><span class="button-search search"></span></span><input type="text" placeholder="Search Entire Store" name="filter_name"></div>
				</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 inner">
					  			<div id="logo">
								<?php if ($logo) { ?>
			<div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
			<?php } else { ?>	
			<div id="logo"><a href="<?php echo $home; ?>"><img src="http://fakeimg.pl/<?php echo $this->config->get('config_image_logo_width');?>x<?php echo $this->config->get('config_image_logo_height');?>/<?php echo $this->config->get('config_logo_background');?>/<?php echo $this->config->get('config_logo_font_color'); ?>/?text= <?php echo $this->config->get('config_name'); ?>&font=<?php echo $this->config->get('config_logo_font_family');?>" /></a></div>
			<?php } ?>	
								
								</div>
								
					</div>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 inner">
<div class="wrap clearfix">
<div class="quick-cart pull-right" id="cart"><div class="quick-cart pull-right" id="cart">	
 	<?php echo $cart; ?>

	   
		
	 
</div></div>
</div>
</div>					
					
				</div>
			</div>
	</section>
<section id="pav-mainnav">
	<div class="container">
		<div class="mainnav-wrap">
			<div class="navbar navbar-inverse"> 
								<nav id="mainmenutop" class="pav-megamenu" role="navigation"> 
					<?php 
					/**
					 * Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
					 */
					$modules = $helper->getModulesByPosition( 'mainmenu' ); 
					if( count($modules) && !empty($modules) ){ 

					?>

						<?php foreach ($modules as $module) { ?>
							<?php echo $module; ?>
						<?php } ?>

					<?php } elseif ($categories) {  ?>
				
						 
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							</button>
						</div>

					  <div class="collapse navbar-collapse navbar-ex1-collapse text-center">
								  <ul class="nav navbar-nav">
							  	<li><a href="<?php echo $home; ?>" title="<?php echo $this->language->get('text_home');?>"><?php echo $this->language->get('text_home');?></a></li>
								<?php foreach ($categories as $category) { ?>
								
								<?php if ($category['children']) { ?>			
								<li class="parent dropdown deeper "><a href="<?php echo $category['href'];?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?>
								<b class="caret"></b>
								</a>
								<?php } else { ?>
								<li ><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
								<?php } ?>
								<?php if ($category['children']) { ?>
								<div>
									<?php for ($i = 0; $i < count($category['children']);) { ?>
									  <ul class="dropdown-menu" style="display: table-cell;">
									  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
									  <?php for (; $i < $j; $i++) { ?>
									  <?php if (isset($category['children'][$i])) { ?>
									  <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
									  <?php } ?>
									  <?php } ?>
										</ul>
									<?php } ?>
							</div>
								  <?php } ?>
								</li>
								<?php } ?>
								<!--vqcode-menu-->
							  </ul>
						</div>	   
					<?php } ?>
					</nav>
						
			</div>
		</div>
	</div>		
</section>
</section>