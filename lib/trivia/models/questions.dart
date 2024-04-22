class Question {
  String difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  Question({
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  Question.fromMap(Map<String, dynamic> map)
      : difficulty = map["difficulty"],
        question = map["question"],
        correctAnswer = map["correct_answer"],
        incorrectAnswers = (map["incorrect_answers"] as List<dynamic>)
            .map((e) => e as String)
            .toList();

  List<String> shuffleQuestion() {
    List<String> temp = [];
    temp.add(correctAnswer);
    temp.addAll(incorrectAnswers);
    temp.shuffle();
    return temp;
  }

  Map<String, dynamic> toMap() {
    return {
      "difficulty": difficulty,
      "question": question,
      "correct_answer": correctAnswer,
      "incorrect_answers": incorrectAnswers,
    };
  }
}
