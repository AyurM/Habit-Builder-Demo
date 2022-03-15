import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double size;

  const AppLoadingIndicator({Key? key, this.size = 64}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
      child: Image.asset('assets/images/loading_indicator.gif',
          width: size, height: size, isAntiAlias: true));
}
