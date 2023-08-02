import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/seat_selection_controller.dart';
import '../model/seat_layout_model.dart';
import '../utils/mytheme.dart';

class SeatLayout extends StatefulWidget {
  final SeatLayoutModel model;

  const SeatLayout({Key? key, required this.model}) : super(key: key);

  @override
  State<SeatLayout> createState() => _SeatLayoutState();
}

class _SeatLayoutState extends State<SeatLayout> {
  int alphabetCounter = -1;
  int seatCounter = 0;
  double amount = 0.0;

  Widget mainSeatLayout(
      {required Function(double) seatPrice,
      required double price,
      required String rowNo}) {
    String seatNo = "$seatCounter";
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          var seat = SeatSelectionController.instance.selectedSeats;

          if (seat.contains("$rowNo$seatNo")) {
            seat.remove("$rowNo$seatNo");
            SeatSelectionController.instance.seatPriceList.removeAt(0);
          } else {
            if (seat.length >
                SeatSelectionController.instance.noOfSeats.value - 1) {
              seat.removeAt(0);
              SeatSelectionController.instance.seatPriceList.removeAt(0);
              seat.add("$rowNo$seatNo");
              SeatSelectionController.instance.seatPriceList.add(price);
            } else {
              seat.add("$rowNo$seatNo");
              SeatSelectionController.instance.seatPriceList.add(price);
            }
          }

          amount = SeatSelectionController.instance.seatPriceList
              .fold(0, (prev, e) => prev + e);
          seatPrice(amount < 0 ? 0.0 : amount);
        },
        child: Obx(
          () {
            Color backgroundColor = SeatSelectionController
                    .instance.selectedSeats
                    .contains("$rowNo$seatNo")
                ? Mytheme.greenColor
                : const Color(0xFFFFFFFF);
            Color borderColor = SeatSelectionController.instance.selectedSeats
                    .contains("$rowNo$seatNo")
                ? Mytheme.greenColor
                : const Color(0xFF707070);
            Color textColor = SeatSelectionController.instance.selectedSeats
                    .contains("$rowNo$seatNo")
                ? Colors.white
                : Colors.black87;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: borderColor,
                  width: 0.5,
                ),
              ),
              child: Center(
                child: Text(
                  seatNo,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    alphabetCounter = -1;
    int seatLength = widget.model.seatTypes.length;

    return Expanded(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40,
                child: Image.asset(
                  "assets/images/Screen.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Text(
                "Screen Here",
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: InteractiveViewer(
              panEnabled: true,
              child: ListView.builder(
                itemCount: widget.model.seatTypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.model.seatTypes[seatLength - index - 1]['price']} ${widget.model.seatTypes[seatLength - index - 1]['title']}",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(
                                widget.model.rowBreaks[index], (row) {
                              alphabetCounter++;
                              seatCounter = 0;
                              String rowNo =
                                  String.fromCharCode(65 + alphabetCounter);
                              return Wrap(
                                children: List.generate(
                                  widget.model.cols + 1,
                                  (cols) {
                                    if (cols == 0) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Text(
                                            rowNo,
                                          ),
                                        ),
                                      );
                                    }

                                    if ((cols == widget.model.gapColIndex ||
                                            cols ==
                                                widget.model.gapColIndex +
                                                    widget.model.gap -
                                                    1) &&
                                        (row ==
                                                widget.model.rowBreaks[index] -
                                                    1 ||
                                            widget.model.isLastFilled)) {
                                      return const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                        ),
                                      );
                                    }

                                    seatCounter++;
                                    double price = widget.model
                                            .seatTypes[seatLength - index - 1]
                                        ['price'];

                                    return mainSeatLayout(
                                        seatPrice: SeatSelectionController
                                            .instance.seatPrice,
                                        price: price,
                                        rowNo: rowNo);
                                  },
                                ),
                              );
                            }),
                          ),
                        ],
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
