import 'package:flutter/material.dart';

import 'dummy_data.dart';

class EventsItem extends StatelessWidget {
  const EventsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.27,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
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
                      events[i].bannerUrl,
                      height: 150,
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    events[i].title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    events[i].description,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
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
