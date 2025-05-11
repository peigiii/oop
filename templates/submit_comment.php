<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    exit("Please login first");
}

if (!isset($_POST['video_id']) || !isset($_POST['comment'])) {
    exit("Missing required fields");
}

$video_id = intval($_POST['video_id']);
$user_id = $_SESSION['user_id'];
$comment = trim($_POST['comment']);

if (empty($comment)) {
    exit("Comment cannot be empty");
}

$stmt = $pdo->prepare("INSERT INTO video_comments (video_id, user_id, content) VALUES (?, ?, ?)");
$stmt->execute([$video_id, $user_id, $comment]);

echo "Comment submitted successfully";
