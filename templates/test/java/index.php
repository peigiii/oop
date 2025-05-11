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
    <title> Skill Test</title>
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
            background-color: #d9e8d0;
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
            border: 2px solid #ddd;
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
            background-color: #f7c8b2;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            margin-top: 10px;
            font-size: 16px;
            color: #333;
            cursor: pointer;
        }
        button:hover {
            background-color: #eab199;
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
            background-color: #ddd;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .quiz-progress-fill {
            height: 100%;
            background-color: #4CAF50;
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
            <h1>🧠 Java Skill Test</h1>
            <div class="grid-container">
                <div class="level-card">
                    <h3>Java</h3>
                    <p>Level 1</p>
                    <button onclick="startQuiz('java level 1')">Start Quiz</button>
                </div>
                <div class="level-card">
                    <h3>Java</h3>
                    <p>Level 2</p>
                    <button onclick="startQuiz('java level 2')">Start Quiz</button>
                </div>
                <div class="level-card">
                    <h3>Java</h3>
                    <p>Level 3</p>
                    <button onclick="startQuiz('java level 3')">Start Quiz</button>
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
    <script>
        let questions = [], currentQuestionIndex = 0, score = 0;
        let selectedCategory = "";

        async function startQuiz(level) {
            selectedCategory = level;
            const res = await fetch("get_questions.php");
            const data = await res.json();
            questions = data[selectedCategory] || [];
            if (questions.length === 0) return alert("No questions found.");
            document.querySelector(".container").style.display = "none";
            document.getElementById("quizSection").style.display = "block";
            document.getElementById("quizTitle").textContent = "Category: " + selectedCategory;
            document.getElementById("totalQuestions").textContent = questions.length;
            updateProgress();
            loadQuestion();
        }

        function updateProgress() {
            const progress = ((currentQuestionIndex + 1) / questions.length) * 100;
            document.querySelector('.quiz-progress-fill').style.width = `${progress}%`;
            document.getElementById('currentQuestion').textContent = currentQuestionIndex + 1;
        }

        function loadQuestion() {
            const qc = document.getElementById("questionContainer");
            qc.innerHTML = "";
            const q = questions[currentQuestionIndex];
            const p = document.createElement("p");
            let html = q.question;
            if (q.image) html += `<br><img src="${q.image}" alt="Question Image" style="max-width:100%;height:auto;">`;
            p.innerHTML = html;
            qc.appendChild(p);

            if (q.inputAnswer) {
                const inputBox = document.createElement("div");
                inputBox.innerHTML = `<textarea name="userAnswer" rows="10" cols="90" placeholder="Type your answer...">${q.userAnswer || ''}</textarea>`;
                qc.appendChild(inputBox);
            } else if (q.options) {
                q.options.forEach((opt, i) => {
                    const optEl = document.createElement("div");
                    optEl.className = "option-container";
                    optEl.innerHTML = `<input type='radio' name='q${currentQuestionIndex}' value='${String.fromCharCode(97+i)}' id='q${currentQuestionIndex}_${i}'>
                        <label for='q${currentQuestionIndex}_${i}'>${opt}</label>`;
                    qc.appendChild(optEl);
                });
            }

            document.getElementById('backButton').classList.toggle('hidden', currentQuestionIndex === 0);
            updateProgress();
        }

        function nextQuestion() {
            const q = questions[currentQuestionIndex];
            if (q.inputAnswer) {
                const input = document.querySelector('textarea[name="userAnswer"]');
                if (!input || input.value.trim() === '') {
                    alert("Please input your answer before proceeding.");
                    return;
                }
                q.userAnswer = input.value.trim();
            } else {
                const selected = document.querySelector(`input[name="q${currentQuestionIndex}"]:checked`);
                if (!selected) {
                    alert("Please select an answer.");
                    return;
                }
                q.selected = selected.value;
                if (selected.value === q.answer) score++;
            }

            currentQuestionIndex++;
            if (currentQuestionIndex < questions.length) {
                loadQuestion();
            } else {
                showResult();
            }
        }

        async function showAnswers() {
          const answersSection = document.getElementById("answersSection");
          const answersList = document.getElementById("answersList");
          answersList.innerHTML = "";
          
          questions.forEach((q, index) => {
            const answerDiv = document.createElement("div");
            answerDiv.className = "answer-item";
            
            let answerContent = `
              <div class="question-text">${index + 1}. ${q.question}</div>
              <div class="answer-content">
            `;
            
            if (q.inputAnswer) {
              answerContent += `
                <div class="user-answer">Your answer: ${q.userAnswer || 'Not answered'}</div>
              `;
            } else {
              const correctOption = q.options[parseInt(q.answer.charCodeAt(0) - 97)];
              answerContent += `
                <div class="correct-answer">Correct answer: ${correctOption}</div>
                <div class="user-answer">Your answer: ${q.selected ? q.options[parseInt(q.selected.charCodeAt(0) - 97)] : 'Not answered'}</div>
              `;
            }
            
            answerContent += `</div>`;
            answerDiv.innerHTML = answerContent;
            answersList.appendChild(answerDiv);
          });
          
          answersSection.classList.remove("hidden");
          document.getElementById("showAnswersButton").classList.add("hidden");
        }

        async function showResult() {
            document.getElementById("quizForm").classList.add("hidden");
            const result = document.getElementById("result");
            result.classList.remove("hidden");

            const total = questions.filter(q => !q.inputAnswer).length;
            const percentage = Math.round((score / total) * 100);
            const message = total > 0 
                ? `✅ You scored ${score} out of ${total} (${percentage}%)` 
                : `✅ Answers submitted successfully.`;
            result.innerHTML = message;

            document.getElementById("retakeButton").classList.remove("hidden");
            document.getElementById("backToTestPageButton").classList.remove("hidden");
            document.getElementById("showAnswersButton").classList.remove("hidden");

            const answers = questions.map((q, i) => ({
                question: q.question,
                answer: q.inputAnswer ? (q.userAnswer || '') : (q.selected || '')
            }));

            try {
                const res = await fetch("submit.php", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ level: selectedCategory, answers })
                });
                const json = await res.json();
                console.log("✅ Submission response:", json);
            } catch (err) {
                console.error("❌ Failed to submit:", err);
            }
        }

        function resetQuiz() {
            score = 0;
            currentQuestionIndex = 0;
            document.getElementById("quizForm").classList.remove("hidden");
            document.getElementById("result").classList.add("hidden");
            document.getElementById("retakeButton").classList.add("hidden");
            document.getElementById("backToTestPageButton").classList.add("hidden");
            document.getElementById("showAnswersButton").classList.add("hidden");
            document.getElementById("answersSection").classList.add("hidden");
            loadQuestion();
        }

        document.addEventListener("DOMContentLoaded", () => {
            document.getElementById("nextButton").onclick = nextQuestion;
            document.getElementById("backButton").onclick = () => {
                if (currentQuestionIndex > 0) {
                    currentQuestionIndex--;
                    loadQuestion();
                }
            };
            document.getElementById("retakeButton").onclick = resetQuiz;
            document.getElementById("backToTestPageButton").onclick = () => location.reload();
            document.getElementById("showAnswersButton").onclick = showAnswers;
        });
    </script>
</body>
</html>
