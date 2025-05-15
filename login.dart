import 'package:flutter/material.dart';
import 'custom.dart';
import 'dumydata.dart';

int? userid;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  bool _validateUser(String email, String password) {
    for (var user in DummyData.users) {
      if (user['email'] == email && user['password'] == password) {
        userid = user['id'];
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEBFCFD),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Title(
                    color: const Color(0xFF000000),
                    child: const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    )),
                const SizedBox(height: 16),
                Title(
                    color: const Color(0xFF000000),
                    child: const Text(
                      'Let\'s continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    )),
                const SizedBox(height: 32),
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
                    const SizedBox(height: 8),
                    InputTexts(controller: email),

                    const SizedBox(height: 32),

                    //Password text box
                    const Text(
                      'Password',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 8),
                    InputTexts(controller: pass),

                    const SizedBox(height: 32),

                    //forgot pass
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgotpass');
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    //OR line
                    const SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(255, 0, 0, 0),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8, left: 8),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color(0xFF000000),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    //Google login Button
                    TextButton(
                      onPressed: () {
                        //login with google func
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: const Size(320, 44),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('lib/assets/logo googleg 48dp.png',
                              height: 24),
                          const SizedBox(width: 16),
                          const Text(
                            'Sign in with Google',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    //Login Button
                    TextButton(
                      onPressed: () {
                        if (_validateUser(email.text, pass.text)) {
                          DummyData.users.firstWhere((user) =>
                              user['id'] == userid)['isLoggedIn'] = true;
                              print(DummyData.users);
                          Navigator.pushNamed(context, '/homepage');
                        } else {
                          print('Current users: ${DummyData.users}');

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                alignment: Alignment.center,
                                content:
                                    const Text('Invalid email or password.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
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
                            'Log in',
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

                    const SizedBox(height: 32),

                    //Login text option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
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
      ),
    );
  }
}
