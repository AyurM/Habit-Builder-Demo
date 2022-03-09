import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/views/primary_text_button.dart';

class HelpDialog extends StatelessWidget {
  final Function()? onClose;

  const HelpDialog({Key? key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onClose?.call();
        return Future.value(true);
      },
      child: Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Habit Builder demo',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                    'This is a demo application. Just type anything into Email and Password fields :)',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center),
              ),
              PrimaryTextButton(
                  text: 'OK',
                  onPressed: () {
                    Navigator.pop(context);
                    onClose?.call();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
