<?php
// 数据库服务器信息
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "skillsphere_db";

try {
    // 1. 连接 MySQL 服务器（不指定具体数据库）
    $pdo = new PDO("mysql:host=$servername", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // 2. 创建数据库（如果不存在）
    $sql = "CREATE DATABASE IF NOT EXISTS $dbname CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";
    $pdo->exec($sql);
    echo "数据库创建成功（或已存在）<br>";

    // 3. 连接到新建的数据库
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // ------------------------------
    // 更新后的 users 表：新增电话、国家、省、市、种族字段
    $sql = "CREATE TABLE IF NOT EXISTS users (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL,
        profile_picture VARCHAR(255) DEFAULT NULL,
        phone VARCHAR(20) DEFAULT NULL,
        country VARCHAR(50) DEFAULT NULL,
        state VARCHAR(50) DEFAULT NULL,
        city VARCHAR(50) DEFAULT NULL,
        race VARCHAR(50) DEFAULT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'users' 更新/创建成功<br>";

    // ------------------------------
    // 创建 test_results 表：存储技能测试记录
    $sql = "CREATE TABLE IF NOT EXISTS test_results (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT(11) UNSIGNED NOT NULL,
        test_type VARCHAR(50) NOT NULL,  -- 如 Python, Java, SQL, Animation, Editing, C++ 等
        score INT(11) NOT NULL,
        taken_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'test_results' 创建成功<br>";

    // ------------------------------
    // 创建 videos 表：存储上传视频的信息
    $sql = "CREATE TABLE IF NOT EXISTS videos (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT(11) UNSIGNED NOT NULL,
        title VARCHAR(255) NOT NULL,
        description TEXT,
        video_url VARCHAR(255) NOT NULL,
        uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'videos' 创建成功<br>";

    // ------------------------------
    // 创建 consultations 表：存储咨询预约信息
    $sql = "CREATE TABLE IF NOT EXISTS consultations (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT(11) UNSIGNED NOT NULL,           -- 预约者（用户）ID
        professional_id INT(11) UNSIGNED NOT NULL,     -- 被预约的专业人士（同样存储在 users 表中）
        booking_date DATE NOT NULL,
        time_slot VARCHAR(20) NOT NULL,                -- 如 '8-9am'
        status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
        booked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
        FOREIGN KEY (professional_id) REFERENCES users(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'consultations' 创建成功<br>";

    // ------------------------------
    // 创建 favorites 表：存储用户收藏的内容
    $sql = "CREATE TABLE IF NOT EXISTS favorites (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT(11) UNSIGNED NOT NULL,
        content_type ENUM('video', 'post', 'other') NOT NULL,  -- 内容类型
        content_id INT(11) NOT NULL,                           -- 对应内容的 ID
        added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'favorites' 创建成功<br>";

    // ------------------------------
    // 创建 resume_summaries 表：存储 AI 生成的简历摘要
    $sql = "CREATE TABLE IF NOT EXISTS resume_summaries (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT(11) UNSIGNED NOT NULL,
        summary TEXT NOT NULL,
        generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'resume_summaries' 创建成功<br>";

    // ------------------------------
    // 新增：创建 messages 表：存储用户之间的私信消息
    $sql = "CREATE TABLE IF NOT EXISTS messages (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        sender_id INT(11) UNSIGNED NOT NULL,
        receiver_id INT(11) UNSIGNED NOT NULL,
        subject VARCHAR(255) NOT NULL,
        message TEXT NOT NULL,
        sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        read_status ENUM('unread', 'read') DEFAULT 'unread',
        FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
        FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'messages' 创建成功<br>";

    // ------------------------------
    // 新增：创建 notifications 表：存储系统通知
    $sql = "CREATE TABLE IF NOT EXISTS notifications (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT(11) UNSIGNED NOT NULL,
        notification_text VARCHAR(255) NOT NULL,
        type VARCHAR(50) NOT NULL, -- 如 'like', 'follow', 'comment' 等
        status ENUM('unread', 'read') DEFAULT 'unread',
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'notifications' 创建成功<br>";

    // ------------------------------
    // 新增：创建 optimizer_reviews 表：存储 AI 简历优化中的审阅建议
    $sql = "CREATE TABLE IF NOT EXISTS optimizer_reviews (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT(11) UNSIGNED NOT NULL,
        review_type ENUM('Correctness', 'Clarity', 'Engagement', 'Delivery') NOT NULL,
        content TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'optimizer_reviews' 创建成功<br>";

    // ------------------------------
    // 新增：创建 resumes 表：存储用户生成的完整简历数据（例如以 JSON 格式保存）
    $sql = "CREATE TABLE IF NOT EXISTS resumes (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT(11) UNSIGNED NOT NULL,
        resume_data TEXT NOT NULL,  -- 可以存储 JSON 格式的完整简历信息
        generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $pdo->exec($sql);
    echo "数据表 'resumes' 创建成功<br>";

} catch(PDOException $e) {
    echo "操作失败: " . $e->getMessage();
}

// 关闭连接
$pdo = null;
?>
