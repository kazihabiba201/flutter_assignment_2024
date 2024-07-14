class TaskListModel {
  List<TaskListItem> data;

  TaskListModel({required this.data});

  factory TaskListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> dataList = json['data'];
    List<TaskListItem> items = dataList.map((item) => TaskListItem.fromJson(item)).toList();
    return TaskListModel(data: items);
  }
}

class TaskListItem {
  String date;
  String name;
  String category;
  String location;

  TaskListItem({
    required this.date,
    required this.name,
    required this.category,
    required this.location,
  });

  factory TaskListItem.fromJson(Map<String, dynamic> json) {
    return TaskListItem(
      date: json['date'],
      name: json['name'],
      category: json['category'],
      location: json['location'],
    );
  }
}
