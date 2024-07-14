import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/new_task_add_controller.dart';
import 'package:flutter_assignment_2024/presentation/state_holders/task_list_controller.dart';
import 'package:flutter_assignment_2024/presentation/ui/screens/new_add.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/constant.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/timeline/custom_task_container.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/timeline/customtasksContainer.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  DateTime startDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime endDate = DateTime.now().add(const Duration(days: 7));
  late DateTime _selectedDate;
  DateTime currentDate = DateTime.now();
  final NewTaskAddController controller = Get.put(NewTaskAddController());

  @override
  void initState() {
    super.initState();
    _selectedDate = currentDate;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<TaskListController>().getTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = context.mediaQuerySize;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: const Text(
          'সময়রেখা',
          style: TextStyle(fontFamily: 'Noto Serif Bengali'),
        ),
        leadingIcon: Icons.menu,
        actionIcon: Iconsax.notification_copy,
        onLeadingPressed: () {},
      ),
      body: Container(
        margin: screenMargin(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate.day == currentDate.day &&
                            _selectedDate.month == currentDate.month &&
                            _selectedDate.year == currentDate.year
                        ? 'আজ, ${DateFormat('dd MMMM', 'bn').format(_selectedDate)}'
                        : '${DateFormat('E', 'bn').format(_selectedDate)}, ${DateFormat('dd MMMM', 'bn').format(_selectedDate)}',
                    style: const TextStyle(
                      fontFamily: 'Noto Serif Bengali',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewTaskAdd(),
                        ),
                      );
                    },
                    child: Container(
                      height: 29,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Pallets.gredientColorA,
                            Pallets.gredientColorB,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'নতুন যোগ করুন',
                          style: TextStyle(
                            fontFamily: 'Noto Serif Bengali',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Pallets.surfaceColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 2,
                color: Pallets.surfaceColor,
                child: Container(
                  width: double.infinity,
                  height: deviceSize.height * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: endDate.difference(startDate).inDays + 1,
                          itemBuilder: (context, index) {
                            DateTime date =
                                startDate.add(Duration(days: index));
                            bool isCurrentDate = date.day == currentDate.day &&
                                date.month == currentDate.month &&
                                date.year == currentDate.year;
                            bool isSelectedDate =
                                date.day == _selectedDate.day &&
                                    date.month == _selectedDate.month &&
                                    date.year == _selectedDate.year;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedDate = date;
                                });
                              },
                              child: Container(
                                width: 37,
                                height: 62.69,
                                margin: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: isCurrentDate
                                      ? Border.all(
                                          color: Pallets.gredientColorA,
                                          width: 2,
                                        )
                                      : isSelectedDate
                                          ? Border.all(
                                              color: Colors.grey, width: 2)
                                          : null,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        DateFormat.E('bn').format(date),
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Noto Serif Bengali',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      DateFormat.d('bn').format(date),
                                      style: const TextStyle(
                                        fontFamily: 'Noto Serif Bengali',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 2,
                color: Pallets.surfaceColor,
                child: Container(
                  width: double.infinity,
                  height: deviceSize.height * 1.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedDate.day == currentDate.day &&
                                    _selectedDate.month == currentDate.month &&
                                    _selectedDate.year == currentDate.year
                                ? 'আজকের কার্যক্রম'
                                : '${DateFormat.E('bn').format(_selectedDate)} বারের কার্যক্রম',
                            style: const TextStyle(
                              fontFamily: 'Noto Serif Bengali',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GetBuilder<TaskListController>(
                            builder: (taskListController) {
                              if (taskListController.gettasklistInProgress) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (taskListController
                                  .tasklistModel.data.isEmpty) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Flexible(
                                child: _selectedDate.day == currentDate.day &&
                                        _selectedDate.month ==
                                            currentDate.month &&
                                        _selectedDate.year == currentDate.year
                                    ? ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: taskListController
                                            .tasklistModel.data.length,
                                        itemBuilder: (context, index) {
                                          final taskListData =
                                              taskListController
                                                  .tasklistModel.data[index];

                                          return CustomTaskContainer(
                                              index: index, data: taskListData);
                                        },
                                      )
                                    : Center(
                                        child: ListView.builder(
                                          itemCount:
                                              controller.taskDataList.length,
                                          itemBuilder: (context, index) {
                                           final taskListData =
                                        controller.taskDataList[index];
                                    bool isSelectedDate =
                                      taskListData.date.day == _selectedDate.day &&
                                      taskListData.date.month == _selectedDate.month &&
                                      taskListData.date.year == _selectedDate.year;
                                    if (isSelectedDate) {
                                      return CustomTasksContainer(
                                        data: taskListData,
                                      );
                                            }
                                    return null;
                                          },
                                        ),
                                      ),
                              );
                            },
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
      ),
    );
  }
}
