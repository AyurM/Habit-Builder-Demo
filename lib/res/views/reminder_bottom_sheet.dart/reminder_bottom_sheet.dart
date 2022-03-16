import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/primary_text_button.dart';
import 'package:habit_builder_demo/res/views/reminder_bottom_sheet.dart/reminder_list_cubit.dart';
import 'package:habit_builder_demo/res/views/reminder_bottom_sheet.dart/reminder_view.dart';

const int _defaultColumns = 3;
const double _defaultGap = 8;

class ReminderBottomSheet extends StatefulWidget {
  const ReminderBottomSheet({Key? key}) : super(key: key);

  @override
  State<ReminderBottomSheet> createState() => _ReminderBottomSheetState();
}

class _ReminderBottomSheetState extends BaseState<ReminderBottomSheet,
    ReminderListCubit, ReminderListState> {
  @override
  Widget builder(BuildContext context, ReminderListState state) {
    return Container(
      padding: EdgeInsets.all(kDefaultHorizontalPaddingMedium.left),
      child: Column(children: [
        Expanded(
            child: SingleChildScrollView(
          child: LayoutGrid(
            columnSizes: List<TrackSize>.generate(_defaultColumns, (_) => 1.fr),
            columnGap: _defaultGap,
            rowGap: _defaultGap,
            rowSizes: List<TrackSize>.generate(
                (cubit.reminders.length / _defaultColumns).ceil(), (_) => auto),
            children: cubit.reminders
                .map((reminderData) => ReminderView(
                    data: reminderData, onChanged: cubit.onReminderChanged))
                .toList(),
          ),
        )),
        const SizedBox(height: 16),
        _buildDialogActions()
      ]),
    );
  }

  Widget _buildDialogActions() => Row(
        children: [
          Expanded(
              child: PrimaryTextButton(
                  text: 'Add Reminder',
                  onPressed: cubit.onAddReminder,
                  margin: EdgeInsets.zero)),
          const SizedBox(width: 16),
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                side: BorderSide(color: eclipse.withOpacity(0.3), width: 2),
                minimumSize:
                    const Size(kDefaultButtonHeight, kDefaultButtonHeight),
              ),
              child: Icon(Icons.notifications_off_outlined,
                  color: eclipse.withOpacity(0.3)))
        ],
      );

  @override
  void listener(BuildContext context, ReminderListState state) {
    if (state is ReminderListOnItemChanged) {
      debugPrint('Reminder ${state.id} is ${state.active ? 'on' : 'off'}');
    }
  }
}
