import 'package:flutter/material.dart';

// Import your screens here
import 'Login&Register/forgot.dart';
import 'Login&Register/login.dart';
import 'Login&Register/register.dart';
import 'Login&Register/resetp.dart';
import 'Login&Register/successregister.dart';
import 'Login&Register/successreset.dart';
import 'home.dart';
import 'splash.dart';

void main() {
  runApp(MoodClickApp());
}

class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home', // The initial route will be SplashScreen
      routes: {
        '/': (context) => SplashScreen(), // SplashScreen route
        '/login': (context) => LoginScreen(), // Login screen route
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
