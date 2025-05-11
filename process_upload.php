<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_FILES["video_file"])) {
    $title = trim($_POST["title"]);
    $description = trim($_POST["description"]);
    $category = trim($_POST["category"]);
    $user_id = $_SESSION['user_id'];

    $upload_dir = "uploads/";
    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0777, true);
    }

    $file_tmp = $_FILES["video_file"]["tmp_name"];
    $file_name = basename($_FILES["video_file"]["name"]);
    $target_file = $upload_dir . time() . "_" . $file_name;

    $allowed_types = ['video/mp4', 'video/webm', 'video/ogg'];
    if (!in_array($_FILES["video_file"]["type"], $allowed_types)) {
        echo "Invalid video format. Allowed: mp4, webm, ogg.";
        exit;
    }

    if (move_uploaded_file($file_tmp, $target_file)) {
        $stmt = $pdo->prepare("INSERT INTO videos (title, description, category, file_path, user_id) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$title, $description, $category, $target_file, $user_id]);
        header("Location: main.php");
        exit;
    } else {
        echo "Video upload failed.";
    }
}
?>
