import 'package:get/get.dart';

import '../modules/chat_text/bindings/chat_text_binding.dart';
import '../modules/chat_text/views/chat_text_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/screens/profile_view.dart';
import '../modules/home/views/home_view.dart';

import '../auth_module/auth_view.dart';
import '../auth_module/auth_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
    ),
    GetPage(
      name: Routes.CHAT_TEXT,
      page: () => const ChatTextView(),
      binding: ChatTextBinding(),
    ),
    GetPage(
      name: Routes.AUTHENTICATION,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
  ];
}

abstract class Routes {
  static const HOME = '/';
  static const PROFILE = '/profile';
  static const CHAT_TEXT = '/chat-text';
  static const AUTHENTICATION = '/authentication';
}
