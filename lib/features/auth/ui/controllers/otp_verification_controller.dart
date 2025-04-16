import 'package:get/get.dart';
import 'package:projects/app/urls.dart';
import 'package:projects/services/network_caller/network_caller.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final requestParams = {"email": email, "otp": otp};
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.verifyOtpUrl(email, otp), body: requestParams);

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
