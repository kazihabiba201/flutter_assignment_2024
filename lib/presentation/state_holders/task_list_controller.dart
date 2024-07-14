import 'package:flutter_assignment_2024/data/model/network_response.dart';
import 'package:flutter_assignment_2024/data/model/task_list_model.dart';
import 'package:flutter_assignment_2024/data/service/network_caller.dart';
import 'package:flutter_assignment_2024/data/utitlity/urls.dart';
import 'package:get/get.dart';



class TaskListController extends GetxController {
  bool _getTasklistInProgress = false;
  TaskListModel _tasklistModel = TaskListModel(data: []);
  String _message = '';

  TaskListModel get tasklistModel => _tasklistModel;

  bool get gettasklistInProgress => _getTasklistInProgress;

  String get message => _message;

  final NetworkCaller _networkCaller = NetworkCaller();

  Future<bool> getTaskList() async {
    _getTasklistInProgress = true;
    update(['getTasklistInProgress']);
    final NetworkResponse response = await _networkCaller.getRequest(
      Urls.getTaskList,
    );
    _getTasklistInProgress = false;
    if (response.isSuccess) {
      _tasklistModel = TaskListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Task list data fetch failed!';
      update();
      return false;
    }
  }
}