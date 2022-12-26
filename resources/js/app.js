import './bootstrap';

import Alpine from 'alpinejs';

window.Alpine = Alpine;

Alpine.start();

// Busket
$(document).on('click', '.js_buy', function (e) {
    e.preventDefault();
    var $this = $(this);
    $.ajax({
        url: '/cart/to-cart',
        data: { good_id: $(this).data('good_id'), count: $(this).data('good_count') },
        type: 'POST',
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        // выполнить до отправки запроса
        beforeSend: function() {
            $this.addClass('bounce_click');
        },
        success: function (data) {
            if (data.count > 0) {
                setTimeout(function() {
                    $this.removeClass('bounce_click');
                }, 400);

                $('.js_cart_count span').text(Number($('.js_cart_count span').text()) + 1);
            }
        },
        // Ошибка AJAX
        error: function(result){
            console.log(result);
            setTimeout(function() {
                $this.removeClass('bounce_click');
            }, 400);
        }
    })
});
$(document).on('click', '.js_remove_cart', function (e) {
    e.preventDefault();
    var cart_id = $(this).data('cart_id'),
        $this = $(this);

    $.ajax({
        url: '/cart/remove',
        data: {cart_id: cart_id},
        type: 'POST',
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        success: function (data) {

            /* Удаление блока */
            $this.closest('.item').remove();

            /* Общая сумма */
            $('.js_cart_total').text(data.count.total);

            /* Иконка */
            $('.js_cart_count span').text(Number($('.js_cart_count span').text()) - 1);
        }
    });
});
$(document).on('click', '.js_cart_action', function (e) {
    e.preventDefault();
    var action = $(this).data('action');
    var cart_id = $(this).data('cart_id');

    $.ajax({
        url: '/cart/action',
        data: { cart_id: cart_id, action: action },
        type: 'POST',
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        success: function (data) {

            var curent = $('#js_cartAction_'+data.cart.id);

            /* Обновление count */
            curent.html(data.cart.count);

            /* Итог */
            $('.page_basket .finish').text(data.count.total);

            /* Общая сумма */
            $('.js_cart_total').text(data.count.total);
        }
    });
});

// Order
var ordering = $("#ordering");
ordering.submit(function(e) {
    e.preventDefault();

    var loader = $('.page_ordering .order_button');
    var formData = ordering.serialize();

    $.ajax({
        url: '/order/order',
        type: 'POST',
        data: formData,
        dataType: 'json',
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        // выполнить до отправки запроса
        beforeSend: function () {
            loader.addClass('loading').prop("disabled", true);
        },
        success: function (data) {
            $('#ordering .success').addClass('active');

            $('#ordering input').val('');
            $('#ordering textarea').val('');
            $('#ordering .box .white').text('0 тг');

            loader.removeClass('loading').prop("disabled", false);
        }
    });
});
