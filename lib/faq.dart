import 'package:exams_app1/custom.dart';
import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {

  final List<Map<String, String>> faqs = [
    {
      "question": "What is Contests ?",
      "answer":
          "Contests are competitive events where users can solve problems."
    },
    {
      "question": "What is Attempts ?",
      "answer":
          "Attempts refer to the number of times you've tried a particular problem."
    },
    {
      "question": "How can I practice ?",
      "answer":
          "You can practice by going to the practice section and solving problems."
    },
    {
      "question": "How to know my level ?",
      "answer":
          "Your level is determined based on your performance in contests."
    },
    {
      "question": "How to know my Rank ?",
      "answer": "You can see your rank in the leaderboard section of the app."
    },
    {
      "question": "How to know my Current Attempts ?",
      "answer": "You can check your current attempts in the profile section."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "FAQ",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnswerPage(
                            question: faqs[index]['question']!,
                            answer: faqs[index]['answer']!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF094647), 
                        borderRadius:
                            BorderRadius.circular(16), 
                      ),
                      child: Center(
                        child: Text(
                          faqs[index]['question']!,
                          style: const TextStyle(
                            color: Colors.white, 
                            fontSize: 16, 
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}

class AnswerPage extends StatelessWidget {
  final String question;
  final String answer;

  const AnswerPage({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEBFCFD), 
        body: Center(
          
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 24,
                        )),
                    Text(
                      question,
                      textAlign: TextAlign.center, 
                      style: const TextStyle(
                        fontSize: 22, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black, 
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), 
                Text(
                  answer, 
                  textAlign: TextAlign.center, 
                  style: const TextStyle(
                    fontSize: 18, 
                    color: Colors.black, 
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
