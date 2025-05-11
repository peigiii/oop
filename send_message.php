<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$to_id = $_GET['to'] ?? null;
if (!$to_id) {
    echo "User not specified.";
    exit;
}

$stmt = $pdo->prepare("SELECT username FROM users WHERE id = ?");
$stmt->execute([$to_id]);
$receiver = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$receiver) {
    echo "User not found.";
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send Message</title>
    <?php include 'adminnav.php'; ?>
    <style>
        form { max-width: 600px; margin: 30px auto; background: #f9f9f9; padding: 20px; border-radius: 10px; }
        label { display: block; margin-bottom: 6px; font-weight: bold; }
        input[type=text], textarea {
            width: 100%; padding: 10px; margin-bottom: 16px; border-radius: 8px; border: 1px solid #ccc;
        }
        button {
            padding: 10px 20px; border: none; border-radius: 6px; background: #3498db; color: white; cursor: pointer;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">📬 Send Message to <?= htmlspecialchars($receiver['username']) ?></h2>

<form method="POST" action="admin_actions.php">
    <input type="hidden" name="to_id" value="<?= $to_id ?>">
    <label for="subject">Subject:</label>
    <input type="text" name="subject" id="subject" required>

    <label for="message">Message:</label>
    <textarea name="message" id="message" rows="6" required></textarea>

    <button type="submit" name="send_message">Send</button>
</form>

</body>
</html>
