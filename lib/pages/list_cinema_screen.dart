import 'package:booktheater/model/movie_model.dart';
import 'package:booktheater/utils/dummy_data.dart';
import 'package:booktheater/widgets/theater_block.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/mytheme.dart';

class ListCinemaScreen extends StatelessWidget {
  final MovieModel model;

  const ListCinemaScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = "";
    String todayDate = DateFormat('dd MMM').format(DateTime.now());
    String tomorrowDate = DateFormat('dd MMM').format(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1));
    String selectedDate = DateFormat('dd MMM').format(DateTime.now());

    String selectedLanguage = "Hindi";
    String selectedScreen = "2D";

    if (selectedDate == todayDate) {
      text = "Today, ";
    } else if (selectedDate == tomorrowDate) {
      text = "Tomorrow, ";
    }

    return Scaffold(
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
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  title: Text(
                    '$text$selectedDate',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
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
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          model.title,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // showSearch(
              //   context: context,
              //   delegate: MySearchDelegate(
              //     isMovie: menu.name.contains("Movies") ? true : false,
              //     list: list,
              //   ),
              // );
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
    );
  }
}
