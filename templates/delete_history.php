<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) exit('Not logged in');
$user_id = $_SESSION['user_id'];
if (isset($_POST['history_id'])) {
    $stmt = $pdo->prepare("DELETE FROM watch_history WHERE id = ? AND user_id = ?");
    $stmt->execute([intval($_POST['history_id']), $user_id]);
    exit;
} elseif (isset($_POST['video_id'])) {
    // 兼容老参数
    $stmt = $pdo->prepare("DELETE FROM watch_history WHERE video_id = ? AND user_id = ?");
    $stmt->execute([intval($_POST['video_id']), $user_id]);
    exit;
} else {
    exit('Invalid request');
}
