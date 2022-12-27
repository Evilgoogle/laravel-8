Добрый день. Документация к API.
Для тестирование использовал POSTMAN
----------------------------------
Все запросы кроме login требюут Bearer Token авторизацию.
Ее получаем с этим запросом на авторизацию

При ошибках приходит сообщение с 422 кодом ответа. Например
{
    "name": [
        "The name field is required."
    ]
}
----------------------------------
Авторизация

GET: http://example.local/api/login
##
отправляем:
{
"email":"evilgoogle@mail.ru",
"password":"12345678"
}

##
получаем (код 200):
    "user": {
        "id": 1,
        "name": "evilgoogle",
        "email": "evilgoogle@mail.ru",
        "email_verified_at": null,
        "two_factor_confirmed_at": null,
        "current_team_id": null,
        "profile_photo_path": null,
        "created_at": "2022-12-26T02:44:26.000000Z",
        "updated_at": "2022-12-26T02:44:26.000000Z",
        "profile_photo_url": "https://ui-avatars.com/api/?name=e&color=7F9CF5&background=EBF4FF"
    },
    "token": "3|bFspgfrJRhHr86zgTcd4UEo8A6RMxaN91vOWBgqT"

##
примечанию:
Прежде вам нужно создать аккаунт здесь http://example.local/register

--------------------------------------
Регистрация пользователя

POST: http://example.local/api/user/registration
++
Передаем Bearer Token что мы получили здесь http://example.local/api/login в token

##
отправляем:
{
    "name":"test",
    "email":"test@deafult.loc",
    "password":"123456"
}

##
получаем (код 200):
{
    "result": "Registration completed successfully"
}

--------------------------------------
Метод для получения дерева категорий
POST: http://example.local/api/goods/cats
++
Передаем Bearer Token что мы получили здесь http://example.local/api/login в token

##
отправляем без тела

## получаем структуриризировнный каталог всех категорий

--------------------------------------
Метод для получения товаров. Должен поддерживать фильтрацию по категории/категориям любого уровня, а также по цене и дополнительным характеристикам. Значения фильтров должны валидироваться.

POST: http://example.local/api/goods/filter
++
Передаем Bearer Token что мы получили здесь http://example.local/api/login в token

##
отправляем:
{
    "category_id":"1"
}
или же
{
    "category_id":"50",
    "price":"6" // Здесь ищется с LIKE запросом
}
или же
{
    "category_id":"50",
    "price":"6",
    "prop":"white"
}
Это филтры. Их можно отправлять в любом порядке и в любом количестве. Филтр рабоает по 3 полям
category_id, price, prop

##
получаем (код 200):
{
    "result": [
        {
            "id": 1,
            "enable": 1,
            "category_id": 50,
            "position": null,
            "title": "Sint ipsam esse id.",
            "slug": "sint-ipsam-esse-id",
            "desc": "Quisquam optio fugiat sit dolor blanditiis dolores. Voluptatibus ex provident expedita et. Sit ipsam quos et et. Eaque velit eveniet optio enim assumenda voluptatem beatae.",
            "price": "64.35",
            "discount": 0,
            "created_at": "2022-12-26T02:42:38.000000Z",
            "updated_at": "2022-12-26T02:42:38.000000Z"
        },
        {
            "id": 4,
            "enable": 1,
            "category_id": 21,
            "position": null,
            "title": "Aspernatur est ipsa.",
            "slug": "aspernatur-est-ipsa",
            "desc": "Aspernatur et velit consequatur. Dolores beatae ab amet aut. Corrupti sunt minima ullam molestiae distinctio molestiae.",
            "price": "330776914.92",
            "discount": 0,
            "created_at": "2022-12-26T02:42:38.000000Z",
            "updated_at": "2022-12-26T02:42:38.000000Z",
            "value": "white"
        },
        {
            "id": 16,
            "enable": 1,
            "category_id": 36,
            "position": null,
            "title": "Aut praesentium est.",
            "slug": "aut-praesentium-est",
            "desc": "Quibusdam ducimus vitae ut. Repellat est quidem optio eaque et. Nihil rerum ut tempore praesentium libero.",
            "price": "924.12",
            "discount": 0,
            "created_at": "2022-12-26T02:42:38.000000Z",
            "updated_at": "2022-12-26T02:42:38.000000Z",
            "value": "white"
        }
    ]
}

--------------------------------------
Метод для получения товара по slug
POST: http://example.local/api/goods/slug
++
Передаем Bearer Token что мы получили здесь http://example.local/api/login в token

##
отправляем:
{
    "slug":"natus-laborum-numquam-et"
}

##
получаем (код 200):
{
    "id": 3,
    "enable": 1,
    "category_id": 39,
    "position": null,
    "title": "Natus laborum numquam et.",
    "slug": "natus-laborum-numquam-et",
    "desc": "Voluptas illo ducimus odit tempore pariatur corporis sint. Voluptatem atque quia et. Accusamus hic ratione molestias enim voluptatem voluptatem non.",
    "price": "16.56",
    "discount": 0,
    "created_at": "2022-12-26T02:42:38.000000Z",
    "updated_at": "2022-12-26T02:42:38.000000Z"
}

---------------------------------------
Методы для работы с корзиной (добавление товара, редактирование количества товара/товаров, удаление товара).

POST: http://example.local/api/busket/add   // добавление 
PUT: http://example.local/api/busket/update   // редактирвоание
DELETE: http://example.local/api/busket/del  // удаление
++
Передаем Bearer Token что мы получили здесь http://example.local/api/login в token

##
отправляем:
{
    "good_id":"3"
}
---------------
{
    "good_id":"1",
    "count":"2"
}
---------------
{
    "good_id":"1"
}

##
получаем (код 200) c сообщениями что получилось


-----------------------------------------------
Метод для оформления заказа.

POST: http://example.local/api/order/add
++
Передаем Bearer Token что мы получили здесь http://example.local/api/login в token

##
отправляем:
{
    "user_id":"1",
    "phone":"87056654812",
    "address":"this address"
}

##
получаем (код 200):
{
    "result": "Order completed successfully"
}


-----------------------------------------------
Метод для получения списка заказов авторизированного пользователя

POST: http://example.local/api/order/show
++
Передаем Bearer Token что мы получили здесь http://example.local/api/login в token

##
отправляем:
{
    "user_id":"1"
}

##
получаем (код 200) список
