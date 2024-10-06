import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/services/firestore_data_source.dart';
import '../../domain/model/creditor/creditor_model.dart';

class HomeController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final addCreditorFormkey = GlobalKey<FormState>();
  RxList<CreditorModel> creditorsList = <CreditorModel>[].obs;
  RxDouble totalOutstandingCredit = 0.0.obs;

  @override
  void onInit() {
    getCredtList();
    super.onInit();
  }

  getCredtList() async {
    creditorsList.value = await FirestoreDataSource().fetchCreditors();
    totalOutstandingCredit.value = 0.0;
    for (int i = 0; i < creditorsList.length; i++) {
      totalOutstandingCredit.value = totalOutstandingCredit.value +
          creditorsList[i].totalOutstandingCredit;
    }
  }

  addcreditorFunction() async {
    bool validate = addCreditorFormkey.currentState!.validate();
    if (validate) {
      CreditorModel creditor = CreditorModel(
          id: "id",
          name: nameController.text,
          phoneNumber: int.parse(phoneNumberController.text),
          address: addressController.text,
          totalOutstandingCredit: double.parse(amountController.text));
      String creditorId =
          await FirestoreDataSource().addCreditor(creditor: creditor);

      // Now you can update the creditor in Firestore if needed
      await FirestoreDataSource().updateCreditor(creditorId: creditorId);
      print("...........succes......");
      print("Creditor added and updated successfully");
    } else {
      return;
    }
    getCredtList();
    Get.back();
    clearFields();
  }

  // Clear form fields
  void clearFields() {
    nameController.clear();
    phoneNumberController.clear();
    amountController.clear();
    addressController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneNumberController.dispose();
    amountController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
