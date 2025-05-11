<?php
session_start();
require 'db.php';

if (!isset($_POST['comment_id'], $_POST['content']) || !isset($_SESSION['user_id'])) {
    exit('Invalid Request');
}

$comment_id = intval($_POST['comment_id']);
$content = trim($_POST['content']);
$user_id = $_SESSION['user_id'];

$stmt = $pdo->prepare("UPDATE video_comments SET content = ? WHERE id = ? AND user_id = ?");
$success = $stmt->execute([$content, $comment_id, $user_id]);

echo $success ? 'ok' : 'error';
