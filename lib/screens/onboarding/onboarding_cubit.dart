import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingPageData {
  final String title;
  final String imagePath;

  const OnboardingPageData({required this.title, required this.imagePath});
}

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  late final PageController _controller;
  PageController get controller => _controller;

  final List<OnboardingPageData> pageData = const [
    OnboardingPageData(
        title: 'Welcome to monumental habits',
        imagePath: 'assets/images/onboarding_1.png'),
    OnboardingPageData(
        title: 'Create new habit easily',
        imagePath: 'assets/images/onboarding_2.png'),
    OnboardingPageData(
        title: 'Keep track of your progress',
        imagePath: 'assets/images/onboarding_3.png'),
    OnboardingPageData(
        title: 'Join a supportive community',
        imagePath: 'assets/images/onboarding_4.png'),
  ];

  void init() {
    _controller = PageController();
  }

  void onSkip() => emit(OnboardingSkipPressed());

  void onNext() => _controller.nextPage(
      duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);

  void onGetStarted() => emit(OnboardingGetStartedPressed());
}
