import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presentation/creditors/creditors_screen.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/reports/reports_screeen.dart';
import '../presentation/transactions/transactions_screen.dart';

class BottonNavController extends GetxController {
  var selectedBottomNavIndex = 0.obs;
  final List<Widget> screens = [
    HomeScreen(),
    CreditorsScreen(),
    TransactionsScreen(),
    const ReportsScreeen(),
  ];

  Widget get currentScreen {
    return screens[selectedBottomNavIndex.value];
  }

  void changeIndex(int index) {
    selectedBottomNavIndex.value = index;
  }
}
