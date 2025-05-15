import 'package:flutter/material.dart';
import 'custom.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

    final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEBFCFD),
        body: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Title(
                  color: const Color(0xFF000000),
                  child: const Text(
                    'Forgot your Password ?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              Title(
                  color: const Color(0xFF000000),
                  child: const Text(
                    'Reset your Password ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  )),
              const SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Email text box
                  const Text(
                    'Email',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputTexts(controller: email),
      
                  const SizedBox(height: 32),
      
                  //Send code Button
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,'/Verification');
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
                          'Send Code',
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
      
                  const SizedBox(height: 327),
      
                  //Login text option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                         
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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