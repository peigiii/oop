<?php
session_start();
require 'db.php';

if (!isset($_POST['comment_id']) || !isset($_SESSION['user_id'])) {
    exit('Invalid Request');
}

$comment_id = intval($_POST['comment_id']);
$user_id = $_SESSION['user_id'];

$stmt = $pdo->prepare("DELETE FROM video_comments WHERE id = ? AND user_id = ?");
$success = $stmt->execute([$comment_id, $user_id]);

echo $success ? 'ok' : 'error';
