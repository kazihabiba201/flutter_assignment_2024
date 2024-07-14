import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';

Widget customDoubleContainer(String textLeft, String textRight, String bottomText, BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          _buildContainer(textLeft, context),
          const SizedBox(width: 5), 
          _buildContainer(textRight, context),
        ],
      ),
      const SizedBox(height: 5), 
      Text(
        bottomText,
        style: const TextStyle(
          fontFamily: 'Poppins', 
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget _buildContainer(String text, BuildContext context) {
  final Size deviceSize = MediaQuery.of(context).size;
  return Container(
    width: deviceSize.width * 0.07, 
    height: deviceSize.height * 0.04,
    decoration: BoxDecoration(
      color: Pallets.dateContainerColor,
      border: Border.all(color: Pallets.secondaryFontColor, width: 1),
      borderRadius: BorderRadius.circular(deviceSize.width * 0.01),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Noto Serif Bengali',
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}