import 'package:booktheater/utils/dummy_data.dart';
import 'package:booktheater/utils/mytheme.dart';
import 'package:flutter/material.dart';

class CrewCastBlock extends StatelessWidget {
  const CrewCastBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Crew & Casts",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View All >",
                  style: TextStyle(
                    color: Mytheme.splash,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: casts.length,
              itemBuilder: (_, index) {
                return Container(
                  height: 128,
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          casts[index].image,
                          height: 107,
                          width: 80,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 80,
                        child: Text(
                          casts[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
