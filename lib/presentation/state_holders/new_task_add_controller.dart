import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/data/model/custom_update_model.dart';
import 'package:get/get.dart';

class NewTaskAddController extends GetxController {
  final TextEditingController paragraphController = TextEditingController();
  final TextEditingController paragraphDescriptionController = TextEditingController();
  final TextEditingController selectedDistrictItemsController = TextEditingController();
  final TextEditingController selectedSectionItemsController = TextEditingController();

  final remainingChars = 20.obs;
  final remainingDesChars = 120.obs;
  final maxChars = 20;
  final maxCharsDes = 120;

  var selectedItem = ''.obs;
  var selectedItems = ''.obs;
 RxBool isAddingTask = false.obs;
  Rx<DateTime?> selectedDateTime = Rx<DateTime?>(null);

  List<CustomModel> taskDataList = [];

 @override
void onInit() {
  super.onInit();
 paragraphController.addListener(() {
  remainingChars.value = (maxChars - paragraphController.text.length).clamp(0, maxChars);
});

paragraphDescriptionController.addListener(() {
  remainingDesChars.value = (maxCharsDes - paragraphDescriptionController.text.length).clamp(0, maxCharsDes);
});

}

  @override
  void onClose() {
    paragraphController.dispose();
    paragraphDescriptionController.dispose();
    super.onClose();
  }

  void updateDateTime(DateTime dateTime) {
    selectedDateTime.value = dateTime;
  }

  void updateModelFromUI() {
    if (selectedDateTime.value != null) { isAddingTask.value = true;
      taskDataList.add(CustomModel(
        paragraphInput: paragraphController.text,
        paragraphDescription: paragraphDescriptionController.text,
        paragraphSection: selectedItems.value,
        date: selectedDateTime.value!,
        location: selectedItem.value,
      ));
   
      paragraphController.clear();
      paragraphDescriptionController.clear();
      selectedItems.value = '';
      selectedItem.value = '';
      selectedDateTime.value = null;isAddingTask.value = false;
    }
  }
}