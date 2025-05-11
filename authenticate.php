<?php
session_start();
require 'db.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email    = trim($_POST['email']);
    $password = trim($_POST['password']);

    // 查询用户字段（已移除 email_verified）
    $stmt = $pdo->prepare("SELECT id, password, role FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
        // 登录成功，存储 session
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['role']    = $user['role'];
        session_regenerate_id(true); // 防止 session 固定攻击

        // 角色跳转
        if ($user['role'] === 'admin') {
            header("Location: admin_dashboard.php");
        } else {
            header("Location: main.php");
        }
        exit;
    } else {
        header("Location: login.php?error=1");
        exit;
    }
}
?>
