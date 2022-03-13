import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/quote.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';

class QuoteView extends StatelessWidget {
  final Quote quote;
  final double borderRadius;
  final double? height;

  const QuoteView(
      {Key? key, required this.quote, this.height, this.borderRadius = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: height ?? MediaQuery.of(context).size.height * 0.16,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Stack(
        children: [const _QuoteImage(), _QuoteText(quote: quote)],
      ));
}

class _QuoteImage extends StatelessWidget {
  final double borderRadius;

  const _QuoteImage({Key? key, this.borderRadius = 12}) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius)),
          child: Image.asset('assets/images/quote.png', fit: BoxFit.cover)));
}

class _QuoteText extends StatelessWidget {
  final Quote quote;
  final double relativeWidth;
  final EdgeInsets padding;

  const _QuoteText(
      {Key? key,
      required this.quote,
      this.relativeWidth = 0.7,
      this.padding = const EdgeInsets.all(16)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        padding: padding,
        width: constraints.maxWidth * relativeWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(quote.text,
                style: textTheme.headline5?.copyWith(height: 1.05)),
            const SizedBox(height: 4),
            Text('- ${quote.author}'.toUpperCase(),
                style: textTheme.subtitle1
                    ?.copyWith(color: eclipse.withOpacity(0.5))),
          ],
        ),
      ),
    );
  }
}
