<?php
date_default_timezone_set('Asia/Kuala_Lumpur'); // ✅ 1. 时区设定

require 'db.php';
require 'phpmailer/PHPMailer.php';
require 'phpmailer/SMTP.php';
require 'phpmailer/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = trim($_POST['email']);

    // 查找用户
    $stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $token = bin2hex(random_bytes(32));
        $expires = date('Y-m-d H:i:s', strtotime('+30 minutes')); // ✅ 2. 设置30分钟

        $stmt = $pdo->prepare("UPDATE users SET reset_token = ?, reset_token_expires = ? WHERE id = ?");
        $stmt->execute([$token, $expires, $user['id']]);

        $reset_link = "http://localhost/oop/templates/reset_password.php?token=" . $token;

        // 邮件配置
        $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host       = 'smtp.gmail.com';
            $mail->SMTPAuth   = true;
            $mail->Username   = 'peiyin5917@gmail.com';
            $mail->Password   = 'fempmnxwjzouykal'; // Gmail 应用密码
            $mail->SMTPSecure = 'tls';
            $mail->Port       = 587;

            $mail->setFrom('peiyin5917@gmail.com', 'SkillSphere');
            $mail->addAddress($email);
            $mail->Subject = '🔐 Reset Your SkillSphere Password';
            $mail->Body    = "Click to reset your password:\n\n$reset_link\n\n⚠ Valid for 30 minutes.";

            $mail->send();
            echo "✅ Reset link sent to your email.";
        } catch (Exception $e) {
            echo "❌ Failed to send email: {$mail->ErrorInfo}";
        }
    } else {
        echo "✅ If the email exists, a reset link has been sent.";
    }
}
?>
