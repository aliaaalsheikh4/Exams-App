import 'package:exams_app1/models/exam_model.dart';

class LanguageController {
  final LanguageModel _model = LanguageModel();
  List<ProgrammingLanguages> filteredLanguages = [];

  void searchLanguage(String query) {
    filteredLanguages = _model.languages
        .where((language) =>
            language.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
