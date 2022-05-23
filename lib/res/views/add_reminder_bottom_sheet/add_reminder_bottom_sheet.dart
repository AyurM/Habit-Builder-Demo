import 'package:flutter/material.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/views/add_reminder_bottom_sheet/add_reminder_dialog_cubit.dart';
import 'package:habit_builder_demo/res/views/add_reminder_bottom_sheet/habit_int_picker.dart';
import 'package:habit_builder_demo/res/views/primary_text_button.dart';

class AddReminderDialog extends StatefulWidget {
  final void Function(TimeOfDay)? onSelected;

  const AddReminderDialog({Key? key, this.onSelected}) : super(key: key);

  @override
  State<AddReminderDialog> createState() => _AddReminderDialogState();
}

class _AddReminderDialogState extends BaseState<AddReminderDialog,
    AddReminderDialogCubit, AddReminderDialogState> {
  @override
  Widget builder(BuildContext context, AddReminderDialogState state) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? pickerTextStyle =
        textTheme.headline3?.copyWith(fontSize: 32);

    return Column(
      children: [
        _AddReminderDialogHeader(
            onCancel: () => Navigator.pop(context),
            onSave: () {
              widget.onSelected?.call(cubit.result);
              Navigator.pop(context);
            }),
        Divider(color: colorScheme.background),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: HabitIntPicker(
                        maxValue: 12,
                        onChanged: cubit.onHourChanged,
                        startFromZero: false),
                  ),
                  Text(':', style: pickerTextStyle),
                  Expanded(
                    child: HabitIntPicker(
                        maxValue: 60, onChanged: cubit.onMinuteChanged),
                  ),
                ],
              ),
            ),
          ),
        ),
        _AddReminderDialogAmPmSelector(
          isInitialValueAM: cubit.isAm,
          onAmSelected: () => cubit.setAmPmMode(true),
          onPmSelected: () => cubit.setAmPmMode(false),
        )
      ],
    );
  }
}

class _AddReminderDialogHeader extends StatelessWidget {
  final void Function()? onCancel;
  final void Function()? onSave;

  const _AddReminderDialogHeader({Key? key, this.onCancel, this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _AddReminderDialogButton(text: 'Cancel', onPressed: onCancel),
            Text('Add Reminder', style: Theme.of(context).textTheme.headline3),
            _AddReminderDialogButton(text: 'Save', onPressed: onSave)
          ],
        ),
      );
}

class _AddReminderDialogButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const _AddReminderDialogButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? dialogButtonTextStyle = Theme.of(context)
        .textTheme
        .headline4
        ?.copyWith(color: Theme.of(context).colorScheme.primary);

    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: Text(
          text,
          style: dialogButtonTextStyle,
        ));
  }
}

class _AddReminderAmPmButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color color;
  final void Function()? onPressed;

  const _AddReminderAmPmButton(
      {Key? key,
      required this.text,
      this.textStyle,
      required this.color,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => PrimaryTextButton(
        text: text,
        onPressed: onPressed,
        margin: EdgeInsets.zero,
        borderRadius: 0,
        color: color,
        textStyle: textStyle,
      );
}

class _AddReminderDialogAmPmSelector extends StatefulWidget {
  final void Function()? onAmSelected;
  final void Function()? onPmSelected;
  final bool isInitialValueAM;

  const _AddReminderDialogAmPmSelector(
      {Key? key,
      this.isInitialValueAM = true,
      this.onAmSelected,
      this.onPmSelected})
      : super(key: key);

  @override
  State<_AddReminderDialogAmPmSelector> createState() =>
      _AddReminderDialogAmPmSelectorState(isInitialValueAM);
}

class _AddReminderDialogAmPmSelectorState
    extends State<_AddReminderDialogAmPmSelector> {
  _AddReminderDialogAmPmSelectorState(bool initialValue) : isAm = initialValue;

  bool isAm;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
            child: _AddReminderAmPmButton(
          text: 'am',
          onPressed: () {
            setState(() {
              isAm = true;
              widget.onAmSelected?.call();
            });
          },
          color: isAm ? colorScheme.primary : colorScheme.background,
          textStyle: textTheme.button?.copyWith(
              fontSize: 20, color: isAm ? eclipse : colorScheme.primary),
        )),
        Expanded(
            child: _AddReminderAmPmButton(
          text: 'pm',
          onPressed: () {
            setState(() {
              isAm = false;
              widget.onPmSelected?.call();
            });
          },
          color: isAm ? colorScheme.background : colorScheme.primary,
          textStyle: textTheme.button?.copyWith(
              fontSize: 20, color: isAm ? colorScheme.primary : eclipse),
        ))
      ],
    );
  }
}
