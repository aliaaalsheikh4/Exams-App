import 'package:exams_app1/Verifcation.dart';
import 'package:exams_app1/dumydata.dart';
import 'package:exams_app1/exams.dart';
import 'package:exams_app1/languges.dart';
import 'package:exams_app1/myaccount.dart';
import 'package:exams_app1/notification.dart';
import 'package:exams_app1/plans.dart';
import 'package:exams_app1/calendar.dart';
import 'package:exams_app1/contests.dart';
import 'package:exams_app1/custom.dart';
import 'package:exams_app1/faq.dart';
import 'package:exams_app1/info.dart';
import 'package:exams_app1/login.dart';
import 'package:exams_app1/newpassword.dart';
import 'package:exams_app1/practice.dart';
import 'package:exams_app1/profile.dart';
import 'package:exams_app1/ranks.dart';
import 'package:exams_app1/reviews.dart';
import 'package:exams_app1/view/exam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'forgotpass.dart';
import 'signup.dart';
import 'homepage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context) => BottomBarIndex(),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = '/login';
  @override
void initState() {
  super.initState();
  DummyData.loadUsers();
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute, 
      routes: {
        '/signup': (context) => const Signup(),
        '/homepage': (context) => const HomePage(),
        '/info': (context) => const Infoscreen(),
        '/login': (context) => const Login(),
        '/forgotpass': (context) => const ForgotPass(),
        '/Verification': (context) => const VerificationCode(),
        '/newpassword': (context) => const Newpassword(),
        '/plans': (context) => const Plans(),
        '/calendar': (context) => const Calendar(),
        '/faq': (context) => const Faq(),
        '/contests': (context) => const Contests(),
        '/practice': (context) => const Practice(),
        '/exams': (context) => const Exams(),
        '/profile': (context) => const MyProfil(),
        '/ranks': (context) => const Ranks(),
        '/reviews': (context) => const Reviews(),
        '/myaccount': (context) => const Myaccount(),
        '/notification': (context) => const mynotification(),
        '/languages': (context) => const Languages(language: '',),
        '/exam': (context) => const ExamsScreen(),
      },
    );
  }
}
