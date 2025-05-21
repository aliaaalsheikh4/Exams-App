import 'package:exams_app1/dumydata.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  void initState() { // **إضافة هذه الدالة لتحميل المستخدمين من SharedPreferences**
    super.initState();
    loadUsers();
  }

  // **دالة لتحميل البيانات من SharedPreferences**
  Future<void> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? userList = prefs.getStringList('users'); // **استرجاع قائمة المستخدمين**

    if (userList != null) {
      for (var user in userList) {
        var userData = user.split(',');
        DummyData.addUser(
          username: userData[0],
          email: userData[1],
          password: userData[2],
        );
      }
    }
  }

  // **دالة لحفظ المستخدمين في SharedPreferences**
  Future<void> saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> userList = [];

    for (var user in DummyData.users) {
      userList.add(
        '${user['username']},${user['email']},${user['password']}', // **تخزين بيانات المستخدم**
      );
    }

    await prefs.setStringList('users', userList); // **حفظ قائمة المستخدمين**
  }

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
                    'Create an account',
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
                    'Signup to start now!',
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
                  //User name text box
                  const Text(
                    'User name',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputTexts(controller: username),
      
                  const SizedBox(height: 32),
      
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
      
                  //Password text box
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputTexts(controller: pass),
      
                  const SizedBox(height: 32),
      
                  //OR line
      
                  SizedBox(
                    height: 20,
                    child: const Row(
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
      
                  //Google Signup Button
                  TextButton(
                    onPressed: () {
                      //sign up with google func
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
                          'Sign up with Google',
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
      
                  //Signup Button
                  TextButton(
                    onPressed: () async {
                      DummyData.addUser(username: username.text, email: email.text, password: pass.text);
                      await saveUsers();
                      print('Current users: ${DummyData.users}');
                      Navigator.pushNamed(context,'/homepage');
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
                          'Sign up',
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
                              'Have an account?',
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Log in',
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
