import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:projects/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:projects/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:projects/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:projects/features/common/ui/widgets/snack_bar_message.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const String name = '/email-verification';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EmailVerificationController _emailVerificationController =
      Get.find<EmailVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Spacer(),
              const AppLogoWidget(),
              const SizedBox(height: 12),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Please enter your email address',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailTEController,
                decoration: InputDecoration(hintText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter your email address";
                  }
                  if (EmailValidator.validate(value!) == false) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              GetBuilder<EmailVerificationController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    // key: ValueKey("nextButton"),
                    onPressed: _onTapNextButton,
                    child: Text('Next'),
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _emailVerificationController.verifyEmail(
        _emailTEController.text.trim(),
      );
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, OtpVerificationScreen.name);
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
            context,
            _emailVerificationController.errorMessage!,
          );
        }
      }
    }
  }
}
