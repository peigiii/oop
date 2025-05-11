<?php
session_start();
require 'db.php';
ob_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username         = trim($_POST["username"]);
    $email            = trim($_POST["email"]);
    $password         = trim($_POST["password"]);
    $confirm_password = trim($_POST["confirm_password"]);

    // 邮箱格式检查
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $_SESSION['error'] = "Invalid email format.";
        header("Location: signup.php");
        exit;
    }

    // 密码一致性检查
    if ($password !== $confirm_password) {
        $_SESSION['error'] = "Passwords do not match.";
        header("Location: signup.php");
        exit;
    }

    // 密码强度
    if (strlen($password) < 8) {
        $_SESSION['error'] = "Password must be at least 8 characters.";
        header("Location: signup.php");
        exit;
    }

    $password_hash = password_hash($password, PASSWORD_DEFAULT);

    try {
        // 邮箱唯一性检查
        $stmt = $pdo->prepare("SELECT id FROM users WHERE email = :email");
        $stmt->execute([":email" => $email]);
        if ($stmt->rowCount() > 0) {
            $_SESSION['error'] = "Email already registered.";
            header("Location: signup.php");
            exit;
        }

        // 插入用户（不包含 verify_token）
        $stmt = $pdo->prepare("INSERT INTO users (username, email, password) 
                               VALUES (:username, :email, :password)");
        $stmt->execute([
            ":username" => $username,
            ":email"    => $email,
            ":password" => $password_hash
        ]);

        $_SESSION['success'] = "Registration successful. Please login.";
        header("Location: login.php");
        exit;

    } catch (PDOException $e) {
        $_SESSION['error'] = "Registration failed: " . $e->getMessage();
        header("Location: signup.php");
        exit;
    }
}
ob_end_flush();
?>
