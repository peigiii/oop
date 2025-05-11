
const questions = [
  {
    question: `Write a Python program that allows managing employees...`,
    inputAnswer: true,
    renderInputBox: () => '<textarea name="userAnswer" rows="10" placeholder="Write your codes here..."></textarea>',
    saveAnswer: function(val) { this.userAnswer = val; }
  },
  {
    question: `Build a Python program that allows a teacher to: ...`,
    inputAnswer: true,
    renderInputBox: () => '<textarea name="userAnswer" rows="10" placeholder="Write your codes here..."></textarea>',
    saveAnswer: function(val) { this.userAnswer = val; }
  }
  // Add more questions similarly
];
