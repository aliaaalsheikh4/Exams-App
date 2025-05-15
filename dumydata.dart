//import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';

class DummyData {
  //the existing users
  static List<Map<String, dynamic>> users = [
    {
      'id': 1,
      'username': 'Lia',
      'email': 'lia@example.com',
      'password': 'password123',
      'age': 22,
      'university': 'Cairo University',
      'country': 'Egypt',
      'rank': 1600,
      'exams': 10,
      'attempts': 15,
      'code': 12345,
      'events': {
        DateTime.utc(2024, 9, 25): ['Contest 1'],
        DateTime.utc(2024, 10, 5): ['Practice Session'],
      },
      'credit_card': '1234 5678 9012 3456',
      'isLoggedIn': false,
    },
    {
      'id': 2,
      'username': 'Youssef',
      'email': 'youssef@example.com',
      'password': 'password456',
      'age': 24,
      'university': 'Alexandria University',
      'country': 'Egypt',
      'rank': 1300,
      'exams': 8,
      'attempts': 12,
      'code': 23456,
      'events': {
        DateTime.utc(2024, 9, 26): ['Contest 2'],
        DateTime.utc(2024, 10, 10): ['Coding Challenge'],
      },
      'credit_card': '9876 5432 1098 7654',
      'isLoggedIn': false,
    },
  ];
  /*Load existing users from; SharedPreferences
  static Future<void> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final userList = prefs.getStringList('users') ?? [];
    users = userList.map((user) => Map<String, dynamic>.from(jsonDecode(user))).toList();
  }

  static Future<void> saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> userList = users.map((user) => jsonEncode(user)).toList();
    await prefs.setStringList('users', userList);
  */


//function to add new user
  static void addUser({
    required String username,
    required String email,
    required String password,
  }) {
    //add new id for new user depend on the last id arrengement
    int newid = users.last['id'] + 1;

    Map<String, dynamic> newUser = {
      'id': newid,
      'username': username,
      'email': email,
      'password': password,
      'age': 0,
      'university': 'Un Known',
      'country': 'Un Known',
      'rank': 0,
      'exams': 0,
      'attempts': 0,
      'code': 12345,
      'events': {},
      'credit_card': '0',
      'isLoggedIn': false,
    };

    users.add(newUser);
  }

  static void loadUsers() {}
}

//Exams data
class ExamQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  ExamQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class Exam {
  final String language;
  final List<ExamQuestion> questions;

  Exam({required this.language, required this.questions});
}

final exams = {
  'c programming': Exam(
    language: 'C Programming',
    questions: [
      ExamQuestion(
        question: "What is the size of int data type?",
        options: ['2 bytes', '4 bytes', '8 bytes', '1 byte'],
        correctAnswerIndex: 1,
      ),
    ],
  ),
};
