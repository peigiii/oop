<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) exit('Login required.');
include 'nav.php';

$user_id = $_SESSION['user_id'];
$searchTerm = isset($_GET['q']) ? trim($_GET['q']) : '';
$page = max(1, intval($_GET['page'] ?? 1));
$pageSize = 8;
$offset = ($page - 1) * $pageSize;
$total = 0;
$results = [];

if ($searchTerm !== '') {
    // 记录搜索历史
    $stmt = $pdo->prepare("INSERT INTO search_history (user_id, keyword) VALUES (?, ?)");
    $stmt->execute([$user_id, $searchTerm]);

    // 获取总数
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM videos WHERE title LIKE ? OR description LIKE ? OR category LIKE ?");
    $like = "%$searchTerm%";
    $stmt->execute([$like, $like, $like]);
    $total = $stmt->fetchColumn();

    // 分页查询
    $stmt = $pdo->prepare("SELECT title, description, category, file_path FROM videos WHERE title LIKE ? OR description LIKE ? OR category LIKE ? ORDER BY id DESC LIMIT ? OFFSET ?");
    $stmt->execute([$like, $like, $like, $pageSize, $offset]);
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $totalPages = ceil($total / $pageSize);
} else {
    $totalPages = 1;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Videos - SkillSphere</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .search-container { max-width: 800px; margin: 40px auto; padding: 24px; background: #fff; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.08); }
        .search-bar { width: 100%; padding: 14px 18px; border-radius: 10px; border: 2px solid #1976d2; font-size: 18px; margin-bottom: 24px; }
        .suggest-list { position: absolute; background: #fff; border: 1px solid #ccc; border-radius: 0 0 10px 10px; width: 100%; z-index: 99; max-height: 220px; overflow-y: auto; }
        .suggest-item { padding: 10px 18px; cursor: pointer; }
        .suggest-item:hover { background: #e3f2fd; }
        .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 20px; }
        .video-card { background: #fff; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); padding: 12px; display: flex; flex-direction: column; align-items: center; }
        .video-card video { width: 100%; height: auto; border-radius: 6px; }
        .video-card h3 { font-size: 16px; margin: 10px 0 4px; text-align: center; }
        .video-card p { font-size: 14px; color: #555; text-align: center; margin: 0; }
        .video-category { font-size: 13px; color: #999; margin-top: 6px; text-align: center; }
        .no-result { text-align: center; color: #888; font-size: 18px; margin-top: 40px; }
        .pagination { margin: 30px 0 0 0; text-align: center; }
        .pagination a, .pagination span { display: inline-block; margin: 0 6px; padding: 6px 14px; border-radius: 6px; color: #1976d2; background: #f3f3f3; text-decoration: none; }
        .pagination .active { background: #1976d2; color: #fff; font-weight: bold; }
        .pagination a:hover { background: #ffe082; }
        .search-form-wrap { position: relative; }
    </style>
</head>
<body>
    <div class="search-container">
        <form method="GET" action="search.php" autocomplete="off" class="search-form-wrap">
            <input id="searchInput" class="search-bar" type="text" name="q" placeholder="Search for videos by title, description, or category..." value="<?php echo htmlspecialchars($searchTerm); ?>">
            <div id="suggestBox" class="suggest-list" style="display:none;"></div>
        </form>
        <?php if ($searchTerm !== ''): ?>
            <h2 style="margin-bottom: 24px; color: #1976d2;">Search Results for "<?php echo htmlspecialchars($searchTerm); ?>"</h2>
            <?php if (count($results) > 0): ?>
                <div class="grid">
                    <?php foreach ($results as $row): ?>
                        <div class="video-card">
                            <video src="<?php echo $row['file_path']; ?>" controls></video>
                            <h3><?php echo htmlspecialchars($row['title']); ?></h3>
                            <p><?php echo htmlspecialchars($row['description']); ?></p>
                            <div class="video-category">分类: <?php echo htmlspecialchars($row['category']); ?></div>
                        </div>
                    <?php endforeach; ?>
                </div>
                <?php if ($totalPages > 1): ?>
                <div class="pagination">
                    <?php for ($i = 1; $i <= $totalPages; $i++): ?>
                        <?php if ($i == $page): ?>
                            <span class="active"><?php echo $i; ?></span>
                        <?php else: ?>
                            <a href="search.php?q=<?php echo urlencode($searchTerm); ?>&page=<?php echo $i; ?>"><?php echo $i; ?></a>
                        <?php endif; ?>
                    <?php endfor; ?>
                </div>
                <?php endif; ?>
            <?php else: ?>
                <div class="no-result">No videos found matching your search.</div>
            <?php endif; ?>
        <?php endif; ?>
    </div>
    <script>
    // AJAX 搜索建议
    const input = document.getElementById('searchInput');
    const suggestBox = document.getElementById('suggestBox');
    let timer = null;
    input.addEventListener('input', function() {
        const val = this.value.trim();
        if (val.length === 0) { suggestBox.style.display = 'none'; return; }
        clearTimeout(timer);
        timer = setTimeout(() => {
            fetch('search_suggest.php?q=' + encodeURIComponent(val))
                .then(res => res.json())
                .then(data => {
                    if (data.length > 0) {
                        suggestBox.innerHTML = data.map(item => `<div class='suggest-item'>${item}</div>`).join('');
                        suggestBox.style.display = 'block';
                    } else {
                        suggestBox.style.display = 'none';
                    }
                });
        }, 200);
    });
    // 点击建议填充
    suggestBox.addEventListener('click', function(e) {
        if (e.target.classList.contains('suggest-item')) {
            input.value = e.target.textContent;
            suggestBox.style.display = 'none';
            input.form.submit();
        }
    });
    // 失去焦点隐藏
    input.addEventListener('blur', function() { setTimeout(()=>{suggestBox.style.display='none';}, 200); });
    </script>
</body>
</html>