<?php
$host = "skillspheredb.mysql.database.azure.com";
$db = "skillsphere"; // 替换为你的数据库名
$user = "peiyin5917@skillspheredb";
$pass = "0917Peiyin."; // ⚠️ 别忘了替换！

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("❌ 数据库连接失败: " . $conn->connect_error);
}

echo "<h3>✅ 成功连接数据库：$db</h3>";
$sqlFile = "skillsphere.sql";

if (!file_exists($sqlFile)) {
    die("❌ 未找到 skillsphere.sql 文件，请确认它和本文件在同一目录。");
}

$query = '';
$lines = file($sqlFile);
foreach ($lines as $line) {
    $line = trim($line);
    if ($line == '' || strpos($line, '--') === 0 || strpos($line, '/*') === 0) continue;

    $query .= $line;
    if (substr($line, -1) == ';') {
        if (!$conn->query($query)) {
            echo "<div style='color:red;'>❌ 出错: " . htmlspecialchars($conn->error) . "<br><code>" . htmlspecialchars($query) . "</code></div><hr>";
        } else {
            echo "<div style='color:green;'>✅ 执行成功: <code>" . htmlspecialchars($query) . "</code></div><hr>";
        }
        $query = '';
    }
}

$conn->close();

// 自动删除文件
echo "<h3 style='color:blue;'>🎉 导入完成，尝试删除临时文件…</h3>";
$deleted1 = @unlink(__FILE__); // 删除 import_sql.php 自身
$deleted2 = @unlink("skillsphere.sql");

if ($deleted1 && $deleted2) {
    echo "<strong style='color:green;'>✅ import_sql.php 和 skillsphere.sql 已成功删除</strong>";
} else {
    echo "<strong style='color:orange;'>⚠️ 自动删除失败，请手动删除 import_sql.php 和 skillsphere.sql</strong>";
}
?>
