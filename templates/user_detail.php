<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$id = $_GET['id'] ?? null;
if (!$id) {
    echo "User not specified.";
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
$stmt->execute([$id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    echo "User not found.";
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
    <?php include 'adminnav.php'; ?>
    <style>
        .info-box {
            width: 500px;
            margin: 40px auto;
            padding: 24px;
            background: #f7f7f7;
            border: 2px solid #ddd;
            border-radius: 14px;
        }
        .info-box h3 {
            margin-bottom: 16px;
            color: #444;
        }
        .info-box p {
            margin: 8px 0;
            font-size: 15px;
        }
        .label {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="info-box">
    <h3>👤 User Details</h3>
    <p><span class="label">Username:</span> <?= htmlspecialchars($user['username']) ?></p>
    <p><span class="label">Email:</span> <?= htmlspecialchars($user['email']) ?></p>
    <p><span class="label">Role:</span> <?= $user['role'] ?></p>
    <p><span class="label">Status:</span> <?= $user['status'] ?></p>
    <p><span class="label">Registered:</span> <?= $user['created_at'] ?></p>
    <p><span class="label">Last Login:</span> <?= $user['last_login_at'] ?: '—' ?></p>
    <p><span class="label">Admin Note:</span> <?= nl2br(htmlspecialchars($user['admin_note'])) ?></p>
</div>

</body>
</html>
