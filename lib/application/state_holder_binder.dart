
import 'package:flutter_assignment_2024/presentation/state_holders/dialog_controller.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/home_controller.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/new_task_add_controller.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/task_list_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
  Get.put(TaskListController());
   Get.put(NewTaskAddController());
   Get.put(DialogController());
   Get.lazyPut<HomeController>(() => HomeController());
   
   
   



  }

}