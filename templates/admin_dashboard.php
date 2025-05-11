<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// 获取当前用户信息和角色
$stmt = $pdo->prepare("SELECT username, role FROM users WHERE id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user['role'] !== 'admin') {
    echo "Access denied.";
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - SkillSphere</title>
    <?php include 'adminnav.php'; ?>
    <style>

        .container {
            max-width: 1200px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .card {
            background-color: #f8fafc;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            transition: 0.2s ease;
        }
        .card:hover {
            background-color: #dbeafe;
            cursor: pointer;
        }
        a {
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome Admin <?= htmlspecialchars($user['username']) ?> 🎓</h2>

    <!-- 视频展示 -->
    <div id="videoSection" class="video-section">
        <?php include 'display_video.php'; ?>
    </div>

</body>
</html>
