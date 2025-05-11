<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) exit('Not logged in');
$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("DELETE FROM watch_history WHERE user_id = ?");
$stmt->execute([$user_id]);
echo 'ok';
