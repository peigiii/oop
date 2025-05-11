<?php
// Dynamic submit.php: scores by level and sends notification
header('Content-Type: application/json');
session_start();
require_once __DIR__ . '/../../db.php';

// 检查请求方法是否为 POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => "error", "message" => "Only POST allowed"]);
    exit;
}

// 读取输入数据
$data = json_decode(file_get_contents("php://input"), true);
if (!$data || !isset($data['answers']) || !is_array($data['answers']) || !isset($data['level'])) {
    echo json_encode(["status" => "error", "message" => "Invalid submission format"]);
    exit;
}

// 提取数据并进行校验
$level = preg_replace('/[^a-zA-Z0-9_]/', '', $data['level']);
$answers = $data['answers'];
$score = 0;
$total = 0;

// 定义提交目录
$submissionDir = __DIR__ . "/submissions";

// 检查目录是否存在，不存在则创建
if (!is_dir($submissionDir)) {
    if (!mkdir($submissionDir, 0777, true)) {
        echo json_encode(["status" => "error", "message" => "Failed to create submissions directory."]);
        exit;
    }
}

// 生成文件名
$timestamp = date("Ymd_His");
$filename = "$submissionDir/{$level}_submission_$timestamp.json";

// 查询数据库获取所有该level下的mcq题的正确答案
$stmt = $pdo->prepare("SELECT question_text, correct_option FROM questions WHERE skill_category = ? AND TYPE = 'mcq'");
$stmt->execute([$level]);
$dbQuestions = $stmt->fetchAll(PDO::FETCH_ASSOC);

// 构建题目到正确答案的映射
$answerMap = [];
foreach ($dbQuestions as $q) {
    $answerMap[trim($q['question_text'])] = strtolower(trim($q['correct_option']));
}
$total = count($answerMap);

// 评分
foreach ($answers as $ans) {
    $qText = trim($ans['question']);
    $userAns = strtolower(trim($ans['answer'] ?? ''));
    if (isset($answerMap[$qText]) && $userAns === $answerMap[$qText]) {
        $score++;
    }
}

// 保存用户提交
if (!file_put_contents($filename, json_encode($data, JSON_PRETTY_PRINT))) {
    echo json_encode(["status" => "error", "message" => "Failed to save submission file."]);
    exit;
}

// 通知逻辑
if ($total > 0) {
    $message = "✅ You scored $score out of $total.";
} else {
    $score = null;
    $message = "📝 Thank you for submitting your code. Your result will be reviewed by an instructor.";
}

// 写入通知表
if (isset($_SESSION['user_id'])) {
    try {
        $stmt = $pdo->prepare("INSERT INTO notifications (user_id, title, message, type) VALUES (?, ?, ?, ?)");
        $stmt->execute([
            $_SESSION['user_id'],
            "Quiz Result - $level",
            $message,
            'quiz'
        ]);
    } catch (PDOException $e) {
        error_log("❌ Notification insert failed: " . $e->getMessage());
    }
}

// 处理主观题提交
foreach ($answers as $ans) {
    if (isset($ans['question']) && isset($ans['answer']) && trim($ans['answer']) !== '') {
        // 假设主观题没有在$answerMap里
        if (!isset($answerMap[trim($ans['question'])])) {
            $stmt = $pdo->prepare("INSERT INTO subjective_submissions (user_id, skill_category, question_text, user_answer) VALUES (?, ?, ?, ?)");
            $stmt->execute([
                $_SESSION['user_id'] ?? null,
                $level,
                $ans['question'],
                $ans['answer']
            ]);
        }
    }
}

// 返回成功响应
echo json_encode([
    'status' => 'success',
    'score' => $score,
    'total' => $total,
    'level' => $level,
    'file' => $filename,
    'message' => $message
]);
?>