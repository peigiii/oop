<?php
include 'adminnav.php';
$questions_path = 'questions.json';

// ===== 图片上传处理逻辑开始 =====
require_once 'db.php';
$uploadDir = __DIR__ . "/uploads/images/";
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true);
}
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['image'])) {
    $file = $_FILES['image'];
    $imageName = preg_replace('/[^a-zA-Z0-9_\.\-]/', '_', basename($file['name']));
    $targetPath = $uploadDir . $imageName;
    if (move_uploaded_file($file['tmp_name'], $targetPath)) {
        $imagePath = "uploads/images/" . $imageName;
        $stmt = $pdo->prepare("INSERT INTO questions (question_text, question_image) VALUES (?, ?)");
        $stmt->execute([$_POST['question_text'], $imagePath]);
        $upload_message = "✅ Image uploaded and saved to database: " . htmlspecialchars($imageName);
    } else {
        $upload_message = "❌ Failed to upload image.";
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['image_upload'])) {
    $upload_message = "❌ No image uploaded.";
}
// ===== 图片上传处理逻辑结束 =====

$all = file_exists($questions_path) ? json_decode(file_get_contents($questions_path), true) : [];
$categories = [
    'python_level_1', 'python_level_2', 'python_level_3',
    'java_level_1', 'java_level_2', 'java_level_3',
    'sql_level_1', 'sql_level_2', 'sql_level_3',
    'cpp level 1', 'cpp level 2', 'cpp level 3',
    'animation_level_1', 'animation_level_2', 'animation_level_3',
    'editing_ps_level_1', 'editing_ps_level_2', 'editing_ps_level_3',
    'language_chinese_level_1', 'language_chinese_level_2', 'language_chinese_level_3',
    'language_japanese_level_1', 'language_japanese_level_2', 'language_japanese_level_3',
    'language_korean_level_1', 'language_korean_level_2', 'language_korean_level_3',
    'design_level_1', 'design_level_2', 'design_level_3'
];
$selected = $_GET['category'] ?? $categories[0];
$current = isset($all[$selected]) ? json_encode($all[$selected], JSON_PRETTY_PRINT) : '[]';

// 处理图片上传
function handle_upload($file_input_name) {
    if (isset($_FILES[$file_input_name]) && $_FILES[$file_input_name]['tmp_name']) {
        $upload_dir = __DIR__ . '/uploads/images/';
        if (!is_dir($upload_dir)) mkdir($upload_dir, 0777, true);
        $filename = time() . '_' . preg_replace('/[^a-zA-Z0-9_\.\-]/', '_', basename($_FILES[$file_input_name]['name']));
        $target = $upload_dir . $filename;
        if (move_uploaded_file($_FILES[$file_input_name]['tmp_name'], $target)) {
            return 'uploads/images/' . $filename;
        }
    }
    return '';
}

// 处理添加题目表单
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_question'])) {
    $category = $_POST['add_category'];
    $question = trim($_POST['question_text']);
    $question_image = handle_upload('question_image');
    $type = $_POST['question_type'];
    if ($type === 'mcq') {
        $option_a = trim($_POST['option_a']);
        $option_a_image = handle_upload('option_a_image');
        $option_b = trim($_POST['option_b']);
        $option_b_image = handle_upload('option_b_image');
        $option_c = trim($_POST['option_c']);
        $option_c_image = handle_upload('option_c_image');
        $option_d = trim($_POST['option_d']);
        $option_d_image = handle_upload('option_d_image');
        $correct_option = $_POST['correct_option'];
    } else {
        $option_a = $option_b = $option_c = $option_d = $option_a_image = $option_b_image = $option_c_image = $option_d_image = $correct_option = null;
    }

    // 保存到questions.json
    $newQ = [
        'type' => $type,
        'question' => $question,
        'question_image' => $question_image,
        'options' => $type === 'mcq' ? [
            ['text' => $option_a, 'image' => $option_a_image],
            ['text' => $option_b, 'image' => $option_b_image],
            ['text' => $option_c, 'image' => $option_c_image],
            ['text' => $option_d, 'image' => $option_d_image]
        ] : [],
        'answer' => $type === 'mcq' ? $correct_option : null
    ];
    if (!isset($all[$category])) $all[$category] = [];
    $all[$category][] = $newQ;
    file_put_contents($questions_path, json_encode($all, JSON_PRETTY_PRINT));
    $message = "New question added!";

    // 保存到数据库
    require_once 'db.php';
    $stmt = $pdo->prepare("INSERT INTO questions (skill_category, question_text, question_image, option_a, option_a_image, option_b, option_b_image, option_c, option_c_image, option_d, option_d_image, correct_option, type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([
        $category,
        $question,
        $question_image,
        $option_a,
        $option_a_image,
        $option_b,
        $option_b_image,
        $option_c,
        $option_c_image,
        $option_d,
        $option_d_image,
        $correct_option,
        $type
    ]);
    $selected = $category;
    $current = json_encode($all[$selected], JSON_PRETTY_PRINT);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['category'], $_POST['questions'])) {
    $category = $_POST['category'];
    $uploaded = $_POST['questions'];
    $parsed = json_decode($uploaded, true);
    if ($parsed && is_array($parsed)) {
        $all[$category] = $parsed;
        file_put_contents($questions_path, json_encode($all, JSON_PRETTY_PRINT));
        $current = json_encode($parsed, JSON_PRETTY_PRINT);
        $message = "Questions for '{$category}' saved successfully.";
    } else {
        $message = "Invalid JSON format.";
    }
}

