import 'package:exams_app1/custom.dart';
import 'package:exams_app1/dumydata.dart';
import 'package:exams_app1/login.dart';
import 'package:flutter/material.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {

  final user = DummyData.users.firstWhere((u) => u['id'] == userid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Title(
              color: const Color(0xFF000000),
              child: const Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            const SizedBox(height: 32),

            Stack(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Image.asset(
                    'lib/assets/Profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // Upload image
                      print('Icon pressed');
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF914C),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Text(
              'LIA',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              width: 322,
              height: 322,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: _buildContainer(
                            'My Rank', '${user['rank']}\nOUT OF\n${DummyData.users.length}')),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child:
                            _buildContainer('My Level', 'Level 1\nBeginner')),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      
                      child: _buildContainer(
                        'My Exams',
                        '${user['exams']}/1000',
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: _buildContainer('My Attempts', '${user['attempts']}',),
                        ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNavBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(String title, String description) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF094647), 
        borderRadius: BorderRadius.circular(16), 
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, 
            ),
            textAlign: TextAlign.center, 
          ),
          const SizedBox(height: 10), 
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white, 
            ),
            textAlign: TextAlign.center, 
          ),
        ],
      ),
    );
  }
}
