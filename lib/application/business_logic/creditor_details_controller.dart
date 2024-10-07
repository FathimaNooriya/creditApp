import 'package:get/get.dart';
import '../../data/services/firestore_data_source.dart';
import '../../domain/model/creditor/creditor_model.dart';
import '../../domain/model/transaction/transaction_model.dart';

class CreditorDetailsController extends GetxController {
  final String creditorId;
  CreditorDetailsController({required this.creditorId});

  var creditor = CreditorModel(
          id: '',
          name: '',
          phoneNumber: 0,
          totalOutstandingCredit: 0,
          address: '')
      .obs;
  var transactions = <TransactionModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCreditorDetails();
    fetchTransactions();
    super.onInit();
  }

  void fetchCreditorDetails() async {
    isLoading.value = true;
    creditor.value = await FirestoreDataSource().getCreditorById(creditorId);
    isLoading.value = false;
  }

  void fetchTransactions() async {
    transactions.value =
        await FirestoreDataSource().getTransactionsByCreditorId(creditorId);
  }
}
