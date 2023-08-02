import 'package:booktheater/controllers/movie_controller.dart';
import 'package:booktheater/utils/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static CommonController instance = Get.find();
  RxList list = MovieController.instance.trendingMovies;

  late TabController tabController;
  late List<Tab> tabs;

  final tabList = ["Now Showing", "Up Coming", "Exclusive"];

  late RxString screen;

  @override
  void dispose() {
    pagecontroller.dispose();

    super.dispose();
  }

  @override
  void onInit() {
    tabController = TabController(length: tabList.length, vsync: this);
    tabs = tabList
        .map((e) => Tab(
              text: e,
            ))
        .toList();
    screen = screens[0].obs;
    list = MovieController.instance.trendingMovies;

    super.onInit();
  }

  final PageController pagecontroller = PageController();

  updatePage(int Index) {
    pagecontroller.animateToPage(Index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);

    if (Index == 0) {
      list = MovieController.instance.trendingMovies;
    } else if (Index == 1) {
      list = MovieController.instance.upComingMovies;
    } else if (Index == 2) {
      list = MovieController.instance.popularMovies;
    }
  }

  updateScreen(String screen1) {
    screen = screen1.obs;
    update();
  }
}
