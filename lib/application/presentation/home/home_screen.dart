import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../business_logic/home_controller.dart';
import '../../business_logic/transaction_controller.dart';
import '../widget/custom_alert_box.dart';
import '../widget/custom_listtile_decoration.dart';
import '../widget/top_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  final TransactionController transactionController =
      Get.put(TransactionController());
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
            Obx(
              () {
                if (transactionController.allTransactionList.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  height: height * .7,
                  child: ListView.builder(
                    itemCount: transactionController.allTransactionList.length,
                    itemBuilder: (context, index) {
                      final transaction =
                          transactionController.allTransactionList[index];
                      return CustomListTileDecoration(
                        clr: transaction.type == "credit"
                            ? const Color.fromARGB(199, 244, 67, 54)
                            : const Color.fromARGB(158, 76, 175, 79),
                        listTile: ListTile(
                            title: Text(transaction.amount.toString()),
                            subtitle: Text(transaction.type),
                            trailing: Text(transaction.date.toString())),
                      );
                    },
                  ),
                );
              },
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
        child: const Expanded(child: Text("Add creditor")),
      ),
    );
  }
}
