<?php
// 连接数据库的函数
function connectToDatabase() {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "skillsphere_db";
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    return $conn;
}

// 上传题目的函数
function uploadQuestion($testLevelId, $questionText) {
    $conn = connectToDatabase();
    $stmt = $conn->prepare("INSERT INTO questions (test_level_id, question_text) VALUES (?, ?)");
    $stmt->bind_param("is", $testLevelId, $questionText);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
