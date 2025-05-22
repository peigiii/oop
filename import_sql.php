<?php
$host = "skillspheredb.mysql.database.azure.com";
$dbname = "skillsphere";
$username = "peiyin5917@skillspheredb";
$password = "0917CPYcpy";  // 请替换成你的密码

// 连接数据库
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("连接失败: " . $e->getMessage());
}

// 读取 SQL 文件
$sqlFile = __DIR__ . '/skillsphere.sql';
if (!file_exists($sqlFile)) {
    die("找不到 SQL 文件: $sqlFile");
}
$sqlContent = file_get_contents($sqlFile);

// 拆分成单条 SQL 语句（简单按分号拆分）
$sqlStatements = array_filter(array_map('trim', explode(';', $sqlContent)));

try {
    foreach ($sqlStatements as $statement) {
        if (!empty($statement)) {
            $pdo->exec($statement);
        }
    }
    echo "✅ 数据导入成功！";
} catch (PDOException $e) {
    die("导入失败: " . $e->getMessage());
}
?>
