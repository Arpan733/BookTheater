import 'package:flutter/material.dart';

class ItemBlock extends StatelessWidget {
  final dynamic model;
  final isMovie;
  final double height;
  final double width;

  final Function(dynamic model) onTap;

  const ItemBlock({
    Key? key,
    required this.model,
    this.isMovie = false,
    this.height = 150,
    this.width = 120,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
      child: GestureDetector(
        onTap: () {
          onTap(model);
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: isMovie
                    ? Image.network(
                        "https://image.tmdb.org/t/p/w500${model['poster_path']}",
                        height: height,
                        width: width,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        model.bannerUrl,
                        height: height,
                        width: width,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: width,
                child: Text(
                  isMovie ? model['title'] ?? "" : model.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              isMovie
                  ? Row(
                      children: [
                        const Icon(
                          Icons.favorite_rounded,
                          color: Colors.pinkAccent,
                        ),
                        const SizedBox(
                          width: 2.5,
                        ),
                        Text(
                          "${(model['vote_average'] * 10).toInt()}",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      model.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
