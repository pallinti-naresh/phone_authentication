import 'package:get/get.dart';
import 'package:phone_authentication/app/features/login/bindings/login_binding.dart';
import 'package:phone_authentication/app/features/login/views/screens/login_screen.dart';
import 'package:phone_authentication/app/features/registration/views/registration_screen.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(name: _Paths.registration, page: () => RegistrationScreen())
  ];
}
