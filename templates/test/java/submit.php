<?php
// Dynamic submit.php: scores by level and sends notification
header('Content-Type: application/json');
session_start();
require_once __DIR__ . '/../../db.php';

// Answer keys by level
$answerKeys = [
    'java level 1' => ['b','c','b','c','b','b','d','a','a','a','a','b','b','a','a','c','b','c','c','a'],
    'java level 2' => ['b','b','a','b','b','d','b','a','c','b','a','a','b','b','b','b','b','a','a','b'],
    'java level 3' => []  // subjective
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data || !isset($data['answers']) || !is_array($data['answers']) || !isset($data['level'])) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid submission format']);
        exit;
    }

    $level = $data['level'];
    $answers = $data['answers'];
    $correctAnswers = $answerKeys[$level] ?? [];
    $score = 0;
    $total = count($correctAnswers);

    // Save JSON backup
    $filename = 'submissions/' . $level . '_submission_' . date('Ymd_His') . '.json';
    file_put_contents($filename, json_encode($data, JSON_PRETTY_PRINT));

    if ($total > 0) {
        foreach ($answers as $i => $ans) {
            $user_ans = strtolower(trim($ans['answer'] ?? ''));
            if (isset($correctAnswers[$i]) && $user_ans === $correctAnswers[$i]) {
                $score++;
            }
        }
        $message = "✅ You scored $score out of $total.";
    } else {
        $score = null;
        $message = "📝 Thank you for submitting your code. Your result will be reviewed by an instructor.";
    }

    // Save notification
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

    echo json_encode(['status' => 'success', 'score' => $score, 'total' => $total, 'level' => $level]);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Only POST allowed']);
}
?>