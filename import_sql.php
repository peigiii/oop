<?php
$host = "skillspheredb.mysql.database.azure.com";
$dbname = "skillsphere";
$username = "peiyin5917@skillspheredb";
$password = "0917peiyin.";  // ← 请替换成你自己的密码

// 创建连接
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

// 关闭多语句安全检查
$conn->multi_query($sqlContent);

do {
    // 清空结果
    if ($result = $conn->store_result()) {
        $result->free();
    }
} while ($conn->next_result());

echo "✅ 数据导入成功！";
$conn->close();
?>
