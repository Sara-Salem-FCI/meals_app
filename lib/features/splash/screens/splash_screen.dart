import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meals_app/features/home/screens/home_screen.dart';
import 'package:meals_app/features/on_boarding/screens/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 5)).then(
      (value) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final seen = prefs.getBool('seen');
        if (seen != null && seen) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
          );
        }else{
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/animations/splash.json')),
    );
  }
}
