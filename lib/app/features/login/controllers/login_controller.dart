import 'package:get/get.dart';
import 'package:phone_authentication/app/config/routes/app_pages.dart';

class LoginController extends GetxController {
  void goToRegistrationScreen() {
    Get.offNamed(Routes.registration);
  }

  void goToAuthenticationScreen() {
    Get.toNamed(Routes.authentication);
  }
}
