import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:linkbee/const/colors.dart';
import 'package:linkbee/screen/cs/noticeScreen.dart';
import 'package:linkbee/screen/cultureInfo/cultureinfo_screen.dart';
import 'package:linkbee/screen/honeypot/honeypot_screen.dart';
import 'package:linkbee/screen/login/loginScreen.dart';
import 'package:linkbee/screen/main/homeScreen.dart';
import 'package:linkbee/screen/mypage/myPage.dart';
import 'package:linkbee/screen/splash_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // whenever your initialization is completed, remove the splash screen:
  // FlutterNativeSplash.remove();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => const SplashScreen(), //스플래쉬 화면
        '/login':(context) => LoginScreen(),
        '/mypage':(context) => MypageScreen(),
        '/cultureInfo':(context) => CultureInfoScreen(),
        '/honeypot':(context) => HoneypotScreen(),
        '/notice':(context) => NoticeScreen(),
        '/home_screen':(context) => HomeScreen(),
      },
      theme: ThemeData(
        fontFamily: 'SUIT',
        scaffoldBackgroundColor: white,
        textTheme: TextTheme(
            titleLarge: TextStyle(color: black, fontSize: 24, fontWeight: FontWeight.w700),
            titleMedium: TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.w700),
            titleSmall: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.w700),
            bodyLarge: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.w600),
            bodyMedium: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w600),
            bodySmall: TextStyle(color: black, fontSize: 14, fontWeight: FontWeight.w600),
            displayLarge: TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w500),
            displayMedium: TextStyle(color: black, fontSize: 14, fontWeight: FontWeight.w500),
            displaySmall: TextStyle(color: black, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
    )
  );
}