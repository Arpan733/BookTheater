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
                  title: Text(
                    DateFormat('MMM DD').format(DateTime.now()),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
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
