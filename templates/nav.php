<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillSphere</title>
    <link rel="stylesheet" href="style.css">
    <style>
    body { font-family: 'Segoe UI', Arial, sans-serif; padding: 20px;  }
    h2 { text-align: center; margin-bottom: 30px; color: #1a5ca4; font-size: 2.2em; letter-spacing: 1px; }
    </style>
</head>

<style>
body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
        }

<style>
  .sidebar-overlay {
    position: fixed; left: 0; top: 0; width: 100vw; height: 100vh; background: rgba(0,0,0,0.18); z-index: 1000; display: none; }
  .sidebar {
    position: fixed; left: 0; top: 0; width: 260px; height: 100vh; background: #fff; box-shadow: 2px 0 16px rgba(0,0,0,0.08); z-index: 1001; padding: 32px 18px 18px 18px; display: flex; flex-direction: column; gap: 18px; transform: translateX(-100%); transition: transform 0.25s; }
  .sidebar.open { transform: translateX(0); }
  .sidebar .close-btn { align-self: flex-end; background: none; border: none; font-size: 1.6em; cursor: pointer; color: #888; margin-bottom: 10px; }
  .sidebar a { display: block; padding: 10px 0; color: #222; font-size: 1.1em; text-decoration: none; border-radius: 6px; transition: background 0.18s; }
  .sidebar a:hover { background: #f3f4f6; color: #6366f1; }
  .sidebar-title { font-size: 1.2em; font-weight: bold; margin-bottom: 10px; }
  .hamburger { font-size: 2em; cursor: pointer; background: none; border: none; margin-right: 18px; }
</style>

  <!-- Top Row: Logo + Search + Emoji --><!-- Top Row: ... -->
  <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 20px; padding-top: 20px;">
    <button class="hamburger" id="sidebarOpenBtn" title="Menu">&#9776;</button>

    <!-- Logo + Title -->
    <div style="display: flex; align-items: center;">
      <img src="/oop/static/final_logo.png" alt="SkillSphere Logo"
           style="width: 70px; height: 70px;margin-right: 10px;">
      <span style="font-weight: bold; font-size: 28px;">SkillSphere</span>
    </div>

    <!-- Search Bar -->
    <div style="flex-grow: 1; display: flex; justify-content: center; align-items: center;">
      <form id="navSearchForm" action="/oop/templates/search.php" method="get" style="width: 100%; display: flex; align-items: center;">
        <input id="navSearchInput" name="q" type="text" placeholder="What skills you want to learn?"
               style="width: 70%; max-width: 600px; padding: 10px 16px; border: 2px solid black;
                      border-radius: 12px; font-size: 16px; outline: none;">
        <span style="font-size: 24px; margin-left: -40px; cursor: pointer;"
              onclick="document.getElementById('navSearchForm').submit();">🔍</span>
      </form>
    </div>

    <!-- Emoji Menu -->
    <div style="display: flex; gap: 25px; font-size: 28px;">
      <span onclick="window.location.href='/oop/templates/notification.php'" style="cursor:pointer;">🔔</span>
      <span onclick="window.location.href='/oop/templates/mail.php'" style="cursor:pointer;">📧</span>
      <span onclick="window.location.href='/oop/templates/my_favorites.php'" style="cursor:pointer;">⭐</span>
      <span onclick="window.location.href='/oop/templates/index.php'" style="cursor:pointer;">🏠</span>
      <span onclick="window.location.href='/oop/templates/profile.php'" style="cursor:pointer;">👤</span>
    </div>

  </div>

  <!-- Bottom Row: Button Group -->
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

    <button onclick="window.location.href='/oop/templates/test.php'"
            style=" margin: 0; padding: 12px 20px; background-color: #9cd0dc;
                   color: black; border: none; border-radius: 30px;
                   font-size: 16px; font-weight: 600; cursor: pointer;">
      Skills Test Platform
    </button>

   
    <button onclick="window.location.href='/oop/templates/video.php'"
            style=" margin: 0; padding: 12px 20px; background-color: #9cd0dc;
                   color: black; border: none; border-radius: 30px;
                   font-size: 16px; font-weight: 600; cursor: pointer;">
      Upload Video
    </button>

    <button onclick="window.location.href='/oop/templates/resume.html'"
            style="margin: 0; padding: 12px 20px; background-color: #9cd0dc;
                   color: black; border: none; border-radius: 30px;
                   font-size: 16px; font-weight: 600; cursor: pointer;">
      AI Resume Optimizer
    </button>


  </div>

</div>

<div class="sidebar-overlay" id="sidebarOverlay"></div>
<div class="sidebar" id="sidebarMenu">
  <button class="close-btn" id="sidebarCloseBtn">&times;</button>
  <div class="sidebar-title">Menu</div>
  <a href="/oop/templates/watch_history.php">🕒 Watch History</a>
  <a href="/oop/templates/my_subjective_reviews.php">📝 Questions Review</a>

</div>

<script>
document.getElementById('sidebarOpenBtn').onclick = function() {
  document.getElementById('sidebarOverlay').style.display = 'block';
  document.getElementById('sidebarMenu').classList.add('open');
};
document.getElementById('sidebarCloseBtn').onclick = function() {
  document.getElementById('sidebarOverlay').style.display = 'none';
  document.getElementById('sidebarMenu').classList.remove('open');
};
document.getElementById('sidebarOverlay').onclick = function() {
  document.getElementById('sidebarOverlay').style.display = 'none';
  document.getElementById('sidebarMenu').classList.remove('open');
};
</script>
