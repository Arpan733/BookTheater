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
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      movies[i].bannerUrl,
                      height: 150,
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    movies[i].title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
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
                        "${movies[i].like}%",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

