<?php
// admin.php - Simple Admin Dashboard to View Submissions
$files = glob("submissions/*.json");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Submissions</title>
    <style>
        body { font-family: Arial; background: #f5f5f5; padding: 20px; }
        h2 { color: #333; }
        .submission { background: #fff; margin: 20px 0; padding: 15px; border-radius: 8px; box-shadow: 0 0 6px #ccc; }
        .question { font-weight: bold; margin-top: 10px; }
        .answer { background: #f0f0f0; padding: 10px; border-radius: 4px; margin-bottom: 10px; }
        .file-label { font-size: 0.9em; color: #777; }
    </style>
</head>
<body>
    <h2>All Quiz Submissions</h2>
    <?php
    if (empty($files)) {
        echo "<p>No submissions found.</p>";
    } else {
        foreach ($files as $file) {
            $content = json_decode(file_get_contents($file), true);
            echo "<div class='submission'>";
            echo "<div class='file-label'>File: " . basename($file) . "</div>";
            if (isset($content['answers'])) {
                foreach ($content['answers'] as $i => $item) {
                    echo "<div class='question'>Q" . ($i + 1) . ": " . htmlspecialchars($item['question']) . "</div>";
                    echo "<div class='answer'>" . nl2br(htmlspecialchars($item['answer'])) . "</div>";
                }
            } else {
                echo "<p>Invalid format in file.</p>";
            }
            echo "</div>";
        }
    }
    ?>
</body>
</html>
