import 'package:exams_app1/languges.dart';
import 'package:flutter/material.dart';
import 'package:exams_app1/custom.dart';

class Exams extends StatefulWidget {
  const Exams({super.key});

  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  final List<String> languages = [
    'c programming',
    'c++ programming',
    'python',
    'java',
    'javascript',
    'swift',
    'kotlin',
    'ruby',
    'dart',
    'go',
    'rust',
    'php',
    'r',
    'typescript',
    'scala',
    'perl'
  ];

  List<String> filteredLanguages = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredLanguages = languages; 
  }

  void searchLanguage(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredLanguages = languages
          .where((language) => language.contains(searchQuery))
          .toList();
      if (filteredLanguages.isEmpty) {
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Not Avilable'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select the exam language',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                searchLanguage(value); 
              },
              decoration: InputDecoration(
                hintText: 'Search languages',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Discover the available languages',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 16, 
                  mainAxisSpacing: 16, 
                ),
                itemCount: filteredLanguages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Languages(language: filteredLanguages[index]),
  ),
);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF094546),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          filteredLanguages[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class LanguagePage extends StatelessWidget {
  final String language;

  const LanguagePage({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language), 
      ),
      body: Center(
        child: Text(
          'Welcome to $language exam!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
