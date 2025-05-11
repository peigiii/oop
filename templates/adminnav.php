<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SkillSphere Admin</title>
  <link rel="stylesheet" href="style.css">
</head>

<!-- 顶部区域 -->
<div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 20px; padding-top: 20px;">

  <!-- Logo + Title -->
  <div style="display: flex; align-items: center;">
    <img src="../static/final_logo.png" alt="SkillSphere Logo"
         style="width: 70px; height: 70px; margin-left: 10px;margin-right: 10px;">
    <span style="font-weight: bold; font-size: 28px;">SkillSphere Admin</span>
  </div>

  <!-- Search Bar -->
  <div style="flex-grow: 1; display: flex; justify-content: center; align-items: center;">
    <input type="text" placeholder="Search admin tools..."
           style="width: 70%; max-width: 600px; padding: 10px 16px; border: 2px solid black;
                  border-radius: 12px; font-size: 16px; outline: none;">
    <span style="font-size: 24px; margin-left: -40px; cursor: pointer;"
          onclick="window.location.href='admin_dashboard.php'">🔍</span>
  </div>

  <!-- Emoji Menu -->
  <div style="display: flex; gap: 25px; font-size: 28px;">
    <span onclick="window.location.href='manage_announcements.php'" style="cursor:pointer;">📢</span>
    <span onclick="window.location.href='mail.php'" style="cursor:pointer;">📧</span>
    <span onclick="window.location.href='admin_dashboard.php'" style="cursor:pointer;">🏠</span>
    <span onclick="window.location.href='logout.php'" style="cursor:pointer;">🚪</span>
  </div>
</div>

<!-- 管理员专属按钮导航栏 -->
<div style="
  display: flex;
  justify-content: space-between;
  gap: 20px;
  margin-top: 20px;
  padding: 8px 16px;
  border: 2px solid black;
  border-radius: 12px;
  background-color: white;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
">

  <button onclick="window.location.href='manage_users.php'"
          style="margin: 0; padding: 12px 20px; background-color: #f9b74a;
                 color: black; border: none; border-radius: 30px;
                 font-size: 16px; font-weight: 600; cursor: pointer;">
    👥 Manage Users
  </button>

  <button onclick="window.location.href='manage_videos.php'"
          style="margin: 0; padding: 12px 20px; background-color: #f9b74a;
                 color: black; border: none; border-radius: 30px;
                 font-size: 16px; font-weight: 600; cursor: pointer;">
    🎞️ Manage Videos
  </button>

  <button onclick="window.location.href='manage_announcements.php'"
          style="margin: 0; padding: 12px 20px; background-color: #f9b74a;
                 color: black; border: none; border-radius: 30px;
                 font-size: 16px; font-weight: 600; cursor: pointer;">
    📢 Post Announcements
  </button>

  <button onclick="window.location.href='manage_questions.php'"
          style="margin: 0; padding: 12px 20px; background-color: #f9b74a;
                 color: black; border: none; border-radius: 30px;
                 font-size: 16px; font-weight: 600; cursor: pointer;">
    📝 Manage Questions
  </button>

  <button onclick="window.location.href='review_subjective.php'"
          style="margin: 0; padding: 12px 20px; background-color: #f9b74a;
                 color: black; border: none; border-radius: 30px;
                 font-size: 16px; font-weight: 600; cursor: pointer;">
    📝 Review Subjective Answers
  </button>

</div>
