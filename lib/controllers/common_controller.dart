import 'package:booktheater/utils/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static CommonController instance = Get.find();

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

    super.onInit();
  }

  final PageController pagecontroller = PageController();

  updatePage(int Index) {
    pagecontroller.animateToPage(Index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  updateScreen(String screen1) {
    screen = screen1.obs;
    update();
  }
}
