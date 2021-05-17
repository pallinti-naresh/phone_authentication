import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_authentication/app/config/routes/app_pages.dart';
import 'package:phone_authentication/app/utils/services/firebase_services.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();

  void goToLoginScreen() {
    Get.offNamed(Routes.login);
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      UserServices.phoneNumberExists(phoneNumber.text.trim(), onError: (_) {})
          .then((exist) {
        if (exist) {
          Get.snackbar("Registration Failed", "Phone Number already exists");
        } else {
          Get.snackbar("Sending OTP", "check your message");
          Get.toNamed(
            Routes.authentication,
            arguments: User(name: name.text, phoneNumber: phoneNumber.text),
          );
        }
      });
    }
  }
}
