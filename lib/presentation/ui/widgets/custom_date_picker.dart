import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/extension.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const CustomDatePicker({super.key, 
    required this.startDate,
    required this.endDate,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = context.deviceSize;

    return SizedBox(
      height: deviceSize.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.endDate.difference(widget.startDate).inDays + 1,
        itemBuilder: (context, index) {
          DateTime date = widget.startDate.add(Duration(days: index));
          bool isSelected = date.isAtSameMomentAs(_selectedDate);

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
              widget.onDateSelected(date);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.transparent : Colors.grey[200],
                border: isSelected ? Border.all(color: Colors.blue) : null,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


