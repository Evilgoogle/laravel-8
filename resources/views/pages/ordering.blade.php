<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="page_ordering">
        <div class="contain">
            <div class="full_block">
                <h1 class="title">оформление заказа</h1>
            </div>
            <div class="content">
                <form id="ordering">
                    <div class="block">
                        <div class="flex">
                            <label>
                                <p>имя</p>
                                <input type="text" name="name" value="{{ Auth::check() ? auth()->user()->name : '' }}">
                            </label>
                            <label>
                                <p>Адресс</p>
                                <input type="text" name="address" value="{{ Auth::check() ? auth()->user()->address : '' }}">
                            </label>
                        </div>
                        <div class="flex">
                            <label>
                                <p>телефон</p>
                                <input type="text" name="phone" class="phone" value="{{ Auth::check() ? auth()->user()->phone : '' }}">
                            </label>
                            <label>
                                <p>e-mail</p>
                                <input type="text" name="email" value="{{ Auth::check() ? auth()->user()->email : '' }}">
                            </label>
                        </div>
                    </div>
                    <div class="box">
                        <p>общая сумма заказа:</p>
                        <div class="white">{{ $sum }} тг</div>
                        <button type="submit" class="team_button order_button"><span>оформить заказ</span></button>
                        <div class="success">ЗАКАЗ СДЕЛАН</div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</x-app-layout>
