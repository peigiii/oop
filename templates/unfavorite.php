<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) exit('Login required.');
if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['video_id'])) exit('Invalid request.');

$user_id = $_SESSION['user_id'];
$video_id = intval($_POST['video_id']);

$stmt = $pdo->prepare("DELETE FROM video_favorites WHERE user_id = ? AND video_id = ?");
$stmt->execute([$user_id, $video_id]);

header('Location: my_favorites.php');
exit; 