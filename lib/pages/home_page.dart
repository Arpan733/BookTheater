import 'package:booktheater/controllers/auth_controller.dart';
import 'package:booktheater/utils/constants.dart';
import 'package:booktheater/utils/custom_slider.dart';
import 'package:booktheater/utils/menu_item.dart';
import 'package:booktheater/utils/movies_item.dart';
import 'package:booktheater/utils/mytheme.dart';
import 'package:booktheater/utils/dummy_data.dart';
import 'package:booktheater/utils/play_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/event_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = cities[0];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Mytheme.statusBarColor));

    final Size size = MediaQuery.of(context).size;

    String? PicUrl = AuthController.instance.user?.photoURL;
    PicUrl = PicUrl ?? Constants.dummyAvatar;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  PicUrl,
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            title: Column(
              children: [
                const Text(
                  "Name",
                ),
                DropdownButton(
                  value: city,
                  isDense: true,
                  dropdownColor: Mytheme.statusBarColor,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  items: cities.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (st) {
                    setState(() {
                      city = st!;
                    });
                  },
                )
              ],
            ),
            actions: [
              IconButton(
                icon: Image.asset(
                  "assets/images/Search.png"
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  "assets/images/Notification.png"
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.2,
                  width: size.width,
                  color: Colors.red,
                  child: PageView.builder(
                    itemCount: 3,
                    itemBuilder: (_, i) {
                      return const CustomSlider();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "SEAT CATEGORIES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                const MenuItem(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "RECOMMENDED CATEGORIES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
                const MoviesItem(),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "NEAR BY THEATERS",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black.withOpacity(0.6),
                //         ),
                //       ),
                //       TextButton(
                //         onPressed: () {},
                //         child: const Text(
                //           "View All",
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: Mytheme.splash,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   height: size.height * 0.2,
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: GoogleMap(
                //     mapType: MapType.normal,
                //     initialCamaraPosition: _kGooglePlex,
                //     onMapCreated: (GoogleMapController controller) {
                //       // _controller.complete(controller);
                //     },
                //     zoomControlsEnabled: false,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/Event.png",
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "EVENTS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Mytheme.splash,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const EventsItem(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/Play.png",
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "PLAY",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Mytheme.splash,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PlayItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

