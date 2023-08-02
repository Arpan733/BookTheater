import 'package:booktheater/controllers/seat_selection_controller.dart';
import 'package:booktheater/model/theater_model.dart';
import 'package:booktheater/utils/dummy_data.dart';
import 'package:booktheater/widgets/noOfSeats.dart';
import 'package:booktheater/widgets/seatType.dart';
import 'package:booktheater/widgets/seat_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../utils/mytheme.dart';
import '../widgets/theater_block.dart';

class SeatSelectionScreen extends StatefulWidget {
  final dynamic movieModel;
  final TheaterModel theaterModel;

  const SeatSelectionScreen({
    Key? key,
    required this.movieModel,
    required this.theaterModel,
  }) : super(key: key);

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  noOfSeatSelection() {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "How many seats?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Obx(() => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    // padding: const EdgeInsets.symmetric(
                    //     horizontal: 50, vertical: 30),
                    // height: 150,
                    child: SeatSelectionController.instance.getImage(),
                  )),
              NoOfScreen(
                onTap: SeatSelectionController.instance.noOfSeats,
              ),
              const SizedBox(
                height: 10,
              ),
              SeatTypes(
                onTap: SeatSelectionController.instance.seatTypes,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBar({required Function(bool) toggle}) => BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            // print(SeatSelectionController.instance.isSelecation.value);

            if (SeatSelectionController.instance.isSelecation.value) {
              if (SeatSelectionController.instance.seatPrice <= 0.0) {
                AuthController.instance
                    .getErrorSnackBarNew("Please select at least one seat");
                return;
              }
              SeatSelectionController.instance.createPayment(orderID: "123");
            } else {
              if (SeatSelectionController.instance.noOfSeats.value <= 0) {
                AuthController.instance
                    .getErrorSnackBarNew("Please select number of seats");
                return;
              }
              toggle(true);
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Mytheme.splash,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            height: 50,
            child: Obx(
              () => Center(
                child: Text(
                  SeatSelectionController.instance.isSelecation.value
                      ? "Pay ${SeatSelectionController.instance.seatPrice.value}"
                      : "Select Seats",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  PreferredSizeWidget myAppBar(
      {required Function(bool) toggle, required dynamic model}) {
    return AppBar(
      elevation: 0,
      title: Text(
        model['title'],
      ),
      actions: [
        TextButton(
          onPressed: () {
            toggle(false);
            SeatSelectionController.instance.selectedSeats = [].obs;
            SeatSelectionController.instance.seatPrice = 0.0.obs;
          },
          child: Obx(
            () => Text(
              "${SeatSelectionController.instance.noOfSeats < 0 ? 0 : SeatSelectionController.instance.noOfSeats} Seats",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      bottomNavigationBar:
          bottomBar(toggle: SeatSelectionController.instance.isSelecation),
      appBar: myAppBar(
          toggle: SeatSelectionController.instance.isSelecation,
          model: widget.movieModel),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TheaterBlock(
            model: widget.theaterModel,
            onTimeTap: SeatSelectionController.instance.timeSelectedIndex,
            isBooking: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() => SeatSelectionController.instance.isSelecation.value
              ? const SeatLayout(
                  model: seatLayoutModel,
                )
              : noOfSeatSelection()),
        ],
      ),
    );
  }
}
