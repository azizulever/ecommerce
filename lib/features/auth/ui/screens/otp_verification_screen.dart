import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:projects/app/app_colors.dart';
import 'package:projects/app/app_constants.dart';
import 'package:projects/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:projects/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:projects/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:projects/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:projects/features/common/ui/widgets/snack_bar_message.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  static const String name = '/otp-verification';
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  final RxBool _enableResendCodeButton = false.obs;
  final OtpVerificationController _otpVerificationController =
      Get.find<OtpVerificationController>();

  @override
  void initState() {
    super.initState();
    _startRespondCodeTime();
  }

  void _startRespondCodeTime() {
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _remainingTime.value--;
      if (_remainingTime.value == 0) {
        t.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

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
                'Enter OTP Code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'A 6 digit otp has been sent to your email',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  activeColor: AppColors.themeColor,
                  inactiveColor: AppColors.themeColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                keyboardType: TextInputType.number,
                appContext: context,
                controller: _otpTEController,
                validator: (String? value) {
                  if (value?.length != 6) {
                    return 'Enter you OTP';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 12),
              GetBuilder<OtpVerificationController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    key: ValueKey("nextButton"),
                    onPressed: _onTapNextButton,
                    child: Text('Next'),
                  );
                },
              ),
              const SizedBox(height: 12),
              Obx(
                () => Visibility(
                  visible: !_enableResendCodeButton.value,
                  child: RichText(
                    text: TextSpan(
                      text: 'This code will be expired in ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: '${_remainingTime}s',
                          style: TextStyle(color: AppColors.themeColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: _enableResendCodeButton.value,
                  child: TextButton(
                    onPressed: () {
                      _startRespondCodeTime();
                    },
                    child: const Text("Resend Code"),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool response = await _otpVerificationController.verifyOtp(
        widget.email,
        _otpTEController.text,
      );
      if (response) {
        if (mounted) {
          Navigator.pushNamed(context, CompleteProfileScreen.name);
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
            context,
            _otpVerificationController.errorMessage!,
          );
        }
      }
    }
  }

  @override
  void dispose() {
    timer.cancel();
    _otpTEController.dispose();
    super.dispose();
  }
}
