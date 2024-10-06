import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild(
      {super.key,
      required this.label,
      required this.controller,
      required this.textInputType});
  final TextEditingController controller;
  final String label;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: label,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field cannot be empty';
            } else if (label == "Phone Number" && value.length != 10) {
              return 'Phone Number should be 10 digit';
            }
            return null;
          },
        ),
      ),
    );
  }
}
