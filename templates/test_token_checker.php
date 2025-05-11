<?php
require 'db.php'; // 修改路径确保能加载 db.php
$result = "";
$token = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $token = trim($_POST["token"]);
    $stmt = $pdo->prepare("SELECT id, email, reset_token_expires FROM users WHERE reset_token = ?");
    $stmt->execute([$token]);

    if ($user = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $now = date('Y-m-d H:i:s');
        if ($user['reset_token_expires'] > $now) {
            $result = "<span style='color: green;'>✅ Token is valid for user: <strong>{$user['email']}</strong><br>Expires at: {$user['reset_token_expires']}</span>";
        } else {
            $result = "<span style='color: orange;'>⚠ Token has expired. Expires at: {$user['reset_token_expires']}</span>";
        }
    } else {
        $result = "<span style='color: red;'>❌ Invalid token. Not found in database.</span>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🔍 Token Checker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 12px;
            background-color: #f9f9f9;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #aaa;
            font-size: 16px;
        }
        button {
            margin-top: 10px;
            padding: 10px 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        .result {
            margin-top: 20px;
            font-size: 15px;
        }
    </style>
</head>
<body>

    <h2>🔐 Token Validity Checker</h2>
    <form method="POST">
        <label for="token">Paste your reset token:</label>
        <input type="text" id="token" name="token" value="<?= htmlspecialchars($token) ?>" required>
        <button type="submit">Check Token</button>
    </form>

    <?php if ($result): ?>
        <div class="result"><?= $result ?></div>
    <?php endif; ?>

</body>
</html>
