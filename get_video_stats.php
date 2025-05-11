<?php
session_start();
require 'db.php';
header('Content-Type: application/json; charset=utf-8');

if (!isset($_GET['video_id'])) {
    echo json_encode(['error' => 'no id']);
    exit;
}

$video_id = intval($_GET['video_id']);

$likes = $pdo->prepare("SELECT COUNT(*) FROM video_likes WHERE video_id = ?");
$likes->execute([$video_id]);
$likeCount = $likes->fetchColumn();

$favorites = $pdo->prepare("SELECT COUNT(*) FROM video_favorites WHERE video_id = ?");
$favorites->execute([$video_id]);
$favoriteCount = $favorites->fetchColumn();

$comments = $pdo->prepare("SELECT COUNT(*) FROM video_comments WHERE video_id = ?");
$comments->execute([$video_id]);
$commentCount = $comments->fetchColumn();

echo json_encode([
    'likes' => (int)$likeCount,
    'favorites' => (int)$favoriteCount,
    'comments' => (int)$commentCount
]);
