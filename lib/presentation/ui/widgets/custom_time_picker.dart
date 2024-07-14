import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/new_task_add_controller.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/extension.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class MyDateTimePicker extends StatefulWidget {
  const MyDateTimePicker({super.key});

  @override
  State<MyDateTimePicker> createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends State<MyDateTimePicker> {
  late final NewTaskAddController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<NewTaskAddController>();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Iconsax.calendar_1_copy, size: 16),
              TextButton(
                onPressed: () async {
                  final DateTime? pickedDateTime = await showDatePicker(
                    context: context,
                    initialDate:
                        controller.selectedDateTime.value ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                    initialDatePickerMode: DatePickerMode.day,
                  );
                  if (pickedDateTime != null) {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: controller.selectedDateTime.value != null
                          ? TimeOfDay.fromDateTime(
                              controller.selectedDateTime.value!)
                          : TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      final newDateTime = DateTime(
                        pickedDateTime.year,
                        pickedDateTime.month,
                        pickedDateTime.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                      controller.updateDateTime(newDateTime);
                    }
                  }
                },
                child: Obx(() {
                  return Text(
                    controller.selectedDateTime.value == null
                        ? 'নির্বাচন করুন'
                        : _formatDateTime(controller.selectedDateTime.value!),
                    style: const TextStyle(
                      fontFamily: 'Noto Serif Bengali',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }),
              ),
            ],
          ),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final DateFormat dateFormat = DateFormat('d MMMM, y', 'bn_BD');
    final hour = dateTime.hour;
    final minute = dateTime.minute;
    final period = _getPeriod(hour);

    final NumberFormat hourFormat = NumberFormat('00', 'bn_BD');
    final formattedHour = hourFormat.format(hour > 12
        ? hour - 12
        : hour == 0
            ? 12
            : hour);

    final NumberFormat minuteFormat = NumberFormat('00', 'bn_BD');
    final formattedMinute = minuteFormat.format(minute);

    dateFormat.format(dateTime);
    return '$period $formattedHour:$formattedMinute মি.';
  }

  String _getPeriod(int hour) {
    if (hour < 12) {
      return 'সকাল';
    } else if (hour == 12) {
      return 'দুপুর';
    } else if (hour < 18) {
      return 'বিকাল';
    } else {
      return 'রাত';
    }
  }
}


