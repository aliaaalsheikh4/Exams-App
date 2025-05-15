import 'package:flutter/material.dart';
import 'dumydata.dart';

class Languages extends StatefulWidget {
  final String language;

  const Languages({super.key, required this.language});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    final exam = exams[widget.language];

    if (exam == null || exam.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.language),
          backgroundColor: const Color(0xFF094546), 
        ),
        body: const Center(
          child: Text(
            'No questions available for this exam.',
            style: TextStyle(fontSize: 24, color: Color(0xFF094546)),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (currentQuestionIndex >= exam.questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.language),
          backgroundColor: const Color(0xFF094546), 
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF094546), 
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Your score: $score/${exam.questions.length}',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      );
    }

    final question = exam.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.language,style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        backgroundColor: const Color(0xFF094546), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF094546), 
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                question.question,
                style: const TextStyle(fontSize: 20, color: Color(0xFFEBFCFD)), 
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: List.generate(question.options.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (index == question.correctAnswerIndex) {
                        score++;
                      }
                      setState(() {
                        currentQuestionIndex++;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${index + 1}.', style: const TextStyle(color: Colors.black)),
                        Expanded(
                          child: Text(
                            question.options[index],
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
