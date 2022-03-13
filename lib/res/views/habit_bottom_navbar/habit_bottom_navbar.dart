import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/bottom_nav_data.dart';
import 'package:habit_builder_demo/res/theme/constants.dart';
import 'package:habit_builder_demo/res/views/habit_bottom_navbar/clip_shadow_path.dart';

class HabitBottomNavBar extends StatefulWidget {
  final List<BottomNavData> navData;

  const HabitBottomNavBar({Key? key, required this.navData}) : super(key: key);

  @override
  State<HabitBottomNavBar> createState() => _HabitBottomNavBarState();
}

class _HabitBottomNavBarState extends State<HabitBottomNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ClipShadowPath(
        clipper: _NavBarClipper(),
        shadow: const BoxShadow(
            color: Color(0x20862D7C),
            blurRadius: 20,
            offset: Offset(0, -4),
            spreadRadius: 4),
        child: Container(
          height: kDefaultBottomNavbarHeight,
          color: Colors.white,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildButtons()),
        ));
  }

  List<Widget> _buildButtons() {
    final List<Widget> buttons = [];
    for (int i = 0; i < widget.navData.length; i++) {
      buttons.add(_NavButton(
        imagePath: widget.navData[i].imagePath,
        isActive: i == index,
        onPressed: () {
          setState(() {
            index = i;
          });
          widget.navData[i].onPressed?.call();
        },
      ));
    }
    return buttons;
  }
}

class _NavButton extends StatelessWidget {
  final String imagePath;
  final void Function()? onPressed;
  final bool isActive;

  const _NavButton(
      {Key? key,
      required this.imagePath,
      this.onPressed,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
      icon: ColorFiltered(
        colorFilter: _getColorFilter(),
        child: Image.asset(
          imagePath,
          width: kDefaultIconButtonSize,
          height: kDefaultIconButtonSize,
        ),
      ),
      onPressed: onPressed);

  ColorFilter _getColorFilter() {
    if (isActive) {
      return const ColorFilter.matrix(<double>[
        1,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ]);
    }

    return const ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
  }
}

//navbar.svg from /assets/images was converted to Path
//by following this video: https://www.youtube.com/watch?v=P0eZ0XH5FdI
class _NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 80;
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      120.062 * _xScaling,
      0 * _yScaling,
      120.062 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      137.706 * _xScaling,
      0 * _yScaling,
      155.036 * _xScaling,
      4.66836 * _yScaling,
      170.293 * _xScaling,
      13.5312 * _yScaling,
    );
    path.cubicTo(
      170.293 * _xScaling,
      13.5312 * _yScaling,
      188.741 * _xScaling,
      24.248 * _yScaling,
      188.741 * _xScaling,
      24.248 * _yScaling,
    );
    path.cubicTo(
      200.191 * _xScaling,
      30.8995 * _yScaling,
      214.323 * _xScaling,
      30.9249 * _yScaling,
      225.797 * _xScaling,
      24.3143 * _yScaling,
    );
    path.cubicTo(
      225.797 * _xScaling,
      24.3143 * _yScaling,
      244.825 * _xScaling,
      13.3518 * _yScaling,
      244.825 * _xScaling,
      13.3518 * _yScaling,
    );
    path.cubicTo(
      260.008 * _xScaling,
      4.60433 * _yScaling,
      277.223 * _xScaling,
      0 * _yScaling,
      294.746 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      294.746 * _xScaling,
      0 * _yScaling,
      414 * _xScaling,
      0 * _yScaling,
      414 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      414 * _xScaling,
      0 * _yScaling,
      414 * _xScaling,
      80 * _yScaling,
      414 * _xScaling,
      80 * _yScaling,
    );
    path.cubicTo(
      414 * _xScaling,
      80 * _yScaling,
      0 * _xScaling,
      80 * _yScaling,
      0 * _xScaling,
      80 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      80 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
