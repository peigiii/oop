<?php
$servername  = "localhost";
$db_username = "root";
$db_password = "";
$dbname      = "skillsphere_db";

$pdo = new PDO("mysql:host=$servername;dbname=$dbname", $db_username, $db_password);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$video_id = (int)($_POST['video_id'] ?? 0);

if ($video_id > 0) {
    $sql = "INSERT INTO video_likes (video_id, likes) VALUES (?, 1)
            ON DUPLICATE KEY UPDATE likes = likes + 1";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$video_id]);

    $stmt = $pdo->prepare("SELECT likes FROM video_likes WHERE video_id = ?");
    $stmt->execute([$video_id]);
    echo $stmt->fetchColumn();
}
?>
