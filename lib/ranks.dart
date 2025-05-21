import 'package:exams_app1/custom.dart';
import 'package:exams_app1/dumydata.dart';
import 'package:flutter/material.dart';

class Ranks extends StatefulWidget {
  const Ranks({super.key});

  @override
  State<Ranks> createState() => _RanksState();
}

class _RanksState extends State<Ranks> {
  final List<Map<String, dynamic>> _users = DummyData.users;

  Map<String, dynamic> _getHighestRankUser() {
    Map<String, dynamic> highestRankUser = _users[0]; 

    for (var user in _users) {
      if (user['rank'] > highestRankUser['rank']) {
        highestRankUser = user; 
      }
    }

    return highestRankUser;
  }

  @override
  Widget build(BuildContext context) {
    _getHighestRankUser();

    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            "Top Coders",
            style: TextStyle(
              color: Color(0xFF094647),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "#${index + 1}",
                            style: const TextStyle(
                              color: Color(0xFF094647),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            user['username'], 
                            style: const TextStyle(
                              color: Color(0xFF094647),
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 32),
                          const Icon(
                            Icons.emoji_events,
                            color: Colors.amber,
                          ),
                          Text(
                            "${user['rank']}",
                            style: const TextStyle(
                              color: Color(0xFF094647),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
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
