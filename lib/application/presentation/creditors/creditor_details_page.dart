import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/model/creditor/creditor_model.dart';
import '../../business_logic/creditor_details_controller.dart';
import '../../business_logic/home_controller.dart';
import '../widget/custom_listtile_decoration.dart';
import 'add_transaction_page.dart';

class CreditorDetailsPage extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final CreditorDetailsController crediController =
      Get.put(CreditorDetailsController());

  CreditorDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final transactions = crediController.transactions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creditor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRowWidget('Name', crediController.creditor.value.name),
              CustomRowWidget('Phone Number',
                  crediController.creditor.value.phoneNumber.toString()),
              crediController.creditor.value.address == ''
                  ? const SizedBox()
                  : CustomRowWidget(
                      'Address', crediController.creditor.value.address),
              CustomRowWidget(
                  'Total Outstanding Credit',
                  crediController.creditor.value.totalOutstandingCredit
                      .toString()),
              const SizedBox(height: 20),
              const Text('Transactions:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemCount: crediController.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = crediController.transactions[index];
                      return CustomListTileDecoration(
                        listTile: ListTile(
                          title: Text(transaction.type == 'credit'
                              ? 'Credit'
                              : 'Payment'),
                          subtitle: Text(transaction.date.toString()),
                          trailing:
                              Text('Amount: ${transaction.amount.toString()}'),
                        ),
                      );
                    },
                  ),
                );
              }),
              ElevatedButton(
                onPressed: () {
                  // Add transaction functionality (optional)
                  // Get.toNamed('/add-transaction', arguments: creditor);
                  Get.to(AddTransactionPage(
                    creditorId: crediController.creditor.value.id,
                  ));
                },
                child: const Text('Add Transaction'),
              ),
            ],
          );
        }),
      ),
    );
  }

  // Helper method to build information rows
  Widget CustomRowWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
