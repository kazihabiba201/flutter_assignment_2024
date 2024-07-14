import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/data/model/custom_update_model.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/new_task_add_controller.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/extension.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/custom_time_picker.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

import 'custom_dialog.dart';

class NewTaskAdd extends StatefulWidget {
  const NewTaskAdd({super.key});

  @override
  State<NewTaskAdd> createState() => _NewTaskAddState();
}

class _NewTaskAddState extends State<NewTaskAdd> {
  late final NewTaskAddController controller;
  final CustomModel taskModel = CustomModel(
      paragraphInput: '',
      paragraphDescription: '',
      paragraphSection: '',
      date: DateTime.now(),
      location: '');

  @override
  void initState() {
    super.initState();
    controller = Get.find<NewTaskAddController>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.deviceSize;
    double padding = size.width * 0.05; 
    double spacing = size.height * 0.02; 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:CustomAppBar(
        title: const Text(
          'নতুন যোগ করুন',
          style: TextStyle(fontFamily: 'Noto Serif Bengali', fontSize: 16,
                fontWeight: FontWeight.w700),
        ),
        leadingIcon: Icons.arrow_back_outlined,
        onLeadingPressed: () {     Get.back();},
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: padding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(spacing),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'অনুচ্ছেদ',
                      style: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${NumberFormat.decimalPattern('bn').format(controller.remainingChars.value)} শব্দ',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 8),
              TextField(
                controller: controller.paragraphController,
                maxLines: null,
                maxLength: controller.maxChars,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.85,
                    ),
                  ),
                  hintText: 'অনুচ্ছেদ লিখুন',
                  hintStyle: TextStyle(
                      fontFamily: 'Noto Serif Bengali',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  counterText: '',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'অনুচ্ছেদের বিভাগ',
                style: TextStyle(
                    fontFamily: 'Noto Serif Bengali',
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Obx(() {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.selectedItems.value.isEmpty
                          ? null
                          : controller.selectedItems.value,
                      onChanged: (String? newValue) {
                        controller.selectedItems.value = newValue ?? '';
                        controller.selectedSectionItemsController.text =
                            newValue ?? '';
                      },
                      items: <String>[
                        'অনুচ্ছেদ',
                        'বাক্য',
                        'শব্দ',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: const Text(
                        'অনুচ্ছেদের বিভাগ নির্বাচন করুন',
                        style: TextStyle(
                            fontFamily: 'Noto Serif Bengali',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 5),
              const Text(
                'তারিখ ও সময়',
                style: TextStyle(
                    fontFamily: 'Noto Serif Bengali',
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              const MyDateTimePicker(),
              const SizedBox(height: 8),
              const Text(
                'স্থান',
                style: TextStyle(
                    fontFamily: 'Noto Serif Bengali',
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Iconsax.location_copy,
                        size: 16,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedItem.value.isEmpty
                                ? null
                                : controller.selectedItem.value,
                            onChanged: (String? newValue) {
                              controller.selectedItem.value = newValue ?? '';
                              controller.selectedDistrictItemsController.text =
                                  newValue ?? '';
                            },
                            items: <String>[
                              'বরিশাল',
                              'চট্টগ্রাম',
                              'ঢাকা',
                              'খুলনা',
                              'রাজশাহী',
                              'রংপুর',
                              'ময়মনসিংহ',
                              'সিলেট',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: const Text(
                              'নির্বাচন করুন',
                              style: TextStyle(
                                  fontFamily: 'Noto Serif Bengali',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            icon: const Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'অনুচ্ছেদের বিবরণ',
                          style: TextStyle(
                              fontFamily: 'Noto Serif Bengali',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '${NumberFormat.decimalPattern('bn').format(controller.remainingDesChars.value)} শব্দ',
                          style: const TextStyle(
                              fontFamily: 'Noto Serif Bengali',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 9),
                  TextField(
                    controller: controller.paragraphDescriptionController,
                    maxLines: 5,
                    maxLength: controller.maxCharsDes,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'কার্যক্রমের বিবরণ লিখুন',
                      hintStyle: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      counterText: '',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  controller.updateModelFromUI();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomDialog(
                        title: "নতুন অনুচ্ছেদ সংরক্ষন",
                        content:
                            "আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে ",
                        width: 327,
                        height: 268,
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.06, // 6% of screen height
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.centerLeft,
                      stops: [0.1, 1.0],
                      colors: [Pallets.gredientColorB, Pallets.gredientColorA],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "সংরক্ষন করুন",
                      style: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          fontSize: 18,
                          color: Pallets.surfaceColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}