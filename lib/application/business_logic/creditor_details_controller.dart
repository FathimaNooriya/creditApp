import 'package:get/get.dart';
import '../../data/services/firestore_data_source.dart';
import '../../domain/model/creditor/creditor_model.dart';
import '../../domain/model/transaction/transaction_model.dart';

class CreditorDetailsController extends GetxController {
  CreditorDetailsController();

  var creditor = CreditorModel(
          id: '',
          name: '',
          phoneNumber: 0,
          totalOutstandingCredit: 0,
          address: '')
      .obs;
  var transactions = <TransactionModel>[].obs;
  var isLoading = true.obs;

  void fetchCreditorDetails({required String creditorId}) async {
    isLoading.value = true;
    creditor.value = await FirestoreDataSource().getCreditorById(creditorId);
    isLoading.value = false;
  }

  void fetchTransactions({required String creditorId}) async {
    transactions.clear();
    transactions.value =
        await FirestoreDataSource().getTransactionsByCreditorId(creditorId);
  }
}
