import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/ui/screens/home.dart';
import 'package:flutter_assignment_2024/presentation/ui/screens/timeline.dart';
import 'package:flutter_assignment_2024/presentation/ui/screens/screen_3.dart';
import 'package:flutter_assignment_2024/presentation/ui/screens/screen_4.dart';
import 'package:get/get.dart';

class MainBottomNavScreenController extends GetxController {
  int currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> screens = [
    const Home(),
    const TimeLine(),
    const Screen3(),
    const Screen4(),
  ];

  void changeScreen(int index) {
    currentTab = index;
    update();
  }
}