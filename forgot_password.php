<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f3f3f3;
        }
        .container {
            max-width: 400px;
            margin: 80px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 14px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
            text-align: center;
        }
        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border-radius: 10px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #007BFF;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>🔐 Forgot Your Password?</h2>
    <form action="send_reset_link.php" method="POST">
        <input type="email" name="email" placeholder="Enter your email" required>
        <br>
        <button type="submit">Send Reset Link</button>
    </form>
</div>
</body>
</html>
