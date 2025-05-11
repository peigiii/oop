<?php
// skilltest.php
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>SkillSphere - Skill Test</title>
  <style>

    /* Header、导航等区域可由 nav.php 提供，此处只定义主体页面布局 */
    main {
      display: flex;
      justify-content: center; /* 将内容居中 */
      padding: 30px; /* 增加间距 */
      gap: 30px; /* 增加间距 */
    }
    .left-column,
    .center-column {
      background-color: #fff;
      border-radius: 8px; /* 增加圆角 */
      box-shadow: 0 2px 5px rgba(0,0,0,0.2); /* 增加阴影 */
      padding: 30px; /* 增加内边距 */
      flex: 1;
    }
    .left-column {
      max-width: 300px; /* 增加宽度 */
    }
    .left-column h3 {
      margin-top: 0;
      margin-bottom: 20px; /* 增加间距 */
      font-size: 20px; /* 增加字体大小 */
      text-align: center;
    }
    .skill-list {
      display: grid;
      grid-template-columns: repeat(2, 1fr); /* 两列 */
      gap: 15px; /* 增加间距 */
    }
    .skill-list a {
      display: block;
      background-color: #657367; /* 指定颜色 */
      color: white;
      border: none;
      border-radius: 8px; /* 增加圆角 */
      padding: 12px 16px; /* 增加内边距 */
      cursor: pointer;
      text-align: center;
      text-decoration: none;
      font-size: 16px; /* 增加字体大小 */
    }
    .skill-list a:hover {
      background-color: #546B54; /* 深一点的颜色 */
    }
    .center-column {
      max-width: 500px; /* 增加宽度 */
    }
    .center-column h3 {
      margin-top: 0;
      font-size: 20px; /* 增加字体大小 */
      margin-bottom: 20px; /* 增加间距 */
      text-align: center;
    }


  </style>
</head>
<body>
<?php include '../templates/nav.php'; ?>

  <!-- 主体内容 -->
  <main>
    <!-- 左侧：技能分类列表 -->
    <div class="left-column">
      <h3>Skill Test Platform</h3>
      <div class="skill-list">
        <a href="index.php">Python</a>
        <a href="java_test.php">Java</a>
        <a href="sql_test.php">SQL</a>
        <a href="animation_test.php">Animation</a>
        <a href="editing_ps_test.php">Editing & PS</a>
        <a href="language_test.php">Language</a>
        <a href="cpp_test.php">C++</a>
        <a href="design_test.php">Design</a>
      </div>
    </div>
  </main>
</body>
</html>
