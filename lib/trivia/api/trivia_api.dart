import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_trivia/trivia/models/questions.dart';

class TriviaApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://opentdb.com/api.php",
    ),
  );

  Future<List<Question>> getQuestions(
      {required int amount, required int category}) async {
    Response response = await _dio.get(
      "",
      queryParameters: {
        _APIParams.amount: amount,
        _APIParams.category: category,
        _APIParams.difficulty: DifficultyTypes.hard,
        _APIParams.type: "multiple",
        _APIParams.encode: "url3986",
      },
    );

    List<Question> questions = [];

    for (Map<String, dynamic> webElement
        in (response.data["results"] as List)) {
      questions.add(Question.fromMap(webElement));
    }

    return questions;
  }

  Future<List<Question>> generateQuestionsByUser({
    required int amount,
    required String difficulty,
    required List<int> categories,
  }) async {
    List<Question> listQuestions = [];

    int quo = amount ~/ categories.length;
    int resto = amount % categories.length;

    int indexRandom = Random().nextInt(categories.length);

    for (int categoria in categories) {
      int innerAmount = quo;

      if (categories[indexRandom] == categoria) {
        innerAmount += resto;
      }

      Response response = await _dio.get(
        "",
        queryParameters: {
          _APIParams.amount: innerAmount,
          _APIParams.category: categoria,
          _APIParams.difficulty: difficulty,
          _APIParams.type: "multiple",
          _APIParams.encode: "url3986",
        },
      );

      for (dynamic map in response.data["results"]) {
        Question question = Question.fromMap(map);
        listQuestions.add(question);
      }

      //TODO: Estamos tendo problemas com múltiplas categorias
      //pois está dando um 429 as múltiplas requisições;
      await Future.delayed(const Duration(seconds: 6));
    }

    listQuestions.shuffle();

    return listQuestions;
  }
}

class _APIParams {
  static const String amount = "amount";
  static const String category = "category";
  static const String difficulty = "difficulty";
  static const String type = "type";
  static const String encode = "encode";
}

class DifficultyTypes {
  static const String easy = "easy";
  static const String medium = "medium";
  static const String hard = "hard";
}

class CategoryTypes {
  static const int general = 9;
  static const int books = 10;
  static const int movies = 11;
  static const int music = 12;
  static const int musicalsTheatres = 13;
  static const int television = 14;
  static const int videoGames = 15;
  static const int boardGames = 16;
  static const int nature = 17;
  static const int scienceComputers = 18;
  static const int math = 19;
  static const int mythology = 20;
  static const int sports = 21;
  static const int geography = 22;
  static const int history = 23;
  static const int politics = 24;
  static const int art = 25;
  static const int celebrities = 26;
  static const int animals = 27;
  static const int vehicles = 28;
  static const int comics = 29;
  static const int gadgets = 30;
  static const int animeManga = 31;
  static const int cartoon = 32;
}
