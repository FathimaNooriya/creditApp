import 'package:flutter/material.dart';
import '../../../../domain/core/theme/colors.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
    required this.height,
    required this.tittle,
    required this.value,
  });
  final String tittle;
  final double value;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.borderColor,
          //const Color.fromARGB(153, 136, 104, 143),
        ),
        height: height * .15,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(tittle), Text(value.toString())],
          ),
        ),
      ),
    );
  }
}
