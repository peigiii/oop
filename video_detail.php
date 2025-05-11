<?php
session_start();
require 'db.php';
include 'nav.php';

$video_id = intval($_GET['id'] ?? 0);
$user_id = $_SESSION['user_id'] ?? 0;

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo json_encode(["error" => "No video ID"]);
    exit;
}
$video_id = (int)$_GET['id'];


// 获取视频数据
$stmt = $pdo->prepare("SELECT * FROM videos WHERE id = ?");
$stmt->execute([$video_id]);
$video = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$video) exit("Video not found.");

// 自动记录观看历史
if (isset($_SESSION['user_id']) && $video) {
    $user_id = $_SESSION['user_id'];
    $video_id = $video['id'];
    $stmt = $pdo->prepare("DELETE FROM watch_history WHERE user_id = ? AND video_id = ?");
    $stmt->execute([$user_id, $video_id]);
    $stmt = $pdo->prepare("INSERT INTO watch_history (user_id, video_id, watched_at) VALUES (?, ?, NOW())");
    $stmt->execute([$user_id, $video_id]);
}

// 是否已点赞/收藏
$liked = $pdo->prepare("SELECT 1 FROM video_likes WHERE user_id = ? AND video_id = ?");
$liked->execute([$user_id, $video_id]);
$isLiked = $liked->fetchColumn();

$favorited = $pdo->prepare("SELECT 1 FROM video_favorites WHERE user_id = ? AND video_id = ?");
$favorited->execute([$user_id, $video_id]);
$isFavorited = $favorited->fetchColumn();
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><?= htmlspecialchars($video['title']) ?></title>
  <link rel="stylesheet" href="style.css">
  <style>
    .video-box { max-width: 800px; margin: 40px auto; background: #fff; padding: 20px; border-radius: 12px; }
    .video-box h2 { margin-top: 0; }
    .video-box video { width: 100%; border-radius: 8px; }
    .actions { margin-top: 10px; font-size: 16px; }
    .actions span { margin-right: 15px; cursor: pointer; }
    .active { color: red; font-weight: bold; }
    .comment-box { margin-top: 30px; }
    .comment-box textarea { width: 100%; height: 80px; padding: 10px; }
  </style>
</head>
<body>
<div class="video-box">
  <h2><?= htmlspecialchars($video['title']) ?></h2>
  <video src="<?= $video['file_path'] ?>" controls></video>
  <p class="video-desc" style="text-align:left;white-space:pre-line;word-break:break-all;">
  <?php
  function linkify($text) {
      $text = preg_replace('/(https?:\/\/[^\s]+)/i', '<a href="$1" target="_blank" style="color:#2563eb;text-decoration:underline;">$1</a>', $text);
      return $text;
  }
  function timeify($text) {
      return preg_replace_callback('/(\d{1,2}:\d{2})/', function($m) {
          $parts = explode(':', $m[1]);
          $sec = count($parts) == 2 ? ($parts[0]*60+$parts[1]) : 0;
          return '<a href="#" onclick="jumpToTime('.$sec.');return false;" style="color:#10b981;font-weight:600;">'.$m[1].'</a>';
      }, $text);
  }
  $desc = htmlspecialchars($video['description']);
  $desc = linkify($desc);
  $desc = timeify($desc);
  echo $desc;
  ?>
  </p>

  <div class="actions">
    <span id="likeBtn" onclick="toggleLike()" class="<?= $isLiked ? 'active' : '' ?>">❤️ Like (<span id="likeCount">0</span>)</span>
    <span id="favBtn" onclick="toggleFav()" class="<?= $isFavorited ? 'active' : '' ?>">⭐ Favorite (<span id="favCount">0</span>)</span>
    <span>💬 Comments: <span id="commentCount">0</span></span>
  </div>

  <div class="comment-box" style="margin-top:40px;">
    <div style="font-size:20px;font-weight:600;margin-bottom:10px;display:flex;align-items:center;gap:10px;">
      <span style="color:#3b82f6;">📝</span> Leave a Comment
    </div>
    <hr style="margin-bottom:18px;">
    <form id="commentForm" style="display:flex;flex-direction:column;gap:12px;align-items:flex-start;">
      <textarea name="comment" required
        placeholder="Share your thoughts..."
        style="resize:vertical;min-height:60px;max-height:180px;padding:12px 14px;border-radius:10px;border:1.5px solid #cbd5e1;font-size:15px;box-shadow:0 1px 4px rgba(0,0,0,0.04);transition:border-color 0.2s;width:100%;text-align:left;"
        onfocus="this.style.borderColor='#3b82f6';"
        onblur="this.style.borderColor='#cbd5e1';"
      ></textarea>
      <button type="submit"
        style="background:#3b82f6;color:white;padding:8px 22px;border:none;border-radius:8px;font-size:15px;font-weight:600;cursor:pointer;box-shadow:0 2px 8px rgba(59,130,246,0.08);transition:background 0.2s;align-self:flex-end;">
        <span style='font-size:17px;vertical-align:middle;'>➤</span> Submit
      </button>
    </form>
    <div id="commentList" style="margin-top:32px;"></div>
  </div>
</div>

<script>
const videoId = <?= $video_id ?>;

function fetchStats() {
  fetch(`get_video_stats.php?video_id=${videoId}`)
    .then(res => res.json())
    .then(data => {
      document.getElementById("likeCount").textContent = data.likes;
      document.getElementById("commentCount").textContent = data.comments;
      document.getElementById("favCount").textContent = data.favorites;
    });
}

function toggleLike() {
  fetch("like.php", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: `video_id=${videoId}`
  }).then(res => res.json())
    .then(data => {
      fetchStats();
      document.getElementById("likeBtn").classList.toggle("active", data.liked);
    });
}

