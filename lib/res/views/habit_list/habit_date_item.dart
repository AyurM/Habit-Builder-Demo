import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:intl/intl.dart';

class HabitDateItem extends StatelessWidget {
  static DateFormat dayFormat = DateFormat.E();
  static const Size _selectedMarkSize = Size(20, 3);

  final DateTime day;
  final double size;
  final bool isSelected;

  const HabitDateItem(
      {Key? key,
      required this.day,
      required this.size,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  if (isSelected) _buildSelectedDayMark(),
                  _buildDayWidget(context),
                ],
              )),
        ),
      );

  Widget _buildSelectedDayMark() => Container(
        height: _selectedMarkSize.height,
        width: _selectedMarkSize.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: eclipse,
            boxShadow: const [
              BoxShadow(
                  color: Color(0x80862D7C), blurRadius: 6, offset: Offset(0, 2))
            ]),
      );

  Widget _buildDayWidget(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(dayFormat.format(day).toUpperCase(),
            style:
                textTheme.subtitle2?.copyWith(color: eclipse.withOpacity(0.5))),
        Text(day.day.toString(), style: textTheme.button?.copyWith(height: 1))
      ],
    ));
  }
}
