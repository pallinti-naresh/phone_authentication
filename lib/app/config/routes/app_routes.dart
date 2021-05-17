part of 'app_pages.dart';

abstract class Routes {
  static const login = _Paths.login;
  static const registration = _Paths.registration;
}

abstract class _Paths {
  static const login = '/login/';
  static const registration = '/registration/';
}
