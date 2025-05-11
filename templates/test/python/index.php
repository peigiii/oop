<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: ../../login.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Python Skill Test</title>
    <link rel="stylesheet" href="style.css?v=<?= time() ?>">
    <?php include __DIR__ . '/../../nav.php'; ?>
    <style>
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        header {
            text-align: center;
            margin-bottom: 20px;
        }
        h1 {
            font-size: 28px;
            color: #333;
        }
        .btn-language {
            background-color: #ffe082;
            padding: 8px 16px;
            border-radius: 20px;
            border: none;
            color: #333;
            font-size: 18px;
            margin-top: 10px;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            justify-items: center;
        }
        .level-card {
            background-color: #fff;
            border: 2px solid #1976d2;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s ease;
        }
        .level-card:hover {
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            transform: scale(1.05);
        }
        button {
            background-color: #1976d2;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            margin-top: 10px;
            font-size: 16px;
            color: #ffe082;
            cursor: pointer;
        }
        button:hover {
            background-color: #1565c0;
        }
        #quizSection {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .hidden {
            display: none;
        }
        .quiz-progress {
            height: 20px;
            background-color: #ffe082;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .quiz-progress-fill {
            height: 100%;
            background-color: #1976d2;
            border-radius: 10px;
            transition: width 0.3s ease;
        }
        .question-header {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>🐍 Python Skill Test</h1>
            <div class="grid-container">
                <div class="level-card">
                    <h3>Python</h3>
                    <p>Level 1</p>
                    <button onclick="startQuiz('python_level_1')">Start Quiz</button>
                </div>
                <div class="level-card">
                    <h3>Python</h3>
                    <p>Level 2</p>
                    <button onclick="startQuiz('python_level_2')">Start Quiz</button>
                </div>
                <div class="level-card">
                    <h3>Python</h3>
                    <p>Level 3</p>
                    <button onclick="startQuiz('python_level_3')">Start Quiz</button>
                </div>
            </div>
        </header>
    </div>
    <div id="quizSection" style="display:none;">
        <h3 id="quizTitle"></h3>
        <div class="quiz-progress">
            <div class="quiz-progress-fill"></div>
        </div>
        <form id="quizForm">
            <div class="question-header">Question <span id="currentQuestion">1</span> of <span id="totalQuestions">0</span></div>
            <div id="questionContainer"></div>
            <button type="button" id="backButton" class="hidden">Back</button>
            <button type="button" id="nextButton">Next</button>
        </form>
        <p id="result" class="hidden"></p>
        <button id="retakeButton" class="hidden">Retry</button>
        <button id="backToTestPageButton" class="hidden">Back to Selection</button>
        <button id="showAnswersButton" class="hidden">Show Answers</button>
        <div id="answersSection" class="hidden">
          <h3>Answers Review</h3>
          <div id="answersList"></div>
        </div>
    </div>
    <script src="quiz.js?v=<?= time() ?>"></script>
</body>
</html>
