let questions = [], currentQuestionIndex = 0, score = 0;
let selectedCategory = "";

function shuffle(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
}

async function startQuiz(level) {
  selectedCategory = level;
  try {
    console.log("Starting quiz for level:", level);
    const res = await fetch("get_questions.php?level=" + encodeURIComponent(level));
    if (!res.ok) throw new Error('Network response was not ok');
    const data = await res.json();
    console.log("Received data:", data);
    let arr = Array.isArray(data) ? data : (data[selectedCategory] || []);
    if (!Array.isArray(arr)) arr = [];
    // 保证每个题目都有type字段，options为数组
    questions = arr.filter(q => q && q.question).map(q => ({
      ...q,
      type: q.type === 'mcq' ? 'mcq' : 'subjective',
      options: Array.isArray(q.options) ? q.options : [],
      answer: q.answer || ''
    }));

    if (questions.length === 0) {
      alert("No questions found.");
      return;
    }

    shuffle(questions);
    document.querySelector(".container").style.display = "none";
    document.getElementById("quizSection").style.display = "block";
    document.getElementById("quizTitle").textContent = "Category: " + selectedCategory;
    document.getElementById("totalQuestions").textContent = questions.length;
    loadQuestion();
  } catch (err) {
    alert("Network error or invalid data: " + err.message);
  }
}

function loadQuestion() {
  const qc = document.getElementById("questionContainer");
  qc.innerHTML = "";
  const q = questions[currentQuestionIndex];

  // 更新进度条
  const progress = ((currentQuestionIndex + 1) / questions.length) * 100;
  const progressBar = document.querySelector('.quiz-progress-fill');
  if (progressBar) {
    progressBar.style.width = progress + '%';
  }
  document.getElementById('currentQuestion').textContent = currentQuestionIndex + 1;
  document.getElementById('totalQuestions').textContent = questions.length;

  // 每次切换题目时隐藏Show Answers按钮和答案回顾
  const showBtn = document.getElementById("showAnswersButton");
  if (showBtn) showBtn.classList.add("hidden");
  const answersSection = document.getElementById("answersSection");
  if (answersSection) answersSection.classList.add("hidden");

  const p = document.createElement("p");
  p.textContent = q.question;
  qc.appendChild(p);

  // 显示图片：直接用后端返回的绝对路径
  if (q.image) {
    const img = document.createElement("img");
    img.src = q.image; // 直接用后端返回的绝对路径
    img.alt = "Question Image";
    img.style.maxWidth = "100%";
    img.style.height = "auto";
    img.onerror = function() {
      console.error("Image not found:", img.src);
      this.style.display = "none";
    };
    qc.appendChild(img);
  } else {
    console.warn("No image found for question:", q.question);
  }

  // 渲染选择题选项
  if (q.type === 'mcq' && Array.isArray(q.options)) {
    q.options.forEach((opt, i) => {
      const optEl = document.createElement("div");
      optEl.className = "option-container";
      const radio = document.createElement("input");
      radio.type = 'radio';
      radio.name = `q${currentQuestionIndex}`;
      radio.value = String.fromCharCode(97 + i);
      radio.id = `q${currentQuestionIndex}_${i}`;
      optEl.appendChild(radio);
      // 只显示图片，如果有图片
      if (opt.image) {
        const img = document.createElement("img");
        img.src = opt.image;
        img.alt = "Option Image";
        img.style.maxWidth = "120px";
        img.style.height = "auto";
        img.style.marginLeft = "12px";
        img.style.display = "inline-block";
        optEl.appendChild(img);
      } else {
        // 没有图片才显示文字
        const label = document.createElement("label");
        label.htmlFor = `q${currentQuestionIndex}_${i}`;
        label.textContent = opt.text || "";
        optEl.appendChild(label);
      }
      qc.appendChild(optEl);
      optEl.addEventListener('click', () => {
        document.querySelectorAll('.option-container').forEach(c => c.classList.remove('selected'));
        optEl.classList.add('selected');
        radio.checked = true;
      });
    });
  }

  // 渲染主观题文本框
  if (q.type === 'subjective') {
    const inputBox = document.createElement("div");
    inputBox.innerHTML = `<textarea name="userAnswer" rows="10" cols="90" placeholder="Type your answer...">${q.userAnswer || ''}</textarea>`;
    qc.appendChild(inputBox);
  }

  document.getElementById('backButton').classList.toggle('hidden', currentQuestionIndex === 0);
}

