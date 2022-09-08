import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController{
  late TabController tabController;

  void onTabTapped(int index) {
    tabController.index = index;
    update();
  }



}
