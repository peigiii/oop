<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$stmt = $pdo->prepare("SELECT role FROM users WHERE id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
if ($user['role'] !== 'admin') {
    echo "Access denied.";
    exit;
}

if (isset($_GET['id'])) {
    $stmt = $pdo->prepare("DELETE FROM videos WHERE id = ?");
    $stmt->execute([$_GET['id']]);
}
header("Location: manage_videos.php");
exit;
?>
