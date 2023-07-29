import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatSelectionController extends GetxController {
  static SeatSelectionController instance = Get.find();
  RxInt timeSelectedIndex = 0.obs;
  static int indexValue = -1;
  RxInt noOfSeats = indexValue.obs;
  RxInt seatTypes = indexValue.obs;
  RxBool isSelecation = false.obs;

  Widget getImage() {
    int val = noOfSeats.value;

    if (val <= 2) {
      return Container(
        height: 150,
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Image.asset(
          "assets/images/Vespa.png",
          fit: BoxFit.fill,
        ),
      );
    } else if (val > 2 && val <= 4) {
      return SizedBox(
        height: 150,
        child: Image.asset(
          "assets/images/Car.png",
        ),
      );
    } else if (val > 4 && val <= 8) {
      return SizedBox(
        height: 150,
        child: Image.asset(
          "assets/images/Van.png",
        ),
      );
    } else {
      return SizedBox(
        height: 150,
        child: Image.asset(
          "assets/images/Bus.png",
        ),
      );
    }
  }

  updateNoOfSeates(int value) {
    noOfSeats = value.obs;
    update();
  }
}
