<?php
// db.php
$host = 'skillspheredb.mysql.database.azure.com';  // Azure MySQL 主机名
$dbname = 'skillspheredb';                        // Azure 数据库名
$user = '$user = 'peiyin5917@gmail.com';               // Azure 数据库用户名
$pass = 'P12345678.';                                // Azure 密码

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database error: " . $e->getMessage());
}
?>
