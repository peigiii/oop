<?php
$host = 'skillspheredb.mysql.database.azure.com';
$username = 'peiyin5917@skillspheredb';
$password = '0917Peiyin.';  // 请确保这是你的真实密码
$dbname = 'skillsphere';

try {
    // 注意变量名 $username 和 $password，PDO 构造函数用的也要对应
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);

    // 设置错误处理模式
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "✅ 成功连接到 Azure MySQL 数据库！";

    // 可选：列出所有数据库
    $stmt = $pdo->query("SHOW DATABASES;");
    echo "<br><br>📂 数据库列表：<br>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo " - " . $row['Database'] . "<br>";
    }

} catch (PDOException $e) {
    die("❌ 数据库连接失败: " . $e->getMessage());
}
?>
