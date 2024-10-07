import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderncreditapp/application/business_logic/home_controller.dart';
import '../../data/services/firestore_data_source.dart';
import '../../domain/model/transaction/transaction_model.dart';
import 'creditor_details_controller.dart';

class TransactionController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> transactionFormKey = GlobalKey<FormState>();
  final RxString transactionType = 'credit'.obs;
  final HomeController homeController = Get.put(HomeController());
  final creditDetailController = Get.put(CreditorDetailsController());
  RxList<TransactionModel> allTransactionList = <TransactionModel>[].obs;

  @override
  void onInit() {
    fetchAllTransaction();
    super.onInit();
  }

  Future<void> fetchAllTransaction() async {
    allTransactionList.clear();
    allTransactionList.value =
        await FirestoreDataSource().fetchAllTransactions();
  }

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
      print('Transaction added successfully ');
      final creditor = await FirestoreDataSource().getCreditorById(creditorId);
      if (transactionType.value == 'credit') {
        await FirestoreDataSource().updateCreditorOutsnding(
            creditorId: transaction.creditorId,
            amount: creditor.totalOutstandingCredit + transaction.amount);
      } else {
        await FirestoreDataSource().updateCreditorOutsnding(
            creditorId: transaction.creditorId,
            amount: creditor.totalOutstandingCredit - transaction.amount);
      }
      print('Amount added successfully');
      creditDetailController.fetchTransactions(creditorId: creditorId);
      creditDetailController.fetchCreditorDetails(creditorId: creditorId);
      homeController.getCredtList();
    } catch (e) {
      print('Failed to add transaction: $e');
    }
  }
}
