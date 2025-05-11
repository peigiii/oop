<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// 获取当前用户角色
$stmt = $pdo->prepare("SELECT role FROM users WHERE id = ?");
$stmt->execute([$_SESSION['user_id']]);
$current_user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($current_user['role'] !== 'admin') {
    echo "Access denied.";
    exit;
}

// 更新用户角色
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_role'])) {
    $new_role = $_POST['role'];
    $user_id = $_POST['user_id'];
    $stmt = $pdo->prepare("UPDATE users SET role = ? WHERE id = ?");
    $stmt->execute([$new_role, $user_id]);
    header("Location: manage_users.php");
    exit;
}

// 更新管理员备注
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_note'])) {
    $note = $_POST['admin_note'];
    $user_id = $_POST['user_id'];
    $stmt = $pdo->prepare("UPDATE users SET admin_note = ? WHERE id = ?");
    $stmt->execute([$note, $user_id]);
    header("Location: manage_users.php");
    exit;
}

// 启用/禁用账户
if (isset($_GET['toggle'])) {
    $uid = $_GET['toggle'];
    $stmt = $pdo->prepare("SELECT status FROM users WHERE id = ?");
    $stmt->execute([$uid]);
    $current = $stmt->fetchColumn();
    $new = ($current === 'active') ? 'inactive' : 'active';

    $stmt = $pdo->prepare("UPDATE users SET status = ? WHERE id = ?");
    $stmt->execute([$new, $uid]);
    header("Location: manage_users.php");
    exit;
}

// 删除用户
if (isset($_GET['delete'])) {
    $stmt = $pdo->prepare("DELETE FROM users WHERE id = ?");
    $stmt->execute([$_GET['delete']]);
    header("Location: manage_users.php");
    exit;
}

header("Location: manage_users.php"); // Fallback
exit;
?>
