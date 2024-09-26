import 'package:flutter/material.dart';
import 'package:untitled/Pages/profile.dart';

import 'Pages/splashscreen.dart';
import 'Pages/loogin.dart';
import 'Pages/register.dart';
import 'Pages/forgot.dart';
import 'Pages/resetp.dart';
import 'Pages/successregister.dart';
import 'Pages/successreset.dart';
import 'Pages/home.dart';

void main() {
  runApp(MoodClickApp());
}

class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // The initial route will be SplashScreen or any other screen you set as '/'
      routes: {
        // Define routes here for navigation between screens
        '/': (context) => SplashScreen(), // SplashScreen route
        '/loogin': (context) => LoginScreen(), // Login screen route
        '/register': (context) => RegisterScreen(), // Register screen route
        '/forgot': (context) => ForgotPasswordScreen(), // Forgot password route
        '/resetp': (context) => ResetPasswordScreen(), // Reset password route
        '/successregister': (context) => RegistrationSuccessScreen(), // Registration success screen route
        '/successreset': (context) => SuccessScreen(), // Password change success screen route
        '/home': (context) => HomeScreen(), // Main Home Screen
      },
    );
  }
}
