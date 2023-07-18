import 'package:get/get.dart';

import 'auth_view.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthView>(() => AuthView());
  }
}
