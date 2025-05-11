<?php
session_start();
require 'db.php';
header('Content-Type: application/json; charset=utf-8');

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['error' => 'Not logged in']);
    exit;
}

if (!isset($_POST['video_id'])) {
    echo json_encode(['error' => 'No video ID']);
    exit;
}

$video_id = intval($_POST['video_id']);
$user_id = $_SESSION['user_id'];

// 检查是否已经收藏
$check = $pdo->prepare("SELECT 1 FROM video_favorites WHERE video_id = ? AND user_id = ?");
$check->execute([$video_id, $user_id]);
$exists = $check->fetchColumn();

if ($exists) {
    // 取消收藏
    $stmt = $pdo->prepare("DELETE FROM video_favorites WHERE video_id = ? AND user_id = ?");
    $stmt->execute([$video_id, $user_id]);
    echo json_encode(['favorited' => false]);
} else {
    // 添加收藏
    $stmt = $pdo->prepare("INSERT INTO video_favorites (video_id, user_id) VALUES (?, ?)");
    $stmt->execute([$video_id, $user_id]);
    echo json_encode(['favorited' => true]);
}
