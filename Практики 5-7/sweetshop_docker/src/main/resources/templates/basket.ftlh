<!DOCTYPE html>
<html>
<head>
    <title>Корзина</title>
    <style>
        *{
            background-color: black;
            color: white;
        }
        button {
            background-color: darksalmon;
            border-radius: 20px;
            color: black;
            font-size: 13px;
            height: 30px;
            font-weight: bold;
        }
        .cake {
            display: flex;
            flex-direction: row;

        }
        .formButton{
            display: flex;
            justify-content: center;
            align-content: center;
        }
        a{
            color: darksalmon;
            font-size: 20px;
        }
    </style>
</head>
<header>
    <a href="/">Главная</a>
</header>
<body>
<h1>Корзина</h1>
<#list basket as cake>
    <div class="cake">
        <p>${cake.cakeName} ${cake.cakePrice} руб.</p>
        <form class="formButton" action="/basket/delete/${cake.id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Удалить из корзины</button>
        </form>
    </div>
    <#else>
    <p>Корзина пуста</p>
</#list>
<form class="formButton" action="/basket/deleteAll" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Оформить заказ</button>
</form>
</body>
</html>