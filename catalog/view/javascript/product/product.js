$(window).load(function () {    sizeCharacteristic();    sizeName();});$(document).ready(function() {    if(mobileDetect()) {        //Карусель        var owl = $("[name ='visitedproduct']");        owl.owlCarousel({            loop:true, //Зацикливаем слайдер            margin:29, //Отступ от картино если выводите больше 1            nav:false, //Отключил навигацию            autoplay:false, //Автозапуск слайдера            smartSpeed:1000, //Время движения слайда            autoplayTimeout:5000, //Время смены слайда            dots: false,            dotsEach:true,            responsive:{ //Адаптация в зависимости от разрешения экрана                0:{                    items:1                },                600:{                    items:1                },                1200:{                    items:41                }            }        });    } else {        //Карусель        var owl = $("[name ='visitedproduct']");        owl.owlCarousel({            loop:true, //Зацикливаем слайдер            margin:29, //Отступ от картино если выводите больше 1            nav:false, //Отключил навигацию            autoplay:false, //Автозапуск слайдера            smartSpeed:1000, //Время движения слайда            autoplayTimeout:5000, //Время смены слайда            dots: false,            dotsEach:true,            responsive:{ //Адаптация в зависимости от разрешения экрана                0:{                    items:4                },                600:{                    items:4                },                1200:{                    items:4                }            }        });    }    $('.nav-tabs .button').on('click', function () {        $('.nav-tabs .button p').removeClass('active-button');        $(this).find('p').addClass('active-button');        var id = $(this).data('tab');        $('.check-info>div').hide();        $('.check-info').find('#' + id).show();    });    $('#characteristic .any').mouseenter(function () {        $('#message-characteristic').show();        $(this).before($('#message-characteristic'));    });    $('#characteristic .any').mouseleave(function () {        $('#message-characteristic').hide();    });    //Форма для ввода телефона    $("[name='active-phone']").click(function (event) {        var root = $(this).parent();        var text_phone = root.find("[name='telephone']").val();        var text_name = root.find("[name='name']").val();        $('.error').hide();        if (text_phone == '' || text_name == '') {            if(text_name == '') {                $(".error[name='name']").show();            }            if(text_phone == '') {                $(".error[name='phone']").show();            }            return false;        } else {            $("[name='product_id']").data('modal', $(this).data('modal'));            ajaxClientCall($(this).data('modal'), 3, 0);        }    });    //Модальное окно с вводом телефона    $("[name='to_order']").click(function (event) {        $("[name='product_id']").data('modal', $(this).data('modal'));        ajaxClientCall($(this).data('modal'), 3, 1);    });    $('.thumbnails').magnificPopup({        type: 'image',        delegate: 'a',        gallery: {            enabled: true        }    });    $(window).resize(function () {        sizeCharacteristic();        sizeName()    });});function sizeCharacteristic() {   // $('.price').text($(window).width());    if ($(window).width() > 480) { //Если размер совсем маленький, делаем все в столбик, и не используем JS      //  $('.price').text($(window).width());        var root = $('#size-box-mobile');        var width_mobile = root.find('#width-mobile');        var height_mobile = root.find('#height-mobile');        var depth_mobile = root.find('#depth-mobile');        for (var i = 0; i < 25; i++) {            var width_div_size = width_mobile.outerWidth();            var height_div_size = height_mobile.outerWidth();            var depth_div_size = depth_mobile.outerWidth();            //padding            var width_p = parseInt(width_mobile.css('padding-left'));            var height_p = parseInt(height_mobile.css('padding-left'));            var depth_p = parseInt(depth_mobile.css('padding-left'));            //alert('width_div_size ' + width_div_size + 'height_div_size ' + height_div_size + 'depth_div_size ' + depth_div_size + 'oot.width() ' + root.width());            if (width_div_size + height_div_size + depth_div_size + width_p + height_p + depth_p + 5 > root.width()) {               // alert('check!');                updateSize(width_mobile);                updateSize(height_mobile);                updateSize(depth_mobile);            } else {                break;            }        }    }}function updateSize(width_mobile) {    updateSizeItem(width_mobile, 'p.name');    updateSizeItem(width_mobile, 'a');    updateSizeItem(width_mobile, 'p.size');}function updateSizeItem(width_mobile, value) {    var text = '.' + width_mobile.attr('class') + ' ' + value;    if ($(text).length > 0) {        var size_old = width_mobile.find(value).css('font-size');        width_mobile.find(value).css('font-size', (parseInt(size_old) - 1) + 'px');    }}function sizeName() {    if ($(window).width() > 480) { //Если размер совсем маленький, ничего не делаем        var root_object = $('.back');        var back_button = root_object.find('a');        var width = root_object.width();        var text_object = root_object.find('p:visible');        // alert('width = ' + width + 'p_left' + p_left + 'p_right' +p_right + 'text_object.width() ' + text_object.width());        // alert('width - back_button.width() - 65 ' + (width - back_button.width() - 65) + 'back_button = ' + back_button.width() +  ' text_object.width() ' + text_object.width());        for (var i = 0; i < 25; i++) {            if (width - back_button.width() - 35 < text_object.width()) {                var size_old = text_object.css('font-size');                text_object.css('font-size', (parseInt(size_old) - 1) + 'px');            } else {                break;            }        }    }}