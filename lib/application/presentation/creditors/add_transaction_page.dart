import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../business_logic/transaction_controller.dart';
import '../widget/custom_textField.dart';

class AddTransactionPage extends StatelessWidget {
  final String creditorId;
  const AddTransactionPage({super.key, required this.creditorId});
  @override
  Widget build(BuildContext context) {
    final TransactionController controller = Get.put(TransactionController());

    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.transactionFormKey,
          child: Column(
            children: [
              const Text("Enter the amount"),
              CustomTextFeild(
                controller: controller.amountController,
                label: "Amount",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.descriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Note',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: controller.transactionType.value,
                  onChanged: (value) =>
                      controller.transactionType.value = value!,
                  items: const [
                    DropdownMenuItem(value: 'credit', child: Text('Credit')),
                    DropdownMenuItem(value: 'payment', child: Text('Payment')),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.addTransaction(creditorId);
                  Get.back();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
