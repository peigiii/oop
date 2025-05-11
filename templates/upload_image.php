<?php
// 正确引用 db.php
require_once __DIR__ . '/db.php';

$uploadDir = __DIR__ . "/uploads/images/";

// 自动创建目录及权限
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['image'])) {
    $file = $_FILES['image'];
    $imageName = basename($file['name']);
    $targetPath = $uploadDir . $imageName;

    // 移动上传文件
    if (move_uploaded_file($file['tmp_name'], $targetPath)) {
        echo "✅ Image uploaded successfully: " . htmlspecialchars($imageName);
        echo "<br>File path: " . htmlspecialchars($targetPath);
    } else {
        echo "❌ Failed to upload image.";
    }
} else {
    echo "❌ No image uploaded.";
}
?>
<form method="POST" enctype="multipart/form-data">
    <input type="file" name="image" required>
    <button type="submit">Upload Image</button>
</form>
