<?php
header('Content-Type: application/json');
require __DIR__ . '/../../db.php';

$level = preg_replace('/[^a-zA-Z0-9_]/', '', $_GET['level'] ?? '');

if ($level) {
    try {
        $stmt = $pdo->prepare("SELECT * FROM questions WHERE skill_category = ?");
        $stmt->execute([$level]);
        $questions = [];

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // 处理图片路径
            $imagePath = null;
            if (!empty($row['question_image'])) {
                $imagePath = '/oop/templates/' . ltrim($row['question_image'], '/');
                $fullPath = __DIR__ . '/../../' . ltrim($row['question_image'], '/');
                if (!file_exists($fullPath)) {
                    error_log("Image not found at: " . $fullPath);
                    $imagePath = null;
                }
            }
            $type = isset($row['TYPE']) ? strtolower($row['TYPE']) : 'mcq';
            $q = [
                "question" => $row['question_text'],
                "image" => $imagePath,
                "type" => $type,
            ];
            if ($type === 'mcq') {
                $q["options"] = [
                    [
                        "text" => isset($row['option_a']) ? $row['option_a'] : '',
                        "image" => !empty($row['option_a_image']) ? '/oop/templates/' . ltrim($row['option_a_image'], '/') : null
                    ],
                    [
                        "text" => isset($row['option_b']) ? $row['option_b'] : '',
                        "image" => !empty($row['option_b_image']) ? '/oop/templates/' . ltrim($row['option_b_image'], '/') : null
                    ],
                    [
                        "text" => isset($row['option_c']) ? $row['option_c'] : '',
                        "image" => !empty($row['option_c_image']) ? '/oop/templates/' . ltrim($row['option_c_image'], '/') : null
                    ],
                    [
                        "text" => isset($row['option_d']) ? $row['option_d'] : '',
                        "image" => !empty($row['option_d_image']) ? '/oop/templates/' . ltrim($row['option_d_image'], '/') : null
                    ]
                ];
                $q["answer"] = $row['correct_option'];
            } elseif ($type === 'subjective') {
                $q["answer"] = $row['subjective_answer'];
            }
            $questions[] = $q;
        }

        echo json_encode($questions);
    } catch (Exception $e) {
        echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
}
?>
