import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/seat_selection_controller.dart';
import '../utils/dummy_data.dart';
import '../utils/mytheme.dart';

class NoOfScreen extends StatefulWidget {
  final Function(int) onTap;

  const NoOfScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<NoOfScreen> createState() => _NoOfScreenState();
}

class _NoOfScreenState extends State<NoOfScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        alignment: WrapAlignment.spaceAround,
        children: List.generate(s.length, (index) {
          index = index + 1;
          return GestureDetector(
            onTap: () => widget.onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(5),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: index == SeatSelectionController.instance.noOfSeats.value
                    ? Mytheme.greenColor
                    : Colors.white,
              ),
              child: Center(
                child: Text(
                  "${index}",
                  style: TextStyle(
                    color: index ==
                            SeatSelectionController.instance.noOfSeats.value
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
