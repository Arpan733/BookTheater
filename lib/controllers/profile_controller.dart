import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  RxBool isEditName = false.obs;
  RxBool isEditMoNumber = false.obs;

  toggleEditName() {
    if (isEditName.isTrue) {
      isEditName.toggle();
    } else {
      isEditName.value = true;
    }
  }

  toggleEditMoNumber() {
    if (isEditMoNumber.isTrue) {
      isEditMoNumber.toggle();
    } else {
      isEditMoNumber.value = true;
    }
  }
}
