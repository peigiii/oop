<?php
// Backend: submit.php
header('Content-Type: application/json');

// Check POST method
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data || !isset($data['answers']) || !is_array($data['answers'])) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid submission']);
        exit;
    }

    // Generate unique file name with timestamp
    $filename = 'submissions/submission_' . date('Ymd_His') . '.json';
    file_put_contents($filename, json_encode($data, JSON_PRETTY_PRINT));

    echo json_encode(['status' => 'success', 'message' => 'Submission saved']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Only POST requests allowed']);
}
?>
