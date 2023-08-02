import 'package:booktheater/pages/view_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dummy_data.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.125,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menus.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
            child: GestureDetector(
              onTap: () {
                if (i <= 2) {
                  Get.to(() => const ViewAllScreen(), arguments: menus[i]);
                }
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      menus[i].image,
                      height: 35,
                      width: 35,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    menus[i].name,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
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
