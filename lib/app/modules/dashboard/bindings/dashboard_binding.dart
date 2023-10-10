import 'package:books/app/modules/carts/controllers/carts_controller.dart';
import 'package:books/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CartsController>(() => CartsController());
  }
}
