import 'package:get/get.dart';
import 'package:tyba_restaurant/global/initial_binding.dart';
import 'package:tyba_restaurant/presentation/src/pages/home/home_page.dart';

import '../presentation/src/utils/pages.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        transition: Transition.native,
        binding: InitialBinding()),
    GetPage(
        name: Routes.register,
        page: () => RegisterPage(),
        transition: Transition.native,
        binding: InitialBinding()),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        transition: Transition.native,
        binding: InitialBinding()),
  ];
}
