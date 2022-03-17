import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _defaultItemExtent = 80;
const EdgeInsets _defaultItemPadding = EdgeInsets.symmetric(vertical: 16);

class HabitIntPicker extends StatelessWidget {
  final void Function(int)? onChanged;
  final int maxValue;
  final bool startFromZero;
  final double height;
  final double fontSize;

  const HabitIntPicker(
      {Key? key,
      required this.maxValue,
      this.onChanged,
      this.height = 300,
      this.startFromZero = true,
      this.fontSize = 32})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? pickerTextStyle =
        Theme.of(context).textTheme.headline3?.copyWith(fontSize: fontSize);

    return SizedBox(
      height: height,
      child: CupertinoPicker(
        selectionOverlay: null,
        diameterRatio: 1.5,
        magnification: 1.1,
        squeeze: 1.25,
        looping: true,
        onSelectedItemChanged: onChanged,
        itemExtent: _defaultItemExtent,
        children: List<Widget>.generate(maxValue, (index) {
          final int value = startFromZero ? index : index + 1;
          return Padding(
            padding: _defaultItemPadding,
            child: Text(value < 10 ? '0$value' : value.toString(),
                style: pickerTextStyle),
          );
        }),
      ),
    );
  }
}
