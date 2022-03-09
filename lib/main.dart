import 'package:flutter/material.dart';
import 'package:habit_builder_demo/di/modules.dart';
import 'package:habit_builder_demo/res/theme/theme.dart';
import 'package:habit_builder_demo/screens/onboarding/onboarding_page.dart';

void main() {
  setup();
  runApp(FutureBuilder(
      future: getIt.allReady(),
      builder: (context, snapshot) => snapshot.hasData
          ? const Application()
          : const Center(child: CircularProgressIndicator())));
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habit Builder',
        theme: appTheme,
        home: const OnboardingPage(),
      );
}
