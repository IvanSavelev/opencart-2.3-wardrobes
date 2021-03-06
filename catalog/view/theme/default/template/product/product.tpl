<?php echo $header; ?>

<!-- MODAL WINDOW BEGIN -->
<div class="overlay modal_window_box" style="display: none" title="окно"></div>
<div class="popup modal_window_box" id="modal_window_box" style="display: none">
	<div class="close_window">x</div>
</div>
<!-- MODAL WINDOW BEGIN END -->



<!-- PUPAP MESSAGE END -->
<div class="message-pupop" id="message-characteristic" style="display: none;">
	<p class="font-size-12 font-type-verdana" id="text">Мы можем изготовить шкаф-купе который
		присутствует на нашем сайте с любыми
		вашими индивидуальными размерами </p>
	<p class="arrow"></p>
</div>
<!-- PUPAP MESSAGE END -->

<input type="hidden" name="product_id" data-modal="1" value="<?php echo $product_id; ?>" />


<div class="container visible-lg"  id="product">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
		<?php if(!next($breadcrumbs)) { ?>
		<li class="breadcrumb_last"><span class="red"><?php echo $breadcrumb['text']; ?></span></li>
		<?php continue; ?>
		<?php } ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>


	<div class="row row-base">
		<div class="col-lg-8">
			<?php if ($thumb || $images) { ?>
			<div class="thumbnails">
				<div class=" thumbnail-left <?php if (!$images) { ?> one-image <?php } ?>">
					<?php if ($images) { ?>
					<?php foreach ($images as $image) { ?>
					<div class="image-additional">
						<a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
							<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
								 alt="<?php echo $heading_title; ?>"/>
						</a>
					</div>
					<?php } ?>
					<div class="border-gray" id="thumbnail-button"  ></div>
					<?php } ?>
				</div>

				<div class="images-item <?php if (!$images) { ?> one-image <?php } ?>">

					<?php if ($thumb) { ?>
					<a class="thumbnail " style="" href="<?php echo $popup; ?>"
					   title="<?php echo $heading_title; ?>">
						<div class="box-icon <?php if($discount || $new) { echo 'icon'; }?>" style="height: 400px;">

								<img src="<?php echo $thumb; ?>"
								 title="<?php echo $heading_title; ?>"
								 style="max-width: 100%; max-height: 100%;"
								 alt="<?php echo $heading_title; ?>"/>


							<?php if($discount) { ?>
							<div class="product-icon discount">Скидка <?php echo $discount; ?>%</div>
							<?php } ?>
							<?php if($new && !$discount) { ?>
							<div class="product-icon new">Новинка</div>
							<?php } ?>
						</div>
					</a>

					<?php } ?>
				</div>
			</div>

			<?php } ?>
			<div class="nav nav-tabs border-gray font-type-georgia">
				<div class="button" data-tab="characteristic-tab"><p class="active-button">Характеристика</p></div>
				<div class="button" data-tab="description-tab"><p  class="active-div">Описание</p></div>
				<div class="button" data-tab="color-tab"><p class="active-div">Цвет</p></div>
				<div class="button" data-tab="reviews-tab"><p  class="active-div">Отзывы</p></div>
				<div class="button" data-tab="delivery-tab"><p  class="active-div">Доставка</p></div>
			</div>
			<div class="check-info border-gray">
				<div id="characteristic-tab" style="">
					<div class="characteristic-top">
						<div id="size-box">
							<div id="size" class="block-line font-size-15 font-type-verdana">Размеры</div>
							<div id="width" class="block-line">
								<p class="block-line font-size-15 font-type-verdana">Ширина:</p>
								<?php if($width=='') { ?>
								<a href="<?php echo $calculator ?>" class="any block-line font-size-15 font-type-verdana red font-underline">Любая</a>
								<?php } else { ?>
								<p class="block-line <?php if(mb_strlen($width)<8) { ?> font-size-15 <?php } else { ?> font-size-13 <?php } ?>   font-type-verdana"><?php echo $width ?></p>
								<?php } ?>
							</div>
							<div id="height" class="block-line">
								<p class="block-line font-size-15 font-type-verdana">Высота:</p>
								<?php if($height=='') { ?>
								<a href="<?php echo $calculator ?>" class="any block-line font-size-15 font-type-verdana red font-underline">Любая</a>
								<?php } else { ?>
								<p class="block-line <?php if(mb_strlen($height)<8) { ?> font-size-15 <?php } else { ?> font-size-13 <?php } ?> font-type-verdana"><?php echo $height ?></p>
								<?php } ?>
							</div>
							<div id="depth" class="block-line">
								<p class="block-line font-size-15 font-type-verdana">Глубина:</p>
								<?php if($depth=='') { ?>
								<a href="<?php echo $calculator ?>" class="any block-line font-size-15 font-type-verdana red font-underline">Любая</a>
								<?php } else { ?>
								<p class="block-line <?php if(mb_strlen($depth)<8) { ?> font-size-15 <?php } else { ?> font-size-13 <?php } ?> font-type-verdana"><?php echo $depth ?></p>
								<?php } ?>
							</div>
						</div>
					</div>
					<div style="margin: 15px"><?php echo $characteristic; ?></div>
				</div>
				<div id="description-tab" style="padding: 12px; display: none">
					<?php echo $description; ?>
				</div>
				<div id="color-tab" style="padding: 12px; display: none">
					<p>Доступные цвета</p>
					<div>
						<?php foreach($colors as $color) { ?>
						<?php echo $color; ?>
						<?php } ?>
					</div>

				</div>
				<div id="reviews-tab" style="display: none">
					<?php if(!empty($reviews)) { ?>
					<?php if(isset($reviews[count($reviews)-2])) { ?>
					<div class="reviews-box" id="review">
						<p style="color: #3e70c5; font-size: 18px;     margin-bottom: 7px;"><?php echo $reviews[count($reviews)-1]['author']?></p>

						<p style="padding-top: 0; margin: 0;"><?php echo $reviews[count($reviews)-1]['text']?></p>

						<p style="padding-top: 5px; font-size: 11px;"><?php echo $reviews[count($reviews)-1]['date_added']?></p>
						<a href="/" style=" position: absolute; color: #3e70c5; top: 90px; left: 177px; font-size: 13px;">Ответить</a>
					</div>
					<div class="reviews-box" id="review" style="padding-top: 0px; background-position-y: 4px;">
						<p style="color: #3e70c5; font-size: 18px;     margin-bottom: 7px;"><?php echo $reviews[count($reviews)-2]['author']?></p>

						<p style="padding-top: 0; margin: 0;"><?php echo $reviews[count($reviews)-2]['text']?></p>

						<p style="padding-top: 0px; font-size: 11px;"><?php echo $reviews[count($reviews)-2]['date_added']?></p>
						<a href="/" style=" position: absolute; color: #3e70c5; top: 73px; left: 177px; font-size: 13px;">Ответить</a>
					</div>
					<p style="position: relative; color: #3e70c5; font-size: 18px; top: -6px; left: 24px; cursor: pointer;">
						Оставить отзыв</p>
					<?php } else { ?>
					<?php if(isset($reviews[count($reviews)-1])) { ?>
					<div class="reviews-box" id="review">
						<p style="color: #3e70c5; font-size: 18px;     margin-bottom: 7px;"><?php echo $reviews[count($reviews)-1]['author']?></p>
						<p style="padding-top: 0; margin: 0;"><?php echo $reviews[count($reviews)-1]['text']?></p>
						<p style="padding-top: 5px; font-size: 11px;"><?php echo $reviews[count($reviews)-1]['date_added']?></p>
						<a href="/" style=" position: absolute; color: #3e70c5; top: 90px; left: 177px; font-size: 13px;">Ответить</a>
					</div>
					<div class="messange-review">
						<p style="position: relative; color: #3e70c5; font-size: 18px; top: -6px; left: 24px; cursor: pointer;">Оставить отзыв</p>
						<textarea name="review" rows="4" placeholder="Написать комментарий..." class="form-control" id="textarea-review"></textarea>
						<div class="mes">
							<p style="position: relative">Войти с помощью:</p>
							<img id="vk_auth" class="icon" src="../catalog/view/theme/default/image/icon-vk.svg">
						</div>
					</div>
					<?php } ?>
					<?php } ?>
					<?php } else { ?>

					<div class="empty-review font-italic gray">
						Здесь пока нет отзывов
					</div>
					<div class="messange-review">
						<p style="position: relative; color: #3e70c5; font-size: 18px; top: -6px; left: 24px; cursor: pointer;">Оставить отзыв</p>
						<textarea name="review" rows="4" placeholder="Написать комментарий..." class="form-control" id="textarea-review"></textarea>
						<div class="mes">
							<p style="position: relative">Вход с помощью</p>
							<img id="vk_auth" class="icon" src="../catalog/view/theme/default/image/icon-vk.svg">
							<img id="vk_auth" class="icon" src="../catalog/view/theme/default/image/icon-instagram.svg">
							<img id="vk_auth" class="icon" src="../catalog/view/theme/default/image/icon-facebook.svg">
							<img id="vk_auth" class="icon" src="../catalog/view/theme/default/image/icon-ok.svg">
						</div>
					</div>
					<?php } ?>


				</div>
				<div id="delivery-tab" style="padding: 12px; padding-top: 28px; display: none">
					<!--noindex-->
					<div class="delivery-box" id="calck"><p>После заказа с вами свяжется менеджер для уточнения удобного времени доставки.</p></div>
					<div class="delivery-box" id="cart"><p style="padding-top: 15px;">Доставка и изготовление происходит в течении 7 дней.</p></div>
					<div class="delivery-box" id="drill"><p style="padding-top: 12px;">Монтаж  и сборка происходит в течении 2 - 4 часов в зависимости от сложности</p></div>
					<!--/noindex-->
				</div>

			</div>
		</div>
		<div class="col-lg-4 left-column">
			<h1 id="text-name"><?php echo $heading_title; ?></h1>

			<div class="phone-box border-gray">
				<!--noindex-->
				<p class="phone-child-1 text-left">Дизайн-проект по продукции, выезд дизайнера и замерщика <a href="<?php echo $special_link; ?>" rel="nofollow" class="red">в подарок.</a></p>
				<!--/noindex-->
				<input type="text" name="name" data-modal="1" value="" placeholder="Введите ваше имя" class="phone-child-2 input-field">
				<input type="text" name="telephone" data-modal="1" value="" placeholder="Введите ваш телефон" class="phone-child-3 input-field">
				<input type="button" name="active-phone" data-modal="1" value="Запросить звонок" class="phone-child-4 button-style-1"  />
				<span class="error" name="name" data-modal="1" hidden="hidden">Пожалуйста, введите имя</span>
				<span class="error" name="phone" data-modal="1" hidden="hidden">Пожалуйста, введите телефон</span>
				<!--noindex-->
				<span class="phone-child-5 text-mini ">Нажимая на кнопку, вы даете согласие на обработку персональных данных и соглашаетесь c политикой конфиденциальности.</span>
				<!--/noindex-->
			</div>
			<?php if($price_view) { ?>
				<div class="price-box">
					<?php if($price_view_meter) { ?>
					<p class="name-price">Цена за погонный метр:</p>
					<?php } ?>
					<?php if ($discount) { ?>
					<p class="price green"><?php echo trim($price); ?><span class="price-rubil-green"> </span></p>
					<p class="price-old"><?php echo trim($price_old); ?><span class="price-rubil-gray"> </span></p>
					<?php } else { ?>
					<p class="price <?php if(!$price_view_meter) { ?> price-product <?php } ?>"><?php echo trim($price); ?><span class="price-rubil-black"> </span></p>
					<?php } ?>
				</div>
			<?php } else { ?>
				<div class="stub"></div>
			<?php } ?>
			<div class="advantages border-gray">
				<div class="advantages-top">
					<p class="ont-type-georgia font-size-18">Способы оплаты</p>
					<div class="item">
						<p class="font-type-verdana font-size-14">Наличный расчет</p>
						<p class="font-type-verdana font-size-14">Банковской картой</p>
						<p class="font-type-verdana font-size-14">Оплата в расрочку</p>
					</div>
					<div class="image"></div>
				</div>
				<hr class="line-product gray">
				<div class="advantages-down">
					<p class="ont-type-georgia font-size-18">Наши преимущества</p>
					<div class="item">
						<p class="font-type-verdana font-size-14">На рынке с 2008г</p>
						<p class="font-type-verdana font-size-14">Гарантия от 2х лет</p>
						<p class="font-type-verdana font-size-14">Изготовление от 7 дней</p>
					</div>
					<div class="image"></div>
				</div>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	</div>





