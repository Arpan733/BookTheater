import 'package:booktheater/widgets/item_block.dart';
import 'package:flutter/material.dart';

import 'dummy_data.dart';

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
        itemCount: movies.length,
        itemBuilder: (_, i) {
          return ItemBlock(
            model: movies[i],
            isMovie: true,
          );
        },
      ),
    );
  }
}
