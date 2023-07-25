import 'package:booktheater/utils/mytheme.dart';
import 'package:booktheater/widgets/offers_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cast_crew_block.dart';
import '../widgets/review_block.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  final dynamic model = Get.arguments[0];
  final int index = Get.arguments[1];

  titleWidget(model) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${model.title}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.favorite_rounded,
                color: Colors.pinkAccent,
              ),
              const SizedBox(
                width: 2.5,
              ),
              Text(
                "${model.like}%",
              ),
            ],
          ),
        ],
      );

  final screenWidget = Row(
    children: [
      const Text(
        "Hindi",
        style: TextStyle(
          color: Colors.pinkAccent,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        color: Colors.pinkAccent.withOpacity(0.1),
        child: const Text(
          "2D",
          style: TextStyle(
            color: Colors.pinkAccent,
          ),
        ),
      ),
    ],
  );

  final descriptionWidget = RichText(
    text: TextSpan(children: [
      const WidgetSpan(
        child: Icon(
          Icons.history,
          size: 15,
          color: Colors.black45,
        ),
      ),
      const WidgetSpan(
        child: SizedBox(
          width: 10,
        ),
      ),
      const TextSpan(
        text: "2h 50m",
        style: TextStyle(
          color: Colors.black45,
        ),
      ),
      const WidgetSpan(
        child: SizedBox(
          width: 10,
        ),
      ),
      WidgetSpan(
        child: Image.asset(
          "assets/images/Theater_Mask.png",
          height: 15,
          width: 15,
          fit: BoxFit.fitHeight,
        ),
      ),
      const WidgetSpan(
        child: SizedBox(
          width: 10,
        ),
      ),
      const TextSpan(
        text: "Drama, Romance",
        style: TextStyle(
          color: Colors.black45,
        ),
      ),
    ]),
  );

  Block(model) => Container(
        color: Colors.white,
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleWidget(model),
            const SizedBox(
              height: 2.5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PG-13 | 25 Dec 2009",
                  style: TextStyle(color: Colors.black45),
                ),
                Text(
                  "414K votes",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2.5,
            ),
            screenWidget,
            const SizedBox(
              height: 10,
            ),
            descriptionWidget,
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {},
          child: Container(
            width: double.maxFinite,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_seat,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Book Seats",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Mytheme.splash,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            backgroundColor: Mytheme.appbarColor,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "${model.title}$index",
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/movies/3IdiotsBanner.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                color: const Color(0xFFF5F5FA),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Block(model),
                    const SizedBox(
                      height: 20,
                    ),
                    const OffersBlock(),
                    const SizedBox(
                      height: 20,
                    ),
                    const ReviewBlock(),
                    const SizedBox(
                      height: 20,
                    ),
                    const CrewCastBlock(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
