import 'package:exams_app1/custom.dart';
import 'package:flutter/material.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {

  final TextEditingController newPassword =TextEditingController();
  final TextEditingController confirmNewPassword =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEBFCFD),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20,top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Title(
                  color: const Color(0xFF000000),
                  child: const Text(
                    'Set your New Password',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Set your New Password text box
                  const Text(
                    'New Password',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputTexts(controller: newPassword),

                  const SizedBox(height: 32),

                  //Confinm Password text box
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputTexts(controller: confirmNewPassword),

                  const SizedBox(height: 32),

                  //confirm Button
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/homepage');
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
                          'Confirm',
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}