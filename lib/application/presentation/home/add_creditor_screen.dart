import 'package:flutter/material.dart';

class AddCreditorScreen extends StatelessWidget {
  const AddCreditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add creditor"),
      ),
      body: Column(
        children: [
          const Text("Enter Creditor name"),
          TextFormField(),
          const Text("Enter Creditor phone number"),
          TextFormField(),
          const Text("Enter creditor adress"),
          ElevatedButton(onPressed: () {}, child: const Text("Save")),
        ],
      ),
    );
  }
}
