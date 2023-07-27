import 'package:booktheater/model/movie_model.dart';
import 'package:booktheater/utils/dummy_data.dart';
import 'package:booktheater/widgets/theater_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/calender_controller.dart';
import '../controllers/common_controller.dart';
import '../utils/custom_calender.dart';
import '../utils/mytheme.dart';
import '../widgets/screen_selection_block.dart';

class ListCinemaScreen extends StatefulWidget {
  final MovieModel model;

  const ListCinemaScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<ListCinemaScreen> createState() => _ListCinemaScreenState();
}

class _ListCinemaScreenState extends State<ListCinemaScreen> {
  final DateFormat format = DateFormat("dd MMM");

  final now = DateTime.now();

  String selectedDate = DateFormat("dd MMM").format(DateTime.now());

  String selectedLanguage = "Hindi";

  String selectedScreen = "2D";
  late CalendarController commonController;

  @override
  void initState() {
    commonController = Get.put(CalendarController());
    // Get.put(SeatSelectionController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.delete<CalendarController>();
        print(commonController.selectedMovieDate.value);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5FA),
        bottomNavigationBar: BottomAppBar(
          color: Mytheme.statusBarColor,
          elevation: 0,
          child: Container(
            height: AppBar().preferredSize.height,
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: StatefulBuilder(
                    builder: (_, setState) {
                      final todayDate = format.format(now);
                      final tomorrowDate =
                          format.format(now.add(const Duration(days: 1)));
                      String text = "";

                      if (selectedDate == todayDate) {
                        text = "Today, ";
                      } else if (selectedDate == tomorrowDate) {
                        text = "Tomorrow, ";
                      } else {
                        text =
                            "${DateFormat("EEE").format(commonController.selectedMovieDate.value)}, ";
                      }

                      return ListTile(
                        onTap: () {
                          showModalBottomSheet(
                                  context: context,
                                  builder: (_) => const CustomCalendar(),
                                  constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.35))
                              .then((value) => setState(() {
                                    if (value != null) {
                                      selectedDate = format.format(value);
                                    }
                                  }));
                        },
                        horizontalTitleGap: 0,
                        textColor: Colors.white,
                        leading: const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                        title: Text(
                          "$text$selectedDate",
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return ListTile(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (_) => ScreenSelectionBlock(
                                    onScreenSelect: (screen) {
                                      CommonController.instance
                                          .updateScreen(screen);
                                      setState(() => selectedScreen = screen);
                                    },
                                  ),
                              constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height *
                                          0.25));
                        },
                        horizontalTitleGap: 0,
                        title: Text(
                          '$selectedLanguage,$selectedScreen',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            widget.model.title,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: TheaterSearchDelegate(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                child: Image.asset(
                  "assets/images/Search.png",
                  height: 25,
                ),
              ),
            )
          ],
          elevation: 0,
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: theaters.length,
          itemBuilder: (_, index) {
            return Container(
              padding: EdgeInsets.only(
                  top: 5, bottom: index != theaters.length - 1 ? 20 : 0),
              child: TheaterBlock(model: theaters[index]),
            );
          },
        ),
      ),
    );
  }
}

class TheaterSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Container()];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null.toString());
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionTheater = query.isEmpty
        ? theaters
        : theaters
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: suggestionTheater.length,
      itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.only(
              top: 5, bottom: index != suggestionTheater.length - 1 ? 20 : 0),
          child: TheaterBlock(model: suggestionTheater[index]),
        );
      },
    );
  }
}
