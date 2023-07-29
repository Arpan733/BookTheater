import 'package:booktheater/controllers/seat_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dummy_data.dart';
import '../utils/mytheme.dart';

class SeatTypes extends StatefulWidget {
  final Function(int) onTap;

  const SeatTypes({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SeatTypes> createState() => _SeatTypesState();
}

class _SeatTypesState extends State<SeatTypes> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        alignment: WrapAlignment.spaceAround,
        children: List.generate(
            seatLayoutModel.seatTypes.length,
            (index) => GestureDetector(
                  onTap: () => widget.onTap(index),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: index ==
                                SeatSelectionController.instance.seatTypes.value
                            ? Mytheme.greenColor
                            : const Color(0xFFFCFCFC),
                        border: Border.all(
                          color: index ==
                                  SeatSelectionController
                                      .instance.seatTypes.value
                              ? Mytheme.greenColor
                              : const Color(0xFFE5E5E5),
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            seatLayoutModel.seatTypes[index]["title"] as String,
                            style: TextStyle(
                              color: index ==
                                      SeatSelectionController
                                          .instance.seatTypes.value
                                  ? Colors.white
                                  : const Color(0xFF999999),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "₹ ${seatLayoutModel.seatTypes[index]["price"]}",
                            style: TextStyle(
                              color: index ==
                                      SeatSelectionController
                                          .instance.seatTypes.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            seatLayoutModel.seatTypes[index]["status"]
                                as String,
                            style: TextStyle(
                              color: index ==
                                      SeatSelectionController
                                          .instance.seatTypes.value
                                  ? Colors.white
                                  : const Color(0xFF999999),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )).toList(),
      ),
    );
  }
}
