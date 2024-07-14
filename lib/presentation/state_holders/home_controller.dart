import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Map<String, String>> menuItems = List.generate(
    6, // Number of menu items
    (index) => {
      'imagePath':
          'assets/images/menu_no_0${index + 1}.png', 
      'title': 'মেনু নং', 
      'subtitle':
          '০০০০${String.fromCharCode(2534 + index + 1)}',
    },
  );
}
