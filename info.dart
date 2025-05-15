import 'package:exams_app1/custom.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Infoscreen extends StatefulWidget {
  const Infoscreen({super.key});

  @override
  State<Infoscreen> createState() => _InfoscreenState();
}

class _InfoscreenState extends State<Infoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 127,),
    
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                Title(
                    color: const Color(0xFF000000),
                    child: const Text(
                      'About us',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    )),
                const SizedBox(
                  height: 32,
                ),
                Title(
                    color: const Color(0xFF000000),
                    child: const Text(
                      'We are an online educational platform that capitalizes on human potential by assisting professionals and aspiring individuals to succeed in their goals.Discover excellence with Gammal Tech\'s unparalleled courses, meticulously designed to propel you towards success. Our approach, ensures you master skills that matter.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 32,
                ),
                        
                const SizedBox(height: 32),
                        
                //More Button
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://www.gammal.tech/'));
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
                        'For more visit our website',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF000000),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      
          const Spacer(),
      
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
