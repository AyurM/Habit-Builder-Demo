import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/habit.dart';

class HabitValueItem extends StatelessWidget {
  final HabitFrequency value;
  final Color color;
  final double size;
  final double borderWidth;
  final EdgeInsets? margin;

  const HabitValueItem(
      {Key? key,
      required this.value,
      required this.color,
      required this.size,
      this.borderWidth = 2,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
            padding: margin ?? const EdgeInsets.symmetric(horizontal: 1),
            child: SizedBox(
                width: size,
                height: size,
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  _buildValueWidget()
                ]))),
      );

  Widget _buildValueWidget() {
    switch (value) {
      case HabitFrequency.none:
        return const SizedBox();
      case HabitFrequency.seldom:
        return ClipPath(
            clipper: _HabitHalfValueItem(),
            child: Container(
                width: size - borderWidth * 2,
                height: size - borderWidth * 2,
                color: color));
      case HabitFrequency.often:
        return Container(
          width: size - borderWidth * 2,
          height: size - borderWidth * 2,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
        );
    }
  }
}

class _HabitHalfValueItem extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double _xScaling = size.width / 50;
    final double _yScaling = size.height / 50;
    path.lineTo(0 * _xScaling, 9.13594 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      5.648916 * _yScaling,
      4.15084 * _xScaling,
      3.83155 * _yScaling,
      6.71312 * _xScaling,
      6.1967300000000005 * _yScaling,
    );
    path.cubicTo(
      6.71312 * _xScaling,
      6.1967300000000005 * _yScaling,
      26 * _xScaling,
      24 * _yScaling,
      26 * _xScaling,
      24 * _yScaling,
    );
    path.cubicTo(
      26 * _xScaling,
      24 * _yScaling,
      43.8033 * _xScaling,
      43.2869 * _yScaling,
      43.8033 * _xScaling,
      43.2869 * _yScaling,
    );
    path.cubicTo(
      46.1685 * _xScaling,
      45.8492 * _yScaling,
      44.3511 * _xScaling,
      50 * _yScaling,
      40.8641 * _xScaling,
      50 * _yScaling,
    );
    path.cubicTo(
      40.8641 * _xScaling,
      50 * _yScaling,
      12 * _xScaling,
      50 * _yScaling,
      12 * _xScaling,
      50 * _yScaling,
    );
    path.cubicTo(
      5.37258 * _xScaling,
      50 * _yScaling,
      0 * _xScaling,
      44.6274 * _yScaling,
      0 * _xScaling,
      38 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      38 * _yScaling,
      0 * _xScaling,
      9.13594 * _yScaling,
      0 * _xScaling,
      9.13594 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      9.13594 * _yScaling,
      0 * _xScaling,
      9.13594 * _yScaling,
      0 * _xScaling,
      9.13594 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
