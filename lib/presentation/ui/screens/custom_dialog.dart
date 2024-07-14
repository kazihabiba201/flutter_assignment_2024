import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/dialog_controller.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/extension.dart';
import 'package:get/get.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String content;

  final double width;
  final double height;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.width = 300, // Default width
    this.height = 400, // Default height
  });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  late final DialogController dialogController;

  @override
  initState() {
    super.initState();
    dialogController = Get.find<DialogController>();
    dialogController.updateTitle(widget.title);
    dialogController.updateContent(widget.content);
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.deviceSize;

    double dialogWidth = size.width * 0.8; 
    double dialogHeight = size.height * 0.4; 
    double imageSize = size.width * 0.2; 

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: dialogWidth,
          height: dialogHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/done.png',
                  width: imageSize,
                  height: imageSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Center(
                  child: Obx(() {
                    return Text(
                      dialogController.title.value,
                      style: const TextStyle(
                        fontFamily: 'Noto Serif Bengali',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Obx(() {
                    return Text(
                      dialogController.content.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Noto Serif Bengali',
                        fontSize: 14,
                        color: Pallets.subTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: dialogWidth * 0.7, // 70% of dialog width
                    height: size.height * 0.06, // 6% of screen height
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.2, 1.0],
                        colors: [
                          Pallets.gredientColorA,
                          Pallets.gredientColorB,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "আরও যোগ করুন",
                        style: TextStyle(
                          fontFamily: 'Noto Serif Bengali',
                          fontSize: 18,
                          color: Pallets.surfaceColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        insetPadding: const EdgeInsets.all(8),
      ),
    );
  }

}
