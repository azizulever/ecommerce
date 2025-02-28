import 'package:flutter/material.dart';
import 'package:projects/app/app_colors.dart';
import 'package:projects/features/auth/ui/screens/splash_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor
      ),
      routes: {
        '/' : (context) => SplashScreen(),
      },
    );
  }
}
