import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/habit.dart';

class HabitValueItem extends StatelessWidget {
  final HabitFrequency value;
  final Color color;
  final double size;

  const HabitValueItem(
      {Key? key, required this.value, required this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: SizedBox(
                width: size + 4,
                height: size + 4,
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    width: size + 4,
                    height: size + 4,
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
            child: Container(width: size, height: size, color: color));
      case HabitFrequency.often:
        return Container(
          width: size,
          height: size,
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
    final double _xScaling = size.width / 45;
    final double _yScaling = size.height / 45;
    path.lineTo(0 * _xScaling, 4.13594 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0.648916 * _yScaling,
      4.15084 * _xScaling,
      -1.16845 * _yScaling,
      6.71312 * _xScaling,
      1.19673 * _yScaling,
    );
    path.cubicTo(
      6.71312 * _xScaling,
      1.19673 * _yScaling,
      26 * _xScaling,
      19 * _yScaling,
      26 * _xScaling,
      19 * _yScaling,
    );
    path.cubicTo(
      26 * _xScaling,
      19 * _yScaling,
      43.8033 * _xScaling,
      38.2869 * _yScaling,
      43.8033 * _xScaling,
      38.2869 * _yScaling,
    );
    path.cubicTo(
      46.1685 * _xScaling,
      40.8492 * _yScaling,
      44.3511 * _xScaling,
      45 * _yScaling,
      40.8641 * _xScaling,
      45 * _yScaling,
    );
    path.cubicTo(
      40.8641 * _xScaling,
      45 * _yScaling,
      12 * _xScaling,
      45 * _yScaling,
      12 * _xScaling,
      45 * _yScaling,
    );
    path.cubicTo(
      5.37258 * _xScaling,
      45 * _yScaling,
      0 * _xScaling,
      39.6274 * _yScaling,
      0 * _xScaling,
      33 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      33 * _yScaling,
      0 * _xScaling,
      4.13594 * _yScaling,
      0 * _xScaling,
      4.13594 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      4.13594 * _yScaling,
      0 * _xScaling,
      4.13594 * _yScaling,
      0 * _xScaling,
      4.13594 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
