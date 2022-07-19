import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/src/pages/home/home_controller.dart';

import '../presentation/src/utils/pages.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
