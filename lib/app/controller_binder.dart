import 'package:get/get.dart';
import 'package:projects/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:projects/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:projects/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:projects/services/network_caller/network_caller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
  }
}
