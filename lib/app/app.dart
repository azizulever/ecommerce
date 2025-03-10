import 'package:flutter/material.dart';
import 'package:projects/app/app_theme_data.dart';
import 'package:projects/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:projects/features/auth/ui/screens/email_verification_screen.dart';
import 'package:projects/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:projects/features/auth/ui/screens/splash_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => SplashScreen(),
        EmailVerificationScreen.name: (context) => const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name: (context) => const CompleteProfileScreen(),
      },
    );
  }
}
