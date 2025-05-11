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
    <title>Language Skill Test</title>
    <link rel="stylesheet" href="style.css?v=<?= time() ?>">
    <?php include __DIR__ . '/../../nav.php'; ?>
    <style>
        .container { max-width: 800px; margin: 50px auto; padding: 20px; background-color: #fff; border-radius: 16px; box-shadow: 0 4px 16px rgba(0,0,0,0.10);}
        header { text-align: center; margin-bottom: 30px;}
        h1 { font-size: 32px; color: #2a3b4c; letter-spacing: 2px;}
        .lang-select, .level-select { margin: 30px 0 20px 0; text-align: center;}
        .lang-btn, .level-btn {
            margin: 0 18px 18px 0; padding: 18px 36px; border-radius: 18px; border: none;
            font-size: 22px; font-weight: 600; cursor: pointer; background: #e3f0fa; color: #2a3b4c; transition: all 0.2s;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }
        .lang-btn.selected, .level-btn.selected { background: #4CAF50; color: #fff; box-shadow: 0 4px 16px rgba(76,175,80,0.15);}
        .lang-btn:hover, .level-btn:hover { background: #b2e6c5; color: #1a2b3c; }
        #startQuizBtn {
            margin-top: 20px; padding: 16px 48px; font-size: 22px; border-radius: 24px; border: none; background: linear-gradient(90deg,#4CAF50,#2196F3); color: #fff; font-weight: bold; box-shadow: 0 4px 16px rgba(33,150,243,0.10); cursor: pointer; transition: background 0.2s;}
        #startQuizBtn:hover { background: linear-gradient(90deg,#2196F3,#4CAF50); }
        .hidden { display: none !important; }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>🌏 Language Skill Test</h1>
        </header>
        <div class="lang-select">
            <button class="lang-btn" data-lang="chinese">中文</button>
            <button class="lang-btn" data-lang="japanese">日本語</button>
            <button class="lang-btn" data-lang="korean">한국어</button>
        </div>
        <div class="level-select" style="display:none;">
            <button class="level-btn" data-level="1">Level 1</button>
            <button class="level-btn" data-level="2">Level 2</button>
            <button class="level-btn" data-level="3">Level 3</button>
        </div>
        <div style="text-align:center;">
            <button id="startQuizBtn" style="display:none;">Start Quiz</button>
        </div>
    </div>
    <div id="quizSection" style="display:none;">
        <h3 id="quizTitle"></h3>
        <div class="quiz-progress"><div class="quiz-progress-fill"></div></div>
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
    <script src="quiz.js"></script>
    <script>
    let selectedLang = '', selectedLevel = '';
    document.querySelectorAll('.lang-btn').forEach(btn => {
        btn.onclick = function() {
            selectedLang = btn.dataset.lang;
            document.querySelectorAll('.lang-btn').forEach(b => b.classList.remove('selected'));
            btn.classList.add('selected');
            document.querySelector('.level-select').style.display = 'block';
            document.getElementById('startQuizBtn').style.display = 'none';
        }
    });
    document.querySelectorAll('.level-btn').forEach(btn => {
        btn.onclick = function() {
            selectedLevel = btn.dataset.level;
            document.querySelectorAll('.level-btn').forEach(b => b.classList.remove('selected'));
            btn.classList.add('selected');
            document.getElementById('startQuizBtn').style.display = 'inline-block';
        }
    });
    document.getElementById('startQuizBtn').onclick = function() {
        if (selectedLang && selectedLevel) {
            const levelName = `language_${selectedLang}_level_${selectedLevel}`;
            startQuiz(levelName);
        }
    }
    </script>
</body>
</html> 