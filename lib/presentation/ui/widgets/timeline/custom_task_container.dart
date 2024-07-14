import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/data/model/task_list_model.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/extension.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

class CustomTaskContainer extends StatelessWidget {
  final TaskListItem data;
  final int index;

  const CustomTaskContainer({
    super.key,
    required this.index,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
     final Size deviceSize = context.deviceSize;

    final decoration = BoxDecoration(
      gradient: index % 3 == 0
          ? const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.1, 1.0],
              colors: [Pallets.gredientColorA, Pallets.gredientColorB],
            )
          : null,
      color: index % 3 == 1
          ? Pallets.taskContainerColor
          : index % 3 == 2
              ? Pallets.errorColor
              : null,
      borderRadius: BorderRadius.circular(deviceSize.width * 0.048), 
    );

    final textColor = index % 3 == 0
        ? Pallets.onSurfaceColor
        : index % 3 == 1
            ? Pallets.dateTextColor
            : Pallets.errorColor;

    final readableTime =
        convertUnixTimestampToReadableBengaliTime(int.parse(data.date));
    final readableDayAndTime =
        convertUnixTimestampToReadableBengaliDayTime(int.parse(data.date));

    return Padding(
      padding: EdgeInsets.symmetric(vertical: deviceSize.height * 0.008), 
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              readableDayAndTime,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                letterSpacing: -0.17,
                fontFamily: 'Noto Serif Bengali',
                fontSize: deviceSize.width * 0.034,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Card(elevation: 0,
                child: Container(
                  decoration: decoration,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: deviceSize.width * 0.048,
                      vertical: deviceSize.width * 0.024,
                    ), 
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.clock_copy,
                              color: Pallets.surfaceColor,
                              size: deviceSize.width * 0.034, 
                            ),
                            const Gap(5),
                            Expanded(
                              child: Text(
                                readableTime,
                                style: TextStyle(
                                  letterSpacing: -0.17,
                                  fontFamily: 'Noto Serif Bengali',
                                  fontSize: deviceSize.width * 0.028, 
                                  fontWeight: FontWeight.w500,
                                  color: Pallets.surfaceColor,
                                ),
                              ),
                            ),
                          ],
                        ),  const Gap(5),
                        Text(
                          data.name,
                          style: TextStyle(
                            letterSpacing: -0.17,
                            fontFamily: 'Noto Serif Bengali',
                            fontSize: deviceSize.width * 0.034, 
                            fontWeight: FontWeight.w600,
                            color: Pallets.surfaceColor,
                          ),
                        ),  const Gap(5),
                        Text(
                          data.category,
                          style: TextStyle(
                            letterSpacing: -0.17,
                            fontFamily: 'Noto Serif Bengali',
                            fontSize: deviceSize.width * 0.028, 
                            fontWeight: FontWeight.w500,
                            color: Pallets.surfaceColor,
                          ),
                        ),  const Gap(5),
                        Row(
                          children: [
                            Icon(
                              Iconsax.location_copy,
                              size: deviceSize.width * 0.034, 
                              color: Pallets.surfaceColor,
                            ),
                            const Gap(5),
                            Expanded(
                              child: Text(
                                data.location,
                                style: TextStyle(
                                  letterSpacing: -0.17,
                                  fontFamily: 'Noto Serif Bengali',
                                  fontSize: deviceSize.width * 0.028, 
                                  fontWeight: FontWeight.w500,
                                  color: Pallets.surfaceColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertUnixTimestampToReadableBengaliDayTime(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final hour = dateTime.hour;
    final minute = dateTime.minute;

    String periodInBengali;
    String timeInBengali;

    if (hour >= 0 && hour < 6) {
      periodInBengali = 'রাত';
      final timeFormatter = DateFormat('hh:mm', 'bn');
      timeInBengali = timeFormatter.format(dateTime);
    } else if (hour >= 6 && hour < 12) {
      periodInBengali = 'সকাল';
      final timeFormatter = DateFormat('hh:mm', 'bn');
      timeInBengali = timeFormatter.format(dateTime);
    } else if (hour >= 12 && hour < 18) {
      periodInBengali = 'দুপুর';
      final timeFormatter = DateFormat('hh:mm', 'bn');
      timeInBengali = timeFormatter.format(dateTime);
    } else {
      periodInBengali = 'বিকাল';
      final timeFormatter = DateFormat('hh:mm', 'bn');
      timeInBengali = timeFormatter.format(dateTime);
    }

    return '$periodInBengali \n$timeInBengali মি.';
  }

  String convertUnixTimestampToReadableBengaliTime(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final formatter = DateFormat('HH:mm মি.', 'bn');
    return formatter.format(dateTime);
  }
}
