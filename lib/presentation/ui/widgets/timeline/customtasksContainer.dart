import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/data/model/custom_update_model.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

class CustomTasksContainer extends StatelessWidget {
  final CustomModel data;

  const CustomTasksContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
      final Size deviceSize = context.deviceSize;

    final readableTime = convertUnixTimestampToReadableBengaliTime(data.date.millisecondsSinceEpoch);
    final readableDayAndTime = convertUnixTimestampToReadableBengaliDayTime(data.date.millisecondsSinceEpoch);

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
                color: Pallets.badgeColor,
                letterSpacing: -0.17,
                fontFamily: 'Noto Serif Bengali',
                fontSize: deviceSize.width * 0.034, 
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Card(color: Pallets.taskContainerColor,elevation: 0,
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(deviceSize.width * 0.048),color: Pallets.taskContainerColor, ),
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
                        ),const Gap(5,),
                        Text(
                          data.paragraphInput,
                          style: TextStyle(
                            letterSpacing: -0.17,
                            fontFamily: 'Noto Serif Bengali',
                            fontSize: deviceSize.width * 0.034, 
                            fontWeight: FontWeight.w600,
                            color: Pallets.surfaceColor,
                          ),
                        ),const Gap(5,),
                        Text(
                          data.paragraphDescription,
                          style: TextStyle(
                            letterSpacing: -0.17,
                            fontFamily: 'Noto Serif Bengali',
                            fontSize: deviceSize.width * 0.028,
                            fontWeight: FontWeight.w500,
                            color: Pallets.surfaceColor,
                          ),
                        ),const Gap(5,),
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
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
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
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final formatter = DateFormat('HH:mm মি.', 'bn');
    return formatter.format(dateTime);
  }
}

extension BuildContextExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this);
  TextTheme get textTheme => _theme.textTheme;
  ColorScheme get colorScheme => _theme.colorScheme;
  Size get deviceSize => MediaQuery.sizeOf(this);
}
