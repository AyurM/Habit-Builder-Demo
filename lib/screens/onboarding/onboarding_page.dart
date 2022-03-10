import 'package:flutter/material.dart';
import 'package:habit_builder_demo/base/base_state.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/onboarding_page_indicator.dart';
import 'package:habit_builder_demo/res/views/primary_text_button.dart';
import 'package:habit_builder_demo/screens/login/login_page.dart';
import 'package:habit_builder_demo/screens/onboarding/onboarding_cubit.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState
    extends BaseState<OnboardingPage, OnboardingCubit, OnboardingState> {
  @override
  Widget builder(BuildContext context, OnboardingState state) {
    final double spacing = MediaQuery.of(context).size.height * 0.09;
    final Widget whiteSpace = SizedBox(height: spacing);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          whiteSpace,
          Expanded(
            child: _OnboardingPageView(
                controller: cubit.controller, pageData: cubit.pageData),
          ),
          const _OnboardingSubtitle(),
          whiteSpace,
          AnimatedBuilder(
            animation: cubit.controller,
            builder: _animatedBuilder,
          ),
          whiteSpace
        ],
      ),
    );
  }

  Widget _animatedBuilder(BuildContext context, Widget? child) {
    final int pageIndex =
        cubit.controller.hasClients && cubit.controller.page != null
            ? cubit.controller.page!.round()
            : 0;

    if (pageIndex == cubit.pageData.length - 1) {
      return PrimaryTextButton(
          text: 'Get Started', onPressed: cubit.onGetStarted);
    }

    return OnboardingPageIndicator(
        pageIndex: pageIndex,
        totalPages: cubit.pageData.length,
        onSkip: cubit.onSkip,
        onNext: cubit.onNext);
  }

  @override
  void listener(BuildContext context, OnboardingState state) {
    if (state is OnboardingSkipPressed ||
        state is OnboardingGetStartedPressed) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  void dispose() {
    cubit.controller.dispose();
    super.dispose();
  }
}

class _OnboardingPageView extends StatelessWidget {
  final PageController controller;
  final List<OnboardingPageData> pageData;

  const _OnboardingPageView(
      {Key? key, required this.controller, required this.pageData})
      : super(key: key);

  @override
  Widget build(BuildContext context) => PageView(
      controller: controller,
      children:
          pageData.map((data) => _OnboardingPageViewItem(data: data)).toList());
}

class _OnboardingPageViewItem extends StatelessWidget {
  final OnboardingPageData data;

  const _OnboardingPageViewItem({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: kDefaultHorizontalPadding,
            child: Text(data.title,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center),
          ),
          Expanded(child: Image.asset(data.imagePath))
        ],
      );
}

class _OnboardingSubtitle extends StatelessWidget {
  const _OnboardingSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color altTextColor = Color(0xFFFC9D45);
    final TextStyle? textStyle1 = Theme.of(context).textTheme.headline4;
    final TextStyle? textStyle2 =
        Theme.of(context).textTheme.headline4?.copyWith(color: altTextColor);

    return Padding(
        padding: kDefaultHorizontalPadding,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'We can '.toUpperCase(),
              style: textStyle1,
              children: [
                TextSpan(text: 'help you '.toUpperCase(), style: textStyle2),
                TextSpan(
                    text: 'to be a better version of '.toUpperCase(),
                    style: textStyle1),
                TextSpan(text: 'yourself.'.toUpperCase(), style: textStyle2),
              ]),
        ));
  }
}
