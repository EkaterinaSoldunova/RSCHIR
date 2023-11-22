<!DOCTYPE html>
<html>
<head>
    <title>Кондитерская</title>
    <style>
        *{
            background-color: black;
            color: white;
        }
        .btn {
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
        header {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
    </style>
</head>
<header>
    <#if user.email??>
        <a href="/basket">Корзина</a>
    </#if>
    <#if user.email??>
        <p style="color: darksalmon">Имя пользователя: ${user.name}</p>
        <#if user.isAdmin()>
            <a href="/admin">Панель администратора</a>
        </#if>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button class="btn" type="submit">Выйти</button>
        </form>
    <#else>
        <a href="/login">Войти</a>
    </#if>
</header>
<body>
<h1>Кондитерская</h1>
<h2>Список десертов</h2>
<#list cakes as cake>
    <div class="cake">
        <p> ${cake.id} ${cake.name} ${cake.price} руб. ${cake.being} шт. </p>
        <#if user.email??>
        <form class="formButton" action="/basket/add?cakeId=${cake.id}&cakeName=${cake.name}&cakePrice=${cake.price}&cakeBeing=${cake.being}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button class="btn" type="submit">Добавить в корзину</button>
        </form>
        </#if>
        <#if user.isAdmin()>
        <form action="/cake/delete/${cake.id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="btn" type="submit" value="Удалить товар"/>
        </form>
        </#if>
    </div>
</#list>
<#if user.isAdmin()>
<h3>Добавить товар</h3>
<form action="/cake/create" method="post">
    Название: <input type="text" name="name"/><br><br>
    Цена товара: <input type="text" name="price"/><br><br>
    Наличие (шт.) <input type="text" name="being"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input class="btn" type="submit" value="Добавить товар"/>
</form>
<h3>Обновить данные о товаре</h3>
<form action="/cake/update" method="post">
    ID: <input type="text" name="id"/><br><br>
    Название: <input type="text" name="name"/><br><br>
    Цена товара: <input type="text" name="price"/><br><br>
    Наличие (шт.) <input type="text" name="being"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input class="btn" type="submit" value="Обновить"/>
</form>
</#if>
</body>
</html>