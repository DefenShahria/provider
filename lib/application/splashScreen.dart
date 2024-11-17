import 'package:Practice_provider/ui/screens/auth/signinScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/screens/main_bottomnav.dart';
import '../ui/state_holder/controller/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkFirstTimeAndNavigate();
  }

  Future<void> checkFirstTimeAndNavigate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      navigateToLogin();
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const SignInPage()));
    }
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 3), () async {
      final bool isLoggedIn = await AuthController.isLoggedin; // Ensure this returns a Future<bool>
      if (isLoggedIn) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const MainBottomNavScreen()));
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const SignInPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Task Manager Apk"),
      ),
    );
  }
}
