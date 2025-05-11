<?php
session_start();
require 'db.php';

// 未登录者跳转登录页
if (!isset($_SESSION['user_id'])) {
    header("Location: signup.php");
    exit;
}

// 获取当前用户信息
$stmt = $pdo->prepare("SELECT username, role FROM users WHERE id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// 限制只允许普通用户访问
if ($user['role'] !== 'user') {
    header("Location: signup.php"); // 或者 admin_dashboard.php
    exit;
}

$role = $user['role'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillSphere Video Portal</title>
    <?php include 'nav.php'; ?>
    <style>
        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: #f8fafc;
            margin: 0;
            padding: 0;
        }

        .welcome-section {
            text-align: center;
            padding: 2rem 0;
            color: black;
            margin-bottom: 2rem;
        }

        .welcome-text {
            font-size: 2.5rem;
            font-weight: 700;
            margin: 0;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            font-family: 'Poppins', 'Segoe UI', sans-serif;
        }

        .username {
            color: #fbbf24;
            font-weight: 800;
        }

        .video-section {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }

        @media (max-width: 768px) {
            .welcome-text {
                font-size: 2rem;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
    <!-- 用户欢迎信息 -->
    <div class="welcome-section">
        <h1 class="welcome-text">Welcome, <span class="username"><?php echo htmlspecialchars($user['username']); ?></span>!</h1>
    </div>

    <!-- 视频展示 -->
    <div id="videoSection" class="video-section">
        <?php 
        // 修改每页显示的视频数量为9
        $GLOBALS['pageSize'] = 9;
        include 'display_video.php'; 
        ?>
    </div>
</body>
</html>

