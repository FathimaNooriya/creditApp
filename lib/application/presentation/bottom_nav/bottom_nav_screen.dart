import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../business_logic/botton_nav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  final BottonNavController navController = Get.put(BottonNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: navController.currentScreen,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navController.selectedBottomNavIndex.value,
            onTap: navController.changeIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: 'Creditors'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.money), label: 'Transactions'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart), label: 'Reports'),
            ],
          ),
        ));
  }
}
