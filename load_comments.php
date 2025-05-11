<?php
session_start();
require 'db.php';

if (!isset($_GET['video_id'])) {
    exit("No video ID provided");
}

$video_id = intval($_GET['video_id']);

$stmt = $pdo->prepare("
    SELECT c.*, u.username 
    FROM video_comments c 
    JOIN users u ON c.user_id = u.id 
    WHERE c.video_id = ? 
    ORDER BY c.created_at DESC
");
$stmt->execute([$video_id]);

while ($comment = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $isMine = isset($_SESSION['user_id']) && $_SESSION['user_id'] == $comment['user_id'];
    echo "<div class='comment-item' style='display:flex;align-items:flex-start;margin-bottom:22px;padding-bottom:16px;border-bottom:1px solid #f1f1f1;'>";
    echo "<div style='width:44px;height:44px;border-radius:50%;background:#e0e7ef;display:flex;align-items:center;justify-content:center;font-size:22px;font-weight:bold;color:#3b82f6;margin-right:14px;flex-shrink:0;'>";
    // 显示用户名首字母作为头像
    echo strtoupper(mb_substr($comment['username'],0,1,'UTF-8'));
    echo "</div>";
    echo "<div style='flex:1;'>";
    echo "<div style='display:flex;align-items:center;gap:10px;'><span style='font-weight:600;color:#222;font-size:16px;'>" . htmlspecialchars($comment['username']) . "</span>";
    echo "<span style='color:#aaa;font-size:13px;'>" . date('Y-m-d H:i', strtotime($comment['created_at'])) . "</span>";
    if ($isMine) {
        echo "<span style='margin-left:auto;display:flex;gap:6px;'>";
        echo "<button class='edit-comment-btn' data-id='{$comment['id']}' style='background:#fbbf24;color:#fff;border:none;border-radius:4px;padding:2px 14px;font-size:13px;cursor:pointer;'>Edit</button>";
        echo "<button class='delete-comment-btn' data-id='{$comment['id']}' style='background:#ef4444;color:#fff;border:none;border-radius:4px;padding:2px 14px;font-size:13px;cursor:pointer;'>Delete</button>";
        echo "</span>";
    }
    echo "</div>";
    echo "<div class='comment-content' style='background:#f6f8fa;padding:12px 16px;border-radius:8px;font-size:15px;color:#333;line-height:1.7;box-shadow:0 1px 4px rgba(0,0,0,0.03);text-align:left;margin-top:4px;word-break:break-all;'>" . nl2br(htmlspecialchars($comment['content'])) . "</div>";
    echo "</div>";
    echo "</div>";
}
