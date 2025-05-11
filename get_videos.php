<?php
// get_videos.php
// 数据库连接信息
$servername  = "localhost";
$db_username = "root";
$db_password = "";
$dbname      = "skillsphere_db";

// 获取分类参数，若为空则查询所有记录
$category = isset($_GET['category']) ? trim($_GET['category']) : '';

try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $db_username, $db_password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($category !== '') {
        $sql = "SELECT * FROM videos WHERE category = :category ORDER BY uploaded_at DESC";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':category' => $category]);
    } else {
        $sql = "SELECT * FROM videos ORDER BY uploaded_at DESC";
        $stmt = $pdo->query($sql);
    }

    $output = "";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $title       = htmlspecialchars($row['title']);
        $description = htmlspecialchars($row['description']);
        $video_url   = htmlspecialchars($row['video_url']);
        $video_cat   = htmlspecialchars($row['category']);
        $uploaded_at = $row['uploaded_at'];

        $output .= "<div class='video-item'>";
        $output .= "<h2>$title</h2>";
        $output .= "<p>Category: $video_cat</p>";
        if (!empty($description)) {
            $output .= "<p>$description</p>";
        }
        $output .= "<video width='100%' controls>";
        $output .= "<source src='$video_url' type='video/mp4'>";
        $output .= "Your browser does not support the video tag.";
        $output .= "</video>";
        $output .= "<p>Uploaded at: $uploaded_at</p>";
        $output .= "</div>";
    }
    
    echo $output;

} catch (PDOException $e) {
    echo "Database error: " . $e->getMessage();
}
?>
