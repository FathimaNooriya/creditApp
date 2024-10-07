import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/core/theme/colors.dart';
import '../../business_logic/home_controller.dart';
import 'custom_textField.dart';

class CustomAlertBox extends StatelessWidget {
  const CustomAlertBox({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add creditors"),
      content: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: homeController.addCreditorFormkey,
        child: ListView(
          shrinkWrap: true,
          children: [
            const Text("Enter Creditor name"),
            CustomTextFeild(
              controller: homeController.nameController,
              label: "Name",
              textInputType: TextInputType.name,
            ),
            const Text("Enter Creditor phone number"),
            CustomTextFeild(
              controller: homeController.phoneNumberController,
              label: "Phone Number",
              textInputType: TextInputType.number,
            ),
            const Text("Enter creditor adress"),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: TextFormField(
                controller: homeController.addressController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Adress",
                ),
              ),
            ),
            Obx(() {
              return homeController.isEdit.value
                  ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 5),
                    child: Text(
                        "Total Outstanding Credit =${homeController.amountController.text}"),
                  )
                  : Column(
                      children: [
                        const Text("Enter the amound"),
                        CustomTextFeild(
                          controller: homeController.amountController,
                          label: "Credit Amount",
                          textInputType: TextInputType.number,
                        ),
                      ],
                    );
            }),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          color: MyColors.borderColor, // Custom border color
          width: 2.0, // Custom border width
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              homeController.addCreditorFunction();
            },
            child: const Text("Save"))
      ],
    );
  }
}
