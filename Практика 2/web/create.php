<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $price = $_POST["price"];

    $conn = new mysqli("db", "me", "password", "tovars");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "INSERT INTO tovars (name, price) VALUES ('$name', '$price')";

    if ($conn->query($sql) === TRUE) {
        echo "Товар успешно добавлен";
    } else {
        echo "Ошибка: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Добавить товар</title>
</head>
<body>
<h2>Добавить товар</h2>
<form method="post" action="<?php echo $_SERVER["PHP_SELF"];?>">
    Название: <input type="text" name="name"><br>
    Цена: <input type="text" name="price"><br>
    <input type="submit" value="Добавить">
</form>
<a href="read.php">К списку товаров</a>
</body>
</html>
