<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) exit;
include 'nav.php';
$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT v.*, h.watched_at, h.id as history_id FROM watch_history h JOIN videos v ON v.id = h.video_id WHERE h.user_id = ? ORDER BY h.watched_at DESC");
$stmt->execute([$user_id]);
$watched = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
  <title>Watch History</title>
  <style>
    .history-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(340px, 1fr)); gap: 24px; margin: 30px auto; max-width: 1100px; }
    .history-card { background: #fff; border-radius: 14px; box-shadow: 0 2px 12px rgba(0,0,0,0.07); padding: 16px; display: flex; align-items: flex-start; gap: 18px; }
    .history-card video { width: 120px; height: 80px; border-radius: 8px; background: #000; object-fit: cover; }
    .history-info { flex: 1; }
    .history-title { font-size: 1.1em; font-weight: 600; color: #1a5ca4; margin-bottom: 4px; text-decoration: none; }
    .history-time { color: #888; font-size: 0.98em; margin-bottom: 6px; }
    .history-actions { display: flex; gap: 8px; }
    .history-actions button { background: #ef4444; color: #fff; border: none; border-radius: 6px; padding: 4px 14px; font-size: 14px; cursor: pointer; transition: background 0.18s; }
    .history-actions button:hover { background: #b91c1c; }
    .clear-btn { background: #6366f1; color: #fff; border: none; border-radius: 8px; padding: 8px 22px; font-size: 1.1em; font-weight: 600; margin: 24px auto 0 auto; display: block; cursor: pointer; transition: background 0.18s; }
    .clear-btn:hover { background: #4338ca; }
  </style>
</head>
<body>
<h2>Watch History</h2>
<div class="history-grid">
<?php foreach ($watched as $v): ?>
  <div class="history-card">
    <a href="video_detail.php?id=<?= $v['id'] ?>">
      <video src="<?= htmlspecialchars($v['file_path'] ?? $v['video_url']) ?>" controls muted></video>
    </a>
    <div class="history-info">
      <a href="video_detail.php?id=<?= $v['id'] ?>" class="history-title"><?= htmlspecialchars($v['title']) ?></a>
      <div class="history-time">Watched at: <?= date('Y-m-d H:i', strtotime($v['watched_at'])) ?></div>
      <div class="history-actions">
        <form method="POST" action="delete_history.php" class="delete-history-form" style="display:inline;">
          <input type="hidden" name="history_id" value="<?= $v['history_id'] ?>">
          <button type="submit">Delete</button>
        </form>
      </div>
    </div>
  </div>
<?php endforeach; ?>
</div>
<form method="POST" action="clear_history.php" id="clearHistoryForm">
  <button type="submit" class="clear-btn">🧹 Clear All</button>
</form>
<script>
document.getElementById('clearHistoryForm').onsubmit = function(e) {
  e.preventDefault();
  if(confirm('Are you sure you want to clear all watch history?')) {
    fetch('clear_history.php', { method: 'POST' })
      .then(res => res.text())
      .then(() => location.reload());
  }
};
document.querySelectorAll('.delete-history-form').forEach(form => {
  form.onsubmit = function(e) {
    e.preventDefault();
    fetch('delete_history.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams(new FormData(form)).toString()
    }).then(res => res.text()).then(() => location.reload());
  };
});
</script>
</body>
</html>