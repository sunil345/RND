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