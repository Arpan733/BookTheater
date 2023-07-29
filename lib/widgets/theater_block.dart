import 'package:booktheater/controllers/calender_controller.dart';
import 'package:booktheater/controllers/location_controller.dart';
import 'package:booktheater/controllers/seat_selection_controller.dart';
import 'package:booktheater/widgets/facility_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/theater_model.dart';
import '../utils/mytheme.dart';

class TheaterBlock extends StatelessWidget {
  final TheaterModel model;
  final bool isBooking;
  final Function(int) onTimeTap;

  const TheaterBlock({
    Key? key,
    required this.model,
    this.isBooking = true,
    required this.onTimeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.635,
                    ),
                    builder: (_) => FacilityBottomSheet(model: model),
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  color: Colors.black45.withOpacity(0.3),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          isBooking
              ? Text(
                  CalendarController.instance.format.format(
                      CalendarController.instance.selectedMovieDate.value),
                  style: const TextStyle(
                    color: Color(0xFF999999),
                  ),
                )
              : RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.location_on,
                          size: 18,
                          color: Color(0xFF999999),
                        ),
                      ),
                      TextSpan(
                        text: "${LocationController.instance.city.value}, ",
                        style: const TextStyle(
                          color: Color(0xFF999999),
                        ),
                      ),
                      const TextSpan(
                        text: "3.3 KM away",
                        style: TextStyle(
                          color: Color(0xFF444444),
                        ),
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Wrap(
              runSpacing: 10,
              spacing: 20,
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(
                model.timings.length,
                (index) {
                  bool isSelected = index ==
                          SeatSelectionController
                              .instance.timeSelectedIndex.value &&
                      isBooking;

                  return GestureDetector(
                    onTap: () {
                      onTimeTap(index);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Mytheme.greenColor
                            : const Color(0x44E5E5E5),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: isSelected
                              ? Mytheme.greenColor
                              : const Color(0xFFE5E5E5),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        model.timings[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : index % 2 == 0
                                  ? Mytheme.orangeColor
                                  : Mytheme.greenColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
