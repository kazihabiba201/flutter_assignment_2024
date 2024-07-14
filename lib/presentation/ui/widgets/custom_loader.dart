import 'package:flutter/material.dart';

Widget myCircularLoader({
  // ==== CONTAINER ====
  double? radius,
  // ==== LOADER ====
  Color? color,
  double? value,
  double stroke = 2.5,
  Color? background,
  bool showPercentage = false,
  Color percentageColor = const Color.fromARGB(255, 32, 19, 53),
  // ==== INSIDE TEXT ====
  TextStyle? textStyle,
  String? loadingText,
  TextStyle? loadingTextStyle,
}) =>
    FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: radius,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.loose,
              children: [
                CircularProgressIndicator(
                  color: color,
                  strokeWidth: stroke,
                  backgroundColor: background,
                  value: value,
                  strokeCap: StrokeCap.round,
                ),
                if (showPercentage)
                  Text(
                    '${((value ?? 0) * 100).toStringAsFixed(0)}%',
                    maxLines: 1,
                    style: textStyle ??
                        TextStyle(
                          overflow: TextOverflow.fade,
                          color: percentageColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                  ),
              ],
            ),
          ),
          if (loadingText != null) const SizedBox(height: 10),
          if (loadingText != null) Text(loadingText, style: loadingTextStyle),
        ],
      ),
    );

