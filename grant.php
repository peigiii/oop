<?php
$host = "skillspheredb.mysql.database.azure.com";
$username = "peiyin5917@skillspheredb";
$password = "0917CPYcpy";

try {
    $pdo = new PDO("mysql:host=$host;dbname=mysql;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "GRANT ALL PRIVILEGES ON skillsphere.* TO 'peiyin5917@skillspheredb'@'%' IDENTIFIED BY '0917CPYcpy'; FLUSH PRIVILEGES;";
    $pdo->exec($sql);

    echo "授权成功！";
} catch (PDOException $e) {
    echo "授权失败: " . $e->getMessage();
}
?>
