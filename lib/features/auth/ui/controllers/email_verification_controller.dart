import 'package:get/get.dart';
import 'package:projects/app/urls.dart';
import 'package:projects/services/network_caller/network_caller.dart';

class EmailVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  Future<bool> verifyEmail(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.verifyEmailUrl(email));

    if (response.isSuccess) {
      isSuccess = true;
    } else {}
    return isSuccess;
  }
}