function toggleFav() {
  fetch("favorite.php", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: `video_id=${videoId}`
  }).then(res => res.json())
    .then(data => {
      document.getElementById("favBtn").classList.toggle("active", data.favorited);
      fetchStats();
    });
}

function loadComments() {
  fetch(`load_comments.php?video_id=${videoId}`)
    .then(res => res.text())
    .then(html => {
      document.getElementById("commentList").innerHTML = html;
      bindCommentActions();
    });
}

function bindCommentActions() {
  const commentList = document.getElementById('commentList');
  if (!commentList) return;
  commentList.querySelectorAll('.edit-comment-btn').forEach(btn => {
    btn.onclick = function() {
      const cid = this.dataset.id;
      const commentDiv = this.closest('.comment-item').querySelector('.comment-content');
      const oldText = commentDiv.innerText;
      commentDiv.innerHTML = `<textarea style='width:100%;min-height:60px;padding:10px 14px;border-radius:8px;border:2px solid #fbbf24;font-size:15px;resize:vertical;box-sizing:border-box;'>${oldText.replace(/'/g, "&#39;")}</textarea><div style='margin-top:8px;display:flex;gap:10px;'><button class='save-edit-btn' style='background:#10b981;color:#fff;border:none;border-radius:6px;padding:6px 22px;font-size:15px;cursor:pointer;font-weight:600;'>Save</button><button class='cancel-edit-btn' style='background:#aaa;color:#fff;border:none;border-radius:6px;padding:6px 22px;font-size:15px;cursor:pointer;font-weight:600;'>Cancel</button></div>`;
      commentDiv.querySelector('.save-edit-btn').onclick = function() {
        const newContent = commentDiv.querySelector('textarea').value;
        fetch('edit_comment.php', {
          method: 'POST',
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          body: `comment_id=${cid}&content=${encodeURIComponent(newContent)}`
        }).then(res => res.text()).then(txt => {
          if(txt==='ok') loadComments(); else alert('Edit failed: '+txt);
        }).catch(()=>alert('Network error.'));
      };
      commentDiv.querySelector('.cancel-edit-btn').onclick = function() { loadComments(); };
    };
  });
  commentList.querySelectorAll('.delete-comment-btn').forEach(btn => {
    btn.onclick = function() {
      if(confirm('Are you sure you want to delete this comment?')) {
        const cid = this.dataset.id;
        fetch('delete_comment.php', {
          method: 'POST',
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          body: `comment_id=${cid}`
        }).then(res => res.text()).then(txt => {
          if(txt==='ok') loadComments(); else alert('Delete failed: '+txt);
        }).catch(()=>alert('Network error.'));
      }
    };
  });
}

document.getElementById("commentForm").addEventListener("submit", e => {
  e.preventDefault();
  const form = e.target;
  fetch("submit_comment.php", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: `video_id=${videoId}&comment=${encodeURIComponent(form.comment.value)}`
  }).then(() => {
    form.reset();
    loadComments();
    fetchStats();
  });
});

function jumpToTime(sec) {
  var v = document.querySelector('.video-box video');
  if(v) { v.currentTime = sec; v.play(); }
}

fetchStats();
loadComments();
</script>
</body>
</html>
