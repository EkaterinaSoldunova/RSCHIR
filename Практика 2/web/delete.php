<?php
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["id"])) {
    $id = $_GET["id"];
    $conn = new mysqli("db", "me", "password", "tovars");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "DELETE FROM tovars WHERE id=$id";

    if ($conn->query($sql) === TRUE) {
        echo "Товар успешно удален";
    } else {
        echo "Ошибка: " . $conn->error;
    }

    $conn->close();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Удаление товара</title>
</head>
<body>
<h2>Удаление товара</h2>
<form method="get" action="<?php echo $_SERVER["PHP_SELF"];?>">
    Номер товара: <input type="text" name="id"><br>
    <input type="submit" value="Удалить">
</form>
<a href="read.php">К списку товаров</a>
</body>
</html>
