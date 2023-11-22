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
        a{
            color: darksalmon;
            font-size: 20px;
        }
    </style>
</head>
<header>
    <a href="/registration">Регистрация</a>
</header>
<body>
    <h1>Авторизация</h1>
    <form action="/login " method="post">
        Эл. почта: <input type="email" name="username"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <#--    защита приложения, уникальный ключ-->
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Вход</button>
    </form>
</body>
</html>


