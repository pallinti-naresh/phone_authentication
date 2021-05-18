import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:phone_authentication/app/config/routes/app_pages.dart';

class HomeController extends GetxController {
  final _auth = FirebaseAuth.instance;

  void logout() async {
    await _auth.signOut().then((value) => Get.offNamed(Routes.login));
  }
}
