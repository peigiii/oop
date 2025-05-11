<?php
session_start();
require_once 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['mark_read'])) {
    $notice_id = intval($_POST['mark_read']);
    $stmt = $pdo->prepare("UPDATE notifications SET is_read = 1 WHERE id = ? AND user_id = ?");
    $stmt->execute([$notice_id, $user_id]);
    header("Location: notification.php");
    exit;
}

$stmt = $pdo->prepare("SELECT id, title, message, is_read, created_at FROM notifications WHERE user_id = ? ORDER BY created_at DESC");
$stmt->execute([$user_id]);
$notices = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Notifications</title>
    <?php include 'nav.php'; ?>
    <style>
        .notification-section {
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
        }

        .notification-section h2 {
            color: #2c3e50;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 600;
        }

        .notice {
            background: white;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .notice:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        .unread {
            border-left: 5px solid #007BFF;
            background-color: #f8f9ff;
        }

        .notice strong {
            color: #2c3e50;
            font-size: 1.1em;
            display: block;
            margin-bottom: 8px;
        }

        .notice .message {
            color: #333;
            margin: 10px 0;
        }

        .notice small {
            color: #6c757d;
            display: block;
            margin-top: 10px;
        }

        .read-label {
            font-size: 0.85em;
            color: #28a745;
            display: inline-block;
            margin-top: 10px;
            padding: 4px 8px;
            background-color: #e8f5e9;
            border-radius: 4px;
        }

        .notice button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .notice button:hover {
            background-color: #0056b3;
        }

        .no-notifications {
            text-align: center;
            color: #6c757d;
            padding: 40px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="notification-section">
        <h2>Your Notifications</h2>
        <?php if (empty($notices)): ?>
            <div class="no-notifications">
                <p>No notifications at this time.</p>
            </div>
        <?php else: ?>
            <?php foreach ($notices as $note): ?>
                <div class="notice <?= !$note['is_read'] ? 'unread' : '' ?>">
                    <strong><?= htmlspecialchars($note['title']) ?></strong>
                    <div class="message"><?= nl2br(htmlspecialchars($note['message'])) ?></div>
                    <small><?= htmlspecialchars($note['created_at']) ?></small>
                    <?php if (!$note['is_read']): ?>
                        <form method="post" style="margin-top: 15px;">
                            <input type="hidden" name="mark_read" value="<?= $note['id'] ?>">
                            <button type="submit">Mark as Read</button>
                        </form>
                    <?php else: ?>
                        <span class="read-label">✔ Read</span>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</body>
</html>
