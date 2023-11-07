import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ui/utils/api.dart';

class Question {
  final int? id;
  final String? question;
  final Object? jsonOptions;

  Question({
    required this.id,
    required this.question,
    required this.jsonOptions
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      jsonOptions: json['option_array']
    );
  }
}

class QuestionService {
  Future<List<Question>> getQuestionsByCourse(courseId, category) async {
    final box = GetStorage();
    var token = box.read('token');

    var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    final response = await http.get(Uri.parse('${ApiEndpoints.baseUrl}/questions/$courseId?category=$category'), headers: headers);

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Question> questions = [];
      for (var i = 0; i < data['data'].length; i++) {
        final entry = data['data'][i];
        questions.add(Question.fromJson(entry));
      }
      return questions;
    } else {
      throw Exception('Failed to fetch data.');
    }
  }

  Future getQuestionsCount(courseId, category) async {
    final box = GetStorage();
    var token = box.read('token');

    var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    final response = await http.get(Uri.parse('${ApiEndpoints.baseUrl}/questions/$courseId?category=$category'), headers: headers);

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'].length;
    } else {
      throw Exception('Failed to fetch data.');
    }
  }

  Future storeUserExam({
    required int userId,
    required int questionId,
    required String userAnswer
  }) async {
    final box = GetStorage();
    var token = box.read('token');

    try {
      var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
      var url = Uri.parse('${ApiEndpoints.baseUrl}/exams');
  
      Map body = {
        'user_id': userId,
        'question_id': questionId,
        'user_answer': userAnswer
      };
      
      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      final json = jsonDecode(response.body);
      if(json['statusCode'] == 200) {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Your answer has been submitted.',
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.green.shade600,
          )
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            message: jsonDecode(response.body)['message'],
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red.shade600,
          )
        );
        throw jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

class ExamResult {
  final int? total;
  final int? totalResult;
  final String? examStatus;

  ExamResult({
    required this.total,
    required this.totalResult,
    required this.examStatus
  });

  factory ExamResult.fromJson(Map<String, dynamic> json) {
    return ExamResult(
      total: json['total'],
      totalResult: json['total_result'],
      examStatus: json['exam_status']
    );
  }
}

class ExamService {
  Future<ExamResult> getExamResult(userId, courseId, category) async {
    final box = GetStorage();
    var token = box.read('token');

    var headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    final response = await http.get(Uri.parse('${ApiEndpoints.baseUrl}/exams/$userId?course_id=$courseId&category=$category'), headers: headers);

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ExamResult.fromJson(data['data']);
    } else {
      throw Exception('Failed to fetch data.');
    }
  }
}