<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// 只查主观题批阅通知（不查announcements表的user_id）
$stmt = $pdo->prepare("SELECT id, CONCAT('Subjective Review: ', skill_category, ' ', question_text) as title, CONCAT('Score: ', instructor_score, '\nComment: ', instructor_comment) as message, submitted_at as created_at FROM subjective_submissions WHERE user_id = ? AND instructor_score IS NOT NULL ORDER BY created_at DESC");
$stmt->execute([$_SESSION['user_id']]);
$announcements = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My Mailbox - Subjective Reviews</title>
  <?php include 'nav.php'; ?>
  <style>
    h2 {
      text-align: center;
      margin-bottom: 30px;
    }
    .mail-item {
      background-color: white;
      border: 1px solid #ccc;
      padding: 16px;
      border-radius: 10px;
      margin-bottom: 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }
    .mail-title {
      font-weight: bold;
      font-size: 18px;
      color: #333;
    }
    .mail-date {
      font-size: 12px;
      color: #888;
      margin-bottom: 10px;
    }
    .mail-message {
      font-size: 15px;
      color: #444;
      white-space: pre-line;
    }
  </style>
</head>
<body>
  <h2>📬 Your Mailbox</h2>

  <?php if (count($announcements) > 0): ?>
    <?php foreach ($announcements as $a): ?>
      <div class="mail-item">
        <div class="mail-title"><?= htmlspecialchars($a['title']) ?></div>
        <div class="mail-date"><?= $a['created_at'] ?></div>
        <div class="mail-message"><?= nl2br(htmlspecialchars($a['message'])) ?></div>
      </div>
    <?php endforeach; ?>
  <?php else: ?>
    <p style="text-align:center;">No mail yet.</p>
  <?php endif; ?>
</body>
</html>
