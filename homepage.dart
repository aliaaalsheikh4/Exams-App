import 'package:flutter/material.dart';
import 'custom.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), 
      endDrawer: const CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
    
                Title(
                  color: const Color(0xFF000000),
                  child: const Text(
                    'Start Here',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  )),
    
                  const SizedBox(height: 16),
    
                //Practice
                Container(
                  height: 196,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset('lib/assets/practice.png'),
                  ),
    
                  //Go practice Button
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/practice');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF008081),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size(320, 44),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start coding Practice',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32,),
    
                  //Exams
                  Container(
                  height: 196,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset('lib/assets/exams.png'),
                  ),
    
                  const SizedBox(height: 16,),
    
                  //Go to Exams Button
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/exams');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF008081),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size(320, 44),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Exam Challenge Awaits',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                
    
              ],
            ),
          ),
          
            //Spacer(),
        
            Container(
              child: Expanded(
                child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomBottomNavBar(),
                      ),
              ),
            ),
        ],
          ),        
      );
  }
}
