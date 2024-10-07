import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../business_logic/creditor_details_controller.dart';
import '../../business_logic/home_controller.dart';
import '../widget/custom_alert_box.dart';
import '../widget/custom_listtile_decoration.dart';
import 'creditor_details_page.dart';

class CreditorsScreen extends StatelessWidget {
  CreditorsScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    //   double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creditors"),
      ),
      body: Obx(
        () {
          if (homeController.creditorsList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Expanded(
            child: ListView.builder(
              itemCount: homeController.creditorsList.length,
              itemBuilder: (context, index) {
                final creditor = homeController.creditorsList[index];
                return CustomListTileDecoration(
                  listTile: ListTile(
                    onTap: () {
                      final CreditorDetailsController controller = Get.put(
                          CreditorDetailsController(creditorId: creditor.id));
                      controller.fetchTransactions();
                      Get.to(CreditorDetailsPage(
                        creditor: creditor,
                      ));
                      // Get.to(CreditorDetailsPage(
                      //   creditorId: creditor.id,
                      // ));
                    },
                    title: Text(creditor.name),
                    subtitle: Text(creditor.totalOutstandingCredit.toString()),
                    leading: const Text("Active"),
                    // Text("Settled"),
                    trailing: SizedBox(
                      width: width * .3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              homeController.editCreditorFunction(
                                  id: creditor.id);
                              homeController.isEdit = true.obs;
                              Get.dialog(
                                CustomAlertBox(homeController: homeController),
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title: "Delete Creditor",
                                middleText:
                                    "Are you sure you want to delete this creditor?",
                                textCancel: "No",
                                textConfirm: "Yes",
                                onConfirm: () {
                                  homeController.deleteCreditFunction(
                                      id: creditor.id);
                                  Get.back(); // Close the dialog
                                  homeController.deleteCreditFunction(
                                      id: creditor.id);
                                  Get.back(); // Go back to previous page
                                },
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
