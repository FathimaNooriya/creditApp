import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/services/firestore_data_source.dart';
import '../../domain/model/transaction/transaction_model.dart';

class TransactionController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> transactionFormKey = GlobalKey<FormState>();
  final RxString transactionType = 'credit'.obs;

  // Add transaction function
  Future<void> addTransaction(String creditorId) async {
    bool validate = transactionFormKey.currentState!.validate();
    if (!validate) {
      return;
    }
    final transaction = TransactionModel(
      creditorId: creditorId,
      type: transactionType.value,
      amount: double.parse(amountController.text),
      note: descriptionController.text,
      date: DateTime.now(),
      transactionId: "",
    );
    try {
      //  String transactionId =
      await FirestoreDataSource().addTransaction(transaction);
      // transaction.id = transactionId;
      print('Transaction added successfully with ID: transactionId');
    } catch (e) {
      print('Failed to add transaction: $e');
    }
  }
}
