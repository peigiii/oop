let questions = [], currentQuestionIndex = 0, score = 0;
let selectedCategory = "";

function shuffle(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
}

async function startQuiz() {
  selectedCategory = document.getElementById('categorySelector')?.value || 'java_level_1';
  const res = await fetch("questions.json");
  const data = await res.json();
  questions = data[selectedCategory] || [];
  if (questions.length === 0) return alert("No questions found.");
  shuffle(questions);
  document.querySelector(".container")?.classList.add("hidden");
  document.getElementById("quizSection").style.display = "block";
  document.getElementById("quizTitle").textContent = "Category: " + selectedCategory;

  const progress = document.querySelector(".quiz-progress-fill");
  if (progress) {
    progress.style.width = "0%";
  }

  loadQuestion();
}

function loadQuestion() {
  const qc = document.getElementById("questionContainer");
  qc.innerHTML = "";
  const q = questions[currentQuestionIndex];

  const progress = document.querySelector(".quiz-progress-fill");
  if (progress) {
    const percent = Math.round((currentQuestionIndex + 1) / questions.length * 100);
    progress.style.width = percent + "%";
  }

  const questionHeader = document.createElement("div");
  questionHeader.className = "question-header";
  questionHeader.textContent = `Question ${currentQuestionIndex + 1} of ${questions.length}`;
  qc.appendChild(questionHeader);

  const p = document.createElement("p");
  p.innerHTML = q.question;
  qc.appendChild(p);

  if (q.image) {
    const img = document.createElement("img");
    img.src = q.image;
    img.style.maxWidth = "100%";
    img.style.height = "auto";
    qc.appendChild(img);
  }

  if (q.inputAnswer) {
    const inputBox = document.createElement("div");
    inputBox.innerHTML = `<textarea name="userAnswer" rows="10" cols="90" placeholder="Type your answer...">${q.userAnswer || ''}</textarea>`;
    qc.appendChild(inputBox);
  } else if (q.options) {
    q.options.forEach((opt, i) => {
      const optEl = document.createElement("div");
      optEl.className = "option-container";

      const radio = document.createElement("input");
      radio.type = 'radio';
      radio.name = `q${currentQuestionIndex}`;
      radio.value = String.fromCharCode(97 + i);
      radio.id = `q${currentQuestionIndex}_${i}`;

      const label = document.createElement("label");
      label.htmlFor = `q${currentQuestionIndex}_${i}`;
      label.textContent = opt;

      optEl.appendChild(radio);
      optEl.appendChild(label);
      qc.appendChild(optEl);

      optEl.addEventListener('click', () => {
        document.querySelectorAll('.option-container').forEach(c => c.classList.remove('selected'));
        optEl.classList.add('selected');
        radio.checked = true;
      });
    });
  }

  document.getElementById('backButton').classList.toggle('hidden', currentQuestionIndex === 0);
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
    currentQuestionIndex++;
    if (currentQuestionIndex < questions.length) {
      loadQuestion();
    } else {
      showResult();
    }
  } else {
    const selected = document.querySelector(`input[name="q${currentQuestionIndex}"]:checked`);
    if (!selected) {
      alert("Please select an answer.");
      return;
    }
    q.selected = selected.value;

    const allOptions = document.querySelectorAll(`input[name="q${currentQuestionIndex}"]`);
    allOptions.forEach(opt => {
      const container = opt.closest(".option-container");
      container.classList.remove("correct", "incorrect");

      if (opt.value === q.answer) {
        container.classList.add("correct");
        if (opt.checked) score++;
      } else if (opt.checked && opt.value !== q.answer) {
        container.classList.add("incorrect");
      }
    });

    setTimeout(() => {
      currentQuestionIndex++;
      if (currentQuestionIndex < questions.length) {
        loadQuestion();
      } else {
        showResult();
      }
    }, 1000);
  }
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

function previousQuestion() {
  if (currentQuestionIndex > 0) {
    currentQuestionIndex--;
    loadQuestion();
  }
}

function resetQuiz() {
  currentQuestionIndex = 0;
  score = 0;
  document.getElementById("quizForm").classList.remove("hidden");
  document.getElementById("result").classList.add("hidden");
  document.getElementById("retakeButton").classList.add("hidden");
  document.getElementById("backToTestPageButton").classList.add("hidden");
  loadQuestion();
}

document.getElementById("nextButton").onclick = nextQuestion;
document.getElementById("backButton").onclick = previousQuestion;
document.getElementById("retakeButton").onclick = resetQuiz;
document.getElementById("backToTestPageButton").onclick = () => location.reload();
