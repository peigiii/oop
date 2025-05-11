<!DOCTYPE html>
<html>
<head>
    <title>Upload Skill Test Question</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { max-width: 500px; }
        textarea { width: 100%; }
        label { font-weight: bold; }
    </style>
</head>
<body>
    <h2>Upload Skill Test Question</h2>
    <form method="post" action="">
        <label for="test_level_id">Test Level ID:</label><br>
        <input type="number" name="test_level_id" id="test_level_id" required><br><br>
        
        <label for="question_text">Question:</label><br>
        <textarea name="question_text" id="question_text" rows="4" required></textarea><br><br>
        
        <input type="submit" value="Upload Question">
    </form>
</body>
</html>