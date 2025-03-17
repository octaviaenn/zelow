import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zelow/pages/auth/login_page.dart';
import 'package:zelow/pages/umkm/home_page_umkm.dart';
import 'package:zelow/pages/user/home_page_user.dart';

import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash': (context) => SplashPage(),
        '/home_page_user': (context) => HomePageUser(),
        '/home_page_umkm': (context) => HomePageUmkm(),
        '/login_page': (context) => LoginPage(),
      },
    );
  }
}
