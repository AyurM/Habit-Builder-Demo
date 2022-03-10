import 'package:flutter/material.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int pageIndex;
  final int totalPages;
  final void Function()? onSkip;
  final void Function()? onNext;

  const OnboardingPageIndicator(
      {Key? key,
      required this.pageIndex,
      required this.totalPages,
      this.onSkip,
      this.onNext})
      : assert(pageIndex < totalPages),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kDefaultButtonHeight,
      padding: kDefaultHorizontalPaddingLarge,
      child: Row(
        children: [
          TextButton(
              onPressed: onSkip,
              child:
                  Text('Skip', style: Theme.of(context).textTheme.headline4)),
          const Expanded(child: SizedBox()),
          Row(
            children: [
              ...List<Widget>.generate(
                  totalPages,
                  (index) => _IndicatorDot(
                      isSelected: index == pageIndex,
                      isLast: index == totalPages - 1)),
            ],
          ),
          const Expanded(child: SizedBox()),
          TextButton(
              onPressed: onNext,
              child:
                  Text('Next', style: Theme.of(context).textTheme.headline4)),
        ],
      ),
    );
  }
}

class _IndicatorDot extends StatelessWidget {
  final bool isSelected;
  final bool isLast;
  final double size;
  final double selectedSize;
  final double outlineSize;
  final Color color;
  final Color selectedColor;

  const _IndicatorDot(
      {Key? key,
      this.isSelected = false,
      this.isLast = false,
      this.size = 11.0,
      this.selectedSize = 13.0,
      this.outlineSize = 17.0,
      this.color = const Color(0xFFF9B566),
      this.selectedColor = eclipse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget dot = isSelected
        ? _SelectedDot(
            color: selectedColor, size: selectedSize, outlineSize: outlineSize)
        : _DefaultDot(color: color, size: size);

    if (isLast) {
      return dot;
    }

    final double paddingRight =
        isSelected ? 8 - (outlineSize - selectedSize) / 2 : 8;
    return Padding(padding: EdgeInsets.only(right: paddingRight), child: dot);
  }
}

class _DefaultDot extends StatelessWidget {
  final double size;
  final Color color;

  const _DefaultDot({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 2), color: color),
      );
}

class _SelectedDot extends StatelessWidget {
  final double size;
  final double outlineSize;
  final Color color;

  const _SelectedDot(
      {Key? key,
      required this.size,
      required this.outlineSize,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: outlineSize,
        height: outlineSize,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            _DefaultDot(color: color.withOpacity(0.2), size: outlineSize),
            _DefaultDot(color: color, size: size)
          ],
        ),
      );
}
