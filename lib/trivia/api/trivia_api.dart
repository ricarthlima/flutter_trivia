import 'package:dio/dio.dart';
import 'package:flutter_trivia/trivia/models/questions.dart';

class TriviaApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://opentdb.com/api.php",
  ));

  Future<List<Question>> getQuestions(
      {required int amount, required int category}) async {
    Response response = await _dio.get("", queryParameters: {
      _APIParams.amount: amount,
      _APIParams.category: category,
      _APIParams.difficulty: _DifficultyTypes.hard,
      _APIParams.type: "multiple",
      _APIParams.encode: "url3986",
    });

    List<Question> questions = [];

    for (Map<String, dynamic> webElement
        in (response.data["results"] as List)) {
      questions.add(Question.fromMap(webElement));
    }

    return questions;
  }
}

class _APIParams {
  static const String amount = "amount";
  static const String category = "category";
  static const String difficulty = "difficulty";
  static const String type = "type";
  static const String encode = "encode";
}

class _DifficultyTypes {
  static const String easy = "easy";
  static const String medium = "medium";
  static const String hard = "hard";
}

class CategoryTypes {
  static const int manga = 31;
  static const int scienceComputers = 18;
}
