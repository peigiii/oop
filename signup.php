<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SkillSphere - Sign Up</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<?php include 'nav.php'; ?>

  <!-- 注册表单区域 -->
  <section class="signup">
    <h3>Welcome to SkillSphere</h3>
    <h2>Create your account</h2>
    <div class="form-container">
      <?php
      if (isset($_SESSION['error'])) {
          echo '<div class="error-message" style="color:red; text-align:center;">' . $_SESSION['error'] . '</div>';
          unset($_SESSION['error']);
      }
      ?>
      <!-- 表单数据将提交到 register.php -->
      <form action="register.php" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <label for="confirm_password">Confirm password:</label>
        <input type="password" id="confirm_password" name="confirm_password" required><br><br>
        
        <input type="submit" class="signup-btn" value="Sign Up">
      </form>
    </div>
    <p>Already have an account? <a href="login.php">Log in</a></p>
  </section>
</body>
</html>
<style>
  .form-container {
    border: 2px solid #ccc;
    padding: 12px;
    border-radius: 20px;
    max-width: 400px;
    margin: 0 auto;
    background-color: #d7e6dd;
  }
</style>
<style>
  .signup-btn {
    border-radius: 10px;
    background-color: #99ccd8;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
  }

  .signup-btn:hover {
    background-color: darkred;
  }
</style>
