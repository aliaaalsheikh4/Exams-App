import 'package:exams_app1/custom.dart';
import 'package:flutter/material.dart';

class Contests extends StatefulWidget {
  const Contests({super.key});

  @override
  State<Contests> createState() => _ContestsState();
}

class _ContestsState extends State<Contests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 64),
                Text(
                  "Compete to Win",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Pick Your Challenge and Compete!",
                  style: TextStyle(
                    color: Color(0x60094647),
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 32), 
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildContestContainer("Weekly live\nContests"),
                  const SizedBox(height: 16),
                  buildContestContainer("Special\nContests"),
                  const SizedBox(height: 16),
                  buildContestContainer("Past\nContests"),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity, 
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }

  Widget buildContestContainer(String title) {
    return GestureDetector(
      onTap: () {
        // 
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF094647),
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

