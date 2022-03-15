import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';

const double _defaultPadding = 4;

class AppSwitchButton extends StatefulWidget {
  final bool initialValue;
  final void Function(bool)? onChanged;
  final Color? onColor;
  final Color? offColor;
  final TextStyle? textStyle;
  final double width;
  final double height;

  const AppSwitchButton(
      {Key? key,
      this.initialValue = false,
      this.onChanged,
      this.onColor,
      this.offColor,
      this.textStyle,
      this.width = 60,
      this.height = 30})
      : super(key: key);

  @override
  State<AppSwitchButton> createState() => _AppSwitchButtonState(initialValue);
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  _AppSwitchButtonState(bool initialValue) : value = initialValue;

  bool value;

  @override
  Widget build(BuildContext context) {
    final Color onColor =
        widget.onColor ?? Theme.of(context).colorScheme.primary;
    final Color offColor = widget.offColor ?? eclipse;
    final Color color = value ? onColor : offColor;
    final TextStyle? labelTextStyle =
        (widget.textStyle ?? Theme.of(context).textTheme.subtitle2)
            ?.copyWith(color: color);

    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
        });
        widget.onChanged?.call(value);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(_defaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.height / 2),
            color: color.withOpacity(0.1)),
        child: Stack(
          children: [_buildSwitch(color), _buildTextLabel(labelTextStyle)],
        ),
      ),
    );
  }

  Widget _buildSwitch(Color color) {
    final double switchSize = widget.height - _defaultPadding * 2;

    return AnimatedAlign(
      duration: const Duration(milliseconds: 250),
      curve: Curves.decelerate,
      alignment: value ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          width: switchSize,
          height: switchSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(switchSize / 2),
              color: color,
              boxShadow: [
                BoxShadow(
                    color: color.withOpacity(0.5),
                    offset: Offset(value ? 2 : -2, 3),
                    blurRadius: 6)
              ])),
    );
  }

  Widget _buildTextLabel(TextStyle? textStyle) => Align(
        alignment: value ? Alignment.centerLeft : Alignment.centerRight,
        child: Padding(
          padding: value
              ? const EdgeInsets.only(left: _defaultPadding)
              : const EdgeInsets.only(right: _defaultPadding),
          child: Text(value ? 'On' : 'Off', style: textStyle),
        ),
      );
}
