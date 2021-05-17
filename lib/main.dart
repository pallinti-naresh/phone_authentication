import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_authentication/app/config/routes/app_pages.dart';
import 'package:phone_authentication/app/config/themes/app_basic_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Application error"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            initialRoute: AppPages.initial,
            title: 'Phone Authentication',
            theme: AppBasicTheme.getThemeData(),
            getPages: AppPages.routes,
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