// 批量导入功能
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['import_batch'])) {
    $category = $_POST['import_category'];
    $file = $_FILES['import_file']['tmp_name'];
    $ext = pathinfo($_FILES['import_file']['name'], PATHINFO_EXTENSION);
    require_once 'db.php';
    if ($ext === 'json') {
        $content = file_get_contents($file);
        $arr = json_decode($content, true);
        if (is_array($arr)) {
            foreach ($arr as $q) {
                $type = $q['type'] ?? 'mcq';
                $question = $q['question'] ?? '';
                $question_image = $q['question_image'] ?? null;
                $answer = $q['answer'] ?? null;
                $subjective_answer = $q['subjective_answer'] ?? null;
                $options = $q['options'] ?? [];
                $option_a = $options[0]['text'] ?? null;
                $option_a_image = $options[0]['image'] ?? null;
                $option_b = $options[1]['text'] ?? null;
                $option_b_image = $options[1]['image'] ?? null;
                $option_c = $options[2]['text'] ?? null;
                $option_c_image = $options[2]['image'] ?? null;
                $option_d = $options[3]['text'] ?? null;
                $option_d_image = $options[3]['image'] ?? null;
                $stmt = $pdo->prepare("INSERT INTO questions (skill_category, question_text, question_image, option_a, option_a_image, option_b, option_b_image, option_c, option_c_image, option_d, option_d_image, correct_option, type, subjective_answer) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                $stmt->execute([
                    $category,
                    $question,
                    $question_image,
                    $option_a,
                    $option_a_image,
                    $option_b,
                    $option_b_image,
                    $option_c,
                    $option_c_image,
                    $option_d,
                    $option_d_image,
                    $answer,
                    $type,
                    $subjective_answer
                ]);
            }
            $message = "批量导入成功！";
        } else {
            $message = "JSON格式错误";
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Question Bank</title>
    <meta charset="UTF-8" />
    <style>
        body { font-family: Arial; padding: 20px; }
        select, textarea { width: 100%; margin-top: 10px; padding: 10px; font-size: 1em; }
        textarea { height: 400px; }
        button { margin-top: 10px; padding: 10px 20px; }
        .msg { color: green; font-weight: bold; }
        .form-box { background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 5px #ccc; margin-bottom: 30px; }
        .option-row { margin-bottom: 5px; }
    </style>
</head>
<body>
    <h2>🧠 Manage Questions by Category</h2>
    <?php if (!empty($message)) echo "<p class='msg'>{$message}</p>"; ?>
    <?php if (!empty($upload_message)) echo "<p class='msg'>{$upload_message}</p>"; ?>
    <!-- 批量导入表单 -->
    <div class="form-box">
        <h3>批量导入题目</h3>
        <form method="post" enctype="multipart/form-data">
            <input type="file" name="import_file" accept=".json" required>
            <select name="import_category">
                <?php foreach ($categories as $cat) {
                echo "<option value='$cat'" . ($selected == $cat ? " selected" : "") . ">$cat</option>";
                } ?>
        </select>
            <button type="submit" name="import_batch">导入</button>
    </form>
    </div>
    <!-- 添加题目表单 -->
    <div class="form-box">
        <h3>➕ Add New Question</h3>
        <form id="addQuestionForm" method="post" enctype="multipart/form-data">
            <label>Category:</label>
            <select name="add_category" id="add_category">
                <optgroup label="Python">
                    <option value="python_level_1">Python Level 1</option>
                    <option value="python_level_2">Python Level 2</option>
                    <option value="python_level_3">Python Level 3</option>
                </optgroup>
                <optgroup label="Java">
                    <option value="java_level_1">Java Level 1</option>
                    <option value="java_level_2">Java Level 2</option>
                    <option value="java_level_3">Java Level 3</option>
                </optgroup>
                <optgroup label="SQL">
                    <option value="sql_level_1">SQL Level 1</option>
                    <option value="sql_level_2">SQL Level 2</option>
                    <option value="sql_level_3">SQL Level 3</option>
                </optgroup>
                <optgroup label="C++">
                    <option value="cpp level 1">C++ Level 1</option>
                    <option value="cpp level 2">C++ Level 2</option>
                    <option value="cpp level 3">C++ Level 3</option>
                </optgroup>
                <optgroup label="Animation">
                    <option value="animation_level_1">Animation Level 1</option>
                    <option value="animation_level_2">Animation Level 2</option>
                    <option value="animation_level_3">Animation Level 3</option>
                </optgroup>
                <optgroup label="Editing & PS">
                    <option value="editing_ps_level_1">Editing & PS Level 1</option>
                    <option value="editing_ps_level_2">Editing & PS Level 2</option>
                    <option value="editing_ps_level_3">Editing & PS Level 3</option>
                </optgroup>
                <optgroup label="Language - 中文">
                    <option value="language_chinese_level_1">中文 Level 1</option>
                    <option value="language_chinese_level_2">中文 Level 2</option>
                    <option value="language_chinese_level_3">中文 Level 3</option>
                </optgroup>
                <optgroup label="Language - 日本語">
                    <option value="language_japanese_level_1">日本語 Level 1</option>
                    <option value="language_japanese_level_2">日本語 Level 2</option>
                    <option value="language_japanese_level_3">日本語 Level 3</option>
                </optgroup>
                <optgroup label="Language - 한국어">
                    <option value="language_korean_level_1">한국어 Level 1</option>
                    <option value="language_korean_level_2">한국어 Level 2</option>
                    <option value="language_korean_level_3">한국어 Level 3</option>
                </optgroup>
                <optgroup label="Design">
                    <option value="design_level_1">Design Level 1</option>
                    <option value="design_level_2">Design Level 2</option>
                    <option value="design_level_3">Design Level 3</option>
                </optgroup>
            </select><br>
            <label>题型：</label>
            <select name="question_type" id="question_type" onchange="toggleOptionFields()">
                <option value="mcq">选择题</option>
                <option value="subjective">主观题</option>
            </select><br>
            <label>Question Text:</label><br>
            <textarea name="question_text" required></textarea><br>
            <label>Question Image (optional):</label>
            <input type="file" name="question_image" accept="image/png, image/jpeg" onchange="previewImage(this, 'preview_question_image')">
            <img id="preview_question_image" style="max-width:100px;display:none;"><br>
            <div id="optionFields">
                <label>Option A:</label>
                <input type="text" name="option_a">
                <input type="file" name="option_a_image" accept="image/png, image/jpeg" onchange="previewImage(this, 'preview_option_a_image')">
                <img id="preview_option_a_image" style="max-width:100px;display:none;"><br>
                <label>Option B:</label>
                <input type="text" name="option_b">
                <input type="file" name="option_b_image" accept="image/png, image/jpeg" onchange="previewImage(this, 'preview_option_b_image')">
                <img id="preview_option_b_image" style="max-width:100px;display:none;"><br>
                <label>Option C:</label>
                <input type="text" name="option_c">
                <input type="file" name="option_c_image" accept="image/png, image/jpeg" onchange="previewImage(this, 'preview_option_c_image')">
                <img id="preview_option_c_image" style="max-width:100px;display:none;"><br>
                <label>Option D:</label>
                <input type="text" name="option_d">
                <input type="file" name="option_d_image" accept="image/png, image/jpeg" onchange="previewImage(this, 'preview_option_d_image')">
                <img id="preview_option_d_image" style="max-width:100px;display:none;"><br>
                <label>Correct Option:</label>
                <select name="correct_option">
                    <option value="a">A</option>
                    <option value="b">B</option>
                    <option value="c">C</option>
                    <option value="d">D</option>
                </select><br>
            </div>
            <div id="subjectiveAnswerBox" style="display:none;">
                <label>主观题参考答案（可选）:</label><br>
                <textarea name="subjective_answer" rows="3" placeholder="可填写主观题标准答案"></textarea><br>
            </div>
            <input type="hidden" name="add_question" value="1">
            <button type="submit">Add Question</button>
    </form>
    </div>
    <script>
    function toggleOptionFields() {
        const type = document.getElementById('question_type').value;
        document.getElementById('optionFields').style.display = (type === 'mcq') ? 'block' : 'none';
        document.getElementById('subjectiveAnswerBox').style.display = (type === 'subjective') ? 'block' : 'none';
    }
    window.onload = toggleOptionFields;
    function previewImage(input, imgId) {
        const file = input.files[0];
        const img = document.getElementById(imgId);
        if (file) {
            img.src = URL.createObjectURL(file);
            img.style.display = 'inline-block';
        } else {
            img.src = '';
            img.style.display = 'none';
        }
    }
    </script>
</body>
</html>
