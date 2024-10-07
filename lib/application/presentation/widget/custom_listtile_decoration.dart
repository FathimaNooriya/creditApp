import 'package:flutter/material.dart';
import '../../../domain/core/theme/colors.dart';

class CustomListTileDecoration extends StatelessWidget {
  const CustomListTileDecoration({super.key, required this.listTile});
  final Widget listTile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: listTile),
    );
  }
}
