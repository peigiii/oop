<?php
session_start();
require_once 'db.php';

// 权限校验（可选）
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    die("Access denied.");
}

// 处理老师批阅提交
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submission_id'])) {
    $stmt = $pdo->prepare("UPDATE subjective_submissions SET instructor_score = ?, instructor_comment = ? WHERE id = ?");
    $stmt->execute([
        $_POST['instructor_score'],
        $_POST['instructor_comment'],
        $_POST['submission_id']
    ]);
    $msg = "Review saved!";
}

// 查询所有未批阅或已批阅的主观题答案
$stmt = $pdo->query("SELECT * FROM subjective_submissions ORDER BY submitted_at DESC");
$submissions = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review Subjective Submissions</title>
    <?php include 'adminnav.php'; ?>
    <style>
        body { font-family: Arial; padding: 20px; background: #f9f9f9; }
        .submission { background: #fff; border-radius: 8px; box-shadow: 0 0 5px #ccc; margin-bottom: 20px; padding: 20px; }
        .review-form { margin-top: 10px; }
        textarea { width: 100%; }
    </style>
</head>
<body>
    <h2>主观题批阅 Review Subjective Submissions</h2>
    <?php if (!empty($msg)) echo "<p style='color:green;'>$msg</p>"; ?>
    <?php foreach ($submissions as $sub): ?>
        <div class="submission">
            <b>User ID:</b> <?= htmlspecialchars($sub['user_id']) ?><br>
            <b>Category:</b> <?= htmlspecialchars($sub['skill_category']) ?><br>
            <b>Question:</b> <?= nl2br(htmlspecialchars($sub['question_text'])) ?><br>
            <b>User Answer:</b> <pre><?= htmlspecialchars($sub['user_answer']) ?></pre>
            <form class="review-form" method="post">
                <input type="hidden" name="submission_id" value="<?= $sub['id'] ?>">
                <label>Instructor Score:</label>
                <input type="number" name="instructor_score" min="0" max="100" value="<?= htmlspecialchars($sub['instructor_score'] ?? '') ?>"><br>
                <label>Instructor Comment:</label>
                <textarea name="instructor_comment" rows="2"><?= htmlspecialchars($sub['instructor_comment'] ?? '') ?></textarea><br>
                <button type="submit">Save Review</button>
            </form>
            <small>Submitted at: <?= htmlspecialchars($sub['submitted_at']) ?></small>
        </div>
    <?php endforeach; ?>
</body>
</html>
