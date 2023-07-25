import 'package:booktheater/controllers/common_controller.dart';
import 'package:booktheater/controllers/location_controller.dart';
import 'package:booktheater/utils/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/menu_model.dart';
import '../utils/mytheme.dart';
import '../widgets/item_block.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  MenuModel menu = Get.arguments;
  late List<dynamic> list;

  final tabList = ["Now Showing", "Up Coming", "Exclusive"];

  final selectedText = const TextStyle(
    color: Mytheme.splash,
    fontFamily: "poppins",
  );

  final normalText = const TextStyle(
    color: Colors.black45,
    fontFamily: "poppins",
  );

  @override
  void initState() {
    if (menu.name.contains("Movies")) {
      list = movies;
    } else if (menu.name.contains("Events")) {
      list = events;
    } else if (menu.name.contains("Plays")) {
      list = plays;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        CommonController.instance.tabController.animateTo(0);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${menu.name} in ${LocationController.instance.city}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(
                    isMovie: menu.name.contains("Movies") ? true : false,
                    list: list,
                  ),
                );
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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: TabBar(
                tabs: CommonController.instance.tabs,
                controller: CommonController.instance.tabController,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Mytheme.splash,
                    width: 3,
                  ),
                  insets: EdgeInsets.all(15),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                labelStyle: selectedText,
                unselectedLabelStyle: normalText,
                labelColor: Mytheme.splash,
                unselectedLabelColor: Colors.black45,
                enableFeedback: false,
                isScrollable: false,
                onTap: (index) => CommonController.instance.updatePage(index),
              ),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 20, bottom: 20),
            //     child: ListView(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: const NeverScrollableScrollPhysics(),
            //       children: tabList.map((index) {
            //         int i = tabList.indexOf(index);
            //         return GestureDetector(
            //           onTap: () {
            //             CommonController.instance.updatePage(i);
            //           },
            //           child: Obx(
            //             () => Column(
            //               children: [
            //                 Text(
            //                   index,
            //                   style: i ==
            //                           CommonController
            //                               .instance.SelectedIndex.value
            //                       ? selectedText
            //                       : normalText,
            //                 ),
            //                 const SizedBox(
            //                   height: 5,
            //                 ),
            //                 AnimatedContainer(
            //                   duration: const Duration(milliseconds: 300),
            //                   color: Mytheme.splash,
            //                   width: i ==
            //                           CommonController
            //                               .instance.SelectedIndex.value
            //                       ? 50
            //                       : 0,
            //                   height: 3,
            //                 )
            //               ],
            //             ),
            //           ),
            //         );
            //       }).toList(),
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 8,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: CommonController.instance.pagecontroller,
                itemCount: 3,
                itemBuilder: (_, index) => LayoutBuilder(
                  builder: (context, constraints) => GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraints.maxWidth > 480 ? 4 : 2,
                        childAspectRatio: 1,
                      ),
                      itemCount: list.length,
                      itemBuilder: (_, i) {
                        return ItemBlock(
                          model: list[i],
                          height: 180,
                          width: 150,
                          isMovie: menu.name.toLowerCase().contains("Movies"),
                          onTap: (model) {},
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate<String> {
  final bool isMovie;
  final List<dynamic> list;

  MySearchDelegate({
    this.isMovie = false,
    required this.list,
  });

  resultWidget(dynamic model) {
    return ItemBlock(
      model: model,
      height: 180,
      width: 150,
      isMovie: isMovie,
      onTap: (model) {},
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Container()];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null.toString());
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? list
        : list
            .where((element) =>
                element.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return LayoutBuilder(
      builder: (context, constraints) => GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: constraints.maxWidth > 480 ? 4 : 2,
          childAspectRatio: 0.8,
        ),
        itemCount: suggestionList.length,
        itemBuilder: (_, index) => resultWidget(
          suggestionList[index],
        ),
      ),
    );
  }
}
