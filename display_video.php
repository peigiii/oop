<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "skillsphere_db";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("连接失败: " . $conn->connect_error);
}

// 筛选分类
$category = isset($_GET['category']) ? $_GET['category'] : '';
$page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
$pageSize = isset($GLOBALS['pageSize']) ? $GLOBALS['pageSize'] : 9; // 使用全局变量或默认值
$where = $category ? "WHERE category='".$conn->real_escape_string($category)."'" : '';

// 获取总数
$countSql = "SELECT COUNT(*) as cnt FROM videos $where";
$countRes = $conn->query($countSql);
$total = $countRes ? $countRes->fetch_assoc()['cnt'] : 0;
$totalPages = ceil($total / $pageSize);
$offset = ($page-1)*$pageSize;

$sql = "SELECT id, title, description, category, file_path, video_url FROM videos $where ORDER BY id DESC LIMIT $offset, $pageSize";
$result = $conn->query($sql);

function linkify($text) {
    $text = preg_replace('/(https?:\/\/[^\s]+)/i', '<a href="$1" target="_blank" style="color:#2563eb;text-decoration:underline;">$1</a>', $text);
    return $text;
}
function timeify($text, $videoId) {
    return preg_replace_callback('/(\d{1,2}:\d{2})/', function($m) use ($videoId) {
        $parts = explode(':', $m[1]);
        $sec = count($parts) == 2 ? ($parts[0]*60+$parts[1]) : 0;
        return '<a href=\"#\" onclick=\"jumpToTime('.$videoId.','.$sec.');return false;\" style=\"color:#10b981;font-weight:600;\">'.$m[1].'</a>';
    }, $text);
}
// 获取所有分类
$catRes = $conn->query("SELECT DISTINCT category FROM videos");
$categories = [];
while($catRes && $row = $catRes->fetch_assoc()) $categories[] = $row['category'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillSphere</title>
    <style>
        :root {
            --primary-color: #4f46e5;
            --secondary-color: #818cf8;
            --background-color: #f8fafc;
            --card-background: #ffffff;
            --text-primary: #1e293b;
            --text-secondary: #64748b;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 20px;
            color: var(--text-primary);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .page-title {
            text-align: center;
            font-size: 2rem;
            color: var(--text-primary);
            margin: 2rem 0;
            font-weight: 600;
        }

        .filter-section {
            background: var(--card-background);
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            margin-bottom: 2rem;
        }

        .filter-bar {
            display: flex;
            gap: 1rem;
            align-items: center;
            flex-wrap: wrap;
        }

        .filter-bar select {
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            border: 1.5px solid #e2e8f0;
            font-size: 1rem;
            color: var(--text-primary);
            background-color: var(--card-background);
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .filter-bar select:hover {
            border-color: var(--primary-color);
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .video-card {
            background: var(--card-background);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .video-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.1);
        }

        .video-thumbnail {
            position: relative;
            width: 100%;
            padding-top: 56.25%; /* 16:9 Aspect Ratio */
            background: #000;
            overflow: hidden;
        }

        .video-thumbnail video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .video-info {
            padding: 1.25rem;
        }

        .video-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--text-primary);
            margin: 0 0 0.5rem 0;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .video-category {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            background-color: var(--secondary-color);
            color: white;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 2rem;
        }

        .pagination a {
            padding: 0.5rem 1rem;
            border-radius: 8px;
            background: var(--card-background);
            color: var(--text-primary);
            text-decoration: none;
            font-weight: 500;
            border: 1.5px solid #e2e8f0;
            transition: all 0.2s ease;
        }

        .pagination a.active,
        .pagination a:hover {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }

        .loading {
            text-align: center;
            padding: 2rem;
            color: var(--text-secondary);
        }

        @media (max-width: 768px) {
            .grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 1.5rem;
            }

            .page-title {
                font-size: 1.5rem;
            }

            .filter-bar {
                flex-direction: column;
                align-items: stretch;
            }

            .filter-bar select {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        
        <div class="filter-section">
            <form class="filter-bar" method="get" action="">
                <label for="cat">Category:</label>
                <select name="category" id="cat" onchange="this.form.submit()">
                    <option value="">All Videos</option>
                    <?php foreach($categories as $cat): ?>
                        <option value="<?= htmlspecialchars($cat) ?>" <?= $cat===$category?'selected':'' ?>>
                            <?= htmlspecialchars($cat) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </form>
        </div>

        <div class="grid">
            <?php if ($result && $result->num_rows > 0): ?>
                <?php while($row = $result->fetch_assoc()): ?>
                    <a href="video_detail.php?id=<?php echo $row['id']; ?>" class="video-card">
                        <div class="video-thumbnail">
                            <video src="<?php echo htmlspecialchars($row['file_path'] ?? $row['video_url']); ?>" 
                                   preload="metadata" 
                                   data-video-id="<?php echo $row['id']; ?>">
                            </video>
                        </div>
                        <div class="video-info">
                            <h3 class="video-title"><?php echo htmlspecialchars($row['title']); ?></h3>
                            <span class="video-category"><?php echo htmlspecialchars($row['category']); ?></span>
                        </div>
                    </a>
                <?php endwhile; ?>
            <?php else: ?>
                <div class="loading">
                    <p>No videos available</p>
                </div>
            <?php endif; ?>
        </div>

        <?php if ($totalPages > 1): ?>
            <div class="pagination">
                <?php for($i=1; $i<=$totalPages; $i++): ?>
                    <a href="?category=<?= urlencode($category) ?>&page=<?= $i ?>" 
                       class="<?= $i==$page?'active':'' ?>">
                        <?= $i ?>
                    </a>
                <?php endfor; ?>
            </div>
        <?php endif; ?>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // 视频缩略图加载优化
        const videos = document.querySelectorAll('video');
        videos.forEach(video => {
            video.addEventListener('loadedmetadata', function() {
                // 设置视频第一帧作为缩略图
                video.currentTime = 0;
            });
        });
    });
    </script>
</body>
</html>
<?php $conn->close(); ?>
