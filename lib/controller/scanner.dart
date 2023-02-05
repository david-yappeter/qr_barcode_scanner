import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScannerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController _tabBarController;
  TabController get tabBarController => _tabBarController;

  @override
  void onInit() {
    _tabBarController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    _tabBarController.dispose();
    super.onClose();
  }
}
