import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';

class CheckboxOption extends StatefulWidget {
  final String label;
  final bool initialValue;
  final Color? checkColor;
  final Color? fillColor;
  final void Function(bool?)? onChanged;

  const CheckboxOption(
      {Key? key,
      required this.label,
      required this.initialValue,
      this.checkColor,
      this.fillColor,
      this.onChanged})
      : super(key: key);

  @override
  State<CheckboxOption> createState() =>
      _CheckboxOptionState(initialValue: initialValue);
}

class _CheckboxOptionState extends State<CheckboxOption> {
  _CheckboxOptionState({required bool initialValue}) : value = initialValue;

  bool value;

  @override
  Widget build(BuildContext context) => Row(children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
              value: value,
              onChanged: (_) => _onCheckboxChanged(),
              checkColor: widget.checkColor ?? eclipse,
              fillColor: MaterialStateProperty.all<Color>(
                  widget.fillColor ?? Theme.of(context).colorScheme.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              )),
        ),
        const SizedBox(width: 8),
        Expanded(
            child: GestureDetector(
          onTap: _onCheckboxChanged,
          child:
              Text(widget.label, style: Theme.of(context).textTheme.bodyText1),
        ))
      ]);

  void _onCheckboxChanged() {
    setState(() {
      value = !value;
    });
    widget.onChanged?.call(value);
  }
}
