import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/views/app_form_field.dart';

const double _defaultItemHeight = 50;
const double _defaultButtonIconSize = 32;
const double _defaultMarkerIconSize = 20;

class HabitNameInput extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController? controller;
  final String? Function(String?)? nameValidator;
  final void Function()? onPressed;

  const HabitNameInput(
      {Key? key,
      required this.formKey,
      this.controller,
      this.onPressed,
      this.nameValidator})
      : super(key: key);

  @override
  State<HabitNameInput> createState() => _HabitNameInputState();
}

class _HabitNameInputState extends State<HabitNameInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Form(
          key: widget.formKey,
          child: SizedBox(
            height: _defaultItemHeight,
            child: AppFormField(
                controller: widget.controller,
                validator: widget.nameValidator,
                hint: 'Enter habit name',
                margin: EdgeInsets.zero),
          ),
        )),
        const SizedBox(width: 12),
        SizedBox(
          width: _defaultItemHeight,
          height: _defaultItemHeight,
          child: Stack(clipBehavior: Clip.none, children: [
            _HabitInputButton(onPressed: widget.onPressed),
            _ButtonMarker(
                icon: Icons.add,
                backgroundColor: Theme.of(context).colorScheme.primary)
          ]),
        )
      ],
    );
  }
}

class _HabitInputButton extends StatelessWidget {
  final void Function()? onPressed;

  const _HabitInputButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: Colors.white,
            minimumSize: const Size.square(_defaultItemHeight),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Image.asset('assets/images/reader.png',
            width: _defaultButtonIconSize, height: _defaultButtonIconSize),
      );
}

class _ButtonMarker extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;

  const _ButtonMarker({Key? key, required this.icon, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
      top: -4,
      right: -4,
      child: Container(
        width: _defaultMarkerIconSize,
        height: _defaultMarkerIconSize,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: Colors.white, size: 16),
      ));
}
