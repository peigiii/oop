<?php
session_start();
require '../db.php';
include '../nav.php';
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') exit('Admin only.');
$stmt = $pdo->query("SELECT c.id, c.comment, c.posted_at, u.username, v.title AS video_title FROM video_comments c JOIN users u ON c.user_id = u.id JOIN videos v ON c.video_id = v.id ORDER BY c.posted_at DESC");
$comments = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html><html><body>
<nav style="margin-bottom:20px;">
    <a href="index.php">🏠 Home</a> |
    <a href="my_history.php">📜 History</a> |
    <a href="my_favorites.php">⭐ Favorites</a> |
    <a href="search.php">🔍 Search</a>
</nav>
<h2>🛠 Manage Comments</h2>
<?php foreach ($comments as $c): ?>
  <div><strong><?= htmlspecialchars($c['username']) ?></strong> on <em><?= htmlspecialchars($c['video_title']) ?></em>
    <p><?= htmlspecialchars($c['comment']) ?></p>
    <form method="POST" action="delete_comment.php"><input type="hidden" name="comment_id" value="<?= $c['id'] ?>"><button type="submit">Delete</button></form>
  </div>
<?php endforeach; ?>
</body></html>