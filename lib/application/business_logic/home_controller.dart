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
  RxBool isEdit = false.obs;
  String creditorId = "";

  @override
  void onInit() {
    getCredtList();
    super.onInit();
  }

  getCredtList() async {
    creditorsList.clear();
    creditorsList.value = await FirestoreDataSource().fetchCreditors();
    totalOutstandingCredit.value = 0.0;
    for (int i = 0; i < creditorsList.length; i++) {
      totalOutstandingCredit.value = totalOutstandingCredit.value +
          creditorsList[i].totalOutstandingCredit;
    }
  }

  editCreditorFunction({required String id}) async {
    creditorId = "";
    try {
      // Find the creditor by ID using firstWhereOrNull
      CreditorModel? creditor = creditorsList.firstWhereOrNull(
        (creditor) => creditor.id == id,
      );

      if (creditor != null) {
        creditorId = id;
        nameController.text = creditor.name;
        phoneNumberController.text = creditor.phoneNumber.toString();
        amountController.text = creditor.totalOutstandingCredit.toString();
        addressController.text = creditor.address;
      } else {
        print('Creditor not found');
      }
    } catch (e) {
      print('Error during edit: $e');
    }
  }

  addCreditorFunction() async {
    bool validate = addCreditorFormkey.currentState!.validate();
    if (validate) {
      if (isEdit.value) {
        CreditorModel creditor = CreditorModel(
            id: creditorId,
            name: nameController.text,
            phoneNumber: int.parse(phoneNumberController.text),
            address: addressController.text,
            totalOutstandingCredit: double.parse(amountController.text));

        await FirestoreDataSource().updateCreditor(creditor: creditor);
        print("...........succes......");
        print("Creditor updated successfully");
        isEdit.value = false;
      } else {
        CreditorModel creditor = CreditorModel(
            id: "id",
            name: nameController.text,
            phoneNumber: int.parse(phoneNumberController.text),
            address: addressController.text,
            totalOutstandingCredit: double.parse(amountController.text));

        String creditorId =
            await FirestoreDataSource().addCreditor(creditor: creditor);

        // Now you can update the creditor in Firestore if needed
        await FirestoreDataSource().updateCreditorId(creditorId: creditorId);
        print("...........succes......");
        print("Creditor added and updated successfully");
      }
    } else {
      return;
    }
    getCredtList();
    Get.back();
    clearFields();
  }

  deleteCreditFunction({required String id}) {
    FirestoreDataSource().deleteCreditor(id);
    getCredtList();
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
