<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="page_basket">
        <div class="contain">
            <div class="full_block">
                <h1 class="title">корзина</h1>
            </div>
            <div class="content {{ ($carts->count() == 0) ? 'none_content' : '' }}">
                @if($carts->count() > 0)
                    <div class="block_item">
                        @foreach($carts as $i)
                            <div class="item">
                                <button type="button" class="js_remove_cart" data-cart_id="{{ $i->id }}"><span>x</span></button>
                                <div class="block">
                                    <div class="title">{{ $i->title }}</div>
                                    <div class="bottom">
                                        <div class="left">
                                            <p>цена:</p>
                                            <div class="white">{{ $i->price }}</div>
                                        </div>
                                        <div class="right">
                                            <p>количество:</p>
                                            <div class="count">
                                                <button type="button" class="prev js_cart_action" data-action="minus" data-cart_id="{{ $i->id }}"></button>
                                                <span id="js_cartAction_{{ $i->id }}">{{ $i->count }}</span>
                                                <button type="button" class="next js_cart_action" data-action="plus" data-cart_id="{{ $i->id }}"></button>
                                            </div>
                                            <p>итог:</p>
                                            <div class="white finish">{{ $i->price * $i->count }}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <div class="block_sum">
                        <p>общая сумма заказа:</p>
                        <div class="white js_cart_total">{{ $count->total }}</div>
                        <a href="/order" class="team_button red"><span>оформить заказ</span></a>
                        <a href="/goods" class="team_button"><span>вернуться в каталог</span></a>
                    </div>
                @else
                    <div class="none_goods">Корзина пуста</div>
                @endif
            </div>
        </div>
    </div>

</x-app-layout>
