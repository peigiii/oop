<?php
$host = 'skillspheredb.mysql.database.azure.com';
$username = 'peiyin5917@skillspheredb';
$password = '0917Peiyin.';  // ⚠️ 把这行换成你真实密码
$dbname = 'myappdb';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database error: " . $e->getMessage());
}
?>

// 检查连接
if ($conn->connect_error) {
    die("❌ 数据库连接失败: " . $conn->connect_error);
}

echo "✅ 成功连接到 Azure MySQL 数据库！";

// 可选：列出所有数据库
$result = $conn->query("SHOW DATABASES;");
echo "<br><br>📂 数据库列表：<br>";
while ($row = $result->fetch_assoc()) {
    echo " - " . $row['Database'] . "<br>";
}

$conn->close();
?>
