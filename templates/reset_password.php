<?php
require 'db.php'; // 确保路径正确

if (isset($_GET['token'])) {
    $token = $_GET['token'];

    // 查询 token 是否有效
    $stmt = $pdo->prepare("SELECT id FROM users WHERE reset_token = ? AND reset_token_expires > NOW()");
    $stmt->execute([$token]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        // 表单提交后，更新密码
        if ($_SERVER["REQUEST_METHOD"] === "POST" && !empty($_POST['password'])) {
            $new_password = password_hash($_POST['password'], PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("UPDATE users SET password = ?, reset_token = NULL, reset_token_expires = NULL WHERE id = ?");
            $stmt->execute([$new_password, $user['id']]);

            echo "<div style='color: green; text-align: center;'>✅ Password reset successfully. <a href='login.php'>Go to Login</a></div>";
            exit;
        }
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>Reset Password</title>
            <style>
                body {
                    font-family: Arial;
                    background-color: #f3f3f3;
                }
                .container {
                    max-width: 400px;
                    margin: 60px auto;
                    background-color: #fff;
                    padding: 30px;
                    border-radius: 12px;
                    box-shadow: 0 0 10px rgba(0,0,0,0.1);
                    text-align: center;
                }
                input[type="password"] {
                    width: 100%;
                    padding: 12px;
                    margin-top: 10px;
                    border: 1px solid #ccc;
                    border-radius: 8px;
                    font-size: 16px;
                }
                button {
                    margin-top: 16px;
                    padding: 10px 20px;
                    font-size: 16px;
                    background-color: #4CAF50;
                    color: white;
                    border: none;
                    border-radius: 8px;
                    cursor: pointer;
                }
            </style>
        </head>
        <body>
        <div class="container">
            <h2>🔐 Reset Your Password</h2>
            <form method="POST">
                <input type="password" name="password" required placeholder="Enter new password">
                <button type="submit">Reset Password</button>
            </form>
        </div>
        </body>
        </html>
        <?php
    } else {
        echo "<div style='color:red; text-align:center;'>❌ Invalid or expired token.</div>";
    }
} else {
    echo "<div style='color:red; text-align:center;'>❌ Missing token.</div>";
}
?>
