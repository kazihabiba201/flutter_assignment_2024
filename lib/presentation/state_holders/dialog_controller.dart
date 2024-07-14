import 'package:get/get.dart';

class DialogController extends GetxController {
  var title = ''.obs;
  var content = ''.obs;

  void updateTitle(String newTitle) {
    title.value = newTitle;
  }

  void updateContent(String newContent) {
    content.value = newContent;
  }
}
