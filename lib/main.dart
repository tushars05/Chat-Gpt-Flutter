import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'app/routes/app_pages.dart';
import 'auth_module/auth_view.dart';
import 'app/modules/home/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase

  await Future.delayed(const Duration(seconds: 3)); // Add delay for splash screen

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Bot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.AUTHENTICATION,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.HOME:
            if (FirebaseAuth.instance.currentUser != null) {
              return GetPageRoute(
                settings: settings,
                page: () => HomeView(),
              );
            } else {
              return GetPageRoute(
                settings: settings,
                page: () => AuthView(),
              );
            }
          default:
            return null;
        }
      },
    );
  }
}
