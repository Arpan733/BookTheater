import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static CommonController instance = Get.find();

  late TabController tabController;
  late List<Tab> tabs;

  final tabList = ["Now Showing", "Up Coming", "Exclusive"];

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

    super.onInit();
  }

  final PageController pagecontroller = PageController();

  updatePage(int Index) {
    pagecontroller.animateToPage(Index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
