import 'package:flutter/material.dart';

class HabitNameItem extends StatelessWidget {
  final String name;
  final double width;
  final double height;

  const HabitNameItem(
      {Key? key, required this.name, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(name,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
      );
}
