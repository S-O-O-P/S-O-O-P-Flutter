import 'dart:async';
import 'package:flutter/material.dart';
import 'package:linkbee/const/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/common/logo.png',
                  width: 100.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Link Bee',
                  style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w700,
                      color: white),
                ),
                SizedBox(
                  height: 50.0,
                ),
                CircularProgressIndicator(
                  color: white,
                  backgroundColor: pointColor,
                  strokeWidth: 2,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}