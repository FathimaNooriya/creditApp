import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/core/theme/colors.dart';
import '../../business_logic/home_controller.dart';
import '../widget/custom_alert_box.dart';
import '../widget/custom_listtile_decoration.dart';
import '../widget/top_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: height * .1,
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    homeController.creditorsList.isEmpty
                        ? const CircularProgressIndicator()
                        : TopContainer(
                            height: height,
                            tittle: "Creditors",
                            value:
                                homeController.creditorsList.length.toDouble(),
                          ),
                    TopContainer(
                      height: height,
                      tittle: "Outstanding credit",
                      value: homeController.totalOutstandingCredit.value,
                    ),
                  ],
                )),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text("Recent Transactions")),
            ),
            // Obx(
            //   () {
            // if (controller.creditors.isEmpty) {
            //   return Center(child: CircularProgressIndicator());
            // }
            // return
            SizedBox(
              height: height * .7,
              child: ListView.builder(
                itemCount: 10,
                //controller.creditors.length,
                itemBuilder: (context, index) {
                  //  final creditor = controller.creditors[index];
                  return const CustomListTileDecoration(
                    listTile: ListTile(
                        title: Text("Creditor Name"),
                        subtitle: Text('Transaction Type'),
                        trailing: Text("Amound")),
                  );
                  // },
                  // );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Get.dialog(
            CustomAlertBox(homeController: homeController),
          );
        },

        //   },
        child: const Expanded(child: Text("Add creditor")),
      ),
    );
  }
}
