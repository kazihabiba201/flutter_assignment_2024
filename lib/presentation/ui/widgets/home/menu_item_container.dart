import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';

Widget menuItemContainer({
  required String imagePath,
  required String title,
  required String subtitle,
  required BuildContext context, 
}) {
  final Size deviceSize = MediaQuery.of(context).size;

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: deviceSize.width * 0.2, 
        height: deviceSize.width * 0.2, 
        decoration: BoxDecoration(
          color: Pallets.dateContainerColor,
          borderRadius: BorderRadius.circular(deviceSize.width * 0.01), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
                  ),
        )),
      SizedBox(height: deviceSize.height * 0.01), 
      Text(
        title,
        style: const TextStyle(
          fontFamily: 'Noto Serif Bengali',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        subtitle,
        style: const TextStyle(
          fontFamily: 'Noto Serif Bengali',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
