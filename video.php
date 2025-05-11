<?php
// 数据库连接配置
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "skillsphere_db";

// 创建连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接
if ($conn->connect_error) {
    die("连接失败: " . $conn->connect_error);
}

// 处理视频上传
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $_POST["title"];
    $description = $_POST["description"];
    $category = $_POST["category"];
    $videoFile = $_FILES["videoFile"]["name"];
    $uploadDir = "uploads/";
    $targetFile = $uploadDir . basename($videoFile);

    // 上传视频文件
    if (move_uploaded_file($_FILES["videoFile"]["tmp_name"], $targetFile)) {
        $stmt = $conn->prepare("INSERT INTO videos (title, description, category, file_path) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $title, $description, $category, $targetFile);
        if ($stmt->execute()) {
            echo "上传成功！";
        } else {
            echo "数据库插入失败: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo "文件上传失败。";
    }
}
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>SkillSphere - Upload Video</title>
  <link rel="stylesheet" href="style.css" />
  <style>
    :root {
      --theme: #6366f1;
      --theme-dark: #4338ca;
      --theme-light: #a5b4fc;
      --danger: #f87171;
      --success: #34d399;
    }
    body { background: #f3f4f6; }
    .upload-card {
      background: #fff;
      border-radius: 18px;
      box-shadow: 0 4px 24px rgba(99,102,241,0.08);
      max-width: 520px;
      margin: 40px auto 0 auto;
      padding: 32px 28px 24px 28px;
      display: flex;
      flex-direction: column;
      align-items: center;
      transition: box-shadow 0.2s;
    }
    .upload-card:hover { box-shadow: 0 8px 32px rgba(99,102,241,0.13);}
    .drag-area {
      border: 2.5px dashed var(--theme);
      border-radius: 12px;
      background: #f8fafc;
      width: 100%;
      min-height: 120px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--theme-dark);
      font-size: 1.2em;
      font-weight: 600;
      margin-bottom: 18px;
      cursor: pointer;
      transition: background 0.2s, border-color 0.2s;
    }
    .drag-area.dragover {
      background: var(--theme-light);
      border-color: var(--theme-dark);
      color: var(--theme-dark);
    }
    .upload-btn {
      background: var(--theme);
      color: #fff;
      padding: 12px 32px;
      border: none;
      border-radius: 10px;
      font-size: 1.1em;
      font-weight: 600;
      box-shadow: 0 2px 8px rgba(99,102,241,0.08);
      cursor: pointer;
      transition: background 0.2s, transform 0.1s;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .upload-btn:hover { background: var(--theme-dark); transform: translateY(-2px) scale(1.03);}
    .progress-bar {
      width: 100%;
      height: 16px;
      background: #e0e7ef;
      border-radius: 8px;
      overflow: hidden;
      margin-top: 10px;
      margin-bottom: 6px;
      position: relative;
    }
    .progress-bar-inner {
      height: 100%;
      background: linear-gradient(90deg, var(--theme), var(--theme-light));
      width: 0;
      transition: width 0.3s;
      border-radius: 8px;
      animation: progress-move 1.2s linear infinite;
    }
    @keyframes progress-move {
      0% { filter: brightness(1);}
      50% { filter: brightness(1.1);}
      100% { filter: brightness(1);}
    }
    .progress-percent {
      position: absolute;
      right: 12px;
      top: 0;
      height: 100%;
      display: flex;
      align-items: center;
      font-size: 0.98em;
      color: var(--theme-dark);
      font-weight: 600;
    }
    .success-popup, .error-popup {
      position: fixed;
      top: 30px;
      left: 50%;
      transform: translateX(-50%);
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 4px 24px rgba(0,0,0,0.13);
      padding: 18px 32px;
      font-size: 1.1em;
      font-weight: 600;
      color: var(--success);
      z-index: 9999;
      display: flex;
      align-items: center;
      gap: 10px;
      opacity: 0;
      pointer-events: none;
      animation: popup-fade 2.2s forwards;
    }
    .error-popup { color: var(--danger);}
    @keyframes popup-fade {
      0% { opacity: 0;}
      10% { opacity: 1;}
      90% { opacity: 1;}
      100% { opacity: 0;}
    }
    @media (max-width: 600px) {
      .upload-card { padding: 16px 4vw; }
      .drag-area { min-height: 80px; font-size: 1em;}
    }
  </style>
</head>
<body>
  <?php include '../templates/nav.php'; ?>

  <div class="upload-card">
    <h2 style="color:var(--theme);font-size:2em;font-weight:700;margin-bottom:18px;display:flex;align-items:center;gap:10px;">
      <span style="font-size:1.3em;">📤</span> Upload Video
    </h2>
    <form id="videoUploadForm" enctype="multipart/form-data" style="width:100%;display:flex;flex-direction:column;gap:18px;">
      <input type="text" name="title" placeholder="Title *" required
        style="border:1.5px solid #e0e7ef;padding:12px 16px;border-radius:8px;font-size:1.1em;box-shadow:0 1px 4px rgba(0,0,0,0.04);margin-bottom:2px;transition:border-color 0.2s;"
        onfocus="this.style.borderColor='var(--theme)';"
        onblur="this.style.borderColor='#e0e7ef';"
      />
      <textarea name="description" placeholder="Description"
        style="border:1.5px solid #e0e7ef;padding:12px 16px;border-radius:8px;font-size:1.05em;min-height:70px;resize:vertical;box-shadow:0 1px 4px rgba(0,0,0,0.04);transition:border-color 0.2s;"
        onfocus="this.style.borderColor='var(--theme)';"
        onblur="this.style.borderColor='#e0e7ef';"
      ></textarea>
      <select name="category"
        style="border:1.5px solid #e0e7ef;padding:12px 16px;border-radius:8px;font-size:1.05em;box-shadow:0 1px 4px rgba(0,0,0,0.04);transition:border-color 0.2s;"
        onfocus="this.style.borderColor='var(--theme)';"
        onblur="this.style.borderColor='#e0e7ef';"
      >
        <option value="Python">Python</option>
        <option value="Java">Java</option>
        <option value="SQL">SQL</option>
        <option value="Animation">Animation</option>
        <option value="Editing & PS">Editing & PS</option>
        <option value="Language">Language</option>
        <option value="C++">C++</option>
        <option value="Design">Design</option>
      </select>
      <div id="dragArea" class="drag-area" onclick="document.getElementById('videoFileInput').click();">
        <span id="dragText">Drag & Drop video here or click to select</span>
      </div>
      <input type="file" id="videoFileInput" name="videoFile" accept="video/*" style="display:none;" onchange="previewVideo(this)" />
      <div class="progress-bar" id="progressBar" style="display:none;">
        <div class="progress-bar-inner" id="progressBarInner"></div>
        <span class="progress-percent" id="progressPercent">0%</span>
      </div>
      <button type="submit" class="upload-btn"><span style="font-size:1.2em;">⬆️</span> Upload Video</button>
      <div id="uploadMessage" class="text-center text-base font-semibold"></div>
      <video id="previewPlayer" style="display:none;width:100%;max-height:220px;border-radius:10px;margin-top:10px;box-shadow:0 2px 8px rgba(0,0,0,0.08);"></video>
    </form>
  </div>
  <div id="popupContainer"></div>
  <script>
    // 拖拽上传
    const dragArea = document.getElementById('dragArea');
    const fileInput = document.getElementById('videoFileInput');
    dragArea.addEventListener('dragover', e => {
      e.preventDefault();
      dragArea.classList.add('dragover');
      document.getElementById('dragText').textContent = 'Release to upload';
    });
    dragArea.addEventListener('dragleave', e => {
      e.preventDefault();
      dragArea.classList.remove('dragover');
      document.getElementById('dragText').textContent = 'Drag & Drop video here or click to select';
    });
    dragArea.addEventListener('drop', e => {
      e.preventDefault();
      dragArea.classList.remove('dragover');
      document.getElementById('dragText').textContent = 'Drag & Drop video here or click to select';
      if (e.dataTransfer.files && e.dataTransfer.files[0]) {
        fileInput.files = e.dataTransfer.files;
        previewVideo(fileInput);
      }
    });

    // 视频预览
    function previewVideo(input) {
      if (input.files && input.files[0]) {
        const fileURL = URL.createObjectURL(input.files[0]);
        const video = document.getElementById('previewPlayer');
        video.src = fileURL;
        video.style.display = 'block';
      }
    }

    // 上传表单
    document.getElementById('videoUploadForm').addEventListener('submit', function (e) {
      e.preventDefault();
      const formData = new FormData(this);
      const progressBar = document.getElementById('progressBar');
      const progressBarInner = document.getElementById('progressBarInner');
      const progressPercent = document.getElementById('progressPercent');
      const msg = document.getElementById('uploadMessage');
      progressBar.style.display = 'block';
      progressBarInner.style.width = '0%';
      progressPercent.textContent = '0%';
      msg.textContent = '';
      // 禁用按钮
      this.querySelector('button[type=submit]').disabled = true;

      const xhr = new XMLHttpRequest();
      xhr.open('POST', '', true);
      xhr.upload.onprogress = function (e) {
        if (e.lengthComputable) {
          const percent = Math.round((e.loaded / e.total) * 100);
          progressBarInner.style.width = percent + '%';
          progressPercent.textContent = percent + '%';
        }
      };
      xhr.onload = function () {
        progressBar.style.display = 'none';
        document.getElementById('videoUploadForm').querySelector('button[type=submit]').disabled = false;
        if (xhr.status === 200 && xhr.responseText.includes('上传成功')) {
          showPopup('success', '✅ 上传成功，跳转中...');
          setTimeout(() => { window.location.href = 'display_video.php'; }, 1200);
        } else {
          showPopup('error', '❌ 上传失败：' + xhr.responseText);
        }
      };
      xhr.onerror = function () {
        progressBar.style.display = 'none';
        document.getElementById('videoUploadForm').querySelector('button[type=submit]').disabled = false;
        showPopup('error', '❌ 上传错误，请重试');
      };
      xhr.send(formData);
    });

    // 弹窗动画
    function showPopup(type, text) {
      const popup = document.createElement('div');
      popup.className = type === 'success' ? 'success-popup' : 'error-popup';
      popup.innerHTML = (type === 'success' ? '✅' : '❌') + ' ' + text;
      document.getElementById('popupContainer').appendChild(popup);
      setTimeout(() => { popup.remove(); }, 2200);
    }
  </script>
</body>
</html>
