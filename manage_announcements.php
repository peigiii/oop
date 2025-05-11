<?php
session_start();
require 'db.php';

// 仅限管理员访问
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}
$stmt = $pdo->prepare("SELECT role FROM users WHERE id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
if ($user['role'] !== 'admin') {
    echo "Access denied.";
    exit;
}

// 添加公告
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $title = trim($_POST["title"]);
    $message = trim($_POST["message"]);
    if ($title && $message) {
        $stmt = $pdo->prepare("INSERT INTO announcements (title, message) VALUES (?, ?)");
        $stmt->execute([$title, $message]);
    }
}

// 删除公告
if (isset($_GET['delete'])) {
    $stmt = $pdo->prepare("DELETE FROM announcements WHERE id = ?");
    $stmt->execute([$_GET['delete']]);
    header("Location: manage_announcements.php");
    exit;
}

// 获取所有公告
$announcements = $pdo->query("SELECT * FROM announcements ORDER BY created_at DESC")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Announcements</title>
  <?php include 'adminnav.php'; ?>
  <style>
    .form-box {
      max-width: 600px;
      margin: 30px auto;
      padding: 20px;
      border: 2px solid #444;
      border-radius: 12px;
      background-color: #f4f4f4;
    }
    input, textarea {
      width: 100%;
      padding: 10px;
      margin-top: 8px;
      margin-bottom: 16px;
      border-radius: 8px;
      border: 1px solid #aaa;
    }
    button {
      padding: 10px 20px;
      background-color: #3490dc;
      color: white;
      border: none;
      border-radius: 6px;
    }
    table {
      width: 90%;
      margin: 20px auto;
      border-collapse: collapse;
    }
    table, th, td {
      border: 1px solid #aaa;
    }
    th, td {
      padding: 10px;
      text-align: left;
    }
  </style>
</head>
<body>
  <h2 style="text-align:center;">📢 Manage Announcements</h2>

  <div class="form-box">
    <form method="POST" action="">
      <label for="title">Title:</label>
      <input type="text" id="title" name="title" required>

      <label for="message">Message:</label>
      <textarea id="message" name="message" rows="4" required></textarea>

      <button type="submit">Post Announcement</button>
    </form>
  </div>

  <table>
    <tr><th>ID</th><th>Title</th><th>Message</th><th>Date</th><th>Action</th></tr>
    <?php foreach ($announcements as $a): ?>
      <tr>
        <td><?= $a['id'] ?></td>
        <td><?= htmlspecialchars($a['title']) ?></td>
        <td><?= nl2br(htmlspecialchars($a['message'])) ?></td>
        <td><?= $a['created_at'] ?></td>
        <td><a href="manage_announcements.php?delete=<?= $a['id'] ?>" onclick="return confirm('Delete this announcement?')">Delete</a></td>
      </tr>
    <?php endforeach; ?>
  </table>
</body>
</html>
