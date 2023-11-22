<!DOCTYPE html>
<html>
<head>
    <title>Кондитерская</title>
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
        th {
            text-align: left;
        }
        a{
            color: darksalmon;
            font-size: 20px;
        }
    </style>
</head>
<header>
    <a class="basket" href="/">Главная</a>
</header>
<body>
<h1>Панель администратора</h1>
<table style="width: 100%">
    <tr>
        <th scope="col">Имя</th>
        <th scope="col">Email</th>
        <th scope="col">Номер телефона</th>
        <th scope="col">Активность</th>
        <th scope="col">Роль</th>
        <th scope="col">Бан</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.name}</th>
            <th>${user.email}</th>
            <th>${user.phoneNumber}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role}</#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit">Бан</button>
                </form>
            </th>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>
</body>
</html>