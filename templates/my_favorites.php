<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) exit('Login required.');


$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT v.*, f.favorited_at FROM video_favorites f JOIN videos v ON v.id = f.video_id WHERE f.user_id = ? ORDER BY f.favorited_at DESC");
$stmt->execute([$user_id]);
$favs = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My Favorites</title>
  <link rel="stylesheet" href="style.css">
  <?php include 'nav.php'; ?>
  <style>
    .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 20px; margin-top: 30px; }
    .video-card { background: #fff; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); padding: 12px; display: flex; flex-direction: column; align-items: center; transition: transform 0.2s; }
    .video-card:hover { transform: translateY(-5px); box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
    .video-card video { width: 100%; height: auto; border-radius: 6px; }
    .video-card h3 { font-size: 16px; margin: 10px 0 4px; text-align: center; }
    .video-card p { font-size: 14px; color: #555; text-align: center; margin: 0; }
    .video-category { font-size: 13px; color: #999; margin-top: 6px; text-align: center; }
    .video-link { text-decoration: none; color: inherit; width: 100%; }
  </style>
</head>
<body>
<h2 style="text-align:center;margin-top:30px;">⭐ My Favorites</h2>
<div class="grid">
<?php foreach ($favs as $v): ?>
  <div class="video-card">
    <a href="video_detail.php?id=<?= $v['id'] ?>" class="video-link">
      <video src="<?= htmlspecialchars($v['file_path'] ?? $v['video_url']) ?>" controls></video>
      <h3><?= htmlspecialchars($v['title']) ?></h3>
      <p><?= htmlspecialchars($v['description']) ?></p>
      <div class="video-category">Category: <?= htmlspecialchars($v['category']) ?></div>
    </a>
    <div style="margin-top:10px;width:100%;display:flex;flex-direction:column;align-items:center;gap:4px;">
      <div style="font-size:13px;color:#888;">Favourite Time: <?= date('Y-m-d H:i', strtotime($v['favorited_at'])) ?></div>
      <div style="font-size:13px;color:#888;">
        Author: <?php
          // 获取作者用户名
          $authorStmt = $pdo->prepare("SELECT username FROM users WHERE id = ?");
          $authorStmt->execute([$v['user_id']]);
          $author = $authorStmt->fetchColumn();
          echo htmlspecialchars($author ?: '未知');
        ?>
      </div>
      <form method="post" action="unfavorite.php" style="margin-top:4px;">
        <input type="hidden" name="video_id" value="<?= $v['id'] ?>">
        <button type="submit" style="background:#f87171;color:white;padding:4px 16px;border:none;border-radius:6px;font-size:13px;cursor:pointer;">Cancel</button>
      </form>
    </div>
  </div>
<?php endforeach; ?>
</div>
</body>
</html>