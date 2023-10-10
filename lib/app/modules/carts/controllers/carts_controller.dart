import 'package:get/get.dart';

class CartsController extends GetxController {
  RxBool isConfirmation = false.obs;
  RxBool isYes = false.obs;
  RxBool isCompleted = true.obs;

  void toggleConfirmation() {
    isConfirmation.value = !isConfirmation.value;
  }

  void toggleSyarat() {
    isYes.value = !isYes.value;
  }

  void toggleCompleted() {
    isCompleted.value = !isCompleted.value;
  }
}
