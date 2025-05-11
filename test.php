<?php
// test.php
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>SkillSphere - Skill Test</title>
  <style>
    main {
      display: flex;
      justify-content: center;
      padding: 30px;
      gap: 30px;
    }
    .left-column,
    .center-column {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.2);
      padding: 30px;
      flex: 1;
    }
    .left-column {
      max-width: 300px;
    }
    .left-column h3 {
      margin-top: 0;
      margin-bottom: 20px;
      font-size: 20px;
      text-align: center;
    }
    .skill-list {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 15px;
    }
    .skill-list a {
      display: block;
      background-color: #657367;
      color: white;
      border: none;
      border-radius: 8px;
      padding: 12px 16px;
      cursor: pointer;
      text-align: center;
      text-decoration: none;
      font-size: 16px;
    }
    .skill-list a:hover {
      background-color: #546B54;
    }
    .center-column {
      max-width: 500px;
    }
    .center-column h3 {
      margin-top: 0;
      font-size: 20px;
      margin-bottom: 20px;
      text-align: center;
    }
  </style>
</head>
<body>

<?php include 'nav.php'; ?>

<!-- 主体内容 -->
<main>
  <div class="left-column">
    <h3>Skill Test Platform</h3>
    <div class="skill-list">
      <a href="test/python/index.php">Python</a>
      <a href="test/java/index.php">Java</a>
      <a href="test/sql/index.php">SQL</a>
      <a href="test/animation/index.php">Animation</a>
      <a href="test/editps/index.php">Editing & PS</a>
      <a href="test/language/index.php">Language</a>
      <a href="test/cpp/index.php">C++</a>
      <a href="test/design/index.php">Design</a>
    </div>
  </div>
</main>

</body>
</html>
