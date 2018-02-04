$(document).ready(function() {    //Карусель Хитов Продаж    var owl = $("[name ='best_product']");    owl.owlCarousel({        loop:true, //Зацикливаем слайдер        margin:29, //Отступ от картино если выводите больше 1        nav:false, //Отключил навигацию        autoplay:false, //Автозапуск слайдера        smartSpeed:1000, //Время движения слайда        autoplayTimeout:5000, //Время смены слайда        dots: false,        items: 4,        dotsEach:true,        responsive:{ //Адаптация в зависимости от разрешения экрана            0:{                items:1            },            600:{                items:1            },            1200:{                items:4            }        }    });    sizeName(); //Делаем так, что бы название категории влезало в верху полностью    function sizeName() {        var root_object = $('.back');        var back_button = root_object.find('a');        var image_width = root_object.find('img').width();        var width = root_object.width();        var text_object = root_object.find('p:visible');        // alert('width = ' + width + 'p_left' + p_left + 'p_right' +p_right + 'text_object.width() ' + text_object.width());        // alert('width - back_button.width() - 65 ' + (width - back_button.width() - 65) + 'back_button = ' + back_button.width() +  ' text_object.width() ' + text_object.width());        for (var i = 0; i < 25; i++) {            if (width - back_button.width() -image_width - 35 < text_object.width()) {                var size_old = text_object.css('font-size');                text_object.css('font-size', (parseInt(size_old) - 1) + 'px');            } else {                break;            }        }    }    //Подсвечиваем выбранную категорию    var page_category_id = $("[name='category_id']").val();    $('.list-group a').each(function(i,elem) {        if ($(this).data('id_category') == page_category_id) {            $(this).addClass('red font-underline');            return false;        }    });    //Работа с ползунком    $("#slider-category").slider({        range: true,        min: 0,        max: 200000,        values: [0, 200000],        slide: function (event, ui) {            $('[name="category-input-min"]').val(ui.values[0]);            $('[name="category-input-max"]').val(ui.values[1]);        },        change: function() {            productFilterPrice();        }    });    $('[name="category-input-min"], [name="category-input-max"]').on('input',function () {        updateSlider();    });    function updateSlider() {        var price_min  = $('[name="category-input-min"]').val();        var price_max = $('[name="category-input-max"]').val();        $("#slider-category").slider('values', 0, price_min);        $("#slider-category").slider('values', 1, price_max);        $('.pagination').hide();    }    $('[name="category-input-min"], [name="category-input-max"]').keypress(function(e) {        if (e.keyCode < 48 || e.keyCode > 57) { //Только числа можно вводить            return false;        }    });});function productFilterPrice() {    $.ajax({        url: 'index.php?route=product/category/productFilterPrice',        dataType: 'html',        data: 'products_json_id=' + $('[name="products_json_id"]').val() + '&min=' + $('[name="category-input-min"]').val() + '&max=' + $('[name="category-input-max"]').val() + '&category_id=' + $('[name="category_id"]').val(),        type: 'post',        beforeSend: function () {        },        success: function (products) {            $('.product-box').empty();           // alert(products);            $('.product-box').append(products);        },        error: function (xhr, ajaxOptions, thrownError) {            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);        }    });}