<?php
session_start();
require_once 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT * FROM subjective_submissions WHERE user_id = ? ORDER BY submitted_at DESC");
$stmt->execute([$user_id]);
$submissions = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Subjective Reviews</title>
    <?php include 'nav.php'; ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; padding: 20px;  }
        h2 { text-align: center; margin-bottom: 30px; color: #1a5ca4; font-size: 2.2em; letter-spacing: 1px; }
        .reviews-container { max-width: 900px; margin: 0 auto; }
        .submission {
            background: linear-gradient(120deg, #fdf6e3 0%, #f7cac9 100%);
            border-radius: 18px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.10);
            margin-bottom: 32px;
            padding: 28px 32px;
            transition: box-shadow 0.2s, transform 0.2s;
            word-break: break-word;
        }
        .submission:hover { box-shadow: 0 8px 32px rgba(0,0,0,0.16); transform: translateY(-2px) scale(1.01); }
        .label { color: #1a5ca4; font-weight: bold; font-size: 1.15em; margin-top: 10px; }
        .score { color: #219150; font-weight: bold; font-size: 1.5em; }
        .pending { color: #e67e22; font-weight: bold; font-size: 1.2em; }
        .answer, .comment {
            background: #f7f7fa;
            border-radius: 8px;
            padding: 14px 16px;
            margin: 10px 0 18px 0;
            font-size: 1.15em;
            color: #333;
            line-height: 1.6;
            word-break: break-word;
        }
        .comment { background: #e0f7fa; color: #1565c0; }
        .meta { font-size: 0.98em; color: #888; margin-top: 8px; }
        @media (max-width: 700px) {
            .reviews-container { padding: 0 4vw; }
            .submission { padding: 18px 8px; }
            h2 { font-size: 1.3em; }
        }
    </style>
</head>
<body>
    <h2>My Subjective Review Results</h2>
    <div class="reviews-container">
    <?php if (empty($submissions)): ?>
        <p style="text-align:center; color:#888; font-size:1.2em;">No subjective submissions yet.</p>
    <?php endif; ?>
    <?php foreach ($submissions as $sub): ?>
        <div class="submission">
            <div class="label">Category:</div> <div class="answer"> <?= htmlspecialchars($sub['skill_category']) ?> </div>
            <div class="label">Question:</div> <div class="answer"> <?= nl2br(htmlspecialchars($sub['question_text'])) ?> </div>
            <div class="label">Your Answer:</div> <div class="answer"> <?= htmlspecialchars($sub['user_answer']) ?> </div>
            <div class="label">Instructor Score:</div>
            <?php if ($sub['instructor_score'] !== null): ?>
                <span class="score"> <?= htmlspecialchars($sub['instructor_score']) ?> </span>
            <?php else: ?>
                <span class="pending"> Pending Review </span>
            <?php endif; ?><br>
            <div class="label">Instructor Comment:</div>
            <?php if ($sub['instructor_comment'] !== null && $sub['instructor_comment'] !== ''): ?>
                <div class="comment"> <?= nl2br(htmlspecialchars($sub['instructor_comment'])) ?> </div>
            <?php else: ?>
                <span class="pending"> No comment yet </span>
            <?php endif; ?><br>
            <div class="meta">Submitted at: <?= htmlspecialchars($sub['submitted_at']) ?></div>
        </div>
    <?php endforeach; ?>
    </div>
</body>
</html> 