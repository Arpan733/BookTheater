import 'package:booktheater/controllers/movie_controller.dart';
import 'package:booktheater/pages/detail_page.dart';
import 'package:booktheater/pages/view_all_screen.dart';
import 'package:booktheater/utils/dummy_data.dart';
import 'package:booktheater/utils/mytheme.dart';
import 'package:booktheater/widgets/item_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.27,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, i) {
          if (i < 9) {
            return Hero(
              tag: "${MovieController.instance.trendingMovies[i]['title']}$i",
              child: ItemBlock(
                model: MovieController.instance.trendingMovies[i],
                isMovie: true,
                onTap: (model) {
                  Get.to(() => DetailPage(), arguments: [
                    MovieController.instance.trendingMovies[i],
                    i
                  ]);
                },
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ViewAllScreen(), arguments: menus[0]);
                },
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Mytheme.splash,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          ">",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "View More",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
