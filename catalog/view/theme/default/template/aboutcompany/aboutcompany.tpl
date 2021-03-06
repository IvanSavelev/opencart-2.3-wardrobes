<?php echo $header; ?>
<div class="container visible-lg" id="aboutcompany">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
			<?php if(!next($breadcrumbs)) { ?>
				<li class="breadcrumb_last"><span class="red"><?php echo $heading_title; ?></span></li>
				<?php continue; ?>
			<?php } ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row row-base">
			<?php echo $content_top; ?>
			<div class="picture-back aboutcompany">
			</div>
			<div class="text_box aboutcompany text-description"><?php echo $description; ?></div>
			<?php echo $content_bottom; ?></div>
		<?php echo $column_right; ?></div>
	</div>
</div>

<!-- FOR MOBILE -->
<div class="container hidden-lg" id="aboutcompany">
	<div class="row">
		<div class="col-xs-12 text-left back">
			<a href="<?php echo $referer_mobile; ?>" class="border-gray">Назад</a>
		</div>
		<div class="col-xs-12 text-left">
			<div class="picture-back aboutcompany"></div>
			<div class="text_box aboutcompany text-description"><?php echo $description; ?></div>
		</div>
	</div>
</div>

<?php echo $footer; ?>
