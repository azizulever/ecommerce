import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:projects/app/app_colors.dart';
import 'package:projects/app/app_constants.dart';
import 'package:projects/features/auth/ui/widgets/app_logo_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  final RxBool _enableResendCodeButton = false.obs;

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
                'A 4 digit otp has been sent to your email',
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
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                key: ValueKey("nextButton"),
                onPressed: () {
                  // if(_formKey.currentState!.validate()) {}
                },
                child: Text('Next'),
              ),
              const SizedBox(height: 12),
              // TODO: enable button when 120s is done and invisible the text
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
}
