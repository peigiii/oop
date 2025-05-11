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

// 检查是否已经点赞
$check = $pdo->prepare("SELECT 1 FROM video_likes WHERE video_id = ? AND user_id = ?");
$check->execute([$video_id, $user_id]);
$exists = $check->fetchColumn();

if ($exists) {
    // 取消点赞
    $stmt = $pdo->prepare("DELETE FROM video_likes WHERE video_id = ? AND user_id = ?");
    $stmt->execute([$video_id, $user_id]);
    echo json_encode(['liked' => false]);
} else {
    // 添加点赞
    $stmt = $pdo->prepare("INSERT INTO video_likes (video_id, user_id) VALUES (?, ?)");
    $stmt->execute([$video_id, $user_id]);
    echo json_encode(['liked' => true]);
}
