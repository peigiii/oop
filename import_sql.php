<?php
$host = "skillspheredb.mysql.database.azure.com";
$dbname = "skillsphere";
$username = "peiyin5917@skillspheredb";
$password = "0917Peiyin.";  // ← 请替换成你自己的密码

// 创建连接，3306 是默认 MySQL 端口
$conn = new mysqli($host, $username, $password, $dbname, 3306);

// 检查连接
if ($conn->connect_error) {
    die("连接失败: " . $conn->connect_error);
}

// 读取 SQL 文件
$sqlFile = 'skillsphere.sql';
if (!file_exists($sqlFile)) {
    die("找不到 SQL 文件: $sqlFile");
}

$sqlContent = file_get_contents($sqlFile);

if ($conn->multi_query($sqlContent)) {
    do {
        if ($result = $conn->store_result()) {
            $result->free();
        }
    } while ($conn->more_results() && $conn->next_result());
    echo "✅ 数据导入成功！";
} else {
    die("导入失败: " . $conn->error);
}

$conn->close();
?>
