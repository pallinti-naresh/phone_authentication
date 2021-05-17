import 'package:get/get.dart';
import 'package:phone_authentication/app/config/routes/app_pages.dart';

class RegistrationController extends GetxController {
  void goToLoginScreen() {
    Get.offNamed(Routes.login);
  }
}