</div>


<!-- FOR MOBILE -->
<div class="container hidden-lg" id="product">
	<div class="row">
		<div class="col-xs-12 text-left back">
			<a href="<?php echo $referer_mobile; ?>" class="border-gray">Назад</a>
			<div id="name-box">
				<p class="cat-bef-h4 text-right"><?php echo $heading_title; ?></p>
			</div>
		</div>
		<div class="col-xs-12">

			<div class="thumbnails">



				<div class=" thumbnail-left <?php if (!$images) { ?> one-image <?php } ?>">
					<?php if ($images) { ?>
						<?php foreach ($images as $image) { ?>
							<div class="image-additional">
								<a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
									<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
										 alt="<?php echo $heading_title; ?>"/>
								</a>
							</div>
							<?php } ?>
					<?php } ?>
				</div>
				<div class=" images-item <?php if (!$images) { ?> one-image <?php } ?>">
					<?php if ($thumb) { ?>
					<a class="thumbnail" href="<?php echo $popup; ?>"
					   title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>"
																  title="<?php echo $heading_title; ?>"
																  style="max-width: 100%; max-height: 100%;"
																  alt="<?php echo $heading_title; ?>"/></a>

					<?php } ?>
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<?php if($price_view) { ?>
			<div class="price-box price-one-product">
				<?php if($price_view_meter) { ?>
				<p class="name-price">Цена за погонный метр:</p>
				<?php } ?>
				<?php if ($discount) { ?>
				<p class="price green"><?php echo trim($price); ?><span class="price-rubil-green"> </span></p>
				<p class="price-old"><?php echo trim($price_old); ?><span class="price-rubil-gray"> </span></p>
				<?php } else { ?>
				<p class="price"><?php echo trim($price); ?><span class="price-rubil-black"> </span></p>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
		<div class="col-xs-12">
			<div class="phone-box border-gray">
				<p class="phone-child-1 text-left">Дизайн-проект по продукции, выезд дизайнера и замерщика <a href="<?php echo $special_link; ?>" rel="nofollow" class="red">в подарок.</a></p>
				<input type="text" name="name" data-modal="4" value="" placeholder="Введите ваше имя" class="phone-child-2 input-field">
				<input type="text" name="telephone" data-modal="4" value="" placeholder="Введите ваш телефон" class="phone-child-3 input-field">
				<input type="button" name="active-phone" data-modal="4" value="Запросить звонок" class="phone-child-4 button-style-1"  />
				<span class="error" name="name" data-modal="4" hidden="hidden">Пожалуйста, введите имя</span>
				<span class="error" name="phone" data-modal="4" hidden="hidden">Пожалуйста, введите телефон</span>
				<!--noindex-->
				<span class="phone-child-5 text-mini">Нажимая на кнопку, вы даете согласие на обработку персональных данных и соглашаетесь c политикой конфиденциальности.</span>
				<!--/noindex-->
			</div>
		</div>
		<div class="col-xs-12 button-tabs-mobile">
			<div class="nav nav-tabs border-gray font-type-georgia">
				<div class="button" data-tab="characteristic-tab"><p class="active-button">Характеристика</p></div>
				<div class="button" data-tab="description-tab"><p  class="active-div">Описание</p></div>
				<div class="button" data-tab="delivery-tab"><p  class="active-div">Доставка</p></div>
			</div>
		</div>
		<div class="col-xs-12 button-tab-mobile">
			<div class="check-info border-gray">

				<div id="characteristic-tab">
					<div class="characteristic-top-text-mobile">
						Габаритные размеры
					</div>
					<div class="characteristic-top-mobile">
						<div id="size-box-mobile">
							<div id="width-mobile" class="block-line-mobile">
								<p class="name">Ширина:</p>
								<?php if($width=='') { ?>
								<a href="<?php echo $calculator ?>" class="any block-line font-size-15 font-type-verdana red font-underline">Любая</a>
								<?php } else { ?>
								<p class="size"><?php echo $width ?></p>
								<?php } ?>
							</div>
							<div id="height-mobile" class="block-line-mobile">
								<p class="name">Высота:</p>
								<?php if($height=='') { ?>
								<a href="<?php echo $calculator ?>" class="any block-line font-size-15 font-type-verdana red font-underline">Любая</a>
								<?php } else { ?>
								<p class="size"><?php echo $height ?></p>
								<?php } ?>
							</div>
							<div id="depth-mobile" class="block-line-mobile">
								<p class="name">Глубина:</p>
								<?php if($depth=='') { ?>
								<a href="<?php echo $calculator ?>" class="any block-line font-size-15 font-type-verdana red font-underline">Любая</a>
								<?php } else { ?>
								<p class="size"><?php echo $depth ?></p>
								<?php } ?>
							</div>
						</div>
					</div>
					<div class="characteristic-box-mobile">
						<div style="margin: 15px"><?php echo $characteristic; ?></div>
					</div>
				</div>

				<div id="description-tab" style="padding: 12px; display: none">
					<?php echo $description; ?>
				</div>

				<div id="delivery-tab" style="display: none">
					<!--noindex-->
					<div class="row text-center">
						<div class="col-sm-12">
							<img src="../catalog/view/theme/default/image/product-calck.png">
						</div>
						<div class="col-sm-12">
							<p>После заказа с вами свяжется менеджер для уточнения удобного времени доставки.</p>
						</div>
						<div class="col-sm-12">
							<img src="../catalog/view/theme/default/image/product-cart.png">
						</div>
						<div class="col-sm-12">
							<p>Доставка и изготовление происходит в течении 7 дней.</p>
						</div>
						<div class="col-sm-12">
							<img src="../catalog/view/theme/default/image/product-drill.png">
						</div>
						<div class="col-sm-12">
							<p>Монтаж  и сборка происходит в течении 2 - 4 часов в зависимости от сложности</p>
						</div>
					</div>
					<!--/noindex-->
				</div>

			</div>
		</div>
		<div class="col-xs-12 button-perfect-mobile">
			<div class="border-gray" id="perfect">
				<div><p class="name-perfect font-type-georgia">Способы оплаты</p></div>
				<div class="payment">
					<div class="element">
						<img src="../catalog/view/theme/default/image/product-payment_by_installments-mobile.png">
						<p>Наличный расчет</p>
					</div>
					<div class="element">
						<img src="../catalog/view/theme/default/image/product-by_bank_card-mobile.png">
						<p>Банковской картой</p>
					</div>
					<div class="element">
						<img src="../catalog/view/theme/default/image/product-cash_payment-mobile.png">
						<p>Оплата в рассрочку</p>
					</div>
				</div>
				<hr>
				<div><p class="name-perfect font-type-georgia">Наши преимущества</p></div>
				<div class="our-advantages">
					<div class="element">
						<img src="../catalog/view/theme/default/image/product-market_since_2008-mobile.png">
						<p>На рынке с 2008г</p>
					</div>
					<div class="element">
						<img src="../catalog/view/theme/default/image/product-2_years_warranty-mobile.png">
						<p>Гарантия от 2-х лет</p>
					</div>
					<div class="element">
						<img src="../catalog/view/theme/default/image/production_from_20_days-mobile.png">
						<p>Изготовление от 20 дней</p>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 visit-product">
			<div class="row">
				<?php echo $content_bottom; ?>
			</div>
		</div>

	</div>
</div>



<?php echo $footer; ?>
<script>
	$(document).ready(function() {
	/*	$('.name-price span').qtip({
			content: {
				text: $(this).next('div') // Use the "div" element next to this for the content
			}
		});*/
		/*$('.name-price span').mousemove(function () {

		})
		$('.selector').qtip({
			content: 'My content'
		});*/
	});
</script>