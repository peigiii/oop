<?php
include 'adminnav.php';
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Skill Test Submissions</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f0f0f0; }
        h2 { margin-bottom: 20px; }
        .btn { padding: 10px 20px; background: #0066cc; color: white; border: none; border-radius: 5px; cursor: pointer; }
        .btn:hover { background: #004999; }
        table { width: 100%; border-collapse: collapse; background: white; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: left; }
        th { background: #f8f8f8; }
        pre { white-space: pre-wrap; word-break: break-word; background: #f3f3f3; padding: 10px; border-radius: 5px; }
    </style>
</head>
<body>
    <h2>Skill Test Submissions</h2>
    <form method="post">
        <button class="btn" name="grade_now">⏳ Auto Grade and Notify</button>
    </form>
    <br>
    <?php
    if (isset($_POST['grade_now'])) {
        include 'grade_and_notify.php';
    }

    $files = glob("submissions/*.json");
    if (empty($files)) {
        echo "<p>No submissions yet.</p>";
    } else {
        echo "<table><tr><th>#</th><th>User</th><th>Answers</th></tr>";
        foreach ($files as $i => $file) {
            $data = json_decode(file_get_contents($file), true);
            $email = htmlspecialchars($data['email'] ?? 'Unknown');
            echo "<tr><td>" . ($i + 1) . "</td><td>$email</td><td>";
            foreach ($data['answers'] as $q) {
                echo "<div><b>Q:</b> " . htmlspecialchars($q['question']) . "<br><b>A:</b> <pre>" . htmlspecialchars($q['answer']) . "</pre></div><hr>";
            }
            echo "</td></tr>";
        }
        echo "</table>";
    }
    ?>
</body>
</html>
