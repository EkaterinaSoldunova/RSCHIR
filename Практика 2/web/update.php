<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST["id"];
    $name = $_POST["name"];
    $price = $_POST["price"];

    $conn = new mysqli("db", "me", "password", "tovars");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "UPDATE tovars SET name='$name', price='$price' WHERE id=$id";

    if ($conn->query($sql) === TRUE) {
        echo "Данные изменены";
    } else {
        echo "Ошибка: " . $conn->error;
    }

    $conn->close();
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["id"])) {
    $id = $_GET["id"];
    $conn = new mysqli("db", "me", "password", "tovars");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT * FROM tovars WHERE id=$id";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $name = $row["name"];
        $price = $row["price"];
    } else {
        echo "Товар не найден";
        exit();
    }

    $conn->close();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Изменить товар</title>
</head>
<body>
<h2>Изменить товар</h2>
<form method="post" action="<?php echo $_SERVER["PHP_SELF"];?>">
    Номер товара: <input type="text" name="id"><br>
    Название: <input type="text" name="name" value="<?php echo $name; ?>"><br>
    Цена: <input type="text" name="price" value="<?php echo $price; ?>"><br>
    <input type="submit" value="Изменить">
</form>
<a href="read.php">К списку товаров</a>
</body>
</html>
