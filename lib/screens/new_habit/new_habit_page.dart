import 'package:flutter/material.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/app_switch_button.dart';
import 'package:habit_builder_demo/res/views/new_habit/add_habit_action.dart';
import 'package:habit_builder_demo/res/views/new_habit/habit_frequency_setting.dart';
import 'package:habit_builder_demo/res/views/new_habit/habit_name_input.dart';
import 'package:habit_builder_demo/res/views/reminder_bottom_sheet.dart/reminder_bottom_sheet.dart';
import 'package:habit_builder_demo/screens/new_habit/new_habit_cubit.dart';

const double _defaultSpacing = 8;

class NewHabitPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController? controller;

  const NewHabitPage({Key? key, required this.formKey, this.controller})
      : super(key: key);

  @override
  State<NewHabitPage> createState() => _NewHabitPageState();
}

class _NewHabitPageState
    extends BaseState<NewHabitPage, NewHabitCubit, NewHabitState> {
  @override
  Widget builder(BuildContext context, NewHabitState state) {
    return Padding(
      padding: EdgeInsets.all(kDefaultHorizontalPaddingMedium.left),
      child: Column(children: [
        HabitNameInput(
            formKey: widget.formKey,
            controller: widget.controller,
            nameValidator: cubit.nameValidator,
            onPressed: cubit.onHabitNamePressed),
        const SizedBox(height: _defaultSpacing),
        HabitFrequencySetting(
            values: cubit.values,
            onCustomPressed: cubit.onCustomFrequencyPressed),
        const SizedBox(height: _defaultSpacing),
        AddHabitAction(
            title: 'Reminder',
            action: '10:00AM',
            onPressed: cubit.onReminderPressed),
        const SizedBox(height: _defaultSpacing),
        _NotificationSetting(onChanged: cubit.onNotificationSettingChanged),
        const Expanded(child: SizedBox()),
        const _AddHabitHint(),
        SizedBox(
          height: kDefaultBottomNavbarHeight -
              kDefaultHorizontalPaddingMedium.left +
              kDefaultFabSize,
        ),
      ]),
    );
  }

  @override
  Future<void> listener(BuildContext context, NewHabitState state) async {
    if (state is NewHabitReminderPressed) {
      await showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          ),
          backgroundColor: Colors.white,
          context: context,
          builder: (context) => const ReminderBottomSheet());
      cubit.onReminderDialogClosed();
    }
  }
}

class _NotificationSetting extends StatelessWidget {
  final void Function(bool)? onChanged;

  const _NotificationSetting({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultHorizontalPaddingMedium.left, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Notification', style: textTheme.bodyText2),
            AppSwitchButton(onChanged: onChanged)
          ],
        ));
  }
}

class _AddHabitHint extends StatelessWidget {
  final double imageRadius;

  const _AddHabitHint({Key? key, this.imageRadius = 35}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -imageRadius,
              child: CircleAvatar(
                radius: imageRadius,
                backgroundColor: Colors.transparent,
                foregroundImage:
                    const AssetImage('assets/images/hint_image.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(32, imageRadius + 16, 32, 16),
              child: Column(
                children: [
                  Text('Start this habit',
                      style: textTheme.headline2, textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Text(
                      'Curabitur non mauris semper erat tincidunt porttitor. Suspendisse potenti.',
                      style: textTheme.bodyText1
                          ?.copyWith(color: eclipse.withOpacity(0.5)),
                      textAlign: TextAlign.center),
                  const Expanded(child: SizedBox()),
                  Image.asset('assets/images/hint_arrow.png')
                ],
              ),
            )
          ]),
    );
  }
}