function nextQuestion() {
  const q = questions[currentQuestionIndex];
  if (q.type === 'subjective') {
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

  const total = questions.filter(q => q.type === 'mcq').length;
  const percentage = Math.round((score / total) * 100);
  const message = total > 0 
    ? `✅ You scored ${score} out of ${total} (${percentage}%)` 
    : `✅ Answers submitted successfully.`;
  result.innerHTML = message;

  document.getElementById("retakeButton").classList.remove("hidden");
  document.getElementById("backToTestPageButton").classList.remove("hidden");
  const showBtn = document.getElementById("showAnswersButton");
  if (showBtn) {
    showBtn.classList.remove("hidden");
    showBtn.style.display = "inline-block";
    console.log('Show Answers button should now be visible', showBtn, showBtn.className, showBtn.style.display);
  } else {
    console.error('Show Answers button not found!');
  }

  await submitQuiz();
}

async function submitQuiz() {
  const answers = questions.map((q, i) => ({
    question: q.question,
    answer: q.type === 'subjective' ? (q.userAnswer || '') : (q.selected || '')
  }));

  try {
    // 发送 POST 请求
    const res = await fetch("submit.php", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ level: selectedCategory, answers })
    });

    // 解析返回数据
    const json = await res.json();
    if (json.status === "success") {
      alert("✅ Submission successful!");
      console.log("File saved at:", json.file);
    } else {
      alert("❌ Submission failed: " + json.message);
    }
  } catch (err) {
    alert("❌ Network error during submission: " + err.message);
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

document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("nextButton").onclick = nextQuestion;
  document.getElementById("backButton").onclick = previousQuestion;
  document.getElementById("retakeButton").onclick = resetQuiz;
  document.getElementById("backToTestPageButton").onclick = () => location.reload();
  const showBtn = document.getElementById("showAnswersButton");
  console.log('DOMContentLoaded: showAnswersButton:', showBtn, showBtn ? showBtn.className : 'not found');
  if (showBtn) {
    document.getElementById("showAnswersButton").onclick = function() {
      const answersSection = document.getElementById("answersSection");
      const answersList = document.getElementById("answersList");
      answersSection.classList.remove("hidden");
      answersList.innerHTML = "";
      questions.forEach((q, i) => {
        const div = document.createElement("div");
        div.className = "answer-item";
        
        // 问题标题
        const questionTitle = document.createElement("div");
        questionTitle.className = "question-text";
        questionTitle.innerHTML = `<b>Q${i+1}:</b> ${q.question}`;
        div.appendChild(questionTitle);

        // 答案内容容器
        const answerContent = document.createElement("div");
        answerContent.className = "answer-content";

        // 用户答案
        const userAnswer = document.createElement("div");
        userAnswer.className = "user-answer";
        if (q.type === 'subjective') {
          userAnswer.innerHTML = `<b>Your answer:</b><br>${q.userAnswer || ''}`;
        } else {
          const userOption = q.selected ? String.fromCharCode(97 + parseInt(q.selected) - 1) : '';
          const isCorrect = userOption === q.answer;
          userAnswer.innerHTML = `<b>Your answer:</b> ${userOption.toUpperCase()}`;
          userAnswer.style.color = isCorrect ? '#28a745' : '#dc3545';
        }
        answerContent.appendChild(userAnswer);

        // 如果是选择题，显示所有选项和正确答案
        if (q.type === 'mcq') {
          const optionsList = document.createElement("div");
          optionsList.className = "options-list";
          q.options.forEach((opt, index) => {
            const optionDiv = document.createElement("div");
            const optionLetter = String.fromCharCode(97 + index);
            const isCorrectOption = optionLetter === q.answer;
            const isUserSelected = optionLetter === q.selected;
            
            optionDiv.className = "option-review";
            if (isCorrectOption) {
              optionDiv.classList.add("correct-option");
            }
            if (isUserSelected && !isCorrectOption) {
              optionDiv.classList.add("incorrect-option");
            }
            
            optionDiv.innerHTML = `${optionLetter.toUpperCase()}. ${opt.text || ''}`;
            if (opt.image) {
              const img = document.createElement("img");
              img.src = opt.image;
              img.alt = "Option Image";
              img.style.maxWidth = "120px";
              img.style.height = "auto";
              img.style.marginLeft = "12px";
              optionDiv.appendChild(img);
            }
            optionsList.appendChild(optionDiv);
          });
          answerContent.appendChild(optionsList);
        }

        div.appendChild(answerContent);
        answersList.appendChild(div);
      });
    };
  }
});