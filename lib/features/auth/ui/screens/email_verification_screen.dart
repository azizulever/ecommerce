import 'package:flutter/material.dart';
import 'package:projects/features/auth/ui/widgets/app_logo_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const String name = '/email-verification';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              const AppLogoWidget(),
              const SizedBox(height: 12),
              Text('Welcome Back', style: Theme.of(context).textTheme.titleLarge),
              Text(
                'Please enter your email address',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email Address'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                key: ValueKey("nextButton"),
                onPressed: () {},
                child: Text('Next'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
