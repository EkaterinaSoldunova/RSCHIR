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
<body>
<h1>Регистрация</h1>
<form action="/registration " method="post">
    Имя пользователя: <input type="text" name="name"><br><br>
    Эл. почта: <input type="email" name="email"><br><br>
    Номер телефона: <input type="text" name="phoneNumber"><br><br>
    Пароль: <input type="password" name="password"><br><br>
<#--    защита приложения, уникальный ключ-->
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Зарегистрироваться</button>
</form>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>


