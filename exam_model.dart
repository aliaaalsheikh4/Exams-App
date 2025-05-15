class Question {
  String questionTitle;
  String questionBody;
  List<String> options;
  String correctAnswer;
  int score;

  Question({
    required this.questionTitle,
    required this.questionBody,
    required this.options,
    required this.correctAnswer,
    this.score = 0,
  });  
}

class ExamModel {
  int examNumber;
  List<Question>questions;

  ExamModel({
    required this.examNumber,
    required this.questions,
  });
}

class ProgrammingLanguages{
  String name;
  List<ExamModel>exams;

  ProgrammingLanguages({
    required this.name,
    required this.exams,
  });

  contains(String lowerCase) {}
}

class LanguageModel {
  List<ProgrammingLanguages> languages = [
    ProgrammingLanguages(name: 'C Programming', exams: []),
    ProgrammingLanguages(name: 'C++ Programming', exams: []),
    ProgrammingLanguages(name: 'Python', exams: []),
    ProgrammingLanguages(name: 'Java', exams: []),
    ProgrammingLanguages(name: 'JavaScript', exams: []),
    ProgrammingLanguages(name: 'Swift', exams: []),
    ProgrammingLanguages(name: 'Kotlin', exams: []),
    ProgrammingLanguages(name: 'Ruby', exams: []),
    ProgrammingLanguages(name: 'Dart', exams: []),
    ProgrammingLanguages(name: 'Go', exams: []),
    ProgrammingLanguages(name: 'Rust', exams: []),
    ProgrammingLanguages(name: 'PHP', exams: []),
    ProgrammingLanguages(name: 'R', exams: []),
    ProgrammingLanguages(name: 'TypeScript', exams: []),
    ProgrammingLanguages(name: 'Scala', exams: []),
    ProgrammingLanguages(name: 'Perl', exams: []),
  ];
}
