import 'package:booktheater/controllers/seat_selection_controller.dart';
import 'package:booktheater/model/theater_model.dart';
import 'package:booktheater/utils/dummy_data.dart';
import 'package:booktheater/widgets/noOfSeats.dart';
import 'package:booktheater/widgets/seatType.dart';
import 'package:booktheater/widgets/seat_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/movie_model.dart';
import '../utils/mytheme.dart';
import '../widgets/theater_block.dart';

class SeatSelectionScreen extends StatefulWidget {
  final MovieModel movieModel;
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
              onTap: (index) {
                SeatSelectionController.instance.updateNoOfSeates(index);
                setState(() {});
              },
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
    );
  }

  Widget bottomBar(Function(bool) toggle) => BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            print(SeatSelectionController.instance.isSelecation.value);
            SeatSelectionController.instance.isSelecation.value =
                !SeatSelectionController.instance.isSelecation.value;
          },
          style: ElevatedButton.styleFrom(
            primary: Mytheme.splash,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: const SizedBox(
            width: double.maxFinite,
            height: 50,
            child: Center(
              child: Text(
                "Select Seats",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      bottomNavigationBar:
          bottomBar((value) => SeatSelectionController.instance.isSelecation),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.movieModel.title,
        ),
        actions: [],
      ),
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
