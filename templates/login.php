<?php
session_start();
require 'db.php';

// 用户已登录，根据角色跳转
if (isset($_SESSION['user_id'])) {
    $stmt = $pdo->prepare("SELECT role FROM users WHERE id = ?");
    $stmt->execute([$_SESSION['user_id']]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && $user['role'] === 'admin') {
        header("Location: admin_dashboard.php");
    } else {
        header("Location: main.php");
    }
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Skill Sphere</title>
    <?php include 'nav.php'; ?>
    <link rel="stylesheet" href="style.css">
    <style>
        .login-header {
            text-align: center;
            margin-top: 60px;
            font-size: 26px;
            font-weight: bold;
        }
        .login-subtext {
            text-align: center;
            font-size: 16px;
            color: #555;
            margin-bottom: 30px;
        }
        .login-container {
            border: 2px solid #ccc;
            padding: 24px;
            border-radius: 20px;
            max-width: 420px;
            margin: 30px auto;
            background-color: #d7e6dd;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 16px;
        }
        .form-group label {
            width: 100px;
            font-weight: bold;
            margin-right: 10px;
        }
        .form-group input {
            flex: 1;
            padding: 10px;
            font-size: 15px;
            border: 1px solid #888;
            border-radius: 8px;
        }
        .login-button {
            width: 100%;
            border-radius: 10px;
            background-color: #99ccd8;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .login-button:hover {
            background-color: #5585a0;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 12px;
        }
        .success-message {
            color: green;
            text-align: center;
            margin-bottom: 12px;
        }
        .forgot-password {
            text-align: center;
            margin-top: 16px;
            font-size: 14px;
            color: #333;
        }
        .forgot-password strong {
            color: #007BFF;
        }
    </style>
</head>
<body>

<div class="login-header">Login to Skill Sphere</div>
<div class="login-subtext">Start your journey</div>

<div class="login-container">
<?php if (isset($_GET['error'])): ?>
    <div class="error-message">❌ Invalid email or password.</div>
<?php elseif (isset($_GET['logout'])): ?>
    <div class="success-message">You have successfully logged out.</div>
<?php endif; ?>


    <form action="authenticate.php" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>

        <button type="submit" class="login-button">Login</button>
    </form>

    <div class="forgot-password">
        Forgot your password? <a href="forgot_password.php"><strong>Reset here</strong></a><br>
        Or contact: <strong>peiyin5917@gmail.com</strong>
    </div>
</div>

</body>
</html>