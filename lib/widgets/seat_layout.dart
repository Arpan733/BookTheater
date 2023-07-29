import 'package:flutter/material.dart';

import '../model/seat_layout_model.dart';

class SeatLayout extends StatefulWidget {
  final SeatLayoutModel model;

  const SeatLayout({Key? key, required this.model}) : super(key: key);

  @override
  State<SeatLayout> createState() => _SeatLayoutState();
}

class _SeatLayoutState extends State<SeatLayout> {
  int alphabetCounter = -1;

  int seatCounter = 0;

  @override
  Widget build(BuildContext context) {
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
                          children: List.generate(widget.model.rowBreaks[index],
                              (row) {
                            alphabetCounter++;
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
                                          String.fromCharCode(
                                              65 + alphabetCounter),
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

                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        // color: Colors.red,
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(
                                          color: const Color(0xFF707070),
                                          width: 0.5,
                                        ),
                                      ),
                                      // child: Center(
                                      //   child: Text(
                                      //     "$cols",
                                      //   ),
                                      // ),
                                    ),
                                  );
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
        ],
      ),
    );
  }
}
