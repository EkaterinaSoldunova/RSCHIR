<?php
$conn = new mysqli("db", "me", "password", "tovars");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM tovars";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<h2>Список товаров</h2>";
    echo "<table border='1'><tr><th>№</th><th>Название товара</th><th>Цена</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row["id"]."</td><td>".$row["name"]."</td><td>".$row["price"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "Товары не найдены";
}

$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Список товаров</title>
</head>
<body>
<a href="create.php">Добавить товар</a>
<a href="delete.php">Удалить товар</a>
<a href="update.php">Изменить товар</a>
</body>
</html>
