<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="page_goods">
        <div class="block">
            @foreach($items as $item)
                <div class="item">
                    <div class="box">
                        <h3>{{ $item->title }}</h3>
                        <small>{{ $item->price }} тг</small>
                        <button type="button" class="js_buy" data-good_id="{{ $item->id }}" data-good_count="1"><span>В корзину</span></button>
                    </div>
                </div>
            @endforeach
        </div>
    </div>

</x-app-layout>
