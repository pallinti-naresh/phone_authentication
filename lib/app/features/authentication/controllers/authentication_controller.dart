import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_authentication/app/config/routes/app_pages.dart';
import 'package:phone_authentication/app/utils/services/firebase_services.dart';

class AuthenticationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final otp = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late final Registrant? registrant;
  late final String? phoneNumber;

  String? verificationId;
  final isLoading = true.obs;

  final _durationTimeOut = Duration(seconds: 10);
  final isCanResendCode = false.obs;
  final durationCountdown = 0.obs;

  @override
  void onInit() {
    registrant = _getUser();
    phoneNumber = _getPhoneNumber();
    verifyPhoneNumber();
    super.onInit();
  }

  void verifyPhoneNumber() async {
    isLoading.value = true;

    isCanResendCode.value = false;
    String? _phoneNumber = phoneNumber ?? registrant?.phoneNumber;

    if (_phoneNumber != null) {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          log("verify phone number : verification completed");
          await _auth.signInWithCredential(phoneAuthCredential);

          if (registrant != null) {
            _saveRegistrantAndGoToHome();
          } else {
            _goToHome();
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          isLoading.value = false;
          Get.snackbar("Verification Failed", e.code,
              snackPosition: SnackPosition.BOTTOM);
        },
        codeSent: (verificationId, forceResendingToken) async {
          log("verify phone number : code success send");
          this.verificationId = verificationId;
          isLoading.value = false;
          _validateCountdownResendCode();
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: _durationTimeOut,
      );
    }
  }

  void verifySmsCode() async {
    if (formKey.currentState!.validate() && verificationId != null) {
      isLoading.value = true;

      var _credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: otp.text);

      await _auth.signInWithCredential(_credential);

      isLoading.value = false;

      if (_auth.currentUser != null) {
        /// authentication success
        if (registrant != null) {
          _saveRegistrantAndGoToHome();
        } else {
          _goToHome();
        }
      } else {
        /// authentication faileed
        Get.snackbar("Invalid Code", "Please enter the correct code",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  void _saveRegistrantAndGoToHome() {
    UserServices.addUser(
      registrant!,
      onSuccess: () => _goToHome(),
      onError: (e) => isLoading.value = false,
    );
  }

  void _goToHome() {
    isLoading.value = false;
    Get.offAllNamed(Routes.home);
  }

  void _validateCountdownResendCode() {
    isCanResendCode.value = false;
    var maxDurationInSecond = _durationTimeOut.inSeconds;
    var currentDurationSecond = 0;
    durationCountdown.value = maxDurationInSecond;

    Timer.periodic(Duration(seconds: 1), (timer) {
      currentDurationSecond++;
      if (maxDurationInSecond - currentDurationSecond >= 0) {
        durationCountdown.value = maxDurationInSecond - currentDurationSecond;
      } else {
        isCanResendCode.value = true;
        timer.cancel();
      }
    });
  }

  Registrant? _getUser() {
    try {
      return Get.arguments as Registrant;
    } catch (_) {
      return null;
    }
  }

  String? _getPhoneNumber() {
    try {
      return Get.parameters['phone_number'];
    } catch (_) {
      return null;
    }
  }
}
