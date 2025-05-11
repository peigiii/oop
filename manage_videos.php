
<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$stmt = $pdo->prepare("SELECT role, username FROM users WHERE id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
if ($user['role'] !== 'admin') {
    echo "Access denied.";
    exit;
}

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_FILES["videoFile"])) {
    $title = trim($_POST["title"]);
    $description = trim($_POST["description"]);
    $category = trim($_POST["category"]);
    $user_id = $_SESSION['user_id'];

    $upload_dir = "uploads/";
    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0777, true);
    }

    $file_tmp = $_FILES["videoFile"]["tmp_name"];
    $file_name = basename($_FILES["videoFile"]["name"]);
    $target_file = $upload_dir . time() . "_" . $file_name;

    $allowed_types = ['video/mp4', 'video/webm', 'video/ogg'];
    if (!in_array($_FILES["videoFile"]["type"], $allowed_types)) {
        echo "Invalid video format.";
    } elseif (move_uploaded_file($file_tmp, $target_file)) {
        $stmt = $pdo->prepare("INSERT INTO videos (title, description, category, file_path, user_id) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$title, $description, $category, $target_file, $user_id]);
        echo "<p style='color:green;'>Upload successful!</p>";
    } else {
        echo "<p style='color:red;'>Video upload failed.</p>";
    }
}

if (isset($_GET['delete'])) {
    $stmt = $pdo->prepare("DELETE FROM videos WHERE id = ?");
    $stmt->execute([$_GET['delete']]);
    header("Location: delete_video.php");
    exit;
}

$videos = $pdo->query("SELECT v.*, u.username 
                       FROM videos v 
                       LEFT JOIN users u ON v.user_id = u.id 
                       ORDER BY v.id DESC")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Videos</title>
  <link rel="stylesheet" href="style.css">
  <?php include 'adminnav.php'; ?>
  <style>
    .rounded-input, .rounded-select, .rounded-textarea {
      border: none;
      background-color: #f5c5b2;
      padding: 10px 16px;
      border-radius: 20px;
      font-size: 16px;
      outline: none;
      width: 280px;
    }
    .rounded-textarea {
      border-radius: 30px;
      resize: none;
    }
    label {
      font-weight: 500;
      width: 120px;
      display: inline-block;
      margin-bottom: 10px;
    }
    .form-group {
      display: flex;
      align-items: flex-start;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
  <h2>Welcome Admin <?= htmlspecialchars($user['username']) ?> - Manage Videos</h2>

  <div style="max-width: 900px; margin: 20px auto; padding: 30px; border: 2px solid #333; border-radius: 30px;">
    <h2>Upload Video</h2>
    <form action="" method="post" enctype="multipart/form-data" id="videoUploadForm">
      <div style="display: flex; gap: 40px; margin-bottom: 20px;">
        <!-- 视频预览框 -->
        <div style="border: 2px solid #333; padding: 6px; border-radius: 10px; background-color: #000; width: 200px; height: 200px; display: flex; align-items: center; justify-content: center;">
          <video id="previewPlayer" width="100%" height="100%" controls style="object-fit: cover; border-radius: 6px; display: none;"></video>
          <label for="videoInput" style="position: absolute; cursor: pointer; color: white; font-size: 30px;">▶</label>
        </div>

        <!-- 表单字段 -->
        <div class="flex flex-col">
          <div class="form-group">
            <label for="title">Title </label>
            <input type="text" id="title" name="title" class="rounded-input" required />
          </div>
          <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" rows="3" class="rounded-textarea"></textarea>
          </div>
          <div class="form-group">
            <label for="category">Category</label>
            <select id="category" name="category" class="rounded-select">
              <option value="Python">Python</option>
              <option value="Java">Java</option>
              <option value="SQL">SQL</option>
              <option value="Animation">Animation</option>
              <option value="Editing & PS">Editing & PS</option>
              <option value="Language">Language</option>
              <option value="C++">C++</option>
              <option value="Design">Design</option>
            </select>
          </div>
        </div>
      </div>

      <input type="file" id="videoInput" name="videoFile" accept="video/*" style="display:none" onchange="previewVideo(this)" />
      <div style="text-align: right;">
        <button type="submit" style="background-color: #3490dc; color: white; padding: 10px 20px; border-radius: 8px; border: none;">📤 Upload Video</button>
      </div>
      <div id="uploadMessage" class="text-green-500 mt-2"></div>
    </form>
  </div>

  <!-- 视频展示列表 -->
  <div style="margin: 30px auto; max-width: 1100px; border: 2px solid #ccc; border-radius: 10px; padding: 20px; background-color: #f9f9f9;">
    <h3 style="margin-bottom: 15px;">📺 All Videos</h3>
    <table border="1" cellpadding="10" style="width: 100%; border-collapse: collapse;">
      <tr style="background-color: #eaeaea;">
        <th>ID</th><th>Title</th><th>Description</th><th>Category</th><th>Uploader</th><th>Preview</th><th>Action</th>
      </tr>
      <?php foreach ($videos as $v): ?>
        <tr>
          <td><?= $v['id'] ?></td>
          <td><?= htmlspecialchars($v['title']) ?></td>
          <td><?= htmlspecialchars($v['description']) ?></td>
          <td><?= htmlspecialchars($v['category']) ?></td>
          <td><?= htmlspecialchars($v['username'] ?? 'Unknown') ?></td>
          <td><video width="200" controls src="<?= htmlspecialchars($v['file_path']) ?>"></video></td>
          <td><a href="<?= basename($_SERVER['PHP_SELF']) ?>?delete=<?= $v['id'] ?>" onclick="return confirm('Delete this video?')">Delete</a></td>
        </tr>
      <?php endforeach; ?>
    </table>
  </div>

  <canvas id="thumbnailCanvas" width="320" height="180" style="display:none;"></canvas>

  <script>
    function previewVideo(input) {
      if (input.files && input.files[0]) {
        const fileURL = URL.createObjectURL(input.files[0]);
        const video = document.getElementById("previewPlayer");
        video.src = fileURL;
        video.style.display = "block";

        const canvas = document.getElementById("thumbnailCanvas");
        const context = canvas.getContext("2d");
        const tempVideo = document.createElement("video");
        tempVideo.src = fileURL;
        tempVideo.addEventListener("loadedmetadata", () => {
          tempVideo.currentTime = 0.1;
        });
        tempVideo.addEventListener("seeked", () => {
          context.drawImage(tempVideo, 0, 0, canvas.width, canvas.height);
        }, { once: true });
      }
    }
  </script>
</body>
</html>
