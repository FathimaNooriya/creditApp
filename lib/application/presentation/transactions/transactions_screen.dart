import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../business_logic/transaction_controller.dart';
import '../widget/custom_listtile_decoration.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});
  final TransactionController controller = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction"),
      ),
      body: Obx(
        () {
          if (controller.allTransactionList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Expanded(
            child: ListView.builder(
              itemCount: controller.allTransactionList.length,
              itemBuilder: (context, index) {
                final transaction = controller.allTransactionList[index];
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
    );
  }
}
